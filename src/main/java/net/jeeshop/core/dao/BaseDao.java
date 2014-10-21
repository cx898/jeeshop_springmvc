package net.jeeshop.core.dao;

import java.util.List;
import java.util.logging.Logger;

import net.jeeshop.core.dao.page.PagerModel;
import net.jeeshop.core.exception.PrivilegeException;

import org.apache.ibatis.exceptions.IbatisException;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.LoggerFactory;


/**
 * 封装mybatis最基本的数据库操作
 * @author huangf
 *
 */
public class BaseDao extends SqlSessionDaoSupport {

	protected static final org.slf4j.Logger log = LoggerFactory.getLogger(BaseDao.class);
	
	private static final boolean selectPrivilege = false;

	/**
	 * 打开session，mybatis中的session能进行数据库基本的操作
	 * 
	 * @return
	 */
	public SqlSession openSession() {
		try {
			SqlSession session = getSqlSession();
			return session;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 查询一条记录
	 * 
	 * @param arg0
	 * @return
	 */
	public Object selectOne(String arg0) {
		SqlSession session = openSession();
		return session.selectOne(arg0);
	}

	/**
	 * 查询一条记录
	 * 
	 * @param arg0
	 * @param arg1
	 * @return
	 */
	public Object selectOne(String arg0, Object arg1) {
		SqlSession session = openSession();
		return session.selectOne(arg0, arg1);
	}

	/**
	 * 分页查询
	 * 
	 * @param selectList
	 * @param selectCount
	 * @param param
	 * @return
	 */
	public PagerModel selectPageList(String selectList, String selectCount,
			Object param) {
		SqlSession session = openSession();
		List list = session.selectList(selectList, param);
		PagerModel pm = new PagerModel();
		pm.setList(list);
		Object oneC = session.selectOne(selectCount, param);
		if(oneC!=null){
			pm.setTotal(Integer.parseInt(oneC.toString()));
		}else{
			pm.setTotal(0);
		}
		
		return pm;
	}

	/**
	 * 查询多条记录
	 * 
	 * @param arg0
	 * @return
	 */
	public List selectList(String arg0) {
		SqlSession session = openSession();
		return session.selectList(arg0);
	}

	/**
	 * 查询多条记录
	 * 
	 * @param arg0
	 * @param arg1
	 * @return
	 */
	public List selectList(String arg0, Object arg1) {
		SqlSession session = openSession();
		return session.selectList(arg0, arg1);
	}

	/**
	 * 查询总数
	 * 
	 * @param arg0
	 * @param arg1
	 * @return
	 */
	public int getCount(String arg0, Object arg1) {
		SqlSession session = openSession();
		return (Integer) session.selectOne(arg0, arg1);
	}

	/**
	 * 插入一条记录
	 * 
	 * @param arg0
	 * @return
	 */
	public int insert(String arg0) {
		if(selectPrivilege){
			throw new PrivilegeException("只具备查询的权限！");
		}
		SqlSession session = openSession();
		return session.insert(arg0);
	}

	/**
	 * 插入一条记录，成功则返回插入的ID；失败则抛出异常
	 * 
	 * @param arg0
	 * @param arg1
	 * @return
	 */
	public int insert(String arg0, Object arg1) {
		if(selectPrivilege){
			throw new PrivilegeException("只具备查询的权限！");
		}
		SqlSession session = openSession();
		int row = session.insert(arg0, arg1);
		if(row==1){
			return Integer.valueOf(((PagerModel)arg1).getId());
		}
		throw new IbatisException();
	}

	/**
	 * 更新一条记录
	 * 
	 * @param arg0
	 * @return
	 */
	public int update(String arg0) {
		if(selectPrivilege){
			throw new PrivilegeException("只具备查询的权限！");
		}
		SqlSession session = openSession();
		return session.update(arg0);
	}

	/**
	 * 更新一条记录
	 * 
	 * @param arg0
	 * @param arg1
	 * @return
	 */
	public int update(String arg0, Object arg1) {
		if(selectPrivilege){
			throw new PrivilegeException("只具备查询的权限！");
		}
		SqlSession session = openSession();
		int row = session.update(arg0, arg1);
		if(row==1){
			if(arg1 instanceof PagerModel){
//				return Integer.valueOf(((PagerModel)arg1).getId());
				String obj = ((PagerModel)arg1).getId();
				if(obj==null){
					return 0;
				}
				return Integer.valueOf(obj);
			}
		}
		return 1;
	}

	/**
	 * 删除一条记录
	 * 
	 * @param arg0
	 * @return
	 */
	public int delete(String arg0) {
		if(selectPrivilege){
			throw new PrivilegeException("只具备查询的权限！");
		}
		SqlSession session = openSession();
		return session.delete(arg0);
	}

	/**
	 * 删除一条记录
	 * 
	 * @param arg0
	 * @param arg1
	 * @return
	 */
	public int delete(String arg0, Object arg1) {
		if(selectPrivilege){
			throw new PrivilegeException("只具备查询的权限！");
		}
		SqlSession session = openSession();
		return session.delete(arg0, arg1);
	}

}
