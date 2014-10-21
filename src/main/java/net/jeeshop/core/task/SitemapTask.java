package net.jeeshop.core.task;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.slf4j.LoggerFactory;

/**
 * sitemap.xml定时生成
 * @author jqsl2012@163.com
 *
 */
public class SitemapTask implements Runnable {
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(SitemapTask.class);
	@Override
	public void run() {
		createSiteMap();
	}
	
	public static void main(String[] args) {
		new SitemapTask().createSiteMap();
	}

	private void createSiteMap() {
		String websizePath = "D:\\workspace5\\jeeshop\\trunk\\jeeshop\\web\\";
		String priority = "0.75";// 级 别
		String changefreq = "daily";// "weekly";//频 率
		String xmlpath = "e:/sitemap.xml";// sitemap名称以及位置
		String homeurl = "http://www.jiujiajiu.cn"; // 栏目首页
		String[] directory = { "promotion", "news", "brand", "goods",
				"services", "shop", "winelive" };
		FileDemo fp = new FileDemo();
		try {
			Document document = DocumentHelper.createDocument();
			Element urlsetElement = document.addElement("urlset");
			urlsetElement.addAttribute("xmlns ",
					"http://www.sitemaps.org/schemas/sitemap/0.9"); // "xmlns
																	// "必须要有空格,否则会报错
			urlsetElement.addAttribute("xmlns",
					"http://www.sitemaps.org/schemas/sitemap/0.9");

			urlsetElement.addAttribute("xmlns:xsi",
					"http://www.w3.org/2001/XMLSchema-instance");

			urlsetElement.addAttribute("xsi:schemaLocation",
					"http://www.sitemaps.org/schemas/sitemap/0.9 " +

					"http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd");

			// 创建url根元素
			Element urlElement;
			// 为url根元素创建loc网页地址，lastmod更新时间，changefreq更改频率和priority级别
			Element locElement;
			Element lastmodElement;
			Element changefreqElement;
			Element priorityElement;
			fp.setPath(websizePath);
			fp.refreshList();
			while (fp.nextFile()) {
				if (!fp.isDirectory()) {
					homeurl = "http://www.jiujiajiu.cn/";
					String f = fp.getFileName();
					String fname = f.substring(f.lastIndexOf("."));
					if ((fname.equals(".html") || fname.equals(".htm")) || fname.equals(".jsp")
							&& !f.equals("login.html")) {
						urlElement = urlsetElement.addElement("url");
						locElement = urlElement.addElement("loc");
						lastmodElement = urlElement.addElement("lastmod");
						changefreqElement = urlElement.addElement("changefreq");
						priorityElement = urlElement.addElement("priority");

						// 导航赋值
						homeurl = homeurl + fp.getFileName();
						locElement.setText(homeurl);
						lastmodElement.setText(fp.getFileTimeStamp());// 这里时间是你更新时间，这里暂时统一
						changefreqElement.setText(changefreq);
						priorityElement.setText(priority);
					}
				}
			}

			// 各个目录下的文件
//			for (int i = 0; i < directory.length; i++) {
//				fp.setPath(websizePath + directory[i] + "\\");
//				fp.refreshList();
//				while (fp.nextFile()) {
//					homeurl = "http://www.jiujiajiu.cn/" + directory[i] + "/";
//					urlElement = urlsetElement.addElement("url");
//					locElement = urlElement.addElement("loc");
//					lastmodElement = urlElement.addElement("lastmod");
//					changefreqElement = urlElement.addElement("changefreq");
//					priorityElement = urlElement.addElement("priority");
//
//					homeurl = homeurl + fp.getFileName();
//					locElement.setText(homeurl);
//					lastmodElement.setText(fp.getFileTimeStamp());// 这里时间是你更新时间，这里暂时统一
//					changefreqElement.setText(changefreq);
//					priorityElement.setText(priority);
//				}
//			}

			XMLWriter writer = new XMLWriter(new FileOutputStream(new File(
					xmlpath)));
			writer.write(document);
			writer.close();
			document = null;
			// 格式化
			formatXMLFile(xmlpath, "UTF-8");
		} catch (Exception ex) {
			ex.printStackTrace();

		}

	}

