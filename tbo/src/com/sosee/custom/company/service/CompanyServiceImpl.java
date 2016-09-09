package com.sosee.custom.company.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.base.service.AbstractService;
import com.sosee.custom.company.dao.CompanyDao;
import com.sosee.custom.company.pojo.Company;

public class CompanyServiceImpl extends AbstractService implements CompanyService {
	private CompanyDao companyDao;
	
	
	
	public CompanyDao getCompanyDao() {
		return companyDao;
	}

	public void setCompanyDao(CompanyDao companyDao) {
		this.companyDao = companyDao;
	}

	@Override
	public Company getCompany(Serializable id) {
		return companyDao.queryById(id);
	}

	@Override
	public List<Company> getCompanyList() {		
		return companyDao.queryAll("from Company");
	}

	@Override
	public void add(Company company) {
		companyDao.create(company);
	}

	@Override
	public void update(Company company) {
		companyDao.update(company);
	}

	@Override
	public void delete(String id) {
		Company company = companyDao.queryById(id);
		if (company != null) {
			companyDao.delete(company);
		}
	}
	
}
