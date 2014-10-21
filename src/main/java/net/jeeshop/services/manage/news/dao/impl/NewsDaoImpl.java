/**
 * 2012-7-8
 * jqsl2012@163.com
 */
package net.jeeshop.services.manage.news.dao.impl;

import java.util.List;

import net.jeeshop.core.dao.BaseDao;
import net.jeeshop.core.dao.page.PagerModel;
import net.jeeshop.services.manage.navigation.bean.Navigation;
import net.jeeshop.services.manage.news.bean.News;
import net.jeeshop.services.manage.news.dao.NewsDao;


/**
 * @author huangf
 */
public class NewsDaoImpl implements NewsDao {
	private BaseDao dao;

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public PagerModel selectPageList(News e) {
		return dao.selectPageList("manage.news.selectPageList",
				"manage.news.selectPageCount", e);
	}

	public List selectList(News e) {
		return dao.selectList("manage.news.selectList", e);
	}

	public News selectOne(News e) {
		return (News) dao.selectOne("manage.news.selectOne", e);
	}

	public int delete(News e) {
		return dao.delete("manage.news.delete", e);
	}

	public int update(News e) {
		return  dao.update("manage.news.update", e);
	}

	/**
	 * 批量删除用户
	 * 
	 * @param ids
	 */
	public int deletes(String[] ids) {
		News e = new News();
		for (int i = 0; i < ids.length; i++) {
			e.setId(ids[i]);
			delete(e);
		}
		return 0;
	}

	public int insert(News e) {
		return dao.insert("manage.news.insert", e);
	}

	/**
	 * @param bInfo
	 */
	public List<News> getLoseList(News bInfo) {
		return dao.selectList("manage.news.getLoseList", bInfo);
	}

	@Override
	public List<News> selecIndexNews(News e) {
		return dao.selectList("manage.news.selecIndexNews", e);
	}

	@Override
	public int deleteById(int id) {
		return dao.delete("manage.news.deleteById",id);
	}

	@Override
	public void sync(News news) {
		// TODO Auto-generated method stub
		dao.update("manage.news.sync",news);
	}

	public News selectById(String id) {
		return (News) dao.selectOne("manage.news.selectById",id);
	}

	@Override
	public void updateDownOrUp(News news) {
		dao.update("manage.news.updateDownOrUp",news);
	}

	@Override
	public int selectCount(News news) {
		return (Integer) dao.selectOne("manage.news.selectCount",news);
	}
}
