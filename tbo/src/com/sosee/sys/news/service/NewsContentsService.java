package com.sosee.sys.news.service;

import java.io.Serializable;

import com.sosee.sys.news.pojo.NewsContents;

/**
 * 
 * @author liuang
 *
 */
public interface NewsContentsService {


	void add(NewsContents newsContents);
	
	void delete(NewsContents newsContents);
	
	void update(NewsContents newsContents);
	
	NewsContents queryNewsContentById(Serializable id);
}
