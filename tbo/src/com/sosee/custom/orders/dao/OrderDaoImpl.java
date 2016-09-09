package com.sosee.custom.orders.dao;

import com.sosee.base.dao.AbstractBaseDao;
import com.sosee.custom.orders.pojo.Order;

public class OrderDaoImpl extends AbstractBaseDao<Order> implements OrderDao {

	public OrderDaoImpl() {
		super(Order.class);
	}

}
