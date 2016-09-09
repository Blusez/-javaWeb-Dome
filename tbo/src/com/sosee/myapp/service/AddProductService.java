package com.sosee.myapp.service;

import com.sosee.myapp.dao.AddProductDao;
import com.sosee.myapp.entity.Product;

public class AddProductService {
	AddProductDao ap=new AddProductDao();
	public boolean  addproduct(Product product){
		int row=ap.addproduct(product);
		return row>0 ? true:false;
	}
}
