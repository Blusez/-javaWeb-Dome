package com.sosee.sys.user.action;

import java.util.ArrayList;
import java.util.List;

import com.sosee.base.action.AbstractAction;
import com.sosee.sys.user.pojo.Moudle;
import com.sosee.sys.user.pojo.Role;
import com.sosee.sys.user.pojo.RoleMoudle;
import com.sosee.sys.user.pojo.User;
import com.sosee.sys.user.pojo.UserRole;
import com.sosee.sys.user.service.ModelService;
import com.sosee.sys.user.service.RoleModelService;
import com.sosee.sys.user.service.RoleService;
import com.sosee.sys.user.service.UserRoleService;
import com.sosee.sys.user.service.UserService;
import com.sosee.util.Constants;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-31 下午11:56:35
 * 功能:
 */
@SuppressWarnings("serial")
public class RoleAction extends AbstractAction {

	public RoleService roleService;
	public RoleModelService roleModelService;
	public UserRoleService userRoleService;
	public ModelService modelService;
	public UserService userService;
	public String roleId;
	public String msg;
	public List<Role> roleList=new ArrayList<Role>();
	public List<User> userList=new ArrayList<User>();
	public List<Moudle> modelList=new ArrayList<Moudle>();
	public String state;
	public Role role;
	
	public String query(){
		tree();
		return "query";
	}

	public String frame(){
		return "frame";
	}
	
	public String tree(){
		roleList=roleService.getRoleList();
		return "tree";
	}
	
	public String roleAdd(){
		return "add";
	}
	
	public String roleEdit(){
		if(roleId!=null && !roleId.equals("")){
			try{
				role = roleService.getValue(roleId);
			}catch(Exception ere){}
		}
		return "edit";
	} 
	
	public String roleSave(){
		if(role!=null){
			try{
				if(role.getId()!=null && !role.getId().equals("")){
					roleService.update(role);
				}else{
					roleService.add(role);
				}
				msg="角色保存成功！";
			}catch(Exception ers){
				msg="角色保存出错！";
			}
		}else{
			msg="角色保存出错！";
		}
		return query();
	} 
	
	public String roleDel(){
		if(roleId!=null && !roleId.equals("")){
			try{
				if(roleId.equals("43958C98-5DD9-4C50-B18B-F33017922041")){
					msg="管理员角色不能删除！";
					return query();
				}
				roleModelService.deleteByRole(new String[]{roleId});
				userRoleService.deleteByRole(new String[]{roleId});
				roleService.delete(new String[]{roleId});
				msg="角色删除成功！";
			}catch(Exception erd){
				msg="角色删除出错！";
			}
		}
		return query();
	}
	
	public String queryModel(){
		if(roleId!=null && !roleId.equals("")){
			try{
				String hql="and id in (select moudle.id from RoleMoudle where role.id='"+roleId+"')";
				modelList=modelService.getModelList(hql);
			}catch(Exception eqm){
				msg="查询出错";
			}
		}
		state="query";
		return "queryModel";
	}
	
	public String roleModelAdd(){
		if(roleId!=null && !roleId.equals("")){
			try{
				String hql="and id not in (select moudle.id from RoleMoudle where role.id='"+roleId+"')";
				modelList=modelService.getModelList(hql);
			}catch(Exception erma){
				msg="查询出错";
			}
		}
		state="add";
		return "queryModel";
	}
	
	public String roleModelSave(){
		if(roleId!=null && !roleId.equals("")){
			try{
				String[] strId=parseId();
				if(strId!=null && strId.length>0){
					Role r=roleService.getValue(roleId);
					for(String modelId : strId){
						Moudle m=modelService.getValue(modelId);
						RoleMoudle rm=new RoleMoudle();
						rm.setMoudle(m);
						rm.setRole(r);
						roleModelService.add(rm);
					}
					msg="引入成功";
				}
			}catch(Exception erms){
				msg="引入出错";
			}
		}
		return queryModel();
	}
	
	public String roleModelDel(){
		if(roleId!=null && !roleId.equals("")){
			try{
				if(roleId.equals("43958C98-5DD9-4C50-B18B-F33017922041")){
					msg="系统管理员的模块不能移除！";
					return queryModel();					
				}
				String[] strId=parseId();
				if(strId!=null && strId.length>0){
					roleModelService.deleteByModel(strId,roleId);
					msg="移除成功";
				}
			}catch(Exception ermd){
				msg="移除出错";
			}
		}
		return queryModel();
	}
	
	public String queryUser(){
		if(roleId!=null && !roleId.equals("")){
			try{
				String hql="and id in (select user.id from UserRole where role.id='"+roleId+"')";
				userList=userService.getUserList(hql, page);
			}catch(Exception eqm){
				msg="查询出错";
			}
		}
		state="query";
		return "queryUser";
	}
	
	public String roleUserAdd(){
		if(roleId!=null && !roleId.equals("")){
			try{
				String hql="and id not in (select user.id from UserRole where role.id='"+roleId+"') and status='"+Constants.USER_STATE_1+"'";
				userList=userService.getUserList(hql);
			}catch(Exception erma){
				msg="查询出错";
			}
		}
		state="add";
		return "queryUser";
	}
	
	public String roleUserSave(){
		if(roleId!=null && !roleId.equals("")){
			try{
				String[] strId=parseId();
				if(strId!=null && strId.length>0){
					Role r=roleService.getValue(roleId);
					for(String userId : strId){
						User u=userService.getValue(userId);
						UserRole ur=new UserRole();
						ur.setUser(u);
						ur.setRole(r);
						userRoleService.add(ur);
					}
					msg="引入成功";
				}
			}catch(Exception erms){
				msg="引入出错";
			}
		}
		return queryUser();
	}
	
	public String roleUserDel(){
		if(roleId!=null && !roleId.equals("")){
			try{
				String[] strId=parseId();
				if(strId!=null && strId.length>0){
					if(roleId.equals("43958C98-5DD9-4C50-B18B-F33017922041")){
						for(String s:strId){
							if(s.equals("06996C4A-8C50-4BBA-B7B7-B3340B04DE0B")){
								msg="系统管理员不能移除！";
								return queryUser();
							}
						}
					}
					userRoleService.deleteByUser(strId,roleId);
					msg="移除成功";
				}
			}catch(Exception ermd){
				msg="移除出错";
			}
		}
		return queryUser();
	}
	
	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public RoleModelService getRoleModelService() {
		return roleModelService;
	}

	public void setRoleModelService(RoleModelService roleModelService) {
		this.roleModelService = roleModelService;
	}

	public UserRoleService getUserRoleService() {
		return userRoleService;
	}

	public void setUserRoleService(UserRoleService userRoleService) {
		this.userRoleService = userRoleService;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public ModelService getModelService() {
		return modelService;
	}

	public void setModelService(ModelService modelService) {
		this.modelService = modelService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public List<Moudle> getModelList() {
		return modelList;
	}

	public void setModelList(List<Moudle> modelList) {
		this.modelList = modelList;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
}
