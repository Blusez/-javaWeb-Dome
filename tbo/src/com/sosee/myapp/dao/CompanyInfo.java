package com.sosee.myapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.batch.Main;

import com.sosee.myapp.data.DataBase;
import com.sosee.myapp.entity.Factory;


public class CompanyInfo {
   private DataBase db=new DataBase();
   public List<Factory> findFactory(){
	   Connection conn=null;
	   PreparedStatement ps=null;
	   ResultSet rs=null;
	   List<Factory> factorys=null;
	   try {
		String sql="select *from factory where isdele=1";
		conn=db.getConnection();
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		factorys=new ArrayList<Factory>();
		Factory fa=null;
		
		while(rs.next()){
			fa=new Factory();
			fa.setId(rs.getInt("id"));
			fa.setCompName(rs.getString("compName"));
			fa.setUsername(rs.getString("username"));
			fa.setType(rs.getString("type"));
			fa.setEmail(rs.getString("email"));
			fa.setPhono(rs.getString("phono"));
			fa.setQq(rs.getString("qq"));
			fa.setAddress(rs.getString("address"));
			fa.setClicknum(rs.getInt("clicknum"));
			fa.setLogo(rs.getString("logo"));
			fa.setSort(rs.getInt("sort"));
			factorys.add(fa);
			
		}
		return factorys;
	} catch (SQLException e) {
		
		e.printStackTrace();
		return null;
	}
   }
   
   public  int  deleteCom(int id,int isdele){
	   Connection conn=null;
	   PreparedStatement ps=null;
	   
	   try {
		String sql="update factory set isdele=? where id=?";
		conn=db.getConnection();
		ps=conn.prepareStatement(sql);
		ps.setInt(1, isdele);
		ps.setInt(2, id);
		int row=ps.executeUpdate();
		return row;
	} catch (SQLException e) {
		
		e.printStackTrace();
		return 0;
		
	}
	   
   }
   
   public List<Factory> findFactoryByComName(String comname){
	   Connection conn=null;
	   PreparedStatement ps=null;
	   ResultSet rs=null;
	   List<Factory> factorys=null;
	   try {
		String sql="select *from factory where isdele=1 and compName=?";
		conn=db.getConnection();
		ps=conn.prepareStatement(sql);
	    ps.setString(1, comname);  
		rs=ps.executeQuery();
		factorys=new ArrayList<Factory>();
		Factory fa=null;
		
		while(rs.next()){
			fa=new Factory();
			fa.setId(rs.getInt("id"));
			fa.setCompName(rs.getString("compName"));
			fa.setUsername(rs.getString("username"));
			fa.setType(rs.getString("type"));
			fa.setEmail(rs.getString("email"));
			fa.setPhono(rs.getString("phono"));
			fa.setQq(rs.getString("qq"));
			fa.setAddress(rs.getString("address"));
			fa.setClicknum(rs.getInt("clicknum"));
			fa.setLogo(rs.getString("logo"));
			fa.setSort(rs.getInt("sort"));
			factorys.add(fa);
			
		}
		return factorys;
	} catch (SQLException e) {
		
		e.printStackTrace();
		return null;
	}
   }
   
   public List<Factory>  fenye(int pagecount,int pagesize){
	   Connection conn=null;
	   PreparedStatement ps=null;
	   ResultSet rs=null;
	   List<Factory> factorys=null;
	   try {
		String sql="select *from factory where isdele=1 limit ?,?";
		conn=db.getConnection();
		ps=conn.prepareStatement(sql);
	    ps.setInt(1, pagecount);  
	    ps.setInt(2, pagesize);
		rs=ps.executeQuery();
		factorys=new ArrayList<Factory>();
		Factory fa=null;
		
		while(rs.next()){
			fa=new Factory();
			fa.setId(rs.getInt("id"));
			fa.setCompName(rs.getString("compName"));
			fa.setUsername(rs.getString("username"));
			fa.setType(rs.getString("type"));
			fa.setEmail(rs.getString("email"));
			fa.setPhono(rs.getString("phono"));
			fa.setQq(rs.getString("qq"));
			fa.setAddress(rs.getString("address"));
			fa.setClicknum(rs.getInt("clicknum"));
			fa.setLogo(rs.getString("logo"));
			fa.setSort(rs.getInt("sort"));
			factorys.add(fa);
			
		}
		return factorys;
	} catch (SQLException e) {
		
		e.printStackTrace();
		return null;
	}
   }
   
   public int getCount(){
	   Connection conn=null;
	   PreparedStatement ps=null;
	   ResultSet rs=null;
	   int counts=0;
	   String sql="select count(*) from factory where isdele=1";
	   conn=db.getConnection();
	   try {
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			counts=rs.getInt(1);
		}
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	   return counts;
	   
   }
	public static void main(String[] args) {
	  
	 
	} 
	   
	 
 
	   
	   
}
