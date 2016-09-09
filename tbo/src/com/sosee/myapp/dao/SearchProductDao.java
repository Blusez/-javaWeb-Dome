package com.sosee.myapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.batch.Main;

import com.sosee.myapp.data.DataBase;
import com.sosee.myapp.entity.Product;

public class SearchProductDao {
	private DataBase db=new DataBase();
	public List<Product> findproduct(){
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Product> products=new ArrayList<Product>();
		Product product=null;
		String sql="select * from product";
		conn=db.getConnection();
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				product=new Product();
				product.setProductName(rs.getString("productName"));
				product.setProductType(rs.getString("productType"));
				product.setWidth(rs.getString("width"));
				
				product.setLon(rs.getString("long"));
				product.setHight(rs.getString("hight"));
				product.setWeight(rs.getString("weight"));
				product.setPrice(rs.getFloat("price"));
				product.setPicture(rs.getString("picture"));
				products.add(product);
			}
			return products;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		}
	}
	public List<Product> findproductByname(String productname){
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Product> products=new ArrayList<Product>();
		Product product=null;
		String sql="select * from product where  productName=?";
		conn=db.getConnection();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, productname);
			rs=ps.executeQuery();
			while(rs.next()){
				product=new Product();
				product.setProductName(rs.getString("productName"));
				product.setProductType(rs.getString("productType"));
				product.setWidth(rs.getString("width"));
				
				product.setLon(rs.getString("long"));
				product.setHight(rs.getString("hight"));
				product.setWeight(rs.getString("weight"));
				product.setPrice(rs.getFloat("price"));
				product.setPicture(rs.getString("picture"));
				products.add(product);
			}
			return products;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		}
	}
	
		

		
	
}
