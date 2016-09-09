package com.sosee.app.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.app.dao.DictDao;
import com.sosee.app.pojo.Dict;
import com.sosee.base.service.AbstractService;

public class DictServiceImpl extends AbstractService implements DictService {
     private DictDao dictDao;
	
	public DictDao getDictDao() {
		return dictDao;
	}

	public void setDictDao(DictDao dictDao) {
		this.dictDao = dictDao;
	}

	@Override
	public Dict getDict(Serializable id) {
		return dictDao.queryById(id);
	}

	@Override
	public List<Dict> getDictList() {
		
		return dictDao.queryAll("from Dict");
	}

	@Override
	public void add(Dict dict) {
		dictDao.create(dict);
	}

	@Override
	public void update(Dict dict) {
		dictDao.update(dict);
	}

	@Override
	public void delete(String id) {
		Dict dict = dictDao.queryById(id);
		if(dict!=null){
			dictDao.delete(dict);
		}

	}

}
