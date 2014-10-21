/**
 * 2012-7-8
 * jqsl2012@163.com
 */
package net.jeeshop.web.action.manage.indexImg;

import java.io.IOException;

import net.jeeshop.core.BaseAction;
import net.jeeshop.services.manage.indexImg.IndexImgService;
import net.jeeshop.services.manage.indexImg.bean.IndexImg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 滚动图片
 * 
 * @author huangf
 * 
 */
@Scope("prototype")   
@Controller   
@RequestMapping("/manage/indexImg")
public class IndexImgAction extends BaseAction<IndexImg> {
	private static final long serialVersionUID = 1L;
	@Autowired
	private IndexImgService indexImgServiceManage;
	
	{
		toList = "/manage/indexImg/indexImgList";
		toEdit = "/manage/indexImg/indexImgEdit";
		toAdd = "/manage/indexImg/indexImgEdit";
	}
	
	@ModelAttribute
	public void initStrutsActionParam(){
		this.server = indexImgServiceManage ;
	}
	
//	private File image;
//
//	public File getImage() {
//		return image;
//	}
//
//	public void setImage(File image) {
//		this.image = image;
//	}

	@Override
	public IndexImg getE() {
		return this.e;
	}

	@Override
	public void prepare() throws Exception {
		if (this.e == null) {
			this.e = new IndexImg();
		}
	}

	@Override
	public void insertAfter(IndexImg e) {
		e.clear();
	}

	@Override
	public String selectList() throws Exception {
		super.selectList();
		return toList;
	}
	@Override
	protected void selectListAfter() {
		pager.setPagerUrl("indexImg!selectList.action");
	}
	@Override
	public String insert() throws Exception {
//		uploadImage();
		return super.insert();
	}
	
	@Override
	public String update() throws Exception {
//		uploadImage();
		return super.update();
	}
	
	//上传文件
	@Deprecated
	private void uploadImage() throws IOException{
//		if(image==null){
//			return;
//		}
//		String imageName = String.valueOf(System.currentTimeMillis()) + ".jpg";
//		String realpath = ServletActionContext.getServletContext().getRealPath("/indexImg/");
//		// D:\apache-tomcat-6.0.18\webapps\struts2_upload\images
//		System.out.println("realpath: " + realpath);
//		if (image != null) {
//			File savefile = new File(new File(realpath), imageName);
//			if (!savefile.getParentFile().exists())
//				savefile.getParentFile().mkdirs();
//			FileUtils.copyFile(image, savefile);
//			ActionContext.getContext().put("message", "文件上传成功");
//		}
////		SystemInfo sInfo = SystemSingle.getInstance().getSystemInfo();
////		String url = sInfo.getWww_ip() + "/file/img/" + imageName;
//		String url = "/indexImg/" + imageName;
//		e.setPicture(url);
//		image = null;
	}
	
	/**
	 * 同步缓存
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/syncCache")
	public String syncCache() throws Exception{
//		SystemSingle.getInstance().sync(Container.imgList);
		return super.selectList();
	}
}
