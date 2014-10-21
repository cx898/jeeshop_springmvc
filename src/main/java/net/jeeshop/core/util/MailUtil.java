package net.jeeshop.core.util;
import java.util.Date;
import java.util.Enumeration;
import java.util.Properties;
import java.util.Vector;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import net.jeeshop.core.front.SystemManager;
import net.jeeshop.services.front.account.impl.AccountServiceImpl;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import sun.util.logging.resources.logging;


/**
 * 发送邮件工具类
 * @author huangf
 *
 */
public class MailUtil {
	private static final Logger logger = Logger.getLogger(MailUtil.class);
	public static void main(String[] args) {//huangf@spider.com.cn
		MailUtil mail = new MailUtil("543089122@qq.com",
				"xxx@163.com","xxx", "smtp.163.com", "标题");
		mail.attachfile("e:\\1.jpg");
		mail.attachfile("e:\\bsa.js");
//		mail.attachfile("e:\\aa.txt");
//		mail.startSend(getForgetHtml(null));
	}

	// 定义发件人、收件人、主题等
	String to = null;
	String from = null;
	String password = null;
	String host = null;
	String filename = null;
//	String subject = null;
	// 用于保存发送附件的文件名的集合
	Vector file = new Vector();

	// 做一个可以传发件人等参数的构造
	public MailUtil(String to, String from,String password, String smtpServer, String subject) {
		// 初始化发件人、收件人、主题等
		this.to = to;
		this.from = from;
		this.password = password;
		this.host = smtpServer;
//		this.subject = subject;
	}
	
	public MailUtil(String to){
		this.to = to;
		this.from = SystemManager.getInstance().get("from_email_account");
		this.password = SystemManager.getInstance().get("from_email_password");
		this.host = SystemManager.getInstance().get("from_eamil_smtpServer");
//		this.subject = subject;
	}

	// 该方法用于收集附件名
	public void attachfile(String fname) {
		file.addElement(fname);
	}

	// 开始发送信件的方法
	public boolean startSend(String emailTitle,String emailContent) {
		if(StringUtils.isBlank(emailContent)){
			logger.error("邮件内容不能为空！");
			return false;
		}
		
		try {
			if(StringUtils.isBlank(emailContent)){
				throw new NullPointerException("发送的内容不能为空！");
			}
			// 创建Properties对象
			Properties props = System.getProperties();
			// 创建信件服务器
			props.put("mail.smtp.auth","true");   
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.password", "0");
			// 得到默认的对话对象
//		 	Session session = Session.getDefaultInstance(props, null);
			Session session = Session.getInstance(props, new PopupAuthenticator(this.from, this.password));

			// 创建一个消息，并初始化该消息的各项元素
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(from));
			InternetAddress[] address = { new InternetAddress(to) };
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(emailTitle);
			
			// 后面的BodyPart将加入到此处创建的Multipart中
			Multipart mp = new MimeMultipart("subtype");

			//添加HTML正文
			BodyPart htmlBody = new MimeBodyPart();            
			MimeMultipart htmlContent = new MimeMultipart("related");
			BodyPart msgContent = new MimeBodyPart();
			htmlContent.addBodyPart(msgContent);
			msgContent.setContent(emailContent, "text/html;charset=utf-8");
			htmlBody.setContent(htmlContent);            
			mp.addBodyPart(htmlBody);
			
			// 利用枚举器方便的遍历集合
			Enumeration efile = file.elements();
			// 检查序列中是否还有更多的对象
			while (efile.hasMoreElements()) {
				MimeBodyPart mbp = new MimeBodyPart();
				// 选择出每一个附件名
				filename = efile.nextElement().toString();
				// 得到数据源
				FileDataSource fds = new FileDataSource(filename);
				// 得到附件本身并至入BodyPart
				mbp.setDataHandler(new DataHandler(fds));
				// 得到文件名同样至入BodyPart
				mbp.setFileName(fds.getName());
				mp.addBodyPart(mbp);
			}
			// 移走集合中的所有元素
			file.removeAllElements();
			// Multipart加入到信件
			msg.setContent(mp);
			// 设置信件头的发送日期
			msg.setSentDate(new Date());
			// 发送信件
			Transport.send(msg);
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

	class PopupAuthenticator extends Authenticator {
		String username = null;
		String password = null;

		public PopupAuthenticator(String user, String pass) {
			username = user;
			password = pass;
		}

		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(username, password);
		}
	}
	
	/**
	 * 忘记密码的HTML
	 * @return
	 */
//	public static String getForgetHtml(Account account,int pageType){
//		StringBuilder buff = new StringBuilder();
//		buff.append("http://127.0.0.1:8082/mybbs/forget.html?account="+account.getAccount()+"&sign="+account.getSign()+"&pageType="+pageType);
//		
//		return buff.toString();
//	}
}

