package net.jeeshop.web.action.manage.system;

import net.jeeshop.core.BaseAction;
import net.jeeshop.core.ManageContainer;
import net.jeeshop.core.exception.NotThisMethod;
import net.jeeshop.core.system.bean.Role;
import net.jeeshop.core.system.bean.User;
import net.jeeshop.services.manage.system.impl.RoleService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;

/**
 * 角色action
 * @author huangf
 *
 */
@Scope("prototype")
@Controller
@RequestMapping("/manage/role")
public class RoleAction extends BaseAction<Role> {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LoggerFactory.getLogger(RoleAction.class);
	
	@Autowired
	private RoleService roleService;
	@Autowired
	private RoleService myServer;
	
	private Role role = new Role();

	{
		toList = "/manage/system/role/roleList";
		toEdit = "/manage/system/role/editRole";
		toAdd = "/manage/system/role/editRole";
	}
	
	/**
	 * 添加角色
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save() throws Exception {
		Role r = new Role();
		r.setRole_name(request.getParameter("roleName"));
		r.setId(request.getParameter("id"));
		r.setRole_desc(request.getParameter("roleDesc"));
		r.setRole_dbPrivilege(request.getParameter("role_dbPrivilege"));
		r.setPrivileges(request.getParameter("privileges"));
		r.setStatus(request.getParameter("status"));
		if(r.getRole_name()==null || r.getRole_name().trim().equals("")){
			response.getWriter().print("0");
			return null;
		}else{
			roleService.editRole(r,request.getParameter("insertOrUpdate"));
		}
		
		response.getWriter().write("1");
		return null;
	}
	
	@Override
	@RequestMapping("/deletes")
	public String deletes() throws Exception {
		throw new NotThisMethod(ManageContainer.not_this_method);
	}


	// getter setter
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Override
	public Role getE() {
		this.role = e;
		return this.role;
	}


	@Override
	public void prepare() throws Exception {
		logger.warn("prepare method called....");
		String id = request.getParameter("id");
		if (id==null || id.trim().equals("")){
			role.clear();
			role.setInsertOrUpdate("1");
		}
		else{
			role.clear();
			role.setId(id);
			role = roleService.selectOne(role);
			if (role == null) {
				role = new Role();
			}
			role.setInsertOrUpdate("2");
		}
		
		if(e==null){
			e = new Role();
		}
	}

	@Override
	public void insertAfter(Role e) {
		e.clear();
	}
	@Override
	protected void selectListAfter() {
		pager.setPagerUrl(getBasePath() + "manage/role/selectList.action");
	}
	
	/**
	 * 只能是admin才具有编辑其他用户权限的功能
	 */
	@Override
	@RequestMapping("/update")
	public String update() throws Exception {
		User user = (User)request.getSession().getAttribute(ManageContainer.manage_session_user_info);
		if(!user.getUsername().equals("admin")){
			throw new NullPointerException(ManageContainer.RoleAction_update_error);
		}
		return super.update();
	}
	
	@ModelAttribute
	public void initStrutsActionParam(){
		this.server = myServer;
	}
	
}
