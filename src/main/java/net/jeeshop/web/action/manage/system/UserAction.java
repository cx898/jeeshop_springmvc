package net.jeeshop.web.action.manage.system;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import net.jeeshop.core.BaseAction;
import net.jeeshop.core.ManageContainer;
import net.jeeshop.core.exception.NotThisMethod;
import net.jeeshop.core.oscache.ManageCache;
import net.jeeshop.core.system.bean.User;
import net.jeeshop.core.util.AddressUtils;
import net.jeeshop.core.util.MD5;
import net.jeeshop.services.manage.system.impl.RoleService;
import net.jeeshop.services.manage.system.impl.UserService;
import net.jeeshop.services.manage.systemlog.SystemlogService;
import net.jeeshop.services.manage.systemlog.bean.Systemlog;

import org.apache.commons.lang.StringUtils;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;


/**
 * 后台用户管理
 * 
 * @author huangf
 *
 */
@Scope("prototype")
@Controller
@RequestMapping("/manage/user")
public class UserAction extends BaseAction<User> {
	private static final org.slf4j.Logger logger = LoggerFactory
			.getLogger(UserAction.class);

	private static final long serialVersionUID = 1L;
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private SystemlogService systemlogService;
	@Autowired
	private ManageCache manageCache;
	@Autowired
	HttpSession session;
	
	private String errorMsg;
	private List roleList;// 角色列表-编辑用户用到

	private String toChangePwd = "/manage/system/user/toChangePwd";
	private String changePwd = "/manage/system/user/changePwd";
	private String initManageIndex = "/manage/system/right";

	@Autowired
	private UserService myServer;

	{
		INPUT = "redirect:/manage/admin.jsp";
		SUCCESS = "redirect:/manage/main.jsp";
		toList = "/manage/system/user/userList";
		toAdd = "/manage/system/user/editUser";
		toEdit = "/manage/system/user/editUser";
		show = "/manage/system/user/show";
	}


	@ModelAttribute
	public void initStrutsActionParam(){
		this.server = myServer;
	}
	
	
	/**
	 * 后台登录
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login")
	public String login() {
		if (session.getAttribute(ManageContainer.manage_session_user_info) != null) {
			return SUCCESS;
		}

		errorMsg = "<font color='red'>帐号或密码错误!</font>";
		if (StringUtils.isBlank(e.getUsername())
				|| StringUtils.isBlank(e.getPassword())) {
			session.setAttribute(ManageContainer.loginError, "账户和密码不能为空!");
			return INPUT;
		}

		e.setPassword(MD5.md5(e.getPassword()));
		User u = ((UserService) userService).login(e);
		if (u == null) {
			logger.error("登陆失败，账号不存在！");
			session.setAttribute(ManageContainer.loginError, errorMsg);
			return INPUT;
		} else if (!u.getStatus().equals(User.user_status_y)) {
			logger.error("帐号已被禁用，请联系管理员!");
			errorMsg = "<font color='red'>帐号已被禁用，请联系管理员!</font>";
			session.setAttribute(ManageContainer.loginError, errorMsg);
			return INPUT;
		}
		u.setUsername(e.getUsername());
		errorMsg = null;
		e.clear();
		session.setAttribute(ManageContainer.manage_session_user_info, u);

		// 解析用户的数据库权限，以后可以进行DB权限限制
		if (StringUtils.isNotBlank(u.getRole_dbPrivilege())) {
			String[] dbPriArr = u.getRole_dbPrivilege().split(",");
			if (u.getDbPrivilegeMap() == null) {
				u.setDbPrivilegeMap(new HashMap<String, String>());
			} else {
				u.getDbPrivilegeMap().clear();
			}

			if (dbPriArr.length != 0) {
				for (int i = 0; i < dbPriArr.length; i++) {
					u.getDbPrivilegeMap().put(dbPriArr[i], dbPriArr[i]);
				}
			}
		}

		try {
			loginLog(u, "login");
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return SUCCESS;
	}

	private void loginLog(User u, String log) {
		Systemlog systemlog = new Systemlog();
		systemlog.setTitle(log);
		systemlog.setContent(log);
		systemlog.setAccount(u.getUsername());
		systemlog.setType(1);
		systemlog.setLoginIP(AddressUtils.getIp(request));

		String address = null;
		if (!systemlog.getLoginIP().equals("127.0.0.1")
				&& !systemlog.getLoginIP().equals("localhost")) {
			// 获取指定IP的区域位置
			try {
				address = AddressUtils.getAddresses(
						"ip=" + systemlog.getLoginIP(), "utf-8");
			} catch (Exception e) {
				e.printStackTrace();
			}
			systemlog.setLoginArea(address);

			// 异地登陆的判断方法为：先比较本次登陆和上次登陆的区域位置，如果不一致，说明是异地登陆；如果获取不到区域，则比较IP地址，如果IP地址和上次的不一致，则是异地登陆
			Systemlog firstSystemlog = systemlogService.selectFirstOne(u
					.getUsername());
			if (firstSystemlog != null) {
				if (StringUtils.isNotBlank(address)
						&& StringUtils
								.isNotBlank(firstSystemlog.getLoginArea())) {
					if (!address.equals(firstSystemlog.getLoginArea())) {
						systemlog
								.setDiffAreaLogin(Systemlog.systemlog_diffAreaLogin_y);
					}
				} else if (StringUtils.isNotBlank(systemlog.getLoginIP())
						&& StringUtils.isNotBlank(firstSystemlog.getLoginIP())) {
					if (!systemlog.getLoginIP().equals(
							firstSystemlog.getLoginIP())) {
						systemlog
								.setDiffAreaLogin(Systemlog.systemlog_diffAreaLogin_y);
					}
				}
			}
		}

		systemlogService.insert(systemlog);
	}

	/**
	 * 添加用户
	 */
	@RequestMapping("/insert")
	public String insert() throws Exception {
		return save0();
	}

