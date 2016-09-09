package com.sosee.myapp.action;

import com.opensymphony.xwork2.Action;
import com.sosee.myapp.entity.Factory;
import com.sosee.myapp.service.AddCompinfoIm;

public class AddCompanInfoAction implements Action{
	private Factory fa;
	private String result;
	AddCompinfoIm ac=new AddCompinfoIm();
	public String addComp(){
		boolean flag=ac.addCompinfo(fa);
		if(flag){
			result="success";
		}else{
			result="fail";
		}
		return "addsuccess";
	}
	
	public String addye(){
		return "success";
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
    public Factory getFa() {
		return fa;
	}
	public void setFa(Factory fa) {
		this.fa = fa;
	}

	@Override
	public String execute() throws Exception {
		boolean flag=ac.addCompinfo(fa);
		if(flag){
			result="success";
		}else{
			result="fail";
		}
		return "addsuccess";
	}
}
