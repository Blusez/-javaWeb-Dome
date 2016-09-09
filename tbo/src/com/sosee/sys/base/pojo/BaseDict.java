package com.sosee.sys.base.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.sosee.base.pojo.BaseObject;
/**
 * @author  :outworld
 * @date    :2012-9-25 上午10:59:44
 * @function:
 */
@Entity
@Table(name = "t_basedict")
public class BaseDict extends BaseObject {
	private static final long serialVersionUID = 1L;
	private String categoryId; //分类标识
	private String categoryName;//分类名称
	private String typeName;//类别名称
	
	public BaseDict() {
	}

	@Column(name = "FcategoryId", length = 100)
	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	@Column(name = "FcategoryName", length = 30)
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Column(name = "FtypeName", length = 20)
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
}
