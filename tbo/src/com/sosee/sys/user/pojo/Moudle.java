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
 * @date    :2012-9-25 下午12:42:43
 *@Copyright:2012 outworld Studio Inc. All rights reserved.
 * @function:
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "t_moudle")
public class Moudle extends BaseObject {
	private String	moudleName;	//模块名称
	private String	code;		//模块编码
	private int		grade;		//模块级别
	private	Moudle	parentId;	//上级模块标识
	private String  image;		//图片路径
	private String  url;		//链接地址
	private String  indexUrl;	//模块首页
	
	public Moudle(){}
	
	@Column(name = "FmoudleName", nullable = false, length = 60)
	public String getMoudleName() {
		return moudleName;
	}
	public void setMoudleName(String moudleName) {
		this.moudleName = moudleName;
	}
	
	@Column(name = "Fcode", nullable = false, length = 60)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(name = "Fgrade")
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FparentId")
	public Moudle getParentId() {
		return parentId;
	}
	public void setParentId(Moudle parentId) {
		this.parentId = parentId;
	}
	
	@Column(name = "Fimage", length = 60)
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	@Column(name = "Furl", length = 60)
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Column(name = "FindexUrl", length = 100)
	public String getIndexUrl() {
		return indexUrl;
	}
	public void setIndexUrl(String indexUrl) {
		this.indexUrl = indexUrl;
	}
}
