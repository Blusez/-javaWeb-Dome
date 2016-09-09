package com.sosee.sys.user.action;

import java.util.ArrayList;
import java.util.List;

import com.sosee.base.action.AbstractAction;
import com.sosee.sys.user.pojo.Moudle;
import com.sosee.sys.user.service.ModelService;

/**
 * 
 * 作者： qiangle 创建时间：2011-5-31 下午11:56:26 功能:
 */
public class ModelAction extends AbstractAction {

	public ModelService modelService;
	public List<Moudle> modelList = new ArrayList<Moudle>();
	public Moudle model;
	public List<Moudle> mpList = new ArrayList<Moudle>();
	public String parent;
	public String msg;// 返回操作信息

	public String query() {
		try{
			modelList = modelService.getModelList();
		}catch(Exception eq){
			msg="模块查询出错";
		}
		return "query";
	}

	public String modelAdd() {
		mpList = modelService.getModeParentlList();
		return "add";
	}

	public String modelEdit() {
		mpList = modelService.getModeParentlList();
		if (model != null && model.getId() != null) {
			model = modelService.getValue(model.getId());
			if (model != null && model.getParentId() != null) {
				parent = model.getParentId().getId();
			}
		}
		return "edit";
	}

	public String modelDel() {
		if(model !=null && model.getId()!=null && !model.getId().equals("")){
			List<Moudle> mlist=modelService.getModelList("and parentId.id='"+model.getId()+"'");
			if(mlist!=null && mlist.size()>0){
				msg="请删除模块下的子模块后再删除！";
			}else{
				modelService.delete(new String[]{model.getId()});
				msg="模块删除成功！";
			}
		}else{
			msg="模块数据异常！";
		}
		return query();
	}

	public String saveModel() {
		if (model != null) {
			if (model.getMoudleName() != null && model.getCode() != null) {
				if (!parent.equals("-1")) {
					model.setParentId(modelService.getValue(parent));
				}
				try {
					if (model.getId() != null && !model.getId().equals("")) {
						modelService.update(model);
						msg = "模块编辑成功！";
					} else {
						modelService.add(model);
						msg = "模块添加成功！";
					}
					
				} catch (Exception es) {
					es.printStackTrace();
					if (model.getId() != null && !model.getId().equals("")){
						msg = "模块编辑失败！";
					}else{
						msg = "模块添加失败！";
					}
				}
			}
		}
		return query();
	}

	public ModelService getModelService() {
		return modelService;
	}

	public void setModelService(ModelService modelService) {
		this.modelService = modelService;
	}

	public List<Moudle> getModelList() {
		return modelList;
	}

	public void setModelList(List<Moudle> modelList) {
		this.modelList = modelList;
	}

	public Moudle getModel() {
		return model;
	}

	public void setModel(Moudle model) {
		this.model = model;
	}

	public List<Moudle> getMpList() {
		return mpList;
	}

	public void setMpList(List<Moudle> mpList) {
		this.mpList = mpList;
	}

	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
