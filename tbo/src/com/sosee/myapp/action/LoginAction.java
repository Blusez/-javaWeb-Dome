package com.sosee.myapp.action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.sosee.myapp.service.LoginServiceIm;

public class LoginAction implements Action{
	private String comname;
	private String password;
	private String result;
    
	LoginServiceIm lg=new LoginServiceIm();
	public String login(){
		boolean flag=lg.login(comname, password);
		if(flag){
			result="success";
			ServletActionContext.getRequest().getSession().setAttribute("comname", comname);
		}else{
			result="fail";
		}
		return "loginSuccess";
	}
	
	public String loginSuccess(){
		return "success";
	}
	
	public String log(){
		return "success";
	}
	public String getComname() {
		return comname;
	}

	public void setComname(String comname) {
		this.comname = comname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		boolean flag=lg.login(comname, password);
		if(flag){
			result="success";
			ServletActionContext.getRequest().getSession().setAttribute("comname", comname);
		}else{
			result="fail";
		}
		return "loginSuccess";
	}
	

}
