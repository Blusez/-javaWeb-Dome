package com.sosee.myapp.action;

import com.opensymphony.xwork2.Action;
import com.sosee.base.action.AbstractAction;
import com.sosee.myapp.entity.User;
import com.sosee.myapp.service.RegisterService;

public class ZhuceAction implements Action{
	private User user;
	private String result;
	RegisterService rs=new RegisterService();
	public String register(){
		boolean flag=rs.register(user);
		if(flag){
			result="success";
		}else{
			result="fail";
		}
		return "registerSuccess";
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		boolean flag=rs.register(user);
		if(flag){
			result="success";
		}else{
			result="fail";
		}
		return "success";
	}
	public String zhuce(){
		return "success";
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
