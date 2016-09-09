package com.sosee.custom.product.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.base.service.AbstractService;
import com.sosee.custom.product.dao.ProductDao;
import com.sosee.custom.product.pojo.Product;

public class ProductServiceImpl extends AbstractService implements ProductService {
	private ProductDao productDao;
	
	public ProductServiceImpl() {
	}
	
	public ProductDao getProductDao() {
		return productDao;
	}



	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}



	@Override
	public Product getProduct(Serializable id) {
		return productDao.queryById(id);
	}

	@Override
	public List<Product> getProductList() {
		return productDao.queryAll("from Product");
	}

	@Override
	public void add(Product product) {
		productDao.create(product);
	}

	@Override
	public void update(Product product) {
		productDao.update(product);
	}

	@Override
	public void delete(String id) {
		Product product = productDao.queryById(id);
		if (product != null) {
			productDao.delete(product);
		}
	}

}
