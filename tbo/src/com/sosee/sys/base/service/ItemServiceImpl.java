package com.sosee.sys.base.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.base.dao.Page;
import com.sosee.sys.base.dao.ItemsDao;
import com.sosee.sys.base.pojo.Items;
import com.sosee.util.Constants;

public class ItemServiceImpl implements ItemsService {

	private ItemsDao itemsDao;

	public ItemsDao getItemsDao() {
		return itemsDao;
	}

	public void setItemsDao(ItemsDao itemsDao) {
		this.itemsDao = itemsDao;
	}

	@Override
	public List<Items> queryAllItems() {
		// TODO Auto-generated method stub
		return itemsDao.queryAll("from Items order by code");
	}

	@Override
	public Items queryItemsById(Serializable id) {
		// TODO Auto-generated method stub
		return itemsDao.queryById(id);
	}

	@Override
	public List<Items> getSubItemListByPid(Serializable id) {
		// TODO Auto-generated method stub
		return itemsDao.queryForList("from Items where parentId.id=? order by code", new Object[]{id});
	}

	@Override
	public void add(Items items) {
		// TODO Auto-generated method stub
		itemsDao.create(items);
	}

	@Override
	public void update(Items items) {
		// TODO Auto-generated method stub
		itemsDao.update(items);
	}

	@Override
	public void delete(Items items) {
		// TODO Auto-generated method stub
		itemsDao.delete(items);
	}

	@Override
	public List<Items> queryItemsByCode(String code) {
		return itemsDao.queryForList("from Items where code=? order by code", new Object[]{code});
	}

	@Override
	public List<Items> queryItemsOfTen() {
		// TODO Auto-generated method stub
		return itemsDao.queryAll("from Items where parentId.code='"+Constants.TENTRADECODE+"'");
	}
	
	public List<Items> queryItemsByCode(String code,Page page){
		return itemsDao.queryForList("from Items where code like '"+code+"%' and code<>'ITEM007' ", page);
	}

	@Override
	public Items queryItemByCode(String code) {
		// TODO Auto-generated method stub
		return itemsDao.queryForList("from Items where code=? order by code", new Object[]{code}).get(0);
	}
	
	public List<Items> queryItemsBySql(String sql,Page page){
		return itemsDao.queryForList("from Items where 1=1 "+sql+" order by code", page);
	}

}
