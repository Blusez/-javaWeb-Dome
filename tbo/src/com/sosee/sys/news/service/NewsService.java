package com.sosee.sys.news.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.base.dao.Page;
import com.sosee.sys.base.pojo.Items;
import com.sosee.sys.news.pojo.News;
/**
 * 
 * @author liuang
 *
 */

public interface NewsService {

	//前台调用查询新闻
	List<News> queryNews(News news ,Page page);
	//后台调用查询新闻
	List<News> queryNewsBack(News news, Page page,Items items);
	//删除
	void deleteNews(News news);
	//按id查询
	News queryNewsById(Serializable id);
	//增加
	void addNews(News news);
	//更新
	void updateNews(News news);
	//
	List<News> queryNewsByItemCode(String code,Page page);
	
	//按照栏目查新闻
	List<News> queryNewsByItems(Items items);
	//按照条件查询
	List<News> queryNewsByItemCode(String code,String sql,Page page);
	
	List<News> queryNewsByItemCode(String code, String sql, Page page,String sortSql);
	
	int getNewsCount(String sql);
	
	List<News> queryNewsByHql(String hql,Page page);
}
