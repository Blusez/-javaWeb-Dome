package com.sosee.myapp.service;

import com.sosee.myapp.dao.RegisterDao;
import com.sosee.myapp.entity.User;

public class RegisterService {
	RegisterDao rd=new RegisterDao();
	public boolean register(User user){
		int row=rd.register(user);
		return row>0 ? true:false;
	}
}
