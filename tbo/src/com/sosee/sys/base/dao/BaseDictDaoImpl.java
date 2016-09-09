package com.sosee.sys.base.dao;

import com.sosee.base.dao.AbstractBaseDao;
import com.sosee.sys.base.pojo.BaseDict;

public class BaseDictDaoImpl extends AbstractBaseDao<BaseDict> implements BaseDictDao {

	public BaseDictDaoImpl() {
		super(BaseDict.class);
	}

	@Override
	public BaseDict getBaseDictByTypeName(String typeName) {
		// TODO Auto-generated method stub
		String hql = "from BaseDict where typename=?";
		return (BaseDict) super.queryForObject(hql, new Object[]{typeName});
	}
	
}
