package net.jeeshop.core.oss;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.jeeshop.core.front.SystemManager;
import net.jeeshop.services.front.systemSetting.bean.SystemSetting;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONObject;
import com.aliyun.openservices.ClientConfiguration;
import com.aliyun.openservices.ClientException;
import com.aliyun.openservices.oss.OSSClient;
import com.aliyun.openservices.oss.OSSException;
import com.aliyun.openservices.oss.model.CannedAccessControlList;
import com.aliyun.openservices.oss.model.ListObjectsRequest;
import com.aliyun.openservices.oss.model.OSSObjectSummary;
import com.aliyun.openservices.oss.model.ObjectListing;

/**
 * 读取阿里云OSS的目录列表或文件列表
 * 
 * 参考：http://aliyun_portal_storage.oss.aliyuncs.com/oss_api/oss_javahtml/object.html#id6
 * @author jqsl2012@163.com
 *
 */
public class OSSFileManagerJson {
	private static final Logger logger = LoggerFactory.getLogger(OSSFileManagerJson.class);
	private OSSClient client;
	
	public String write(HttpServletRequest request,HttpServletResponse response){
		logger.error("write...");
		SystemSetting systemSetting = SystemManager.systemSetting;
		//根目录路径，可以指定绝对路径，比如 /var/www/attached/
		String rootPath = null;//pageContext.getServletContext().getRealPath("/") + "attached/";
		//String rootPath = "D:\\workspace\\myshop\\web\\attached\\";//pageContext.getServletContext().getRealPath("/") + "attached/";
		//根目录URL，可以指定绝对路径，比如 http://www.yoursite.com/attached/
		String rootUrl  = systemSetting.getImageRootPath()+"/attached/";//request.getContextPath() + "/attached/";
		rootPath = rootUrl;
		//图片扩展名
		String[] fileTypes = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};

		String dirName = request.getParameter("dir");
		logger.error("dirName = "+dirName);
		if (dirName != null) {
			if(!Arrays.<String>asList(new String[]{"image", "flash", "media", "file"}).contains(dirName)){
//				out.println("Invalid Directory name.");
				return "Invalid Directory name.";
			}
			rootPath += dirName + "/";
			rootUrl += dirName + "/";
			File saveDirFile = new File(rootPath);
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}
		}
		//根据path参数，设置各路径和URL
		String path = request.getParameter("path") != null ? request.getParameter("path") : "";
		String currentPath = rootPath + path;
		String currentUrl = rootUrl + path;
		String currentDirPath = path;
		String moveupDirPath = "";
		
		logger.error("path="+path);
		
		if (!"".equals(path)) {
			String str = currentDirPath.substring(0, currentDirPath.length() - 1);
			moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0, str.lastIndexOf("/") + 1) : "";
		}

		//排序形式，name or size or type
		String order = request.getParameter("order") != null ? request.getParameter("order").toLowerCase() : "name";

		//不允许使用..移动到上一级目录
		if (path.indexOf("..") >= 0) {
//			out.println("Access is not allowed.");
			return "Access is not allowed.";
		}
		//最后一个字符不是/
		if (!"".equals(path) && !path.endsWith("/")) {
//			out.println("Parameter is not valid.");
			return "Parameter is not valid.";
		}
		//目录不存在或不是目录
