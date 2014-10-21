/**
 * 2012-7-8
 * jqsl2012@163.com
 */
package net.jeeshop.services.manage.news.impl;

import java.util.List;

import net.jeeshop.core.ServersManager;
import net.jeeshop.services.manage.news.NewsService;
import net.jeeshop.services.manage.news.bean.News;
import net.jeeshop.services.manage.news.dao.NewsDao;


/**
 * @author huangf
 */
public class NewsServiceImpl extends ServersManager<News> implements
		NewsService {
	private NewsDao newsDao;
	
	public NewsDao getNewsDao() {
		return newsDao;
	}

	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}

	/**
	 * @param e
	 */
	public List<News> selecIndexNews(News e) {
		return newsDao.selecIndexNews(e);
	}

	@Override
	public void updateStatus(String[] ids, String status) {
		if(ids==null || ids.length==0){
			return;
		}
		
		for(int i=0;i<ids.length;i++){
			News news = new News();
			news.setId(ids[i]);
			news.setStatus(status);
			newsDao.sync(news);
		}
//		throw new NullPointerException();
	}

	@Override
	public void updateDownOrUp(News news) {
		newsDao.updateDownOrUp(news);
	}

	@Override
	public int selectCount(News news) {
		return newsDao.selectCount(news);
	}

}
