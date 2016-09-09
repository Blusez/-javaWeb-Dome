package com.sosee.custom.orders.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.custom.orders.pojo.Order;

public interface OrderService {
	public Order getOrder(Serializable id);
	List<Order> getOrderList();
	void add(Order Order);
	void update(Order Order);
	void delete(String id);
}
