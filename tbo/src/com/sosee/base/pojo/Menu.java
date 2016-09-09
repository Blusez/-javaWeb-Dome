package com.sosee.base.pojo;

import java.util.ArrayList;
import java.util.List;

import com.sosee.util.StringUtils;

@SuppressWarnings("serial")
public class Menu extends BaseMenu {

	private List<BaseMenu> subMenuList;

	public void addSubMenu(BaseMenu menu) {
		if (subMenuList == null)
			subMenuList = new ArrayList<BaseMenu>();
		subMenuList.add(menu);
	}

	@Override
	public String toString() {
		StringBuffer tree = new StringBuffer();
		tree.append("data['").append(this.parentId).append("_").append(this.id).append("'] = ");
		if(StringUtils.isNullString(this.text))
			tree.append("'text:;").append("'\r\n");
		else
			tree.append("'text:").append(this.text).append(";").append("'\r\n");
		if (subMenuList != null)
			for (BaseMenu menu : subMenuList) {
				tree.append(menu.toString());
			}
		return tree.toString();
	}
}
