package com.sosee.myapp.service;

import com.sosee.myapp.dao.LoginDao;

public class LoginServiceIm {
  LoginDao lg=new LoginDao();
  public boolean login(String comname,String password){
	  return lg.login(comname, password);
  }
  
}
