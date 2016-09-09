package com.sosee.custom.opdetail.dao;

import java.io.Serializable;
import java.util.List;

import com.sosee.base.dao.AbstractBaseDao;
import com.sosee.base.dao.Page;
import com.sosee.custom.opdetail.pojo.Opdetail;

public class OpdetailDaoImpl extends AbstractBaseDao<Opdetail> implements OpdetailDao {

	public OpdetailDaoImpl() {
		super(Opdetail.class);
	}

}
