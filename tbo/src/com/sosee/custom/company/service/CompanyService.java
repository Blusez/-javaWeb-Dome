package com.sosee.custom.company.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.custom.company.pojo.Company;

public interface CompanyService {
	
	public Company getCompany(Serializable id);
	List<Company> getCompanyList();
	void add(Company company);
	void update(Company company);
	void delete(String id);
}
