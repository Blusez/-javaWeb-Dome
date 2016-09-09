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
/**
 * @author  :outworld
 * @date    :2012-9-25 下午12:32:17
 *@Copyright:2012 outworld Studio Inc. All rights reserved.
 * @function:
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "t_loginlog")
public class LoginLog extends BaseObject {
	private String 		account;			//登录账号
	private Date 		loginTime;			//登录时间
	private Date 		logoutTime;			//退出时间
	private CityRegion 	region;				//所属行政区域
	private String 		leagueName;			//所属联合会
	
	public LoginLog() {
	}
	
	@Column(name = "Faccount", length = 30)
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	
	@Column(name = "FloginTime", length = 19)
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	
	@Column(name = "FlogoutTime", length = 19)
	public Date getLogoutTime() {
		return logoutTime;
	}
	public void setLogoutTime(Date logoutTime) {
		this.logoutTime = logoutTime;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FregionId")
	public CityRegion getRegion() {
		return region;
	}
	public void setRegion(CityRegion region) {
		this.region = region;
	}
	
	@Column(name = "FleagueName", length = 60)
	public String getLeagueName() {
		return leagueName;
	}
	public void setLeagueName(String leagueName) {
		this.leagueName = leagueName;
	}
	
	
}
