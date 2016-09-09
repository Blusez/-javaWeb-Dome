package com.sosee.sys.base.service;

import java.util.List;

import com.sosee.sys.base.dao.BaseDictDao;
import com.sosee.sys.base.pojo.BaseDict;

public class BaseDictServiceImpl implements BaseDictService {
	
	private BaseDictDao baseDictDao;

	@Override
	public List<BaseDict> getBaseDictList() {
		String hsql="from BaseDict";
		return baseDictDao.queryAll(hsql);
	}

	@Override
	public BaseDict getValue(String id) {
		
		return (BaseDict)baseDictDao.queryById(id);
	}

	@Override
	public List<BaseDict> getBaseDictList(String parentBaseDictId) {
		String hsql="from BaseDict where parent.id=? order by typename asc";
		Object[] params={parentBaseDictId};
		return (List<BaseDict>)baseDictDao.queryForList(hsql,params);
	}

	@Override
	public BaseDict getValueByNumber(String number) {
		String hsql="from BaseDict where number=?";
		Object[] params={number};
		return (BaseDict)baseDictDao.queryForObject(hsql,params);
	}

	public BaseDictDao getBaseDictDao() {
		return baseDictDao;
	}

	public void setBaseDictDao(BaseDictDao baseDictDao) {
		this.baseDictDao = baseDictDao;
	}
	public BaseDict getValueByCategoryID(String id) {
		String hsql="from BaseDict as a where a.categoryId=?";
		Object[] params={id};
		return (BaseDict)baseDictDao.queryForObject(hsql,params);
	}

}
