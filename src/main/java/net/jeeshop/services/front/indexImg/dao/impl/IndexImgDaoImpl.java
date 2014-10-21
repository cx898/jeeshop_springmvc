/**
 * 2012-7-8
 * jqsl2012@163.com
 */
package net.jeeshop.services.front.indexImg.dao.impl;

import java.util.List;

import net.jeeshop.core.dao.BaseDao;
import net.jeeshop.core.dao.page.PagerModel;
import net.jeeshop.services.front.comment.bean.Comment;
import net.jeeshop.services.front.indexImg.bean.IndexImg;
import net.jeeshop.services.front.indexImg.dao.IndexImgDao;


/**
 * @author huangf
 */
public class IndexImgDaoImpl implements IndexImgDao {
	private BaseDao dao;

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public PagerModel selectPageList(IndexImg e) {
		return dao.selectPageList("front.indexImg.selectPageList",
				"front.indexImg.selectPageCount", e);
	}

	public List selectList(IndexImg e) {
		return dao.selectList("front.indexImg.selectList", e);
	}

	public IndexImg selectOne(IndexImg e) {
		return (IndexImg) dao.selectOne("front.indexImg.selectOne", e);
	}

	public int delete(IndexImg e) {
		return dao.delete("front.indexImg.delete", e);
	}

	public int update(IndexImg e) {
		return  dao.update("front.indexImg.update", e);
	}

	/**
	 * 批量删除用户
	 * 
	 * @param ids
	 */
	public int deletes(String[] ids) {
		IndexImg e = new IndexImg();
		for (int i = 0; i < ids.length; i++) {
			e.setId(ids[i]);
			delete(e);
		}
		return 0;
	}

	public int insert(IndexImg e) {
		return  dao.insert("front.indexImg.insert", e);
	}

	/**
	 * @param bInfo
	 */
	public List<IndexImg> getLoseList(IndexImg bInfo) {
		return dao.selectList("front.indexImg.getLoseList", bInfo);
	}
	
	@Override
	public int deleteById(int id) {
		return dao.delete("front.indexImg.deleteById",id);
	}

	@Override
	public List<IndexImg> getImgsShowToIndex(int i) {
		return dao.selectList("front.indexImg.getImgsShowToIndex",i);
	}
	
	public IndexImg selectById(String id) {
		return (IndexImg) dao.selectOne("account.selectById", id);
	}
}
