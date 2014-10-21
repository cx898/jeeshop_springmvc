//package net.jeeshop.core.manage;
//
//import java.io.File;
//import java.io.IOException;
//import java.util.Collections;
//import java.util.Comparator;
//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.LinkedList;
//import java.util.List;
//import java.util.Map;
//import java.util.TreeMap;
//import java.util.Map.Entry;
//
//import net.jeeshop.core.KeyValueHelper;
//import net.jeeshop.core.pay.alipay.alipayescow.config.AlipayConfig;
//import net.jeeshop.core.util.CreateAreaUtil;
//import net.jeeshop.services.manage.area.AreaService;
//import net.jeeshop.services.manage.area.bean.Area;
//import net.jeeshop.services.manage.catalog.CatalogService;
//import net.jeeshop.services.manage.catalog.bean.Catalog;
//import net.jeeshop.services.manage.comment.CommentService;
//import net.jeeshop.services.manage.comment.impl.CommentServiceImpl;
//import net.jeeshop.services.manage.commentType.bean.CommentType;
//import net.jeeshop.services.manage.keyvalue.KeyvalueService;
//import net.jeeshop.services.manage.keyvalue.bean.Keyvalue;
//import net.jeeshop.services.manage.notifyTemplate.NotifyTemplateService;
//import net.jeeshop.services.manage.notifyTemplate.bean.NotifyTemplate;
//import net.jeeshop.services.manage.order.OrderService;
//import net.jeeshop.services.manage.order.bean.Order;
//import net.jeeshop.services.manage.order.bean.OrdersReport;
//import net.jeeshop.services.manage.oss.OssService;
//import net.jeeshop.services.manage.oss.bean.AliyunOSS;
//import net.jeeshop.services.manage.oss.bean.Oss;
//import net.jeeshop.services.manage.pay.PayService;
//import net.jeeshop.services.manage.pay.bean.Pay;
//import net.jeeshop.services.manage.product.ProductService;
//import net.jeeshop.services.manage.product.bean.Product;
//import net.jeeshop.services.manage.systemSetting.SystemSettingService;
//import net.jeeshop.services.manage.systemSetting.bean.SystemSetting;
//
//import org.apache.commons.io.FileUtils;
//import org.apache.commons.lang.StringUtils;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
//import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.TypeReference;
//
///**
// * 缓存管理器。 后台项目可以通过接口程序通知该类重新加载部分或全部的缓存
// * 
// * @author huangf
// * 
// */
//public class CacheManager {
//	private static final Logger logger = LoggerFactory.getLogger(CacheManager.class);
//	private KeyvalueService keyvalueService;
//	private SystemSettingService systemSettingService;
//	private OssService ossService;
//	private CatalogService catalogService;
//	private ProductService productService;
//	private AreaService areaService;
//	private OrderService orderService;
//	private PayService payService;
//	private NotifyTemplateService notifyTemplateService;
//	private CommentService commentService;
//	
//	public void setCommentService(CommentService commentService) {
//		this.commentService = commentService;
//	}
//
//	public void setNotifyTemplateService(NotifyTemplateService notifyTemplateService) {
//		this.notifyTemplateService = notifyTemplateService;
//	}
//
//	public void setPayService(PayService payService) {
//		this.payService = payService;
//	}
//
//	public void setOrderService(OrderService orderService) {
//		this.orderService = orderService;
//	}
//
//	public void setAreaService(AreaService areaService) {
//		this.areaService = areaService;
//	}
//
//	public void setOssService(OssService ossService) {
//		this.ossService = ossService;
//	}
//
//	public void setSystemSettingService(
//			SystemSettingService systemSettingService) {
//		this.systemSettingService = systemSettingService;
//	}
//
//	public void setCatalogService(CatalogService catalogService) {
//		this.catalogService = catalogService;
//	}
//
//	public void setProductService(ProductService productService) {
//		this.productService = productService;
//	}
//
//	public void setKeyvalueService(KeyvalueService keyvalueService) {
//		this.keyvalueService = keyvalueService;
//	}
//
//	/**
//	 * 加载key-value键值对
//	 */
//	public void loadKeyValue() {
//		logger.info("load...");
//		KeyValueHelper.load(keyvalueService.selectList(new Keyvalue()));
//	}
//
//	/**
//	 * 加载系统配置信息
//	 */
//	public void loadSystemSetting() {
//		SystemManager.systemSetting = systemSettingService.selectOne(new SystemSetting());
//	}
//	
//	/**
//	 * 加载云存储配置信息
//	 */
//	public void loadOSS() {
////		SystemManager.aliyunOSS = null;
//		
//		Oss oss = new Oss();
//		oss.setStatus(Oss.oss_status_y);
//		oss.setCode(Oss.code_aliyun);
//		
//		oss = ossService.selectOne(oss);
//		if(oss!=null){
//			if(oss.getCode().equals(Oss.code_aliyun)){
//				if(StringUtils.isBlank(oss.getOssJsonInfo())){
//					throw new NullPointerException("阿里云存储配置不能为空！");
//				}
//				AliyunOSS aliyunOSS = JSON.parseObject(oss.getOssJsonInfo(), AliyunOSS.class);
//				if(aliyunOSS==null){
//					throw new NullPointerException("阿里云配置不正确，请检查！");
//				}
//				SystemManager.aliyunOSS = aliyunOSS;
//			}
//		}else{
//			SystemManager.aliyunOSS = null;
//		}
//		
////		List<Oss> list = ossService.selectOne(oss);
////		if(list!=null && list.size()>0){
////			for(int i=0;i<list.size();i++){
////				Oss e = list.get(i);
////				if(e.getCode().equals("aliyun")){
////					if(StringUtils.isBlank(e.getOssJsonInfo())){
////						throw new NullPointerException("阿里云存储配置不能为空！");
////					}
////					AliyunOSS aliyunOSS = JSON.parseObject(e.getOssJsonInfo(), AliyunOSS.class);
////					if(aliyunOSS==null){
////						throw new NullPointerException("阿里云配置不正确，请检查！");
////					}
////					SystemManager.aliyunOSS = aliyunOSS;
////				}
////			}
////		}
//	}
//
//	/**
//	 * 加载目录列表,树形结构
//	 */
//	public void loadCatalogs() {
////		log.info("load...");
////		Catalog c = new Catalog();
////		c.setType("p");
////		c.setPid("0");
////		List<Catalog> catalogs = catalogService.loadRoot(c);
////
////		System.out.println("result:" + catalogs);
////
////		SystemManager.catalogs = catalogs;
//		
//		loadCatalogs2("p",SystemManager.catalogs);
//		loadCatalogs2("a",SystemManager.catalogsArticle);
//		
//		logger.error("SystemManager.catalogs="+SystemManager.catalogs.size());
//		logger.error("SystemManager.catalogsArticle="+SystemManager.catalogsArticle.size());
//		
//		SystemManager.catalogsMap.clear();
//		SystemManager.catalogsCodeMap.clear();
//		putToMap(SystemManager.catalogs);
//	}
//	
//	public static void putToMap(List<Catalog> catalogs){
//		for(int i=0;i<catalogs.size();i++){
//			Catalog item = catalogs.get(i);
//			SystemManager.catalogsMap.put(Integer.valueOf(item.getId()),item);
//			SystemManager.catalogsCodeMap.put(item.getCode(),item);
//			if(item.getChildren()!=null && item.getChildren().size()>0){
//				putToMap(item.getChildren());
//			}
//		}
//	}
//	
//	private void loadCatalogs2(String type,List<Catalog> catalogs){
//		//原来递归的方式修改为非递归方式
//		Catalog cc = new Catalog();
//		cc.setType(type);
//		List<Catalog> catalogsList = catalogService.selectList(cc);
//		if(catalogsList!=null){
//			Map<String, Catalog> map = new HashMap<String, Catalog>();
//			for(Iterator<Catalog> it = catalogsList.iterator();it.hasNext();){
//				Catalog item = it.next();
//				if(StringUtils.isNotBlank(item.getPid()) && item.getPid().equals("0")){
////							list.add(item);
//					map.put(item.getId(), item);
//					it.remove();
//				}
//			}
//			
//			for(Iterator<Catalog> it = catalogsList.iterator();it.hasNext();){
//				Catalog item = it.next();
//				if(StringUtils.isNotBlank(item.getPid())){
////							list.add(item);
//					Catalog rootItem = map.get(item.getPid());
//					if(rootItem!=null){
//						if(rootItem.getChildren()==null){
//							rootItem.setChildren(new LinkedList<Catalog>());
//						}
//						rootItem.getChildren().add(item);
//					}
//					it.remove();
//				}
//			}
//			
//			if(catalogs==null){
//				catalogs = new LinkedList<Catalog>();
//			}else{
//				catalogs.clear();
//			}
//
//			for(Iterator<Entry<String, Catalog>> it = map.entrySet().iterator();it.hasNext();){
//				catalogs.add(it.next().getValue());
//			}
//			
//			//对主类别和子类别进行排序
//			Collections.sort(catalogs, new Comparator<Catalog>() {
//				public int compare(Catalog o1, Catalog o2) {
//					if (o1.getOrder1() > o2.getOrder1()) {
//						return 1;
//					} else if (o1.getOrder1() < o2.getOrder1()) {
//						return -1;
//					}
//					return 0;
//				}
//			});
//			
//			for(int i=0;i<catalogs.size();i++){
//				if(catalogs.get(i).getChildren()==null){
//					continue;
//				}
//				Collections.sort(catalogs.get(i).getChildren(), new Comparator<Catalog>() {
//					public int compare(Catalog o1, Catalog o2) {
//						if (o1.getOrder1() > o2.getOrder1()) {
//							return 1;
//						} else if (o1.getOrder1() < o2.getOrder1()) {
//							return -1;
//						}
//						return 0;
//					}
//				});
//			}
//		}
//	}
//
//	/**
//	 * 加载促销的商品
//	 */
//	public void selectTopProducts() {
//		Product e = new Product();
//		e.setStatus(1);
//		e.setTop(8);
//
//		List<Product> result = productService.selectList(e);
//		if (result == null || result.size() == 0) {
//			return;
//		}
//
//		System.out.println("result=" + result);
//
//		List<List<Product>> list = new LinkedList<List<Product>>();
//		int nn = 0;
//		int maxLen = 4;
//		int i = 0;
//		List<Product> row = new LinkedList<Product>();
//		for (Iterator<Product> it = result.iterator(); it.hasNext();) {
//			Product ee = (Product) it.next();
//			row.add(ee);
//			nn++;
//			i++;
//			if (nn == maxLen) {
//				list.add(row);
//				nn = 0;
//				row = new LinkedList<Product>();
//			}
//
//			if ((result.size() == 1 + i)) {
//				if (row.size() == 0) {
//					row.add(ee);
//				}
//				list.add(row);
//				break;
//			}
//		}
//		SystemManager.goodsTopList = list;// productTypeService.selectList(e);
//
//		System.out.println("list====" + list);
//	}
//
//	// 加载商品
//	private List<Product> loadProducts(int type) {
//		Product p = new Product();
//		p.setTop(4);
//		if (type == 1) {
//			p.setIsnew(1);
//		} else if (type == 2) {
//			p.setSale(1);
//		}
//		return productService.selectList(p);
//	}
//	
//	/**
//	 * 为系统初始化省市区数据
//	 */
//	public void initAreaDataToDB() {
//		Map<String, Area> map = CreateAreaUtil.getAreaMap();
//		if(map.size()==0){
//			return;
//		}
//		
//		areaService.initAreaDataToDB(map);
//	}
//	
//	/**
//	 * 加载省市区数据
//	 */
//	private void loadArea(){
//		logger.error("loadArea...");
//		Area area = new Area();
//		area.setPcode("0");
//		List<Area> rootData = areaService.selectList(area);
//		if(rootData==null){
//			return ;
//		}
//		
//		for(int i=0;i<rootData.size();i++){
//			Area item = rootData.get(i);
//			getAreaByDigui2(item);
//		}
//		
//		Map<String, Area> map = new TreeMap<String, Area>();
//		for(int i=0;i<rootData.size();i++){
//			Area item = rootData.get(i);
//			map.put(item.getCode(), item);
//		}
//		
//		SystemManager.areaMap = map;
//		
////		logger.error("SystemManager.areaMap=="+SystemManager.areaMap);
//		
//		String json = JSON.toJSONString(SystemManager.areaMap);
////		logger.error("json="+json);
//		try {
//			//写到文件
//			File file = new File("__area.txt");
//			logger.error(file.getAbsolutePath());
//			FileUtils.writeStringToFile(new File("__area.json"), json, "utf-8");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	/**
//	 * 递归加载省份下的：城市、区域、以后还会有街道的数据
//	 * @param item
//	 */
//	private void getAreaByDigui2(Area item){
//		Area area = new Area();
//		area.setPcode(item.getCode());
//		List<Area> children = areaService.selectList(area);
//		if(children==null){
//			return ;
//		}
//		
//		item.setChildren(children);
//		
//		
//		for(int i=0;i<children.size();i++){
//			getAreaByDigui2(children.get(i));
//		}
//	}
//	
//	//递归分离区域数据
//	@Deprecated
//	private void getAreaByDigui(List<Area> data,Map<String, Area> map){
//		logger.error("getAreaByDigui data = " + data.size() + ",map = " + map.size());
//		if (data == null || data.size() == 0) {
//			return;
//		}
//		
//		for(Iterator<Area> it = data.iterator();it.hasNext();){
//			Area areaInfo = it.next();
//			Area parentItem = map.get(areaInfo.getPcode());
//			if (parentItem != null) {
//				map.put(areaInfo.getCode(), areaInfo);
//				
//				if(parentItem.getChildren()==null){
//					parentItem.setChildren(new LinkedList<Area>());
//				}
//				
//				parentItem.getChildren().add(areaInfo);
//				it.remove();
//			}
//		}
//		
//		logger.error("data = " + data.size());
//		logger.error("map = " + map.toString());
//	}
//	
//	/**
//	 * 加载订单报表
//	 */
//	public void loadOrdersReport(){
//		SystemManager.ordersReport = orderService.loadOrdersReport();
//		if(SystemManager.ordersReport==null){
//			SystemManager.ordersReport = new OrdersReport();
//		}
//		//加载缺货商品数
//		SystemManager.ordersReport.setOutOfStockProductCount(productService.selectOutOfStockProductCount());
//
//		//加载吐槽评论数
//		SystemManager.ordersReport.setNotReplyCommentCount(commentService.selectNotReplyCount());
//	}
//	
//	/**
//	 * 加载插件配置
//	 */
//	public void loadPlugConfig() {
//		
//		/**
//		 * 加载支付宝配置
//		 */
//		Pay pay = new Pay();
//		pay.setCode(Pay.pay_code_alipay);
//		pay = payService.selectOne(pay);
////		SystemManager.alipayConfig = pay.getSeller();
//		
//		AlipayConfig.partner = pay.getPartner();
//		AlipayConfig.key = pay.getKey1();
//		
////		logger.error("SystemManager.alipayConfig="+SystemManager.alipayConfig);
//		
//		/**
//		 * 加载评论配置
//		 */
////		CommentType commentType = new CommentType();
////		commentType.setStatus(CommentType.commentType_status_y);
////		commentType = commentTypeService.selectOne(commentType);
////		SystemManager.commentTypeCode = commentType.getCode();
////		logger.error("SystemManager.commentTypeCode="+SystemManager.commentTypeCode);
//	}
//	
//	private void readJsonArea(){
//		long start = System.currentTimeMillis();
//		try {
//			String path = CacheManager.class.getResource("/").getPath();
//			logger.error("path = " + path);
//			File file = new File(path + "__area.json");
//			logger.error(file.getAbsolutePath());
//			List<String> list = FileUtils.readLines(file, "utf-8");
//			logger.error("list.size()="+list.size());
//			
//			SystemManager.areaMap = JSON.parseObject(list.get(0),new TypeReference<Map<String,Area>>(){});
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		logger.error("readJsonArea time = " + (System.currentTimeMillis() - start));
//	}
//	
//	/**
//	 * 加载模板列表
//	 */
//	private void loadNotifyTemplate(){
//		List<NotifyTemplate> list = notifyTemplateService.selectList(null);
//		if(list!=null && list.size()>0){
//			SystemManager.notifyTemplateMap = new HashMap<String, NotifyTemplate>();
//			for(int i=0;i<list.size();i++){
//				NotifyTemplate item = list.get(i);
//				SystemManager.notifyTemplateMap.put(item.getCode(), item);
//			}
//		}
//	}
//
//	/**
//	 * 加载全部的内存数据
//	 */
//	public void loadAllCache() {
//		logger.error("loadAllCache...");
//		
////		initAreaDataToDB();
////		loadArea();
//		readJsonArea();
////		
//		loadCatalogs();
//		loadKeyValue();
//		loadSystemSetting();
//		loadOSS();
//		loadPlugConfig();
//		loadOrdersReport();
//		loadNotifyTemplate();
//		logger.error("后台缓存加载完毕!");
//	}
//	
//	public static void main(String[] args) {
//		Map<String, Area> map = new TreeMap<String, Area>();
//		
//		map.put("2", new Area());
//		map.put("1", new Area());
//		System.out.println(map);
//	}
//}
