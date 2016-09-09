package com.sosee.sys.base.dao;

import java.util.List;

import com.sosee.base.dao.AbstractBaseDao;
import com.sosee.sys.base.pojo.BaseCode;

public class BaseCodeDaoImpl extends AbstractBaseDao<BaseCode> implements BaseCodeDao {

	public BaseCodeDaoImpl() {
		super(BaseCode.class);
	}

	@Override
	public BaseCode getBaseCodeByCategoryName(String categoryName) {
		// TODO Auto-generated method stub
		String hql="from BaseCode where categoryName = ?";
		return (BaseCode) this.queryForList(hql, new Object[]{categoryName}).get(0);
	}

	@Override
	public BaseCode getBaseCodeByState(String state) {
		// TODO Auto-generated method stub
		String hql="from BaseCode where categoryName=?";
		return (BaseCode) queryForObject(hql, new Object[]{state});
	}

	@Override
	public List<BaseCode> getBaseCodeByType(String type) {
		// TODO Auto-generated method stub
		String hql="from BaseCode where categoryId=?";
		return this.queryForList(hql, new Object[]{type});
	}
}
