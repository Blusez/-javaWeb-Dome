package com.sosee.sys.base.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.base.dao.Page;
import com.sosee.sys.base.pojo.Items;

public interface ItemsService {

	void add(Items items);
	
	void update(Items items);
	
	List<Items> queryAllItems();
	
	Items queryItemsById(Serializable id);
	
	List<Items> getSubItemListByPid(Serializable id);
	
	void delete(Items items);
	
	List<Items> queryItemsByCode(String code);
	
	List<Items> queryItemsOfTen();
	
	List<Items> queryItemsByCode(String code,Page page);
	
	Items queryItemByCode(String code);
	
	List<Items> queryItemsBySql(String sql,Page page);
}
