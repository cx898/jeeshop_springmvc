package net.jeeshop.services.manage.system.impl;

import java.util.List;

import net.jeeshop.core.dao.BaseDao;
import net.jeeshop.core.dao.page.PagerModel;
import net.jeeshop.core.system.bean.User;
import net.jeeshop.services.manage.system.UserInteface;


/**
 * 用户业务逻辑实现类
 * 
 * @author huangf
 * 
 */
public class UserService implements UserInteface {
	private BaseDao dao;

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public User login(User user) {
//		user.setStatus(User.user_status_y);
		return (User) dao.selectOne("user.selectOne", user);
	}

	public List selectList(User user) {
		if (user == null)
			return dao.selectList("user.selectList");
		return dao.selectList("user.selectList", user);
	}

	public int insert(User user) {
		return dao.insert("user.insert", user);
	}

	/**
	 * 批量删除用户
	 * 
	 * @param ids
	 */
	public int deletes(String[] ids) {
		User user = new User();
		for (int i = 0; i < ids.length; i++) {
			user.setId(ids[i]);
			delete(user);
		}
		return 0;
	}

	public int delete(User e) {
		// TODO Auto-generated method stub
		return dao.delete("user.delete", e);
	}

	public int update(User e) {
		// TODO Auto-generated method stub
		return dao.update("user.update", e);
	}

	public PagerModel selectPageList(User e) {
		return dao.selectPageList("user.selectPageList",
				"user.selectPageCount", e);
	}

	@Override
	public User selectOne(User e) {
		return (User) dao.selectOne("user.selectOne", e);
	}

	@Override
	public User selectById(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 根据条件查询数量
	 * @param user
	 * @return
	 */
	public int selectCount(User user) {
		if(user==null){
			throw new NullPointerException();
		}
		
		return (Integer) dao.selectOne("user.selectCount",user);
	}

	public User selectOneByCondition(User user) {
		if(user==null){
			throw new NullPointerException();
		}
		return (User) dao.selectOne("user.selectOneByCondition", user);
	}

}