	/**
	 * 修改用户信息
	 */
	@RequestMapping("/update")
	public String update() throws Exception {
		return save0();
	}

	private String save0() throws Exception {
		logger.error("save0..." + e.getPassword() + "," + e.getNewpassword2());

		if (StringUtils.isBlank(e.getId())) {// 添加
			if (StringUtils.isBlank(e.getPassword())
					|| StringUtils.isBlank(e.getNewpassword2())) {
				throw new NullPointerException("输入的密码不符合要求！");
			}

			if (!e.getPassword().equals(e.getNewpassword2())) {
				throw new IllegalArgumentException("两次输入的密码不一致！");
			}

			User user = (User) session
					.getAttribute(ManageContainer.manage_session_user_info);
			e.setCreateAccount(user.getUsername());
			if (StringUtils.isBlank(e.getStatus())) {
				e.setStatus(User.user_status_y);
			}
			e.setPassword(MD5.md5(e.getPassword()));
			userService.insert(e);
		} else {// 修改
			// 当前登录用户是admin，才能修改admin的信息，其他用户修改admin信息都属于非法操作。
			User user = (User) session
					.getAttribute(ManageContainer.manage_session_user_info);
			if (!user.getUsername().equals("admin")
					&& e.getUsername().equals("admin")) {
				throw new RuntimeException("操作非法！");
			}

			if (StringUtils.isBlank(e.getPassword())
					&& StringUtils.isBlank(e.getNewpassword2())) {
				// 不修改密码
				e.setPassword(null);
			} else {
				// 修改密码
				if (!e.getPassword().equals(e.getNewpassword2())) {
					throw new IllegalArgumentException("两次输入的密码不一致！");
				}
				e.setPassword(MD5.md5(e.getPassword()));
			}

			e.setUpdateAccount(user.getUsername());
			userService.update(e);
		}
		return back();
	}

	@RequestMapping("/loginOut")
	public String loginOut() throws Exception {
		User u = (User) session
				.getAttribute(ManageContainer.manage_session_user_info);
		if (u != null && StringUtils.isNotBlank(u.getUsername())) {
			loginLog(u, "loginOut");
		}

		session.setAttribute(ManageContainer.manage_session_user_info, null);
		session.setAttribute(ManageContainer.resource_menus, null);
		session.setAttribute(ManageContainer.user_resource_menus_button, null);
		if (e != null)
			e.clear();
		return INPUT;
	}

	/**
	 * ajax验证输入的字符的唯一性
	 * 
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("unique")
	public String unique() throws IOException {
		logger.error("验证输入的字符的唯一性" + e);
		response.setCharacterEncoding("utf-8");
		synchronized (this) {
			if (StringUtils.isNotBlank(e.getNickname())) {// 验证昵称是否被占用
				logger.error("验证昵称是否被占用");
				User user = new User();
				user.setNickname(e.getNickname());
				user = userService.selectOneByCondition(user);

				if (user == null) {
					// 数据库中部存在此编码
					response.getWriter().write("{\"ok\":\"昵称可以使用!\"}");
				} else {
//					if (StringUtils.isBlank(user.getId())) {
					if (StringUtils.isBlank(e.getId())) {
						// 当前为insert操作，但是编码已经存在，则只可能是别的记录的编码
						response.getWriter().write("{\"error\":\"昵称已经存在!\"}");
					} else {
						// update操作，又是根据自己的编码来查询的，所以当然可以使用啦
						response.getWriter().write("{\"ok\":\"昵称可以使用!\"}");
					}
				}
			} else if (StringUtils.isNotBlank(e.getUsername())) {// 验证用户名是否被占用
				logger.error("验证账号是否被占用");
				response.setCharacterEncoding("utf-8");
				User user = new User();
				user.setUsername(e.getUsername());
				if (userService.selectCount(user) > 0) {
					response.getWriter().write("{\"error\":\"账号已经被占用!\"}");
				} else {
					response.getWriter().write("{\"ok\":\"账号可以使用!\"}");
				}
			}
		}
		return null;
	}

	/**
	 * 转到修改密码页面
	 * 
	 * @return
	 */
	@RequestMapping("toChangePwd")
	public String toChangePwd() {
		User u = (User) session
				.getAttribute(ManageContainer.manage_session_user_info);
		this.e.setId(u.getId());
		return toChangePwd;
	}

