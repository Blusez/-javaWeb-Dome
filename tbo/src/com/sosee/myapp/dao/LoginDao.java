package com.sosee.myapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sosee.myapp.data.DataBase;

public class LoginDao {
	private DataBase db=new DataBase();
    public boolean login(String comname,String password){
    	 Connection conn=null;
    	 PreparedStatement ps=null;
    	 ResultSet rs=null;
    	 String sql="select * from user where compName=? and password=?";
    	 conn=db.getConnection();
    	 try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, comname);
			ps.setString(2, password);
			rs=ps.executeQuery();
			if(rs.next()){
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
			return false;
		}
    }
    public static void main(String[] args) {
		
	}
}
