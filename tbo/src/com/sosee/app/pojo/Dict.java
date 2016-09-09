package com.sosee.app.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.sosee.base.pojo.BaseObject;
@Entity
@Table(name = "t_dict")
public class Dict extends BaseObject  {
	private static final long serialVersionUID = 1L;
	private String categoryType;//
	private String name;//
	private String code;//
	private int orderNum;
	
	
	public Dict(){}

	@Column(name = "FcategoryType", length = 60)
	public String getCategoryType() {
		return categoryType;
	}

	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}

	@Column(name = "Fname", length = 60)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "Fcode", length =30)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "ForderNum")
	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	
	
}
