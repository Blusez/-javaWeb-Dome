package com.sosee.custom.product.dao;

import java.io.Serializable;
import java.util.List;

import com.sosee.base.dao.AbstractBaseDao;
import com.sosee.base.dao.Page;
import com.sosee.custom.product.pojo.Product;

public class ProductDaoImpl extends AbstractBaseDao<Product> implements ProductDao {

	public ProductDaoImpl() {
		super(Product.class);
	}

}
