package net.jeeshop.services.common;

import java.io.Serializable;

import net.jeeshop.core.dao.page.PagerModel;


public class News extends PagerModel implements Serializable {
	private static final long serialVersionUID = 1L;
	private String id;
	private String title;
	private String title2;
	private String code;
	private String content;
	private String createtime;
	private String createtimeEnd;//页面查询条件
	private String updatetime;
	private int readerCount;
	private String status;//文章是否显示到门户。y:显示；n：不显示；默认是n
	private String catalogID;//目录ID
	private String lableID;//标签ID
	private String createAccount;//创建人账号
	private int order1;//顺序
	private String type;//通知：notice；帮助：help
	
	public static final String news_status_y = "y";//显示
	public static final String news_status_n = "n";//不显示
	
	/*
	 * 文章类型
	 */
	public static String news_type_notice = "notice";//通知文章
	public static String news_type_help = "help";//帮助文章
	
	@Override
	public void clear() {
		super.clear();

		id = null;
		type = null;
		title = null;
		title2 = null;
		code = null;
		content = null;
		createtime = null;
		updatetime = null;
		status = null;
		readerCount = 0;
		catalogID = null;
		lableID = null;
		createAccount = null;
		createtimeEnd = null;
		order1=0;
	}

	public String getCatalogID() {
		return catalogID;
	}


	public void setCatalogID(String catalogID) {
		this.catalogID = catalogID;
	}


	public int getOrder1() {
		return order1;
	}


	public void setOrder1(int order1) {
		this.order1 = order1;
	}


	public String getCreatetimeEnd() {
		return createtimeEnd;
	}


	public void setCreatetimeEnd(String createtimeEnd) {
		this.createtimeEnd = createtimeEnd;
	}


	public String getCreateAccount() {
		return createAccount;
	}

	public void setCreateAccount(String createAccount) {
		this.createAccount = createAccount;
	}

	public int getReaderCount() {
		return readerCount;
	}

	public void setReaderCount(int readerCount) {
		this.readerCount = readerCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLableID() {
		return lableID;
	}

	public void setLableID(String lableID) {
		this.lableID = lableID;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle2() {
		return title2;
	}

	public void setTitle2(String title2) {
		this.title2 = title2;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "News [id=" + id + ", title=" + title + ", title2=" + title2
				+ ", code=" + code + ", content=" + content + ", createtime="
				+ createtime + ", createtimeEnd=" + createtimeEnd
				+ ", updatetime=" + updatetime + ", readerCount=" + readerCount
				+ ", status=" + status + ", catalogID=" + catalogID
				+ ", lableID=" + lableID + ", createAccount=" + createAccount
				+ ", order1=" + order1 + ", type=" + type + "]";
	}
	

}
