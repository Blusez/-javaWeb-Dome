package cn.keller.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

import cn.keller.pojo.People;

public class LoginAction implements Action  {
	private String name;
	private String password;
	//private People peo=new People();
	
//	public People getPeo() {
//		return peo;
//	}
//
//	public void setPeo(People peo) {
//		this.peo = peo;
//	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("Login!"+name+password);
		
		return SUCCESS;
	}
//
//	@Override
//	public People getModel() {
//		// TODO Auto-generated method stub
//		return peo;
//	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	

}