	/**
	 * 格式化XML文档,并解决中文问题
	 * 
	 * @param xmlpath
	 *            ：xml文件路径
	 * @param charSet
	 *            :格式化的字符集
	 * @return
	 */
	private static boolean formatXMLFile(String xmlpath, String charSet) {

		boolean returnValue = false;
		try {

			SAXReader saxReader = new SAXReader();
			Document document = saxReader.read(new File(xmlpath));
			XMLWriter output = null;
			OutputFormat format = OutputFormat.createPrettyPrint();
			format.setEncoding(charSet);
			output = new XMLWriter(new FileWriter(new File(xmlpath)), format);
			output.write(document);
			output.close();
			document = null;
			saxReader = null;
			returnValue = true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return returnValue;
	}

	private class FileDemo {
		File myDir;
		File[] contents;
		List fileList;
		Iterator currentFileIt;
		File currentFile;
		String path;

		/**
		 * 无参的构造函数
		 * */
		public FileDemo() {
			path = new String("");
			fileList = new ArrayList();
		}

		/**
		 * 有参的构造函数
		 * */
		public FileDemo(String path) {
			this.path = path;
			fileList = new ArrayList();
		}

		/**
		 * 设置要查看的文件路径
		 */
		public void setPath(String path) {
			this.path = path;
		}

		/***************************************************************************
		 * 返回当前目录的路径
		 */
		public String getDirectory() {
			return myDir.getPath();
		}

		public void refreshList() {
			logger.error("refreshList...");
			if (this.path.equals("")){
				path = "c:\\";
			}
			logger.error("refreshList...path = " + path);
			myDir = new File(path);

			fileList.clear();
			contents = myDir.listFiles();
			logger.error("refreshList...myDir = " + myDir);
			logger.error("refreshList...contents = " + contents);
			if(contents==null){
				currentFileIt = null;
				return ;
			}
			
			// 重新装入路径下文件
			for (int i = 0; i < contents.length; i++) {
				fileList.add(contents[i]);
			}
			currentFileIt = fileList.iterator();
		}

		/**
		 * 指到下一个条目
		 */
		public boolean nextFile() {
			if(currentFileIt==null){
				return false;
			}
			
			while (currentFileIt.hasNext()) {
				currentFile = (File) currentFileIt.next();

				return true;
			}
			return false;
		}

		/**
		 * 返回当前指向的文件对象的文件名称
		 */
		public String getFileName() {
			return currentFile.getName();
		}

		/**
		 * 返回当前指向的文件对象的文件尺寸
		 */
		public String getFileSize() {
			return convertFileSize(currentFile.length());
		}

		/**
		 * 转换文件尺寸为指定格式。
		 */
		private String convertFileSize(long size) {
			int divisor = 1;
			String unit = "bytes";
			if (size >= 1024 * 1024) {
				divisor = 1024 * 1024;
				unit = "MB";
			} else if (size >= 1024) {
				divisor = 1024;
				unit = "KB";
			}
			if (divisor == 1)
				return size / divisor + " " + unit;
			String aftercomma = "" + 100 * (size % divisor) / divisor;
			if (aftercomma.length() == 1)
				aftercomma = "0" + aftercomma;
			return size / divisor + "." + aftercomma + " " + unit;
		}

		/**
		 * 返回文件的最后修改日期
		 */
		public String getFileTimeStamp() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateString = sdf
					.format(new Date(currentFile.lastModified()));

			return dateString;
		}

		/**
		 * 返回文件是不是一个目录
		 */
		public boolean isDirectory() {
			return currentFile.isDirectory();
		}

	}
}
