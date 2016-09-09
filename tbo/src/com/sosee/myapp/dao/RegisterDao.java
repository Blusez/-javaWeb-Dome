package com.sosee.myapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.sosee.myapp.data.DataBase;
import com.sosee.myapp.entity.User;

public class RegisterDao {
	private DataBase db=new DataBase();
	public int register(User user){
		Connection conn=null;
		PreparedStatement ps=null;
		String sql="insert into user values(null,?,?,?,?,?,?)";
		conn=db.getConnection();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, user.getCompName());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getUsername());
			ps.setString(4, user.getPhono());
			ps.setString(5, user.getEmail());
			ps.setString(6, user.getSlience());
			int row=ps.executeUpdate();
			return row;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return 0;
		}
		
	}
	
}
