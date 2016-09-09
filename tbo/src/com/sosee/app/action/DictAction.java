package com.sosee.app.action;

import java.util.List;

import com.sosee.app.pojo.Dict;
import com.sosee.app.service.DictService;
import com.sosee.base.action.AbstractAction;
import com.sosee.custom.company.pojo.Company;
import com.sosee.util.StringUtils;


public class DictAction extends AbstractAction {

	private DictService dictService;
	
	private List<Dict> dictList;
	private boolean editable=false;
	private Dict dict;
	
	
	public String transferToDictList(){
		dictList = dictService.getDictList();
		return "list";
	}
	/**
	 * 
	 */
	public String save(){
		if (StringUtils.isNullString(dict.getId())) {
			dictService.add(dict);
		} else {
			dictService.update(dict);
		}
		errorMessage = "保存成功！";
		dict = null;
		return transferToDictList();
	}
	/**
	 * 
	 */
	public String editDict(){
		editable=true;
		dict = dictService.getDict(id);
		return transferToDictList();
	}
	/**
	 * 
	 */
	public String deleteDict(){
		dictService.delete(id);
		return transferToDictList();
	}
	
	
	public DictService getDictService() {
		return dictService;
	}

	public void setDictService(DictService dictService) {
		this.dictService = dictService;
	}
	public List<Dict> getDictList() {
		return dictList;
	}
	public void setDictList(List<Dict> dictList) {
		this.dictList = dictList;
	}
	public boolean isEditable() {
		return editable;
	}
	public void setEditable(boolean editable) {
		this.editable = editable;
	}
	public Dict getDict() {
		return dict;
	}
	public void setDict(Dict dict) {
		this.dict = dict;
	}
	
	
	
	
}