//		File currentPathFile = new File(currentPath);
//		if(!currentPathFile.isDirectory()){
//			out.println("Directory does not exist.");
//			return "Directory does not exist.";
//		}

		//遍历目录取的文件信息
		List<Hashtable> fileList = new ArrayList<Hashtable>();
		Map<String,String> addFileMap = new HashMap<String,String>();

		String _tmpRootPath = "attached/image/";
		
		if(StringUtils.isNotBlank(path)){
			_tmpRootPath = _tmpRootPath + path;
		}
		logger.error("_tmpRootPath="+_tmpRootPath);
		
		ObjectListing osslist = getDirList(_tmpRootPath);
		if((osslist.getCommonPrefixes()==null || osslist.getCommonPrefixes().size()==0) && 
				(osslist.getObjectSummaries()==null || osslist.getObjectSummaries().size()==0)){
			logger.error("没有文件夹和目录！");
		}else{
			//遍历所有文件夹CommonPrefix
            logger.error("文件夹CommonPrefixs:");
            for (String commonPrefix : osslist.getCommonPrefixes()) {
//	                System.out.println(commonPrefix);
            	String filename = commonPrefix.substring(_tmpRootPath.length());
            	if(filename.endsWith("/")){
            		filename = filename.substring(0, filename.length()-1);
            	}
                Hashtable<String, Object> hash = new Hashtable<String, Object>();
                
//                boolean ss = hasFile("myshopxx", _tmpRootPath, client);
//                logger.error("sss="+ss);
                
                hash.put("is_dir", true);
				hash.put("has_file", true);//(file.listFiles() != null));
				hash.put("filesize", 0L);
				hash.put("is_photo", false);
				hash.put("filetype", "");
				
				hash.put("filename", filename);
				hash.put("datetime", filename);//"2014-03-21");//new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified()));
				fileList.add(hash);
            }
            
			logger.error("Objects:");
			//获取所有的文件列表
            for (OSSObjectSummary objectSummary : osslist.getObjectSummaries()) {
//	                System.out.println(objectSummary.getKey()+","+objectSummary.getETag());
            	Hashtable<String, Object> hash = new Hashtable<String, Object>();
            	logger.error("objectSummary.getKey()="+objectSummary.getKey());
            	if(StringUtils.isBlank(objectSummary.getKey()) || objectSummary.getKey().equals(_tmpRootPath)){
            		continue;
            	}
            	
            	String filename = objectSummary.getKey().substring(_tmpRootPath.length());
            	if(filename.endsWith("/")){
            		filename = filename.substring(0, filename.length()-1);
            	}
            	logger.error("filename="+filename);
            	String _fileName = filename.substring(0,filename.lastIndexOf("."));
            	String[] arr = _fileName.split("_");
            	if(arr.length==2){
            		String fileNameA = _fileName.split("_")[1];
            		//切割的小图不需要显示。
            		if(fileNameA.equals("1") || fileNameA.equals("2")){
            			continue;
            		}
            	}
            	String fileExt = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();//文件后缀
            	
            	hash.put("is_dir", false);
				hash.put("has_file", false);
				hash.put("filesize", objectSummary.getSize());
				hash.put("is_photo", Arrays.<String>asList(fileTypes).contains(fileExt));
				hash.put("filetype", fileExt);
				
				hash.put("filename", filename);
				hash.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(objectSummary.getLastModified()));
				fileList.add(hash);
            }
		}

		if ("size".equals(order)) {
			Collections.sort(fileList, new SizeComparator());
		} else if ("type".equals(order)) {
			Collections.sort(fileList, new TypeComparator());
		} else {
			Collections.sort(fileList, new NameComparator());
		}
		JSONObject result = new JSONObject();
		result.put("moveup_dir_path", moveupDirPath);
		result.put("current_dir_path", currentDirPath);
		result.put("current_url", currentUrl);
		result.put("total_count", fileList.size());
		result.put("file_list", fileList);
		
		logger.error("result.toJSONString()="+result.toJSONString());
		return result.toJSONString();
	}
	
	private ObjectListing getDirList(String dir){
		String ACCESS_ID = SystemManager.aliyunOSS.getACCESS_ID();
        String OSS_ENDPOINT=SystemManager.aliyunOSS.getOSS_ENDPOINT();
        String ACCESS_KEY=SystemManager.aliyunOSS.getACCESS_KEY();
        String bucketName = SystemManager.aliyunOSS.getBucketName();
        // 可以使用ClientConfiguration对象设置代理服务器、最大重试次数等参数。
        ClientConfiguration config = new ClientConfiguration();
        client = new OSSClient(OSS_ENDPOINT, ACCESS_ID, ACCESS_KEY, config);

        ensureBucket(client, bucketName);

        try {
            setBucketPublicReadable(client, bucketName);
         // 构造ListObjectsRequest请求
            ListObjectsRequest listObjectsRequest = new ListObjectsRequest(bucketName);
            listObjectsRequest.setDelimiter("/");
         // 列出fun目录下的所有文件和文件夹
            listObjectsRequest.setPrefix(dir);//"attached/image/20140317/");
//            listObjectsRequest.setMarker("123");
            ObjectListing list = client.listObjects(listObjectsRequest);
         // 遍历所有Object
//            System.out.println("Objects:");
//            for (OSSObjectSummary objectSummary : list.getObjectSummaries()) {
//                System.out.println(objectSummary.getKey()+","+objectSummary.getETag()+","+objectSummary.getBucketName()+","+objectSummary.getLastModified());
//            }
            
         // 遍历所有CommonPrefix
//            System.out.println("文件夹CommonPrefixs:");
//            for (String commonPrefix : list.getCommonPrefixes()) {
//                System.out.println(commonPrefix);
//            }
            return list;
        } catch(OSSException e){ 
        	e.printStackTrace();
        	if(e.getErrorCode().equals("NoSuchKey")){
        		System.out.println("文件不存在");
        	}
        }finally {
        }
        return null;
	}
	
