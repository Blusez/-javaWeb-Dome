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
 * @date    :2012-9-25 下午12:09:34
 *@Copyright:2012 outworld Studio Inc. All rights reserved.
 * @function:栏目
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "t_items")
public class Items extends BaseObject {
	private String itemName;//栏目名称
	private String code;//栏目编码
	private String shortName;//简称
	private String url;//url
	private String imageFile;//图标文件
	private String comments;//备注
	private CityRegion cityRegionId;//所属行政区域
	private League leagueId;//所属联合会
	private Items parentId;//上级栏目
	
	
	public Items() {
	}
	
	@Column(name = "FitemName", length = 60)
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	@Column(name = "Fcode", length = 20)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(name = "FshortName", length = 30)
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	
	@Column(name = "Furl", length = 200)
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Column(name = "FimageFile", length = 200)
	public String getImageFile() {
		return imageFile;
	}
	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}
	
	@Column(name = "Fcomments", length = 200)
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FcityRegionId")
	public CityRegion getCityRegionId() {
		return cityRegionId;
	}
	public void setCityRegionId(CityRegion cityRegionId) {
		this.cityRegionId = cityRegionId;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FleagueId")
	public League getLeagueId() {
		return leagueId;
	}
	public void setLeagueId(League leagueId) {
		this.leagueId = leagueId;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FparentId")
	public Items getParentId() {
		return parentId;
	}
	public void setParentId(Items parentId) {
		this.parentId = parentId;
	}
	
}
