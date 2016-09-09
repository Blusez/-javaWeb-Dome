package com.sosee.base.pojo;

import java.io.Serializable;
/**
 * 
*@Project  : jkxt
*@Author   : OutWorld
*@Date     : Apr 20, 2010 1:19:55 PM
*@Copyright: 2010 OutWorld Studio Inc. All rights reserved.
*@Function : 目录树结点对象
 */
@SuppressWarnings("serial")
public class JSONTreeNode implements Serializable {
	private String id;            //ID 
    private String text;          //节点显示 
    private String cls;           //图标 
    private boolean leaf;         //是否叶子 
    private String url;          //链接 
    private String hrefTarget;    //链接指向 
    private boolean expandable;   //是否展开 
    private String description;   //描述信息 

    public JSONTreeNode(){
    	
    }

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getCls() {
		return cls;
	}

	public void setCls(String cls) {
		this.cls = cls;
	}

	public boolean isLeaf() {
		return leaf;
	}

	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}

	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getHrefTarget() {
		return hrefTarget;
	}

	public void setHrefTarget(String hrefTarget) {
		this.hrefTarget = hrefTarget;
	}

	public boolean isExpandable() {
		return expandable;
	}

	public void setExpandable(boolean expandable) {
		this.expandable = expandable;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
    
    
}
