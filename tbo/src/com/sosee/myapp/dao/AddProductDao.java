package com.sosee.myapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.sosee.myapp.data.DataBase;
import com.sosee.myapp.entity.Product;

public class AddProductDao {
	private DataBase db=new DataBase();
	public int addproduct(Product product){
		Connection conn=null;
		PreparedStatement ps=null;
		String sql="insert into product values(null,?,?,?,?,?,?,?,?,1)";
		conn=db.getConnection();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, product.getProductName());
			ps.setString(2, product.getProductType());
			ps.setString(3, product.getWidth());
			ps.setString(4, product.getLon());
			ps.setString(5, product.getHight());
			ps.setString(6, product.getWeight());
			ps.setFloat(7, product.getPrice());
			ps.setString(8, product.getPicture());
			int row=ps.executeUpdate();
			return row;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return 0;
		}
		
		
	}
}
