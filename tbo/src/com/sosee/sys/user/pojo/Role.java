package com.sosee.sys.user.pojo;

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
 * @date    :2012-9-25 下午12:40:40
 *@Copyright:2012 outworld Studio Inc. All rights reserved.
 * @function:
 */

@SuppressWarnings("serial")
@Entity
@Table(name = "t_role")
public class Role extends BaseObject {

	private String		roleName;			//角色名称
	private CityRegion	region;				//所属行政区域
	private League		league;				//所属联合会
	
	public Role(){}
	
	@Column(name = "FroleName", nullable = false, length = 30)
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
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
		
}
