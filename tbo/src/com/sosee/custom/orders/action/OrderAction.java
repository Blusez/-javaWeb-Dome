package com.sosee.custom.orders.action;

import java.util.List;

import com.sosee.base.action.AbstractAction;
import com.sosee.custom.orders.pojo.Order;
import com.sosee.custom.orders.service.OrderService;
import com.sosee.util.StringUtils;

public class OrderAction extends AbstractAction {
private OrderService orderService;
	
	private List<Order> orderList;
	private boolean editable=false;
	private Order order;
	
	
	public String transferToOrderList(){
		orderList = orderService.getOrderList();
		return "list";
	}
	/**
	 * 
	 */
	public String save(){
		if (StringUtils.isNullString(order.getId())) {
			orderService.add(order);
		} else {
			orderService.update(order);
		}
		errorMessage = "保存成功！";
		order = null;
		return transferToOrderList();
	}
	/**
	 * 
	 */
	public String editOrder(){
		editable=true;
		order = orderService.getOrder(id);
		return transferToOrderList();
	}
	/**
	 * 
	 */
	public String deleteOrder(){
		orderService.delete(id);
		return transferToOrderList();
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	public boolean isEditable() {
		return editable;
	}
	public void setEditable(boolean editable) {
		this.editable = editable;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
	
}