//	private boolean hasFile(String bucketName,String dir,OSSClient client){
//		// 构造ListObjectsRequest请求
//        ListObjectsRequest listObjectsRequest = new ListObjectsRequest(bucketName);
//        listObjectsRequest.setDelimiter("/");
//     // 列出fun目录下的所有文件和文件夹
//        listObjectsRequest.setPrefix(dir);//"attached/image/20140317/");
////        listObjectsRequest.setMarker("123");
//        ObjectListing list = client.listObjects(listObjectsRequest);
//        if(list!=null && list.getObjectSummaries()!=null && list.getCommonPrefixes().size()>0){
//        	return true;
//        }
//        return false;
//	}
	
	// 如果Bucket不存在，则创建它。
    private static void ensureBucket(OSSClient client, String bucketName)
            throws OSSException, ClientException{

        if (client.isBucketExist(bucketName)){
        	logger.error("isBucketExist true");
            return;
        }

        //创建bucket
//        client.createBucket(bucketName);
    }
    
	// 把Bucket设置为所有人可读
    private static void setBucketPublicReadable(OSSClient client, String bucketName)
            throws OSSException, ClientException {
        //创建bucket
        client.createBucket(bucketName);

        //设置bucket的访问权限，public-read-write权限
        client.setBucketAcl(bucketName, CannedAccessControlList.PublicRead);
    }
    
    class NameComparator implements Comparator<Object> {
    	public int compare(Object a, Object b) {
    		Hashtable hashA = (Hashtable)a;
    		Hashtable hashB = (Hashtable)b;
    		if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
    			return -1;
    		} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
    			return 1;
    		} else {
    			return ((String)hashA.get("filename")).compareTo((String)hashB.get("filename"));
    		}
    	}
    }
    class SizeComparator implements Comparator<Object> {
    	public int compare(Object a, Object b) {
    		Hashtable hashA = (Hashtable)a;
    		Hashtable hashB = (Hashtable)b;
    		if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
    			return -1;
    		} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
    			return 1;
    		} else {
    			if (((Long)hashA.get("filesize")) > ((Long)hashB.get("filesize"))) {
    				return 1;
    			} else if (((Long)hashA.get("filesize")) < ((Long)hashB.get("filesize"))) {
    				return -1;
    			} else {
    				return 0;
    			}
    		}
    	}
    }
    class TypeComparator implements Comparator<Object> {
    	public int compare(Object a, Object b) {
    		Hashtable hashA = (Hashtable)a;
    		Hashtable hashB = (Hashtable)b;
    		if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
    			return -1;
    		} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
    			return 1;
    		} else {
    			return ((String)hashA.get("filetype")).compareTo((String)hashB.get("filetype"));
    		}
    	}
    }
}
