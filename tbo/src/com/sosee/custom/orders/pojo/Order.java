package com.sosee.custom.orders.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.sosee.base.pojo.BaseObject;

@Entity
@Table(name = "jst_orders")
public class Order extends BaseObject{
	private String orderNo;            //订单编号
	private int count;                 //合计
	private String placeOrder;         //下单人
	private String placeOrderTime;     //下单时间
	private String confirmer;          //确认人
	private String confirmTime;        //确认时间
	private int status;                //状态
	
	public Order() {
	}
	@Column(name = "orderNo", length = 20)
	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	@Column(name = "count", length = 40)
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	@Column(name = "placeOrder", length = 40)
	public String getPlaceOrder() {
		return placeOrder;
	}

	public void setPlaceOrder(String placeOrder) {
		this.placeOrder = placeOrder;
	}
	@Column(name = "placeOrderTime", length = 40)
	public String getPlaceOrderTime() {
		return placeOrderTime;
	}

	public void setPlaceOrderTime(String placeOrderTime) {
		this.placeOrderTime = placeOrderTime;
	}
	@Column(name = "confirmer", length = 40)
	public String getConfirmer() {
		return confirmer;
	}

	public void setConfirmer(String confirmer) {
		this.confirmer = confirmer;
	}
	@Column(name = "confirmTime", length = 40)
	public String getConfirmTime() {
		return confirmTime;
	}

	public void setConfirmTime(String confirmTime) {
		this.confirmTime = confirmTime;
	}
	@Column(name = "status", length = 1)
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
