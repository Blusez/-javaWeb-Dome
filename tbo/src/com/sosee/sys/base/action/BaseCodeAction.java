package com.sosee.sys.base.action;

import java.util.ArrayList;
import java.util.List;

import com.sosee.base.action.AbstractAction;

import com.sosee.util.StringUtils;
import com.sosee.sys.base.pojo.BaseCode;
import com.sosee.sys.base.pojo.BaseDict;
import com.sosee.sys.base.service.BaseCodeService;
import com.sosee.sys.base.service.BaseDictService;

public class BaseCodeAction extends AbstractAction {
	private static final long serialVersionUID = 1L;
	private BaseCode baseCode;
	private List<BaseCode> baseCodeList = new ArrayList<BaseCode>();
	private BaseCodeService baseCodeService;
	private BaseDictService baseDictService;
	private List<BaseDict> baseDictList;
	private String id;
	private String categoryId;
	private String baseDictTree;
	private BaseDict baseDict;

	/**
	 * 生成目录树
	 * 
	 * @return
	 */
	public String baseDictTree() {
		//buildbaseDictTree();
		baseDictList = baseDictService.getBaseDictList();
		return SUCCESS;
	}

	public String initTree() {
		baseDictList = baseDictService.getBaseDictList();
		return SUCCESS;

	}

	public String treeFrame() {
		return SUCCESS;
	}

	private void buildbaseDictTree() {
		/*
		Menu rootMenu = new Menu();
		rootMenu.setId("1");
		rootMenu.setParentId("-1");
		rootMenu.setText("");
		List<BaseDict> baseDictList = baseDictService.getBaseDictList();
		for (Iterator iterator = baseDictList.iterator(); iterator.hasNext();) {
			BaseDict basedict = (BaseDict) iterator.next();
			MenuItem menuItem = new MenuItem();
			menuItem.setId(basedict.getCategoryId());
			menuItem.setParentId(rootMenu.getId());
			menuItem.setText(basedict.getCategoryName());
			menuItem.setUrl("basedata/baseCodeList.action?categoryId="
					+ basedict.getCategoryId());
			menuItem.setTarget("baseCodeList");
			rootMenu.addSubMenu(menuItem);
		}
		StringBuffer tree = new StringBuffer("var data={};").append("\r\n");
		tree.append(rootMenu.toString());
		baseDictTree = tree.toString();
		*/
		
		
	}

	@Override
	/**
	 * 查询
	 */
	public String list() throws Exception {
		

		return "switch";
	}
	/**
	 * 获取栏目列表信息
	 * @return
	 */
	public String baseCodeList(){
		if (!StringUtils.isNullString(id)) {
			baseDict = baseDictService.getValueByCategoryID(categoryId);
			baseCode = baseCodeService.getValue(id);
		} else {
			baseDict = baseDictService.getValueByCategoryID(categoryId);
			baseDictList =baseDictService.getBaseDictList();
		}
		baseCodeList = baseCodeService.getBaseCodeAllList();
		return "list";
	}
	/**
	 * 
	 * @return
	 */
	public String getSubBaseCodeListByPId(){
		//baseCodeList = baseCodeService.getBaseCodeAllList();
		baseCodeList = baseCodeService.getBaseCodeList(categoryId);
		System.out.println(errorMessage);
		return "list";
	}
	
	/**
	 * 添加/更新
	 */
	public String save() throws Exception {
		if (StringUtils.isNullString(baseCode.getId())) {
			baseCodeService.add(baseCode);
		} else {
			baseCodeService.update(baseCode);
		}		
		baseCodeList = baseCodeService.getBaseCodeAllList();//getBaseCodeList("T_ICS_BaseDict_FcategoryId");		
		return "list";
	}

	@Override
	/**
	 * 删除
	 */
	public String delete() throws Exception {
		baseCodeService.delete(id);
		//baseDict = baseDictService.getValueByCategoryID(categoryId);
		
		baseCodeList = baseCodeService.getBaseCodeAllList();//getBaseCodeList("T_ICS_BaseDict_FcategoryId");
		
		return "list";
	}

	public BaseCode getBaseCode() {
		return baseCode;
	}

	public void setBaseCode(BaseCode baseCode) {
		this.baseCode = baseCode;
	}

	public List<BaseCode> getBaseCodeList() {
		return baseCodeList;
	}

	public void setBaseCodeList(List<BaseCode> baseCodeList) {
		this.baseCodeList = baseCodeList;
	}

	public BaseCodeService getBaseCodeService() {
		return baseCodeService;
	}

	public void setBaseCodeService(BaseCodeService baseCodeService) {
		this.baseCodeService = baseCodeService;
	}

	public BaseDictService getBaseDictService() {
		return baseDictService;
	}

	public void setBaseDictService(BaseDictService baseDictService) {
		this.baseDictService = baseDictService;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getBaseDictTree() {
		if (baseDictTree == null) {
			buildbaseDictTree();
		}
		return baseDictTree;
	}

	public void setBaseDictTree(String baseDictTree) {
		this.baseDictTree = baseDictTree;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<BaseDict> getBaseDictList() {
		return baseDictList;
	}

	public void setBaseDictList(List<BaseDict> baseDictList) {
		this.baseDictList = baseDictList;
	}

	public BaseDict getBaseDict() {
		return baseDict;
	}

	public void setBaseDict(BaseDict baseDict) {
		this.baseDict = baseDict;
	}

}