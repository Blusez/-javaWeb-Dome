package com.sosee.custom.product.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.custom.product.pojo.Product;

public interface ProductService {

	public Product getProduct(Serializable id);
	List<Product> getProductList();
	void add(Product product);
	void update(Product product);
	void delete(String id);
}
