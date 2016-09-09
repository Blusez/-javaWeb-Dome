package com.sosee.sys.news.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.sosee.base.pojo.BaseObject;
/**
 * @author  :outworld
 * @date    :2012-9-25 下午12:51:27
 *@Copyright:2012 outworld Studio Inc. All rights reserved.
 * @function:
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "t_newscontents")
public class NewsContents extends BaseObject {
	private String contents;//内容

	
	public NewsContents() {
	}
	
	@Column(name = "Fcontents")
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
}
