/**
 * 2012-7-8
 * jqsl2012@163.com
 */
package net.jeeshop.services.front.news.dao.impl;

import java.util.List;

import net.jeeshop.core.dao.BaseDao;
import net.jeeshop.core.dao.page.PagerModel;
import net.jeeshop.services.front.navigation.bean.Navigation;
import net.jeeshop.services.front.news.bean.News;
import net.jeeshop.services.front.news.dao.NewsDao;


/**
 * @author huangf
 */
public class NewsDaoImpl implements NewsDao {
	private BaseDao dao;

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public PagerModel selectPageList(News e) {
		return dao.selectPageList("front.news.selectPageList",
				"front.news.selectPageCount", e);
	}

	public List selectList(News e) {
		return dao.selectList("front.news.selectList", e);
	}

	public News selectOne(News e) {
		return (News) dao.selectOne("front.news.selectOne", e);
	}

	public int delete(News e) {
		return dao.delete("front.news.delete", e);
	}

	public int update(News e) {
		return  dao.update("front.news.update", e);
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
		return dao.insert("front.news.insert", e);
	}

	/**
	 * @param bInfo
	 */
	public List<News> getLoseList(News bInfo) {
		return dao.selectList("front.news.getLoseList", bInfo);
	}

	@Override
	public List<News> selecIndexNews(News e) {
		return dao.selectList("front.news.selecIndexNews", e);
	}

	@Override
	public int deleteById(int id) {
		return dao.delete("front.news.deleteById",id);
	}

	@Override
	public List<String> selectAllMd5() {
		return dao.selectList("front.news.selectAllMd5");
	}

	@Override
	public void updateInBlackList(String e) {
		// TODO Auto-generated method stub
		dao.update("updateInBlackList",e);
	}

	@Override
	public void sync(News news) {
		// TODO Auto-generated method stub
		dao.update("front.news.sync",news);
	}
	
	public News selectById(String id) {
		return (News) dao.selectOne("front.news.selectById", id);
	}

	@Override
	public List<News> selectNoticeList(News news) {
		return dao.selectList("front.news.selectNoticeList",news);
	}

	@Override
	public News selectSimpleOne(News news) {
		return (News) dao.selectOne("front.news.selectSimpleOne",news);
	}
}
