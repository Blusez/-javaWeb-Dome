package com.sosee.sys.user.pojo;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sosee.base.pojo.BaseObject;

/**
 * @author  :outworld
 * @date    :2012-9-25 下午12:47:53
 *@Copyright:2012 outworld Studio Inc. All rights reserved.
 * @function:
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "t_userrole")
public class UserRole extends BaseObject {
	private User	user;		//用户标识
	private Role	role;		//角色标识
	
	public UserRole(){}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FuserId")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FroleId")
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	
}
