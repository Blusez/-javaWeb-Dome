package com.sosee.sys.news.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.sosee.base.pojo.BaseObject;
/**
 * @author  :outworld
 * @date    :2012-9-25 下午12:49:07
 *@Copyright:2012 outworld Studio Inc. All rights reserved.
 * @function:
 */

@SuppressWarnings("serial")
@Entity
@Table(name = "t_newstype")
public class NewsType extends BaseObject {
	private String name;//分类名称
	private String code;//编码
	private String type;//类型
	
	@Column(name = "Fname", length = 60)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "Fcode", length = 20)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(name = "Ftype", length = 20)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
}
