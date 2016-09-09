package com.sosee.sys.base.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sosee.base.pojo.BaseObject;
/**
 * @author  :outworld
 * @date    :2012-9-25 下午12:01:42
 *@Copyright:2012 outworld Studio Inc. All rights reserved.
 * @function: 行政区
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "t_cityregion")
public class CityRegion extends BaseObject {
	private String name;//名称
	private String areaCode;//区号
	private String code;//编码
	private CityRegion parentId;//上级行政区标识
	private boolean isParent;//是否是父节点
	
	public CityRegion() {
	}
	
	@Column(name = "Fname", length = 30)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "FareaCode", length = 30)
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	
	@Column(name = "Fcode", length = 20)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FparentId")
	public CityRegion getParentId() {
		return this.parentId;
	}
	public void setParentId(CityRegion parentId) {
		this.parentId = parentId;
	}
	
	@Column(name = "FisParent")
	public boolean getIsParent() {
		return isParent;
	}
	public void setIsParent(boolean isParent) {
		this.isParent = isParent;
	}	
}
