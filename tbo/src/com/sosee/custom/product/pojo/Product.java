package com.sosee.custom.product.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.sosee.base.pojo.BaseObject;

@Entity
@Table(name = "jst_product")
public class Product extends BaseObject{
	private String companyId;    //所属厂家
	private String productName;  //产品名称
	private String category;     //产品分类
	private int length;          //长
	private int width;           //宽
	private int heigth;          //高
	private int thickess;        //厚度
	private double price;        //价格
	private String imageUrl;     //产品样图
	
	public Product() {
	}
	@Column(name = "companyId", length = 40)
	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	@Column(name = "productName", length = 40)
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	@Column(name = "category", length = 40)
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	@Column(name = "length", length = 10)
	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}
	@Column(name = "width", length = 10)
	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}
	@Column(name = "heigth", length = 10)
	public int getHeigth() {
		return heigth;
	}

	public void setHeigth(int heigth) {
		this.heigth = heigth;
	}
	@Column(name = "thickess", length = 10)
	public int getThickess() {
		return thickess;
	}

	public void setThickess(int thickess) {
		this.thickess = thickess;
	}
	@Column(name = "price", length = 20)
	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	@Column(name = "imageUrl", length = 20)
	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	
}
