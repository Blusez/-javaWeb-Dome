package com.sosee.sys.news.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.sys.news.dao.NewsTypeDao;
import com.sosee.sys.news.pojo.NewsType;

public class NewsTypeServiceImpl implements NewsTypeService {

	private NewsTypeDao newsTypeDao;

	public NewsTypeDao getNewsTypeDao() {
		return newsTypeDao;
	}

	public void setNewsTypeDao(NewsTypeDao newsTypeDao) {
		this.newsTypeDao = newsTypeDao;
	}

	@Override
	public void add(NewsType newsType) {
		// TODO Auto-generated method stub
		newsTypeDao.create(newsType);
	}

	@Override
	public void delete(NewsType newsType) {
		// TODO Auto-generated method stub
		newsTypeDao.delete(newsType);
	}

	@Override
	public NewsType getNewsTypeById(Serializable id) {
		// TODO Auto-generated method stub
		return newsTypeDao.queryById(id);
	}

	@Override
	public List<NewsType> queryAllNewsType() {
		// TODO Auto-generated method stub
		return newsTypeDao.queryAll("from NewsType");
	}

	@Override
	public void update(NewsType newsType) {
		// TODO Auto-generated method stub
		newsTypeDao.update(newsType);
	}
	
	
}
