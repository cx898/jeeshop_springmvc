package net.jeeshop.services.front.news;

import java.util.List;

import net.jeeshop.core.Services;
import net.jeeshop.services.front.news.bean.News;


public interface NewsService extends Services<News> {
	public List<News> selecIndexNews(News e);

	/**
	 * 加载news表的所有的记录的md5值
	 * @return
	 */
	public List<String> selectAllMd5();

	/**
	 * @param ids
	 */
	public void updateInBlackList(String[] ids);

	/**
	 * @param ids
	 * @param status 2:审核通过,4:审核未通过
	 */
	public void sync(String[] ids, int status);

	/**
	 * 查询通知，门户显示
	 */
	public List<News> selectNoticeList(News news);

	/**
	 * 查询文章--不包含文章内容
	 * @param news
	 * @return
	 */
	public News selectSimpleOne(News news);
}
