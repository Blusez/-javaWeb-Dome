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
 * @date    :2012-9-25 下午12:38:17
 *@Copyright:2012 outworld Studio Inc. All rights reserved.
 * @function:
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "t_operatelog")
public class OperateLog extends BaseObject {
	private String 		account;			//登录账号
	private String 		contents;			//操作内容
	private CityRegion 	region;				//所属行政区域
	private String 		leagueName;			//所属联合会
	private Date createTime;				// 创建时间
	
	public OperateLog() {
	}
	
	@Column(name = "Faccount", length = 30)
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	
	@Column(name = "Fcontents", length = 250)
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
	
	@Column(name = "FcreateTime", length = 19)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
