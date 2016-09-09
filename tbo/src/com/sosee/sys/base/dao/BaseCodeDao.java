package com.sosee.sys.base.dao;

import java.util.List;

import com.sosee.base.dao.BaseDao;
import com.sosee.sys.base.pojo.BaseCode;

public interface BaseCodeDao  extends BaseDao<BaseCode>{

	BaseCode getBaseCodeByCategoryName(String categoryName);
    
	BaseCode getBaseCodeByState(String state);
	
	List<BaseCode> getBaseCodeByType(String type);
}
