//package net.jeeshop.core.manage;
//
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.LinkedList;
//import java.util.List;
//import java.util.Map;
//import java.util.Properties;
//import java.util.logging.Logger;
//
//import javax.servlet.http.HttpServletRequest;
//
//import net.jeeshop.core.listener.SystemListener;
//import net.jeeshop.services.common.Area;
//import net.jeeshop.services.common.Catalog;
//import net.jeeshop.services.common.NotifyTemplate;
//import net.jeeshop.services.common.Product;
//import net.jeeshop.services.common.SystemSetting;
//import net.jeeshop.services.manage.order.bean.OrdersReport;
//import net.jeeshop.services.manage.oss.bean.AliyunOSS;
//
///**
// * 系统管理类，负责管理system.properties的东东
// * @author huangf
// *
// */
//public class SystemManager {
//	private static final Logger log = Logger.getLogger(SystemManager.class
//			.getName());
//	private static Properties p = new Properties();
//	private static SystemManager instance = new SystemManager();
//	
////	public static final String superTypeList = "superTypeList";
//	
//	/**
//	 * 商品目录，树形结构
//	 */
////	@Deprecated
////	public static List<SuperType> superTypeList;
//	
//	/**
//	 * 促销的商品 top=10
//	 */
//	public static List<List<Product>> goodsTopList;
//	public static SystemSetting systemSetting;//系统配置
//	public static Map<String, NotifyTemplate> notifyTemplateMap = new HashMap<String, NotifyTemplate>();//邮件通知模板
//	public static OrdersReport ordersReport;//系统订单报表对象
//	public static AliyunOSS aliyunOSS;//阿里云存储的配置信息
//	
//	public static Map<Integer,Catalog> catalogsMap = new HashMap<Integer,Catalog>();//目录的MAP形式，具有层级关系。key：主类别ID，value：主类别对象，可以通过该对象的getChildren()方法获取该主类别的所有的子类别集合
//	public static Map<String,Catalog> catalogsCodeMap = new HashMap<String,Catalog>();//目录的MAP形式，具有层级关系。key：主类别code，value：主类别对象，可以通过该对象的getChildren()方法获取该主类别的所有的子类别集合
//	public static List<Catalog> catalogs = new LinkedList<Catalog>();//产品目录列表
//	public static List<Catalog> catalogsArticle = new LinkedList<Catalog>();//文章目录列表
//	public static Map<String, Area> areaMap;//省市区集合
//	
//	public static Map<String,String> expressMap = new HashMap<String, String>();
//	
//	static {
//		expressMap.put("shunfeng", "顺风快递");
//		expressMap.put("ems", "EMS");
//		expressMap.put("shentong", "申通E物流");
//		expressMap.put("yuantong", "圆通速递");
//		expressMap.put("zhongtong", "中通速递");
//		expressMap.put("zhaijisong", "宅急送");
//		expressMap.put("yunda", "韵达快运");
//		expressMap.put("tiantian", "天天快递");
//		expressMap.put("lianbangkuaidi", "联邦快递");
//		expressMap.put("huitongkuaidi", "汇通快运");
////		expressMap.put("", "华强物流");
////		expressMap.put("", "");
//	}
//	
//	static {
//		init();
//	}
//	public static SystemManager getInstance(){
//		return instance;
//	}
//	
//	private static void init(){
//		try {
//			p.clear();
//			p.load(SystemListener.class
//					.getResourceAsStream("/system.properties"));
//
//			log.info(p.toString());
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	public String get(String key){
//		return p.getProperty(key);
//	}
//
//	/**
//	 * 获取网站上下文路径/house
//	 * 正式环境和测试环境获取上下文不一样
//	 * @param request
//	 * @return
//	 */
//	public static String getContextPath(HttpServletRequest request){
//		if(Boolean.valueOf(getInstance().get("is_www"))){
//			return SystemManager.getInstance().get("contextPath");
//		}
//		return request.getContextPath();
//	}
//
//	/**
//	 * 根据类别ID获取该类别下的所有ID集合
//	 * @param catalogID
//	 * @return
//	 */
//	public List<String> getCatalogsById(String catalogID) {
//		if(org.apache.commons.lang.StringUtils.isBlank(catalogID)){
////			throw new NullPointerException();
//			return null;
//		}
//		
//		if(this.catalogs==null || this.catalogs.size()==0){
//			return null;
//		}
//		
//		List<String> list = new LinkedList<String>();
//		Catalog cataInfo = this.catalogsMap.get(Integer.valueOf(catalogID));
//		if(cataInfo.getPid().equals("0")){
//			//主类
//			for(int i=0;i<cataInfo.getChildren().size();i++){
//				list.add(cataInfo.getChildren().get(i).getId());
//			}
//		}else{
//			//子类
//			list.add(catalogID);
//		}
//		return list;
//	}
//}
