package net.jeeshop.web.action.manage.freemarker;
///**
// * 2012-7-8
// * jqsl2012@163.com
// */
//package net.jeeshop.web.action.freemarker;
//
//import java.io.IOException;
//import java.util.List;
//
//import org.apache.commons.lang.NullArgumentException;
//
//import net.jeeshop.core.Container;
//import net.jeeshop.core.freemarker.FreemarkerHelper;
//import net.jeeshop.services.account.bean.Account;
//import net.jeeshop.services.news.bean.News;
//import net.jeeshop.services.version.VersionService;
//import net.jeeshop.services.version.bean.Version;
//import net.jeeshop.services.version.impl.VersionServiceImpl;
//import net.jeeshop.web.action.system.BaseAction;
//
///**
// * 网站会员action
// * @author huangf
// * 
// */
//public class FreemarkerAction extends BaseAction<Account> {
//	private static final long serialVersionUID = 1L;
//	private FreemarkerHelper freemarkerHelper;
//	
//	public FreemarkerHelper getFreemarkerHelper() {
//		return freemarkerHelper;
//	}
//
//	public void setFreemarkerHelper(FreemarkerHelper freemarkerHelper) {
//		this.freemarkerHelper = freemarkerHelper;
//	}
//
//	private String error;//错误消息
//	
//	public String getError() {
//		return error;
//	}
//
//	public void setError(String error) {
//		this.error = error;
//	}
//
//	@Override
//	public Account getE() {
//		return this.e;
//	}
//
//	@Override
//	public void prepare() throws Exception {
//		if (this.e == null) {
//			this.e = new Account();
//		}
//	}
//	
//	public String toIndex(){
//		return SUCCESS;
//	}
//	
//	/**
//	 * 生成全部内容明细页面
//	 * @return
//	 */
//	public String createNewsList(){
////		FreemarkerHelper ff = (FreemarkerHelper) app.getBean("FreemarkerHelper");
//		freemarkerHelper.news("news.ftl",null);
//		return SUCCESS;
//	}
//	
//	/**
//	 * 生成首页
//	 * @return
//	 */
//	public String createIndex(){
////		FreemarkerHelper ff = (FreemarkerHelper) app.getBean("FreemarkerHelper");
//		freemarkerHelper.index("index_template.ftl","newindex.jsp");
//		return SUCCESS;
//	}
//	/**
//	 * 联系方式
//	 * @return
//	 */
//	public String createLxfs(){
//		freemarkerHelper.lxfs("index_lxfs.ftl","index_lxfs.jsp");
//		return SUCCESS;
//	}
//	
//	/**
//	 * 一键生成
//	 * @return
//	 */
//	public String createAll(){
//		createIndex();
//		createNewsList();
//		createLxfs();
//		return SUCCESS;
//	}
//
//	@Override
//	public void insertAfter(Account e) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	protected void selectListAfter() {
//		// TODO Auto-generated method stub
//		
//	}
//
////	@Override
////	public void insertAfter(Account e) {
////		e.clear();
////	}
////
////	@Override
////	public String selectList() throws Exception {
////		pager.setPagerUrl("account!selectList.action");
////		super.selectList();
////		return toList;
////	}
//	
////	@Override
////	protected void selectListAfter() {
////		pager.setPagerUrl("user!selectList.action");
////	}
////	
////	/**
////	 * 会员登录
////	 * @return
////	 * @throws Exception
////	 */
////	public String login() throws Exception {
//////		System.out.println(e.getAccount());
//////		System.out.println(e.getPassword());
////		
//////		e.setAccount(e.getAccount2222());
//////		e.setPassword(e.getPassword2222());
////		e = getServer().selectOne(e);
////		if(e==null){
////			error = "帐号或密码错误,登录失败！";
////			//登录失败
////			return "loginFaild";
////		}
////		getSession().setAttribute(Container.session_account_info, e);
////		return "loginSuccess";
////	}
////	/**
////	 * 会员登录
////	 * @return
////	 * @throws Exception
////	 */
////	public String ajaxLogin() throws Exception {
////		return ajaxLogin0();
////	}
////
////	/**
////	 * @return
////	 * @throws IOException
////	 */
////	private String ajaxLogin0() throws IOException {
////		String validateCode = getRequest().getSession().getAttribute("validateCode").toString();
////
//////		System.out.println(e.getAccount());
//////		System.out.println(e.getPassword());
//////		System.out.println(validateCode);
////		
////		if (validateCode == null || validateCode.trim().length() == 0
////				|| e.getVcode() == null || e.getVcode().trim().equals("")
////				|| !validateCode.equalsIgnoreCase(e.getVcode())) {
////			error = "验证码错误!";
////			getResponse().getWriter().write(error);
////			return null;
////		}
////		
////		e = getServer().selectOne(e);
////		if(e==null){
////			error = "帐号或密码错误,登录失败！";
//////			System.out.println("登录失败");
////			getResponse().getWriter().write(error);
////		}else{
////			getSession().setAttribute(Container.session_account_info, e);
////			getResponse().getWriter().write("1");
////		}
////		return null;
////	}
////	
////	public String loginOut(){
////		getRequest().getSession().setAttribute(Container.session_account_info,null);
////		getRequest().getSession().setAttribute(Container.current_menu, "toIndex.jsp");
////		return "loginOut";
////	}
////	/**
////	 * 会员注册
////	 * @return
////	 * @throws Exception
////	 */
////	public String regeist() throws Exception {
////		//后台检验表单
////		StringBuffer errorBuff = new StringBuffer();
////		isEmpty(e.getNickname(), "昵称",errorBuff);
////		isEmpty(e.getAccount(), "帐号",errorBuff);
////		isEmpty(e.getPassword(), "密码",errorBuff);
////		isEmpty(e.getPassword2(), "确认密码",errorBuff);
////		isEmpty(e.getEmail(), "邮箱",errorBuff);
////		if(!e.getPassword().equals(e.getPassword2())){
////			errorBuff.append("两次输入的密码不一致！");
////		}
////		if(errorBuff.length()>0){
//////			return "regFaild";
////			throw new Exception("注册失败，"+errorBuff.toString());
////		}
////		super.insert();
////		return "regeistSuccess";
////	}
////	
////	public StringBuffer isEmpty(String str,String msg,StringBuffer error){
////		if(str==null || str.trim().length()==0){
////			return error.append(msg+"不能为空！<br>");
////		}
////		return null;
////	}
//	
//}
