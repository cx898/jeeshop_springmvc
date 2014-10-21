package net.jeeshop.core.oss;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import net.jeeshop.core.front.SystemManager;
import net.jeeshop.web.action.manage.news.NewsAction;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.aliyun.openservices.ClientConfiguration;
import com.aliyun.openservices.ClientException;
import com.aliyun.openservices.oss.OSSClient;
import com.aliyun.openservices.oss.OSSException;
import com.aliyun.openservices.oss.model.CannedAccessControlList;
import com.aliyun.openservices.oss.model.GetObjectRequest;
import com.aliyun.openservices.oss.model.ListObjectsRequest;
import com.aliyun.openservices.oss.model.OSSObject;
import com.aliyun.openservices.oss.model.OSSObjectSummary;
import com.aliyun.openservices.oss.model.ObjectListing;
import com.aliyun.openservices.oss.model.ObjectMetadata;

/**
 * 该示例代码展示了如果在OSS中创建和删除一个Bucket，以及如何上传和下载一个文件。
 * 
 * 该示例代码的执行过程是：
 * 1. 检查指定的Bucket是否存在，如果不存在则创建它；
 * 2. 上传一个文件到OSS；
 * 3. 下载这个文件到本地；
 * 4. 清理测试资源：删除Bucket及其中的所有Objects。
 * 
 * 尝试运行这段示例代码时需要注意：
 * 1. 为了展示在删除Bucket时除了需要删除其中的Objects,
 *    示例代码最后为删除掉指定的Bucket，因为不要使用您的已经有资源的Bucket进行测试！
 * 2. 请使用您的API授权密钥填充ACCESS_ID和ACCESS_KEY常量；
 * 3. 需要准确上传用的测试文件，并修改常量uploadFilePath为测试文件的路径；
 *    修改常量downloadFilePath为下载文件的路径。
 * 4. 该程序仅为示例代码，仅供参考，并不能保证足够健壮。
 *
 */
public class OSSObjectSample {
	private static final Logger logger = LoggerFactory.getLogger(OSSObjectSample.class);
//    private static final String ACCESS_ID = SystemManager.getInstance().get("ACCESS_ID");
//    private static final String ACCESS_KEY = SystemManager.getInstance().get("ACCESS_KEY");
//    private static final String OSS_ENDPOINT = SystemManager.getInstance().get("OSS_ENDPOINT");
//    private static final String bucketName =  SystemManager.getInstance().get("bucketName");

//    private static final String ACCESS_ID = SystemManager.aliyunOSS.getACCESS_ID();
//    private static final String ACCESS_KEY = SystemManager.aliyunOSS.getACCESS_KEY();
//    private static final String OSS_ENDPOINT = SystemManager.aliyunOSS.getOSS_ENDPOINT();
//    private static final String bucketName =  SystemManager.aliyunOSS.getBucketName();
    public static Object lock = new Object();
    
