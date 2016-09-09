package com.sosee.sys.user.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sosee.base.pojo.BaseObject;
/**
 * @author  :outworld
 * @date    :2012-9-25 下午12:45:18
 *@Copyright:2012 outworld Studio Inc. All rights reserved.
 * @function:
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "t_rolemoudle")
public class RoleMoudle extends BaseObject {
	private Moudle	moudle;		//模块标识
	private Role	role;		//角色标识
	private String 	operateList;//操作
	
	public RoleMoudle(){}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FmoudleId")
	public Moudle getMoudle() {
		return moudle;
	}
	public void setMoudle(Moudle moudle) {
		this.moudle = moudle;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FroleId")
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	
	@Column(name = "FoperateList", length = 15)
	public String getOperateList() {
		return operateList;
	}
	public void setOperateList(String operateList) {
		this.operateList = operateList;
	}
}
