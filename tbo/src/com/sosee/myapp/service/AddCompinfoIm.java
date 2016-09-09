package com.sosee.myapp.service;

import com.sosee.myapp.dao.AddCompDao;
import com.sosee.myapp.entity.Factory;

public class AddCompinfoIm {
   private AddCompDao add=new AddCompDao();
   public boolean addCompinfo(Factory fa){
	   int row=add.addCompInfo(fa);
	   if(row>0){
		   return true;
	   }else{
		   return false;
	   }
   }
}