    /**
     * 上传本地文件到阿里云OSS
     * @param filePath 文件存储到阿里云OSS的路径
     * @param file	本地文件对象
     * @throws OSSException
     * @throws ClientException
     * @throws FileNotFoundException
     */
	public static void save(String filePath, File file) {
		try {
			save0(filePath, file);
		} catch (OSSException e) {
			e.printStackTrace();
		} catch (ClientException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void save0(String filePath, File file)
			throws FileNotFoundException {
		if(SystemManager.aliyunOSS==null){
    		logger.error("阿里云存储未被启用");
    		return;
    	}
    	
    	logger.error("filePath="+filePath);
    	System.out.println("filePath="+filePath);
    	// 可以使用ClientConfiguration对象设置代理服务器、最大重试次数等参数。
        ClientConfiguration config = new ClientConfiguration();
        OSSClient client = new OSSClient(SystemManager.aliyunOSS.getOSS_ENDPOINT(), SystemManager.aliyunOSS.getACCESS_ID(), SystemManager.aliyunOSS.getACCESS_KEY(), config);

        ensureBucket(client, SystemManager.aliyunOSS.getBucketName());
        setBucketPublicReadable(client, SystemManager.aliyunOSS.getBucketName());
        // 获取Object，返回结果为OSSObject对象
        logger.error("bucketName=" + SystemManager.aliyunOSS.getBucketName());
        OSSObject object = client.getObject(SystemManager.aliyunOSS.getBucketName(), "attached/");
        
        // 获取Object的输入流
        InputStream objectContent = object.getObjectContent();
        System.out.println(objectContent);
        System.out.println("正在上传...");
//            fileName = System.currentTimeMillis() + "." +getExtensionName(fileName);
        String url = uploadFile(client, SystemManager.aliyunOSS.getBucketName(), filePath, file);
        System.out.println("上传成功！url="+url);
	}
    
    /*
     * Java文件操作 获取文件扩展名
     *
     *  Created on: 2011-8-2
     *      Author: blueeagle
     */
    public static String getExtensionName(String filename) { 
        if ((filename != null) && (filename.length() > 0)) { 
            int dot = filename.lastIndexOf('.'); 
            if ((dot >-1) && (dot < (filename.length() - 1))) { 
                return filename.substring(dot + 1); 
            } 
        } 
        return filename; 
    } 

    /**
     * @param args
     */
    public static void main(String[] args)throws Exception {
//    	String key = "favicon.png";
//    	String uploadFilePath = "E:/favicon.png";
//    	if(1==1){
//    		save(key, new File(uploadFilePath));
//    		return;
//    	}
    	
//        String downloadFilePath = "E:/拍大师作品.avi";
        String ACCESS_ID = "xx";
        String OSS_ENDPOINT="http://oss.aliyuncs.com/";
        String ACCESS_KEY="xx";
        String bucketName = "xx";
        // 可以使用ClientConfiguration对象设置代理服务器、最大重试次数等参数。
        ClientConfiguration config = new ClientConfiguration();
        OSSClient client = new OSSClient(OSS_ENDPOINT, ACCESS_ID, ACCESS_KEY, config);

        ensureBucket(client, bucketName);

        try {
            setBucketPublicReadable(client, bucketName);
            // 获取Object，返回结果为OSSObject对象
//            OSSObject object = client.getObject(bucketName, "attached");

            // 获取Object的输入流
//            InputStream objectContent = object.getObjectContent();
//            System.out.println(objectContent);
//            System.out.println("正在上传...");
//            uploadFile(client, bucketName, key, uploadFilePath);
            
//            ObjectListing list = client.lis
         // 构造ListObjectsRequest请求
            ListObjectsRequest listObjectsRequest = new ListObjectsRequest(bucketName);
            listObjectsRequest.setDelimiter("/");
         // 列出fun目录下的所有文件和文件夹
            listObjectsRequest.setPrefix("attached/image/");
//            listObjectsRequest.setMarker("123");
            ObjectListing list = client.listObjects(listObjectsRequest);
         // 遍历所有Object
            System.out.println("Objects:");
            for (OSSObjectSummary objectSummary : list.getObjectSummaries()) {
                System.out.println(objectSummary.getKey()+","+objectSummary.getETag());
            }
            
         // 遍历所有CommonPrefix
            System.out.println("文件夹CommonPrefixs:");
            for (String commonPrefix : list.getCommonPrefixes()) {
                System.out.println(commonPrefix);
            }
//            System.out.println("正在下载...");
//            downloadFile(client, bucketName, key, downloadFilePath);
            
            // 设置URL过期时间为1小时
//            Date expiration = new Date(new Date().getTime() + 3600 * 1000);

            // 生成URL
//            URL url = client.generatePresignedUrl
//            System.out.println("url="+url);
        } catch(OSSException e){ 
        	e.printStackTrace();
        	if(e.getErrorCode().equals("NoSuchKey")){
        		//文件不存在
        		System.out.println("文件不存在");
//        		client.c
        	}
        }finally {
//            deleteBucket(client, bucketName);
        }
    }

    // 如果Bucket不存在，则创建它。
    private static void ensureBucket(OSSClient client, String bucketName)
            throws OSSException, ClientException{

        if (client.isBucketExist(bucketName)){
        	logger.error("isBucketExist true");
            return;
        }

        //创建bucket
        client.createBucket(bucketName);
    }

    // 删除一个Bucket和其中的Objects 
    private static void deleteBucket(OSSClient client, String bucketName)
            throws OSSException, ClientException {

        ObjectListing ObjectListing = client.listObjects(bucketName);
        List<OSSObjectSummary> listDeletes = ObjectListing
                .getObjectSummaries();
        for (int i = 0; i < listDeletes.size(); i++) {
            String objectName = listDeletes.get(i).getKey();
            // 如果不为空，先删除bucket下的文件
            client.deleteObject(bucketName, objectName);
        }
        client.deleteBucket(bucketName);
    }

    // 把Bucket设置为所有人可读
    private static void setBucketPublicReadable(OSSClient client, String bucketName)
            throws OSSException, ClientException {
        //创建bucket
        client.createBucket(bucketName);

        //设置bucket的访问权限，public-read-write权限
        client.setBucketAcl(bucketName, CannedAccessControlList.PublicRead);
    }

    // 上传文件
    private static String uploadFile(OSSClient client, String bucketName, String filePath, File file)
            throws OSSException, ClientException, FileNotFoundException {
        ObjectMetadata objectMeta = new ObjectMetadata();
        objectMeta.setContentLength(file.length());
        // 可以在metadata中标记文件类型
        objectMeta.setContentType("image/jpeg");

        InputStream input = new FileInputStream(file);
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//        String ymd = sdf.format(new Date());
//        String path = "attached/"+ymd+"/"+key;
        client.putObject(bucketName, filePath, input, objectMeta);
        
        return "http://"+bucketName+".oss.aliyuncs.com/"+filePath;
    }

    // 下载文件
    private static void downloadFile(OSSClient client, String bucketName, String key, String filename)
            throws OSSException, ClientException {
        client.getObject(new GetObjectRequest(bucketName, key),
                new File(filename));
    }
}
