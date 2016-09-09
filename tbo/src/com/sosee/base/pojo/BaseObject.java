package com.sosee.base.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.GenericGenerator;

/**
 * 
*@Project  : jss
*@Author   : outworld
*@Date     : 2011-5-29 下午04:54:22
*@Copyright: 2011 outworld Studio Inc. All rights reserved.
*@Function : pojo基类
 */
@SuppressWarnings("serial")
@MappedSuperclass
public abstract class BaseObject implements Serializable  {
	protected String id;
	
	
	@Id
	@Column(name = "Fid", unique = true, nullable = false, length = 40)
	@GeneratedValue(generator = "uuid")   //指定生成器名称  
    @GenericGenerator(name = "uuid", strategy = "org.hibernate.id.UUIDGenerator")  //生成器名称，uuid生成类
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
