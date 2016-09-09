package com.sosee.custom.opdetail.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.base.service.AbstractService;
import com.sosee.custom.opdetail.dao.OpdetailDao;
import com.sosee.custom.opdetail.pojo.Opdetail;

public class OpdetailServiceImpl extends AbstractService implements OpdetailService {

	private OpdetailDao opdetailDao;
	
	
	
	public OpdetailDao getOpdetailDao() {
		return opdetailDao;
	}

	public void setOpdetailDao(OpdetailDao opdetailDao) {
		this.opdetailDao = opdetailDao;
	}

	@Override
	public Opdetail getOpdetail(Serializable id) {
		return opdetailDao.queryById(id);
	}

	@Override
	public List<Opdetail> getOpdetailList() {
		return opdetailDao.queryAll("from Opdetail");
	}

	@Override
	public void add(Opdetail opdetail) {
		opdetailDao.create(opdetail);
	}

	@Override
	public void update(Opdetail opdetail) {
		opdetailDao.update(opdetail);
	}

	@Override
	public void delete(String id) {
		Opdetail opdetail = opdetailDao.queryById(id);
		if (opdetail != null) {
			opdetailDao.delete(opdetail);
		}
	}

}
