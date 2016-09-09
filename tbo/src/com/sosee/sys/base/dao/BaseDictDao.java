package com.sosee.sys.base.dao;

import com.sosee.base.dao.BaseDao;
import com.sosee.sys.base.pojo.BaseDict;

public interface BaseDictDao extends BaseDao<BaseDict>{

	BaseDict getBaseDictByTypeName(String typeName);
}
