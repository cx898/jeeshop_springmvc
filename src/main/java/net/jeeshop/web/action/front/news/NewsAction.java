package net.jeeshop.web.action.front.news;

import net.jeeshop.core.BaseAction;
import net.jeeshop.core.FrontContainer;
import net.jeeshop.services.front.news.NewsService;
import net.jeeshop.services.front.news.bean.News;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 文章管理
 * 
 * @author huangf
 * 
 */
@Scope("prototype")   
@Controller("frontNewsAction")   
@RequestMapping("/news")  
public class NewsAction extends BaseAction<News> {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LoggerFactory.getLogger(NewsAction.class);
	
	@Autowired
	private NewsService newsService;
	
	private News news;
	
	private final static String newsInfo = "/newsInfo";
	private final static String help = "/help";
	
	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	@Override
	public News getE() {
		return this.e;
	}

	@Override
	public void prepare() throws Exception {
		if (this.e == null) {
			this.e = new News();
		}
	}

	@Override
	public void insertAfter(News e) {
	}

	@Override
	protected void selectListAfter() {
		pager.setPagerUrl("news/selectList.action");
	}

	/**
	 * 获取新闻详情
	 * @return
	 */
	@RequestMapping("/newsInfo")
	public String newsInfo() throws Exception{
		
		super.setSelectMenu(FrontContainer.not_select_menu);//设置主菜单为不选中
		
		String id = request.getParameter("id");
		logger.error("NewsAction.newsInfo=== id="+id);
		if(StringUtils.isBlank(id)){
			throw new NullPointerException("id is null");
		}
		
//		e = newsService.selectById(id);
		
		News newsParam = new News();
		newsParam.setId(id);
		e =newsService.selectSimpleOne(newsParam);
		if(e==null){
			throw new NullPointerException();
		}
		
		String url = "/jsp/notices/"+e.getId()+".jsp";
		logger.error("url = " + url);
		request.setAttribute("newsInfoUrl",url);
		
		return newsInfo;
	}
	
	/**
	 * 帮助中心
	 * @return
	 */
	@RequestMapping("/help")
	public String help() throws Exception {
		
		super.setSelectMenu(FrontContainer.not_select_menu);//设置主菜单为不选中
		String helpCode = request.getParameter("helpCode");
		logger.error("this.helpCode="+helpCode);
		if(StringUtils.isBlank(helpCode)){
			throw new NullPointerException("helpCode参数不能为空");
		}else if(helpCode.equals("index")){
			return help;
		}else{
			News newsParam = new News();
			newsParam.setCode(helpCode);
			news = newsService.selectSimpleOne(newsParam);
			if(news==null){
				throw new NullPointerException("根据code查询不到文章！");
			}
			
			String url = "/jsp/helps/"+news.getId()+".jsp";
			logger.error("url = " + url);
			request.setAttribute("newsInfoUrl",url);
			
			return help;
		}
	}
}
