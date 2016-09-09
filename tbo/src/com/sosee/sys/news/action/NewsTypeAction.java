package com.sosee.sys.news.action;

import java.util.List;

import com.sosee.base.action.AbstractAction;
import com.sosee.sys.news.pojo.NewsType;
import com.sosee.sys.news.service.NewsTypeService;
import com.sosee.util.StringUtils;

public class NewsTypeAction extends AbstractAction {

	private NewsTypeService newsTypeService;

	private List<NewsType> newsTypeList;

	private NewsType newsType;
	private boolean editable=false;
	
	
	public List<NewsType> getNewsTypeList() {
		return newsTypeList;
	}


	public void setNewsTypeList(List<NewsType> newsTypeList) {
		this.newsTypeList = newsTypeList;
	}

	public NewsType getNewsType() {
		return newsType;
	}


	public void setNewsType(NewsType newsType) {
		this.newsType = newsType;
	}


	public boolean isEditable() {
		return editable;
	}


	public void setEditable(boolean editable) {
		this.editable = editable;
	}


	public NewsTypeService getNewsTypeService() {
		return newsTypeService;
	}


	public void setNewsTypeService(NewsTypeService newsTypeService) {
		this.newsTypeService = newsTypeService;
	}

	/**
	 * 
	 * @return
	 */
	public String transferToNewsTypeList(){
		
		newsTypeList = newsTypeService.queryAllNewsType();
		
		return "list";
	} 
	/**
	 * 添加或更新新闻分类
	 */
	public String save(){
		if (StringUtils.isNullString(newsType.getId())) {
			newsTypeService.add(newsType);
			errorMessage="添加成功";
			newsType=null;
		} else {
			newsTypeService.update(newsType);
			errorMessage="更新成功";
			newsType=null;
			editable=false;
		}
		return transferToNewsTypeList();
	}
	/**
	 * 编辑
	 * @return
	 */
	public String editNewsType(){
		newsType = newsTypeService.getNewsTypeById(id);
		newsTypeList = newsTypeService.queryAllNewsType();
		editable=true;
		return "list";
	} 
	/**
	 * 删除
	 * @return
	 */
	public String deleteNewsType(){
		newsTypeService.delete(newsTypeService.getNewsTypeById(id));
		return "refresh";
	}
}
