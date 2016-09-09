package com.sosee.custom.company.action;

import java.util.List;

import com.sosee.base.action.AbstractAction;
import com.sosee.custom.company.pojo.Company;
import com.sosee.custom.company.service.CompanyService;
import com.sosee.util.StringUtils;

public class CompanyAction extends AbstractAction {
	private CompanyService companyService;
	private Company company;
	private boolean editable=false;
	private List<Company> companies;
	
	public String transferToCompanytList(){
		companies = companyService.getCompanyList();
		return "list";
	}
	
	/**
	 * 
	 */
	public String save(){
		if (StringUtils.isNullString(company.getId())) {
			companyService.add(company);
		} else {
			companyService.update(company);
		}
		errorMessage = "保存成功！";
		company = null;
		return transferToCompanytList();
	}
	/**
	 * 
	 */
	public String editCompany(){
		editable=true;
		company = companyService.getCompany(id);
		return transferToCompanytList();
	}
	/**
	 * 
	 */
	public String deleteCompany(){
		companyService.delete(id);
		return transferToCompanytList();
	}

	public CompanyService getCompanyService() {
		return companyService;
	}

	public void setCompanyService(CompanyService companyService) {
		this.companyService = companyService;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public boolean isEditable() {
		return editable;
	}

	public void setEditable(boolean editable) {
		this.editable = editable;
	}

	public List<Company> getCompanies() {
		return companies;
	}

	public void setCompanies(List<Company> companies) {
		this.companies = companies;
	}
	
	
}
