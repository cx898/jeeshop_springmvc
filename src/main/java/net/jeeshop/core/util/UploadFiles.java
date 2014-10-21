package net.jeeshop.core.util;
/**
 * 文件类，需要的时候，可以和数据库进行关联
 * 
 * @author MZ
 * 
 * @Time 2009-11-24下午04:29:31
 */
public class UploadFiles {
	private String uploadFileName;// 上传的文件名称
	private String uploadContentType;// 类型
	private String uploadRealName;// 保存的文件真实名称，UUID

	// 如果使用数据库的话，建议这三个字段都进行保存
	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadRealName() {
		return uploadRealName;
	}

	public void setUploadRealName(String uploadRealName) {
		this.uploadRealName = uploadRealName;
	}

}
