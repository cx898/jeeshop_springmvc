package net.jeeshop.core;

import net.jeeshop.services.front.indexImg.IndexImgService;
import net.jeeshop.services.front.news.NewsService;

/**
 * 常量类
 * @author jqsl2012@163.com
 *
 */
public class FrontContainer {
	public static final String USER_INFO = "user_info";// 登陆的用户信息
	public static final String myCart = "myCart";//用户购物车key
	public static final int PAGE_SIZE = 20;// 默认分页条数
	public static final int default_page_left_product_size = 10;// 页面左侧默认加载的商品数
	
	public static final String news = "news";//内容key
	public static final String lable = "lable";//标签KEY
	public static final String sessionID = "sessionID";//sessionIDKEY
	public static final String imgList = "imgList";
	public static NewsService newsService;//门户内容
	public static IndexImgService indexImgService;//门户滚动图片
//	@Deprecated
//	public static final String SystemSetting = "SystemSetting";//系统配置
	public static final String order_success_info = "order_success_info";//创建成功的订单的信息
	public static final String navigation_list = "navigation_list";//导航信息
	
	public static final String selectMenu = "selectMenu";//用户选择的菜单
	
	/**
	 * 登录的用户信息
	 */
	@Deprecated
	public static String session_account_info = "session_account_info";
	public static String login_errorMsg = "login_errorMsg";//登陆错误消息
	public static String reset_password_email_timeout = "reset_password_email_timeout";//找回密码的链接已失效的标识符
//	@Deprecated
//	public static String show_user_option_error = "show_user_option_error";//显示用户操作错误信息，error.jsp页面会显示session中该key指定的错误信息，显示后会同时清除该错误信息。
	//当前门户上的菜单
	public static final String current_menu = "current_menu";
	//我的二维码模块的子项菜单
	public static final String current_item_menu = "current_item_menu";
	public static final String validateCode = "validateCode";//session中的验证码
	public static final String not_select_menu = "not_select_menu";//不选择任何导航条的菜单
	public static final String product_images_spider = ",";//商品图片分割符
	public static final String history_product_map = "history_product_map";//浏览过的商品列表
	
	/**
	 * 会员中心，左边菜单
	 */
	public static final String user_leftMenu_user = "user";//个人资料
	public static final String user_leftMenu_topwd = "topwd";//修改密码
	public static final String user_leftMenu_orders = "orders";//我的订单
	public static final String user_leftMenu_address = "address";//配送地址
	public static final String user_leftMenu_favorite = "favorite";//商品收藏夹
	public static final String user_leftMenu_exit = "exit";//退出
	
	public static final String action_exception_error = "action_exception_error";//action异常的错误信息
	public static final String action_exception_stack_error = "action_exception_stack_error";//action异常栈的错误信息
	
	public static final Object insert_outAccount_lock = new Object();//使用第三方信任登陆，系统会为该信任登陆在本地系统建立一个虚账户，此变量保证虚账号在本系统中建立的时候账号不重复。加锁！
	public static final Object insert_favorite_lock = new Object();//收藏夹锁.防止添加重复记录
	public static final Object alipay_notify_lock = new Object();//支付宝通知锁
	public static final Object update_account_score_lock = new Object();//更新会员积分锁，对会员积分的修改必须保证原子性
	
	public static final String request_illegal_error = "请求非法！";//所有的非法请求全部抛出此错误
	
}
