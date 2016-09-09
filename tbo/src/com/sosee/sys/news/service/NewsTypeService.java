package com.sosee.sys.news.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.sys.news.pojo.NewsType;

public interface NewsTypeService {

	List<NewsType> queryAllNewsType();
	
	void add(NewsType newsType);
	
	void delete(NewsType newsType);
	
	void update(NewsType newsType);
	
	NewsType getNewsTypeById(Serializable id);
}
