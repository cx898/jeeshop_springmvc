package net.jeeshop.services.manage.system.impl;

import java.util.List;

import net.jeeshop.core.Services;
import net.jeeshop.core.dao.BaseDao;
import net.jeeshop.core.dao.page.PagerModel;
import net.jeeshop.core.system.bean.Privilege;
import net.jeeshop.core.system.bean.Role;
import net.jeeshop.core.system.bean.User;


/**
 * @author huangf 角色业务逻辑实现类
 */
public class RoleService implements Services<Role> {
	private BaseDao dao;
	private PrivilegeService privilegeService;

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public PagerModel selectPageList(Role role) {
		return dao.selectPageList("role.selectPageList",
				"role.selectPageCount", role);
	}

	public void setPrivilegeService(PrivilegeService privilegeService) {
		this.privilegeService = privilegeService;
	}

	public List selectList(Role role) {
		return dao.selectList("role.selectList", role);
	}

	public Role selectOne(Role role) {
		return (Role) dao.selectOne("role.selectOne", role);
	}

	public int insert(Role role) {
		return dao.insert("role.insert", role);
	}

	/**
	 * 删除指定角色以及该角色下的所有权限
	 * 
	 * @param role
	 */
	public int delete(Role role) {
		// 删除角色
		dao.delete("role.delete", role);
		// 删除角色对应的权限
		privilegeService.deleteByRole(role);
		return 0;
	}

	public int update(Role role) {
		return dao.update("role.update", role);
	}

	/**
	 * 编辑角色
	 * 
	 * @param role
	 * @throws Exception
	 */
	public void editRole(Role role, String insertOrUpdate) throws Exception {
		int insertRole = 0;
		Privilege privilege = new Privilege();
		if (insertOrUpdate.equals("1")) {
			// 新增角色
			insertRole = insert(role);
		} else {
			// 修改角色
			insertRole = update(role);
			// 删除角色的所有权限
			privilege.setRid(String.valueOf(insertRole));
			privilegeService.delete(privilege);
		}

		// 赋予权限
		if (role.getPrivileges() == null
				|| role.getPrivileges().trim().equals(""))
			return;

		String[] pArr = role.getPrivileges().split(",");
		for (int i = 0; i < pArr.length; i++) {
			privilege.clear();

			privilege.setMid(pArr[i]);
			privilege.setRid(String.valueOf(insertRole));
			privilegeService.insert(privilege);
		}
	}

	/**
	 * 批量删除角色
	 * 
	 * @param ids
	 */
	public int deletes(String[] ids) {
		Role role = new Role();
		for (int i = 0; i < ids.length; i++) {
			role.setId(ids[i]);
			delete(role);
			role.clear();
		}
		return 0;
	}

	@Override
	public Role selectById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
