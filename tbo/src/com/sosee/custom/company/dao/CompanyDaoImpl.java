package com.sosee.custom.company.dao;

import com.sosee.base.dao.AbstractBaseDao;
import com.sosee.custom.company.pojo.Company;

public class CompanyDaoImpl extends AbstractBaseDao<Company>implements CompanyDao {

	public CompanyDaoImpl() {
		super(Company.class);
	}

}
