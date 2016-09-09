package com.sosee.sys.news.service;

import java.io.Serializable;

import com.sosee.sys.news.dao.NewsContentsDao;
import com.sosee.sys.news.pojo.NewsContents;

/**
 * 
 * @author liuang
 *
 */
public class NewsContentsServiceImpl implements NewsContentsService {

	private NewsContentsDao newsContentsDao;

	public NewsContentsDao getNewsContentsDao() {
		return newsContentsDao;
	}

	public void setNewsContentsDao(NewsContentsDao newsContentsDao) {
		this.newsContentsDao = newsContentsDao;
	}

	@Override
	public void add(NewsContents newsContents) {
		// TODO Auto-generated method stub
		newsContentsDao.create(newsContents);
	}

	@Override
	public void delete(NewsContents newsContents) {
		// TODO Auto-generated method stub
		newsContentsDao.delete(newsContents);
	}

	@Override
	public NewsContents queryNewsContentById(Serializable id) {
		// TODO Auto-generated method stub
		return newsContentsDao.queryById(id);
	}

	@Override
	public void update(NewsContents newsContents) {
		// TODO Auto-generated method stub
		newsContentsDao.update(newsContents);
	}
	
	
}
