package com.sosee.myapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.sosee.myapp.data.DataBase;
import com.sosee.myapp.entity.Factory;

public class AddCompDao {
	private DataBase db=new DataBase();
	public int addCompInfo(Factory fa){
		Connection conn=null;
		PreparedStatement ps=null;
		String sql="insert into factory values(null,?,?,?,?,?,?,?,?,?,?,1)";
		conn=db.getConnection();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1,fa.getCompName());
			ps.setString(2, fa.getUsername());
			ps.setString(3, fa.getType());
			ps.setString(4, fa.getEmail());
			ps.setString(5, fa.getPhono());
			ps.setString(6, fa.getQq());
			ps.setString(7, fa.getAddress());
			ps.setInt(8, fa.getClicknum());
			ps.setString(9, fa.getLogo());
			ps.setInt(10, fa.getSort());
			int row=ps.executeUpdate();
			return row;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return 0;
		}
	}
	

}
