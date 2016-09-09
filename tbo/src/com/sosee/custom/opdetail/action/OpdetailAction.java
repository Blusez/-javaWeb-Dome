package com.sosee.custom.opdetail.action;

import java.util.List;

import com.sosee.base.action.AbstractAction;
import com.sosee.custom.opdetail.pojo.Opdetail;
import com.sosee.custom.opdetail.service.OpdetailService;
import com.sosee.util.StringUtils;

public class OpdetailAction extends AbstractAction {
private OpdetailService OpdetailService;
	
	private List<Opdetail> OpdetailList;
	private boolean editable=false;
	private Opdetail Opdetail;
	
	
	public String transferToOpdetailList(){
		OpdetailList = OpdetailService.getOpdetailList();
		return "list";
	}
	/**
	 * 
	 */
	public String save(){
		if (StringUtils.isNullString(Opdetail.getId())) {
			OpdetailService.add(Opdetail);
		} else {
			OpdetailService.update(Opdetail);
		}
		errorMessage = "保存成功！";
		Opdetail = null;
		return transferToOpdetailList();
	}
	/**
	 * 
	 */
	public String editOpdetail(){
		editable=true;
		Opdetail = OpdetailService.getOpdetail(id);
		return transferToOpdetailList();
	}
	/**
	 * 
	 */
	public String deleteOpdetail(){
		OpdetailService.delete(id);
		return transferToOpdetailList();
	}
	public OpdetailService getOpdetailService() {
		return OpdetailService;
	}
	public void setOpdetailService(OpdetailService opdetailService) {
		OpdetailService = opdetailService;
	}
	public List<Opdetail> getOpdetailList() {
		return OpdetailList;
	}
	public void setOpdetailList(List<Opdetail> opdetailList) {
		OpdetailList = opdetailList;
	}
	public boolean isEditable() {
		return editable;
	}
	public void setEditable(boolean editable) {
		this.editable = editable;
	}
	public Opdetail getOpdetail() {
		return Opdetail;
	}
	public void setOpdetail(Opdetail opdetail) {
		Opdetail = opdetail;
	}
	
	
}
