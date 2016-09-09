package com.sosee.sys.base.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.sys.base.pojo.BaseCode;

public interface BaseCodeService {

	BaseCode getValue(String id);
	public BaseCode getBaseCode(Serializable id);
	List<BaseCode> getBaseCodeList();
	List<BaseCode> getBaseCodeList(String sql);
	List<BaseCode> getBaseCodeAllList();
	void add(BaseCode baseCode);
	void update(BaseCode baseCode);
	void delete(String id);
	void delete(String[] idArray);
	BaseCode getBaseCode(String type,String code);//add by outworld 根据类型和编号得到字典
	
    BaseCode getBaseCodeByCategoryName(String categoryName);
	BaseCode getBaseCodeByState(String state);
	List<BaseCode> getBaseCodeByType(String type);
}
