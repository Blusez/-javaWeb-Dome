package com.sosee.sys.news.dao;



import com.sosee.base.dao.AbstractBaseDao;
import com.sosee.sys.news.pojo.News;

public class NewsDaoImpl extends AbstractBaseDao<News> implements NewsDao {

	public NewsDaoImpl() {
		super(News.class);
	}

	
}
