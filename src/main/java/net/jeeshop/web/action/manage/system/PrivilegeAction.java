package net.jeeshop.web.action.manage.system;

import java.util.List;

import net.jeeshop.core.BaseAction;
import net.jeeshop.core.Services;
import net.jeeshop.core.system.bean.Privilege;
import net.jeeshop.services.manage.system.impl.PrivilegeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 权限管理
 * @author Administrator
 *
 */
@Scope("prototype")   
@Controller   
@RequestMapping("/manage/privilege")
public class PrivilegeAction extends BaseAction<Privilege> {//implements ModelDriven<Role>{
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private PrivilegeService privilegeService;
	@Autowired
	private PrivilegeService myServer;
	private List privilegeList;

	
	private Privilege privilege = new Privilege();

	public String delete() throws Exception {
		this.privilegeService.delete(privilege);
		return "SUCCESS";
	}

	public PrivilegeService getPrivilegeService() {
		return privilegeService;
	}

	public void setPrivilegeService(PrivilegeService privilegeService) {
		this.privilegeService = privilegeService;
	}

	public List getPrivilegeList() {
		return privilegeList;
	}

	public void setPrivilegeList(List privilegeList) {
		this.privilegeList = privilegeList;
	}

	public Privilege getPrivilege() {
		return privilege;
	}

	public void setPrivilege(Privilege privilege) {
		this.privilege = privilege;
	}

	@Override
	public Privilege getE() {
		// TODO Auto-generated method stub
		return this.privilege;
	}

	@Override
	public Services<Privilege> getServer() {
		// TODO Auto-generated method stub
		return this.privilegeService;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertAfter(Privilege e) {
		// TODO Auto-generated method stub
		e.clear();
	}
	@Override
	protected void selectListAfter() {
		pager.setPagerUrl(getBasePath() + "manage/privilege/selectList.action");
	}
	
	@ModelAttribute
	public void initStrutsActionParam(){
		this.server = myServer;
	}
}
