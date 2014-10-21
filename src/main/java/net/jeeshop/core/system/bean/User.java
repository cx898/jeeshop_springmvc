package net.jeeshop.core.system.bean;

import java.io.Serializable;
import java.util.Map;

import net.jeeshop.core.dao.page.PagerModel;


/**
 * 用户
 * 
 * @author huangf
 * 
 */
public class User extends PagerModel implements Serializable {
	private String id;
	private String username;
	private String password;
	private String createtime;
	private String updatetime;
	private String createAccount;
	private String updateAccount;
	private String status;
	private String rid;
	private String email;

	private String newpassword;
	private String newpassword2;
	private String nickname;

	private String role_dbPrivilege;
	private Map<String, String> dbPrivilegeMap;// 用户数据库权限

	public static final String user_status_y = "y";// 启用
	public static final String user_status_n = "n";// 禁用

	public void clear() {
		this.id = null;
		this.status = null;
		this.createtime = null;
		this.updatetime = null;
		this.createAccount = null;
		this.updateAccount = null;
		this.rid = null;
		this.username = null;
		this.password = null;
		newpassword = null;
		newpassword2 = null;
		nickname = null;
		email = null;
		role_dbPrivilege = null;

		if (dbPrivilegeMap != null) {
			dbPrivilegeMap.clear();
			dbPrivilegeMap = null;
		}
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getNewpassword2() {
		return newpassword2;
	}

	public void setNewpassword2(String newpassword2) {
		this.newpassword2 = newpassword2;
	}

	public Map<String, String> getDbPrivilegeMap() {
		return dbPrivilegeMap;
	}

	public void setDbPrivilegeMap(Map<String, String> dbPrivilegeMap) {
		this.dbPrivilegeMap = dbPrivilegeMap;
	}

	public String getRole_dbPrivilege() {
		return role_dbPrivilege;
	}

	public void setRole_dbPrivilege(String role_dbPrivilege) {
		this.role_dbPrivilege = role_dbPrivilege;
	}

	public String getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}

	public String getCreateAccount() {
		return createAccount;
	}

	public void setCreateAccount(String createAccount) {
		this.createAccount = createAccount;
	}

	public String getUpdateAccount() {
		return updateAccount;
	}

	public void setUpdateAccount(String updateAccount) {
		this.updateAccount = updateAccount;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
