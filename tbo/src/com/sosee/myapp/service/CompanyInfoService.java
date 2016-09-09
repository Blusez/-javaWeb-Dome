package com.sosee.myapp.service;

import java.util.List;

import com.sosee.myapp.dao.CompanyInfo;
import com.sosee.myapp.entity.Factory;

public class CompanyInfoService {
   CompanyInfo com=new CompanyInfo();
   public List<Factory> findFactory(){
	   List<Factory> fa=com.findFactory();
	   if(fa!=null){
		   return fa;
	   }else{
		   return null;
	   }
   }
   
   public List<Factory> findFactoryByComName(String comname){
	   List<Factory> fa=com.findFactoryByComName(comname);
	   if(fa!=null){
		   return fa;
	   }else{
		   return null;
	   }
   }
   
   public boolean deleteCom(int id,int isdele){
	   int row=com.deleteCom(id, isdele);
	   return row>0?true:false;
   }
   public int getCounts(){
	   int rows=com.getCount();
	   if(rows>0){
		   return rows;
	   }else{
		   return 0;
	   }
   }
   
   public List<Factory> fenye(int pagecount,int pagesize){
	   List<Factory> list=com.fenye(pagecount, pagesize);
	   if(list!=null){
		   return list;
	   }else{
		   return null;
	   }
   }
}
