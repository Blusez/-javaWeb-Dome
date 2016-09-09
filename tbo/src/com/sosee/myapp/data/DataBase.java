package com.sosee.myapp.data;


import java.sql.Connection;
import java.sql.DriverManager;




public class DataBase {
	 private Connection conn=null;
	   
	    public  Connection getConnection(){
	    	   
	    	try {
				Class.forName("org.gjt.mm.mysql.Driver");
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8", "root", "123456");
				return conn;
			} catch (Exception e) {
				
				e.printStackTrace();
				return null;
			}
	    	
	    }
}
