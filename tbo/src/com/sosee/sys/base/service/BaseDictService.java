package com.sosee.sys.base.service;

import java.util.List;

import com.sosee.sys.base.pojo.BaseDict;

public interface BaseDictService {

	BaseDict getValue(String id);
	BaseDict getValueByNumber(String number);
	List<BaseDict> getBaseDictList();
	List<BaseDict> getBaseDictList(String parentBaseDictId);
    BaseDict getValueByCategoryID(String categoryId);
    
}
