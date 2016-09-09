package com.sosee.myapp.action;

import java.util.List;

import com.opensymphony.xwork2.Action;
import com.sosee.myapp.entity.Factory;
import com.sosee.myapp.service.CompanyInfoService;

public class CompanyInfoAction implements Action{
	private List<Factory> fa;
    private String result;
	private int id;
	private int isdele;
	private String comname;
	CompanyInfoService comInser = new CompanyInfoService();
	private int pagecount=0;
	private int pagesize=10;
	
	public String findcom() {
		
		fa = comInser.findFactory();
	    return "success";
	}
	
	public String findcombyname(){
		fa=comInser.findFactoryByComName(comname);
		return "success";
	}
	
	public String delete(){
		boolean flag=comInser.deleteCom(id, isdele);
		if(flag){
			result="success";
		}else{
			result="fail";
		}
			
		return "ajaxSuccess";
	}
	
	public String fenyecomp(){
		fa=comInser.fenye(pagecount, pagesize);
		result=String.valueOf(comInser.getCounts());
		System.out.println(result);
		return "fenyeSuccess";
		
		
	}

	public List<Factory> getFa() {
		return fa;
	}

	public void setFa(List<Factory> fa) {
		this.fa = fa;
	}
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIsdele() {
		return isdele;
	}

	public void setIsdele(int isdele) {
		this.isdele = isdele;
	}

	public String getComname() {
		return comname;
	}

	public void setComname(String comname) {
		this.comname = comname;
	}

	public int getPagecount() {
		return pagecount;
	}

	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		fa=comInser.findFactoryByComName(comname);
		return "success";
	}

	
	
	
	
	
	

}
