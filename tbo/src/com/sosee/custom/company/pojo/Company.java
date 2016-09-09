package com.sosee.custom.company.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.sosee.base.pojo.BaseObject;

@Entity
@Table(name = "jst_company")
public class Company extends BaseObject{
	private String companyName;
	private String contactName;
	private String email;
	private String phone;
	private String mobile;
	private String qq;
	private String address;
	private String logoUrl;
	private int clickCount;
	private int sortNum;
	private int isTop;
	
	public Company() {
	}
	@Column(name = "companyName",length =40 )
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	@Column(name = "contactName", length = 40)
	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	@Column(name = "email", length = 40)
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	@Column(name = "phone", length = 40)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Column(name = "mobile", length = 40)
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	@Column(name = "qq", length = 40)
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}
	@Column(name = "address", length = 40)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	@Column(name = "logoUrl", length = 40)
	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}
	@Column(name = "clickCount", length = 10)
	public int getClickCount() {
		return clickCount;
	}

	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}
	@Column(name = "sortNum", length = 10)
	public int getSortNum() {
		return sortNum;
	}

	public void setSortNum(int sortNum) {
		this.sortNum = sortNum;
	}
	@Column(name = "isTop", length = 1)
	public int getIsTop() {
		return isTop;
	}

	public void setIsTop(int isTop) {
		this.isTop = isTop;
	}
	
}
