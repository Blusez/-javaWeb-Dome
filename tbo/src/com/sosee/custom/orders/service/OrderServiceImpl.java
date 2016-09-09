package com.sosee.custom.orders.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.base.service.AbstractService;
import com.sosee.custom.orders.dao.OrderDao;
import com.sosee.custom.orders.pojo.Order;

public class OrderServiceImpl extends AbstractService implements OrderService {
	private OrderDao orderDao;
	
	
	
	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public Order getOrder(Serializable id) {
		return orderDao.queryById(id);
	}

	@Override
	public List<Order> getOrderList() {
		return orderDao.queryAll("from Order");
	}

	@Override
	public void add(Order Order) {
		orderDao.create(Order);
	}

	@Override
	public void update(Order Order) {
		orderDao.update(Order);
	}

	@Override
	public void delete(String id) {
		Order order = orderDao.queryById(id);
		if (order != null) {
			orderDao.delete(order);
		}
	}

}
