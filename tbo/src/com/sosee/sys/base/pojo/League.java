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
 * @date    :2012-9-25 下午12:16:36
 *@Copyright:2012 outworld Studio Inc. All rights reserved.
 * @function:联合会
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "t_league")
public class League extends BaseObject {
	private String name;//名称
	private String contents;//简介
	private String logoFile;//logo
	private CityRegion cityRegionId;//所属行政区域
	private String shortName;//简称
	private String code;//编码
	private String comments;//备注
	private String templateUrl;//模板url
	
	public League() {
	}
	
	@Column(name = "Fname", length = 60)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "Fcontents", length = 65535)
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	@Column(name = "FlogoFile", length = 100)
	public String getLogoFile() {
		return logoFile;
	}
	public void setLogoFile(String logoFile) {
		this.logoFile = logoFile;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FcityRegionId")
	public CityRegion getCityRegionId() {
		return cityRegionId;
	}
	public void setCityRegionId(CityRegion cityRegionId) {
		this.cityRegionId = cityRegionId;
	}
	
	@Column(name = "FshortName", length = 20)
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	
	@Column(name = "Fcode", length = 20)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(name = "Fcomments", length = 200)
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	@Column(name = "FtemplateUrl", length = 200)
	public String getTemplateUrl() {
		return templateUrl;
	}
	public void setTemplateUrl(String templateUrl) {
		this.templateUrl = templateUrl;
	}
	
	
}
