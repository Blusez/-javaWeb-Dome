package com.sosee.sys.base.pojo;

import com.sosee.base.pojo.BaseObject;
/**
 * 
 * @author jackVc
 *全国行政区
 */
public class Region extends BaseObject {

	//名称
	private String name;
	//区号
	private String areaCode;
	//编码
	private String code;
	//上级行政区标识
	private Region parentId;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Region getParentId() {
		return parentId;
	}
	public void setParentId(Region parentId) {
		this.parentId = parentId;
	}
	
	
}
