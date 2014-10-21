package net.jeeshop.core;

import net.jeeshop.services.manage.indexImg.IndexImgService;
import net.jeeshop.services.manage.news.NewsService;

/**
 * 全局变量
 * @author huangf
 *
 */
public class ManageContainer {
	
	public static final String MENU_list = "menu_list";// 菜单信息
	public static final String MENUS = "menus";
	public static final String PROJECTS = "projects";
	public static final String USERS = "users";
	public static final String loginError = "loginError";//登陆错误

	public static final int PAGE_SIZE = 20;// 默认分页条数
	
	/**
	 * 商品目录树
	 */
	public static final String typeTree = "typeTree";
	
	
	
	
	
	public static final String news = "news";//内容key
	public static final String lable = "lable";//标签KEY
	public static final String sessionID = "sessionID";//sessionIDKEY
	public static final String imgList = "imgList";
	public static NewsService newsService;//门户内容
	public static IndexImgService indexImgService;//门户滚动图片
	public static final String resource_menus = "resource_menus";//用户资源菜单
	public static final String user_resource_menus_button = "user_resource_menus_button";//用户资源功能菜单
	public static final String SystemSetting = "SystemSetting";//资源菜单
	public static final String manage_session_user_info = "manage_session_user_info";//用户信息
	
	
	/**
	 * 登录的用户信息
	 */
	public static String session_account_info = "session_account_info";
	//当前门户上的菜单
	public static final String current_menu = "current_menu";
	//我的二维码模块的子项菜单
	public static final String current_item_menu = "current_item_menu";
	public static final String product_images_spider = ",";//商品图片分割符
	
	
//	public static final String user_db_privilege = "user_db_privilege";//用户数据库权限
	public static final String db_privilege_select = "db_privilege_select";//数据库权限-查询
	public static final String db_privilege_insert = "db_privilege_insert";//数据库权限-添加
	public static final String db_privilege_update = "db_privilege_update";//数据库权限-修改
	public static final String db_privilege_delete = "db_privilege_delete";//数据库权限-删除
	
	public static final String db_privilege_insert_error = "权限受限：该用户没有添加数据的权限！";//数据库权限-添加-错误信息
	public static final String db_privilege_update_error = "权限受限：该用户没有修改数据的权限！";//数据库权限-修改-错误信息
	public static final String db_privilege_delete_error = "权限受限：该用户没有删除数据的权限！";//数据库权限-删除-错误信息
	
	public static final String action_db_error = "action_db_error";//action操作DB异常信息
	public static final String action_exception_error = "action_exception_error";//action异常的错误信息
	public static final String action_exception_stack_error = "action_exception_stack_error";//action异常栈的错误信息
	
	/**
	 * 数据库操作
	 */
	public static final String db_insert = "insert";
	public static final String db_update = "update";
	public static final String db_delete = "delete";
	
	public static final String not_this_method = "不支持此操作!";
	
	/**
	 * 错误编码规则：ERROR_action名称_方法名称_错误操作
	 */
	public static final String OrderAction_param_null = "参数非法！";
	public static final String OrderAction_selectById_null = "根据订单ID查询不到订单信息！";
	public static final String OrderAction_updatePayMonery_cancel = "操作非法:未审核和已审核的订单才能取消！";
	public static final String OrderAction_updatePayMonery_update = "操作非法：未审核的订单才能进行此操作！";
	public static final String OrderAction_updateOrderStatus_alreadyCancel = "操作非法:订单已处于取消状态！";
	public static final String OrderAction_updateOrderStatus_statusException = "操作非法:订单状态异常！";
	
	public static final String RoleAction_update_error = "非法操作！";
}
