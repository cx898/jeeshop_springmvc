package net.jeeshop.core.util;

import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreemarkerTemplateUtil {

	public static String freemarkerProcess(Map input, String templateStr) {  
	    try {
	    	StringTemplateLoader stringLoader = new StringTemplateLoader();  
		    String template = "content";  
		    stringLoader.putTemplate(template, templateStr);  
		    Configuration cfg = new Configuration();  
		    cfg.setTemplateLoader(stringLoader);  

		    Template templateCon = cfg.getTemplate(template);  
		    StringWriter writer = new StringWriter();  
		    templateCon.process(input, writer);  
		    return writer.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return null;
	}  
	  
	// test  
	public static void main(String[] args) throws IOException, TemplateException {  
//		String template = "你好${姓名!'未知'}，今天是${date?string('yyyy-MM-dd')}"; //变量参考freemarker语法  
	    String template = "你好${username}，今天是${date}"; //变量参考freemarker语法  
	    Map m = new HashMap();  
	    m.put("username", "管理员");
	    m.put("date", "2012-10-12");
//	    m.put("date", new Date());  
	    System.out.println(freemarkerProcess(m, template)); //"你好管理员，今天是2013-09-11"  
	}

}
