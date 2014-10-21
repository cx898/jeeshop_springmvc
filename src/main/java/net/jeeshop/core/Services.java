/**
 * 2012-7-7
 * jqsl2012@163.com
 */
package net.jeeshop.core;

import java.util.List;

import net.jeeshop.core.dao.page.PagerModel;


/**
 * 该接口提供业务逻辑最基本的服务，所有的业逻辑类都必须实现此接口，这样该业务逻辑类对应
 * 的action就免去了写基本selectList、insert、update、toEdit、deletes麻烦s
 * 
 * @author huangf
 * 
 */
public interface Services<E extends PagerModel> {
	/**
	 * 添加
	 * 
	 * @param e
	 * @return
	 */
	public int insert(E e);

	/**
	 * 删除
	 * 
	 * @param e
	 * @return
	 */
	public int delete(E e);

	/**
	 * 批量删除
	 * 
	 * @param ids
	 * @return
	 */
	public int deletes(String[] ids);

	/**
	 * 修改
	 * 
	 * @param e
	 * @return
	 */
	public int update(E e);

	/**
	 * 查询一条记录
	 * 
	 * @param e
	 * @return
	 */
	public E selectOne(E e);
	
	/**
	 * 根据ID查询一条记录
	 * 
	 * @param e
	 * @return
	 */
	public E selectById(String id);

	/**
	 * 分页查询
	 * 
	 * @param e
	 * @return
	 */
	public PagerModel selectPageList(E e);
	
	/**
	 * 根据条件查询所有
	 * @return
	 */
	public List<E> selectList(E e);
	
}
