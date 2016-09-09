package com.sosee.app.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.app.pojo.Dict;

public interface DictService  {

	public Dict getDict(Serializable id);
	List<Dict> getDictList();
	void add(Dict dict);
	void update(Dict dict);
	void delete(String id);
}
