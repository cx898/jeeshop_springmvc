package net.jeeshop.core.system.bean;

import java.io.Serializable;

import net.jeeshop.core.dao.page.PagerModel;


/**
 * 角色
 * @author huangf
 *
 */
public class Role extends PagerModel implements Serializable {
	private String id;
	private String role_name;
	private String role_desc;
	private String role_dbPrivilege;
	private String status;
	
	public static final String role_status_y = "y";//启用
	public static final String role_status_n = "n";//禁用
	
	private String privileges;
	private String insertOrUpdate = "1";// 1:新增,2:修改
	
	public void clear() {
		id = null;
		role_name = null;
		role_desc = null;
		role_dbPrivilege = null;
		status = null;
		
		privileges = null;
		insertOrUpdate = null;
	}

	public String getRole_dbPrivilege() {
		return role_dbPrivilege;
	}

	public void setRole_dbPrivilege(String role_dbPrivilege) {
		this.role_dbPrivilege = role_dbPrivilege;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public String getRole_desc() {
		return role_desc;
	}

	public void setRole_desc(String role_desc) {
		this.role_desc = role_desc;
	}

	public String getPrivileges() {
		return privileges;
	}

	public void setPrivileges(String privileges) {
		this.privileges = privileges;
	}

	public String getInsertOrUpdate() {
		return insertOrUpdate;
	}

	public void setInsertOrUpdate(String insertOrUpdate) {
		this.insertOrUpdate = insertOrUpdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
