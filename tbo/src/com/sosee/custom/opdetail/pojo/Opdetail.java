package com.sosee.custom.opdetail.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sosee.base.pojo.BaseObject;
import com.sosee.custom.orders.pojo.Order;
import com.sosee.custom.product.pojo.Product;

@Entity
@Table(name = "jst_orderlist")
public class Opdetail extends BaseObject{
	private Order orderId;         //所属订单
	private Product productId;     //对应产品
	private int count;             //数量
	private double singlePrice;    //单价 
	private double countPrice;     //合计
	private String confirmTime;    //确认时间
	
	public Opdetail() {
	}
	@ManyToOne
	@JoinColumn(name = "orderId")
	public Order getOrderId() {
		return orderId;
	}

	public void setOrderId(Order orderId) {
		this.orderId = orderId;
	}
	@ManyToOne
	@JoinColumn(name = "productId")
	public Product getProductId() {
		return productId;
	}

	public void setProductId(Product productId) {
		this.productId = productId;
	}
	@Column(name = "count", length = 10)
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	@Column(name = "singlePrice", length = 20)
	public double getSinglePrice() {
		return singlePrice;
	}

	public void setSinglePrice(double singlePrice) {
		this.singlePrice = singlePrice;
	}
	@Column(name = "countPrice", length = 20)
	public double getCountPrice() {
		return countPrice;
	}

	public void setCountPrice(double countPrice) {
		this.countPrice = countPrice;
	}
	@Column(name = "confirmTime", length = 40)
	public String getConfirmTime() {
		return confirmTime;
	}

	public void setConfirmTime(String confirmTime) {
		this.confirmTime = confirmTime;
	}
	
	
}