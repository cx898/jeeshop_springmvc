package net.jeeshop.core;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.jeeshop.core.dao.page.PagerModel;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;

/**
 * 基础的action
 * 
 * @param <E>
 */
public abstract class BaseAction<E extends PagerModel> extends
		SpringMvcActionContext {
	private static final Logger logger = LoggerFactory
			.getLogger(BaseAction.class);
	protected static final long serialVersionUID = 1L;
	protected  String toList = "toList";
	protected  String selectAllList = "selectAllList";
	protected  String toEdit = "toEdit";
	protected  String toAdd = "toAdd";
	@Deprecated
	protected  String toShow = "toShow";

	protected  String show = "show";// 显示

	protected  String toOptionSuccess = "toOptionSuccess";//
	protected String init;// init=y 是否进行初始化查询，初始化查询会清除所有的查询条件

	protected  String SUCCESS = "";
	protected  String INPUT = "";
	protected  Model model;
	
	/*************
	 *   获取request response
	 */
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	
	@ModelAttribute
	public void setReqAndRes(HttpServletRequest request,
			HttpServletResponse response,@ModelAttribute("e") E e,String[] ids,Model model) {
		this.e = e;  // 将request中的对象放入action，模拟struts2 属性对象的自动封装
		this.request = request;
		this.response = response;
		this.model = model;
		this.ids = ids;
		model.addAttribute("e", e);
		logger.error("BaseAction:method called before:request="+request+",response="+response
				+",e="+JSON.toJSONString(e));
	}

	/**
	 * 后台左边导航菜单的初始化查询方法
	 */
	@RequestMapping("/initPageSelect")
	protected void initPageSelect() {
		if (StringUtils.isNotBlank(this.getInit())
				&& this.getInit().equals("y")) {
			this.e.clear();
			this.init = null;
			logger.error("initPageSelect..clear all e param!");
		} else {
			logger.error("initPageSelect..init=n!");
		}
	}

	public String getInit() {
		return init;
	}

	public void setInit(String init) {
		this.init = init;
	}

	/**
	 * 对应页面上的选中的复选框，提单到后台的时候会自动进入该数组
	 */
	protected String[] ids;
	/**
	 * 分页模版
	 */
	protected PagerModel pager = new PagerModel();
	/**
	 * 抽象的业务逻辑层接口句柄，子类可以通过重写setServer方法注入指定的具体业务逻辑句柄来实现个性化需求
	 */
	protected Services<E> server;
	protected E e;

	/**
	 * 在action方法执行之前做的准备操作 (non-Javadoc)
	 * 
	 * @see com.opensymphony.xwork2.Preparable#prepare()
	 */
	public abstract void prepare() throws Exception;

	/**
	 * 抽象的获取查询参数的方法,子类必须重写此方法---模版方法模式
	 * 
	 * @return
	 */
	public abstract E getE();

	/**
	 * insert之后，selectList之前执行的动作，一般需要清除添加的E，否则查询会按照E的条件进行查询.
	 * 部分情况下需要保留某些字段，可以选择不清除
	 * 
	 * @param e
	 */
	public abstract void insertAfter(E e);

	/**
	 * 编辑后,返回列表页面之前做的操作.可以在此处清除编辑过的E。
	 * 
	 * @param e
	 */
	protected void backBefore(E e) {
		e.clear();
	}

	/**
	 * 跳转到编辑页面之前做的事情
	 * 
	 * @param e
	 */
	@Deprecated
	protected void toEditBefore(E e) {
	}

	/**
	 * 子类必须要实现的方法当分页查询后. 解决了用户先点击新增按钮转到新增页面,然后点击返回按钮返回后,再点分页控件出错的BUG.
	 * 原因是分页查询后未将pageUrl重新设置为正确的URL所致
	 */
	protected abstract void selectListAfter();

	/**
	 * 抽象的获取操作业务逻辑层的bean，子类必须重写此方法以提供各自的操作业务逻辑层的server
	 * 
	 * @return
	 */
	public Services<E> getServer() {
		return this.server;
	}

	public void setServer(Services<E> server) {
		this.server = server;
	}

	public PagerModel getPager() {
		return pager;
	}

	public void setPager(PagerModel pager) {
		this.pager = pager;
	}

	// public ActionContext getActionContext() {
	// return ActionContext.getContext();
	// }
	//
	// public HttpServletRequest getRequest() {
	// return (HttpServletRequest) getActionContext().get(
	// ServletActionContext.HTTP_REQUEST);
	// }
	//
	// public HttpServletResponse getResponse() {
	// return (HttpServletResponse) getActionContext().get(
	// ServletActionContext.HTTP_RESPONSE);
	// }
	//
	// public Map<String,Object> getApplication() {
	// return ActionContext.getContext().getApplication();
	// }

	// public HttpSession getSession() {
	// return getRequest().getSession();
	// }

	public String[] getIds() {
		return ids;
	}

	public void setIds(String[] ids) {
		this.ids = ids;
	}

	/**
	 * 初始化查询的时候，会清除所有的查询参数(所以在e中的)，但可以设置不在e中的参数，然后在此方法中进行e.setXxx(参数)的方式进行保留。
	 */
	protected void setParamWhenInitQuery() {
		// BaseAction 的子类如有初始化页面的时候进行相关查询 ，则可以实现此方法。
	}

	/**
	 * 不选择任何菜单
	 * 
	 * @param selectID
	 */
	public void setSelectMenu(String selectID) {
		getSession().setAttribute(net.jeeshop.core.FrontContainer.selectMenu,
				selectID);
	}

	/**
	 * 根据指定的services进行分页查询
	 * 
	 * @param services
	 *            业务逻辑层对象
	 * @param pm
	 *            查询参数对象，此对象必须继承PagerModel
	 * @return PagerModel
	 * @throws Exception
	 */
	@RequestMapping("/selectPagerModelByServices")
	public PagerModel selectPagerModelByServices(Services services,
			PagerModel pm) throws Exception {
		if (services == null || pm == null) {
			throw new NullPointerException();
		} else {
			// pm.clear();
		}

		int offset = 0;
		String pagerOffset = request.getParameter("pager.offset");
		if (StringUtils.isNotBlank(pagerOffset)) {
			// throw new NullPointerException();
			offset = Integer.parseInt(pagerOffset);
		}
		if (offset < 0)
			offset = 0;
		pm.setOffset(offset);
		PagerModel servicesPager = services.selectPageList(pm);
		if (servicesPager == null)
			servicesPager = new PagerModel();
		// 计算总页数
		servicesPager.setPagerSize((servicesPager.getTotal()
				+ servicesPager.getPageSize() - 1)
				/ servicesPager.getPageSize());
		return servicesPager;
	}

	/**
	 * 公共的分页方法
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectList")
	public String selectList() throws Exception{
		/**
		 * 由于prepare方法不具备一致性，加此代码解决init=y查询的时候条件不被清除干净的BUG
		 */
		this.initPageSelect();

		setParamWhenInitQuery();

		int offset = 0;// 分页偏移量
		if (request.getParameter("pager.offset") != null) {
			offset = Integer
					.parseInt(request.getParameter("pager.offset"));
		}
		if (offset < 0)
			offset = 0;
		((PagerModel) getE()).setOffset(offset);
		pager = getServer().selectPageList(getE());
		if (pager == null)
			pager = new PagerModel();
		// 计算总页数
		pager.setPagerSize((pager.getTotal() + pager.getPageSize() - 1)
				/ pager.getPageSize());

		selectListAfter();
		request.setAttribute("pager", pager);
		return toList;
	}

	/**
	 * 返回到查询页面
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/back")
	public String back() throws Exception {
		getE().clear();
		return selectList();
	}

	/**
	 * 公共的批量删除数据的方法，子类可以通过重写此方法实现个性化的需求。
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deletes")
	public String deletes() throws Exception {
		getServer().deletes(getIds());
		return selectList();
	}

	/**
	 * 公共的更新数据的方法，子类可以通过重写此方法实现个性化的需求。
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/update")
	public String update() throws Exception {
		getServer().update(getE());
		insertAfter(getE());
		return selectList();
	}

	/**
	 * 公共的插入数据方法，子类可以通过重写此方法实现个性化的需求。
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/insert")
	public String insert() throws Exception {
		getServer().insert(getE());
		insertAfter(getE());
		return selectList();
	}

	/**
	 * 跳转到编辑页面
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/toEdit")
	public String toEdit() throws Exception {
		e = getServer().selectOne(getE());
		model.addAttribute("e", e);  // 这里e实际上已经指向了另一个内存地址，所以需要重新绑定model
		return toEdit;
	}

	@RequestMapping("/toAdd")
	public String toAdd() throws Exception {
		e.clear();
		return toAdd;
	}

	/**
	 * 解决使用getResponse().getWriter().write(jsonStr);写出JSON字符串中文出现乱码问题的解决方案，
	 * 只需要写出中文之前先执行该方法即可
	 */
	public void utf8JSON() {
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
	}

	/**
	 * action默认方法
	 */
	// @Override
	public String execute() throws Exception {
		logger.error("execute.e=" + e.toString());
		throw new NullPointerException("BaseAction.execute方法禁止访问！");
		// return super.execute();
	}

	public void write(String str) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(str);
	}

	// @Deprecated
	// public void insertCheck() {
	// User user = (User) getSession().getAttribute(Global.USER_INFO);
	// if(user==null){
	// throw new NullPointerException();
	// }
	// if(user.getDbPrivilegeMap()!=null && user.getDbPrivilegeMap().size()>0){
	// if(user.getDbPrivilegeMap().get(Container.db_privilege_insert)==null){
	// throw new PrivilegeException(Container.db_privilege_insert_error);
	// }
	// }
	// }
	
	/**
	 *  获取项目 basePath
	 */
	protected String getBasePath(){
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
		return basePath;
	}
}
