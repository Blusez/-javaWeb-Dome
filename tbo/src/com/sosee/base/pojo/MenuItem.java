package com.sosee.base.pojo;


@SuppressWarnings("serial")
public class MenuItem extends BaseMenu {

	private String url;

	private String target = "mainFrame";

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String toString() {
		StringBuffer tree = new StringBuffer();
		tree.append("data['").append(this.parentId).append("_").append(this.id).append("'] = ");
		tree.append("'text:").append(this.text);
		if (this.url != null)
			tree.append(" ; url:").append(this.url);
		tree.append(" ; target:").append(this.target);
		tree.append("';\r\n");
		return tree.toString();
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}
}
