package com.sosee.sys.user.service;

import java.util.List;

import com.sosee.sys.user.pojo.Moudle;

public interface ModelService {
	Moudle getValue(String id);
	Moudle getValueByNumber(String number);
	List<Moudle> getModelList();
	List<Moudle> getModelList(String hql);
	List<Moudle> getModeParentlList();
	void add(Moudle moudle);
	void update(Moudle moudle);
	void delete(String[] idArray);
}