	/**
	 * 修改密码
	 * 
	 * @return
	 */
	@RequestMapping("updateChangePwd")
	public String updateChangePwd() {
		errorMsg = "两次输入的密码不一致，修改密码失败!";
		if (StringUtils.isBlank(e.getNewpassword())
				|| StringUtils.isBlank(e.getNewpassword2())) {
			throw new NullPointerException("密码不能为空！");
		}

		if (!e.getNewpassword().equals(e.getNewpassword2())) {
			throw new IllegalArgumentException("两次输入的密码不一致！");
		}

		errorMsg = "旧密码输入错误，修改密码失败!";

		User u = (User) session
				.getAttribute(ManageContainer.manage_session_user_info);
		e.setPassword(MD5.md5(e.getPassword()));
		if (!e.getPassword().equals(u.getPassword())) {// 用户输入的旧密码和数据库中的密码一致
			throw new IllegalArgumentException("原密码不正确！");
		}

		// 修改密码
		e.setPassword(MD5.md5(e.getNewpassword()));
		this.userService.update(e);
		errorMsg = "密码修改成功!";
		request.setAttribute("errorMsg",errorMsg);
		return changePwd;
	}

	/**
	 * 禁止删除系统超级管理员帐号。 系统不提供删除账号功能，只提供禁用账号
	 */
	@Override
	@RequestMapping("deletes")
	public String deletes() throws Exception {
		throw new NotThisMethod(ManageContainer.not_this_method);
		// if(getIds()!=null && getIds().length > 0){
		// for(int i=0;i<getIds().length;i++){
		// e.clear();
		// e.setId(getIds()[i]);
		// e = this.userService.selectOne(e);
		// if(e!=null && StringUtils.isNotBlank(e.getUsername())){
		// if(e.getUsername().equals("admin")){
		// errorMsg = "禁止删除超级管理员帐号!";
		// return selectList();
		// }
		// }
		// }
		// e.clear();
		// return super.deletes();
		// }
		// return selectList();
	}

	@Override
	@RequestMapping("toAdd")
	public String toAdd() throws Exception {
		roleList = roleService.selectList(null);
		request.setAttribute("roleList", roleList);
		return super.toAdd();
	}

	@Override
	@RequestMapping("selectListAfter")
	protected void selectListAfter() {
		pager.setPagerUrl(getBasePath() + "manage/user/selectList.action");
	}

	/**
	 * 编辑用户
	 */
	@RequestMapping("toEdit")
	public String toEdit(Model model) throws Exception {
		roleList = roleService.selectList(null);
		this.e = userService.selectOne(e);
		
		model.addAttribute("roleList", roleList);
		model.addAttribute("e",this.e);
		return toEdit;
	}

	/**
	 * 查看管理人员信息
	 * 
	 * @return
	 */
	@RequestMapping("show")
	public String show() {
		String account = request.getParameter("account");
		if (StringUtils.isBlank(account)) {
			throw new NullPointerException("非法请求！");
		}

		e.setUsername(account);
		e = userService.selectOne(e);
		return super.show;
	}

	/**
	 * 用户修改密码--验证旧密码是否正确
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkOldPassword")
	public String checkOldPassword() throws Exception {
		logger.error("checkOldPassword.." + e.getPassword());
		if (StringUtils.isBlank(e.getPassword())) {
			super.utf8JSON();
			response.getWriter().write("{\"error\":\"旧密码不能为空!\"}");
		} else {
			// 检查旧密码输入的是否正确
			User user = (User) session
					.getAttribute(ManageContainer.manage_session_user_info);
			String oldPass = MD5.md5(e.getPassword());
			if (user.getPassword().equals(oldPass)) {
				response.getWriter().write("{\"ok\":\"旧密码输入正确!\"}");
			} else {
				response.getWriter().write("{\"error\":\"旧密码输入错误!\"}");
			}
		}
		return null;
	}

	/**
	 * 加载后台首页数据
	 * 
	 * @return
	 */
	@RequestMapping("initManageIndex")
	public String initManageIndex() throws Exception {
		// 店主每次登陆后台都需要加载综合统计数据？！还是说每次都触发加载，但是到底加载不加载具体看系统的加载策略？！
		manageCache.loadOrdersReport();
		return initManageIndex;
	}

	@RequestMapping("selectList")
	public String selectList() throws Exception {
		return super.selectList();
	}
	
	
	/**********************************      setter getter  init  **************************************/
		public List getRoleList() {
			return roleList;
		}

		public void setRoleList(List roleList) {
			this.roleList = roleList;
		}

		public String getErrorMsg() {
			return errorMsg;
		}

		public void setErrorMsg(String errorMsg) {
			this.errorMsg = errorMsg;
		}

		@Override
		public User getE() {
			return this.e;
		}

		public User getModel() {
			return this.e;
		}

		@Override
		public void insertAfter(User e) {
			e.clear();
		}

		@Override
		public void prepare() throws Exception {
			logger.warn(" prepare method execute .... ");
			if (this.e == null) {
				this.e = new User();
			}
			super.initPageSelect();
		}
}
