package com.sosee.sys.user.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sosee.base.pojo.BaseObject;
import com.sosee.sys.base.pojo.CityRegion;
import com.sosee.sys.base.pojo.League;

/**
 * @author  :outworld
 * @date    :2012-9-25 下午12:26:25
 *@Copyright:2012 outworld Studio Inc. All rights reserved.
 * @function:
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "t_user")
public class User extends BaseObject {
	private String 		account;			//用户账号
	private String 		name;				//用户名称
	private String 		password;			//用户密码
	private String 		accountType;		//用户类型
	private String 		sex;				//性别
	private int    		age;				//年龄
	private String 		telephone;			//联系电话
	private String 		email;				//电子邮箱
	private String 		status;				//状态
	private CityRegion	region;				//所属行政区域
	private League		league;				//所属联合会
	private Boolean 	isAdmin;			//是否是超级管理员组
	private int			loginSum;			//登录次数
	private Date		lastLoginTime;		//最后登录时间
	private Date createTime;				// 创建时间
	
	public User() {
	}
	
	@Column(name = "Faccount", nullable = false, length = 30)
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	
	@Column(name = "Fpassword", nullable = false)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(name = "FaccountType", nullable = false, length = 20)
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	
	@Column(name = "Fsex", length = 2)
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Column(name = "Fage")
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	@Column(name = "Ftelephone", length = 20)
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	
	@Column(name = "Femail", length = 60)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name = "Fstatus", length = 6)
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FregionId")
	public CityRegion getRegion() {
		return region;
	}
	public void setRegion(CityRegion region) {
		this.region = region;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FleagueId")
	public League getLeague() {
		return league;
	}
	public void setLeague(League league) {
		this.league = league;
	}
	
	@Column(name = "FisAdmin")
	public Boolean getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	@Column(name = "FloginSum")
	public int getLoginSum() {
		return loginSum;
	}
	public void setLoginSum(int loginSum) {
		this.loginSum = loginSum;
	}
	
	@Column(name = "FlastLoginTime", length = 19)
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	
	@Column(name = "Fname", nullable = false, length = 60)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}	
	
	@Column(name = "FcreateTime", length = 19)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
