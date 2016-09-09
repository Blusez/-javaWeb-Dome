package com.sosee.custom.reg.pojo;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.sosee.base.pojo.BaseObject;

@Entity
@Table(name = "jst_users")
public class Register extends BaseObject {
	private String email;
	private String password;
	private String companyName;
	private String contactName;
	private String phoneNum;
	private String regTime;
	private String lloginTime;
	private String lloginIP;
	private int status;
	
	public Register() {
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getRegTime() {
		return regTime;
	}

	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}

	public String getLloginTime() {
		return lloginTime;
	}

	public void setLloginTime(String lloginTime) {
		this.lloginTime = lloginTime;
	}

	public String getLloginIP() {
		return lloginIP;
	}

	public void setLloginIP(String lloginIP) {
		this.lloginIP = lloginIP;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
}
