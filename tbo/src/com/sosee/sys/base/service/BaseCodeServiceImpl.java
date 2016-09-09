package com.sosee.sys.base.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.util.*;
import com.sosee.sys.base.dao.BaseCodeDao;
import com.sosee.sys.base.pojo.BaseCode;

public class BaseCodeServiceImpl implements BaseCodeService {

	private BaseCodeDao baseCodeDao;

	@Override
	public void add(BaseCode baseCode) {
		baseCodeDao.create(baseCode);
		
	}

	@Override
	public void delete(String id) {
		if (!StringUtils.isNullString(id) && !"null".equalsIgnoreCase(id)) {
			BaseCode basecode = this.getValue(id);
			if (basecode != null)
				baseCodeDao.delete(basecode);
		}
		
	}

	@Override
	public void delete(String[] idArray) {
		for (String id : idArray) {
			this.delete(id);
		}
	}

	@Override
	public List<BaseCode> getBaseCodeList() {
		String hsql="from BaseCode";
		return baseCodeDao.queryAll(hsql);
	}

	@Override
	public BaseCode getValue(String id) {
		// TODO Auto-generated method stub
		return (BaseCode)baseCodeDao.queryById(id);
	}

	@Override
	public void update(BaseCode baseCode) {
		// TODO Auto-generated method stub
		baseCodeDao.update(baseCode);
	}

	public BaseCodeDao getBaseCodeDao() {
		return baseCodeDao;
	}

	public void setBaseCodeDao(BaseCodeDao baseCodeDao) {
		this.baseCodeDao = baseCodeDao;
	}

	@Override
	public List<BaseCode> getBaseCodeList(String categoryId) {

		String hsql="from BaseCode as a where a.categoryId='"+categoryId+"' order by a.categoryCode asc ";/*+"' and a.categoryCode!='"+ICSConstants.BASECODE_ERROR_CORRECTION+"'";*/
		return baseCodeDao.queryAll(hsql);
	}
	
	public List<BaseCode> getBaseCodeAllList() {
		String hsql="from BaseCode as a order by a.orderNum";
		return baseCodeDao.queryAll(hsql);
	}
	public BaseCode getBaseCode(Serializable id) {
		
		return baseCodeDao.queryById(id);
	}

	@Override
	public BaseCode getBaseCode(String type, String code) {
		String hsql="from BaseCode as a where a.categoryId='"+type+"' and a.categoryCode='"+code+"'";
		BaseCode baseCode=null;
		List<BaseCode> retList = baseCodeDao.queryAll(hsql);
		if(retList!=null && retList.size()>0){
			baseCode=retList.get(0);
		}
		return baseCode;
	}

	@Override
	public BaseCode getBaseCodeByCategoryName(String categoryName) {
		// TODO Auto-generated method stub
		return baseCodeDao.getBaseCodeByCategoryName(categoryName);
	}

	@Override
	public BaseCode getBaseCodeByState(String state) {
		// TODO Auto-generated method stub
		return baseCodeDao.getBaseCodeByState(state);
	}

	@Override
	public List<BaseCode> getBaseCodeByType(String type) {
		// TODO Auto-generated method stub
		return baseCodeDao.getBaseCodeByType(type);
	}
}
