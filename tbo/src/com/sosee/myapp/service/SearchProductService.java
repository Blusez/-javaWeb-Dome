package com.sosee.myapp.service;

import java.util.List;

import com.sosee.myapp.dao.SearchProductDao;
import com.sosee.myapp.entity.Product;

public class SearchProductService {
	SearchProductDao  sp=new SearchProductDao();
	public List<Product> searchproduct(){
		List<Product> products=sp.findproduct();
		
		return products!=null && products.size()>0 ? products:null;
	}
	
	public List<Product>  findproductByname(String productname){
        List<Product> products=sp.findproductByname(productname);
		return products!=null && products.size()>0 ? products:null;
	}
}
