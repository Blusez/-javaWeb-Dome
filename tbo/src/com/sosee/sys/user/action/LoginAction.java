package com.sosee.sys.user.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.sosee.base.action.AbstractAction;
import com.sosee.sys.user.pojo.LoginLog;
import com.sosee.sys.user.pojo.Moudle;
import com.sosee.sys.user.pojo.Role;
import com.sosee.sys.user.pojo.RoleMoudle;
import com.sosee.sys.user.pojo.User;
import com.sosee.sys.user.service.LoginLogService;
import com.sosee.sys.user.service.ModelService;
import com.sosee.sys.user.service.RoleModelService;
import com.sosee.sys.user.service.RoleService;
import com.sosee.sys.user.service.UserService;
import com.sosee.util.Constants;
import com.sosee.util.StringUtils;

public class LoginAction extends AbstractAction implements ServletRequestAware{
	private static final long serialVersionUID = 4325588745039489390L;

	private String loginName;// 用户名

	private String password;// 密码

	private String verifyCode;// 输入的校验码

	private UserService userService;
	private RoleService roleService;
	private LoginLogService loginLogService;

	private String tips;
	
	private User user;
	
	private HttpServletRequest request;
	
	private String menuCode;//选择当前菜单编号

	private ModelService modelService;

	private RoleModelService roleModelService;
	
	private List<Moudle> listmodel=new ArrayList<Moudle>();//top模块
	private String strMenu="";//菜单模块

	/**
	 * 检查用户校验码是否一致
	 * 
	 * @return
	 */
	private Boolean checkVerifyCode() {
		// 得到系统保存的登录校验码
		Boolean bFlag = true;
		Object o = getRequestAttribute("validate_code");
		if (o != null) {
			// 系统保存的校验码
			String systemVerifyCode = o.toString();
			if (!systemVerifyCode.equals(verifyCode)) {
				bFlag = false;
			}
		} else {// 没有得到校验码
			bFlag = false;
		}

		return bFlag;
	}

	/**
	 * 登录验证
	 * 
	 * @return
	 * @throws Exception
	 */
	public String login() throws Exception {

		User u=(User)this.getSessionAttribute(Constants.USER);
		if(u!=null){
			return SUCCESS;
		}
		if (StringUtils.isNullString(loginName)) {
			tips="登录名不能为空！";
			return LOGIN;
		} else if (StringUtils.isNullString(password)) {
			tips="用户密码不能为空！";
			return LOGIN;
		}
		// 用户存在
		user = userService.getValueByLoginName(loginName);
		if (user == null) {
			tips="登录名或密码不正确，请重新输入！";
			return LOGIN;
		} else if (user.getPassword().equals(StringUtils.encodeBase64(password))) {
			if(user.getStatus().equals(Constants.USER_STATE_1)){
				setSessionAttribute(Constants.USER, user);
				List<Moudle> listMoudle=new ArrayList<Moudle>();
				List<Role> listRole=roleService.getUserRoleList(user.getId());
				if(listRole!=null && listRole.size()>0){
					for(Role role : listRole){
						List<RoleMoudle> listRoleMoudle=roleModelService.getValueByRole(role.getId());
						if(listRoleMoudle!=null && listRoleMoudle.size()>0){
							for(RoleMoudle roleMoudle : listRoleMoudle){
								if(!isExistMoudle(roleMoudle.getMoudle(),listMoudle)){
									listMoudle.add(roleMoudle.getMoudle());
								}
							}
						}
					}
				}				
				setSessionAttribute(Constants.MOUDEL,listMoudle);
				try{
					user.setLoginSum(user.getLoginSum()+1);
					user.setLastLoginTime(new Date());
					userService.update(user);
					LoginLog l=new LoginLog();
					l.setAccount(user.getAccount());
					l.setLoginTime(new Date());
					loginLogService.add(l);
					setSessionAttribute(Constants.LOGINLOG,l);
				}catch(Exception e){}
				return SUCCESS;
			}else{
				tips="对不起，此用户已被禁用！";
				return LOGIN;	
			}
		} else {
			tips="登录名或密码不正确，请重新输入！";
			return LOGIN;
		}
	}

	 /**
     * 重新登录
     * @return
     * @throws Exception
     */
     public String relogin() throws Exception {
    	 Object o = request.getSession().getAttribute(Constants.USER);
     	if(o!=null){
     		request.getSession().removeAttribute(Constants.USER);
     		LoginLog l=(LoginLog)request.getSession().getAttribute(Constants.LOGINLOG);
     		if(l!=null){
     			l.setLogoutTime(new Date());
     			try{
     				loginLogService.update(l);
     			}catch(Exception e){}
     		}
     	}
     	return LOGIN;
     }
     
     public String top() throws Exception {
    	@SuppressWarnings("unchecked")
		List<Moudle> lMoudle=(List<Moudle>)request.getSession().getAttribute(Constants.MOUDEL);
     	if(lMoudle!=null && lMoudle.size()>0){
     		for(Moudle moudle:lMoudle){
     			if(moudle.getParentId()==null || moudle.getParentId().equals("")){
     				listmodel.add(moudle);
     			}
     		}
     	}
    	return "top";
     }
     
     public String control() throws Exception {
      	return "control";
      }
     /**
      * 第一次打开时主界面工作区显示内容
      * @return
      * @throws Exception
      */
     public String mainPanel() throws Exception {
       	return "mainPanel";
      }
     
     public String leftPanel() throws Exception {
     	return "leftPanel";
    }
     public String sideControl() throws Exception {
     	return "sideControl";
    }
   
     public String menu() throws Exception {
    	strMenu="<script language='JavaScript'>";
    	List<Moudle> lMoudle=(List<Moudle>)request.getSession().getAttribute(Constants.MOUDEL);
     	if(lMoudle!=null && lMoudle.size()>0){
     		strMenu +="var tree;";
     		String str="function menuScript(index){";
     		int i=0;//控制方法里边的循环
     		for(Moudle moudle:lMoudle){
     			if(moudle.getParentId()==null || moudle.getParentId().equals("")){
     				strMenu +="tree= outlookbar.addtitle('"+moudle.getMoudleName()+"');";
     				boolean b=true;
     				int j=1;
     				for(Moudle m:lMoudle){
     					if(m.getParentId()!=null && !m.getParentId().equals("")&& m.getParentId().getId().equals(moudle.getId())){
     						
     						if(b){
     							str +="if(index == "+i+"){dTree"+i+" = new dTree('dTree"+i+"');dTree"+i+".add("+i+", -1, '');";
     							b=false;
     						}
     						str +="dTree"+i+".add("+i+""+(j+1)+", "+i+", '"+m.getMoudleName()+"','"+(m.getUrl()!=null && !m.getUrl().equals("")?menuCode+m.getUrl():menuCode+"/main/mainPanelAction.do")+"', '', 'mainFrame');";
     					}
     					j++;
     				}
     				if(!b){
     					str +="return ('<span>' + dTree"+i+" + '</span>');}";
     				}else{
     					str +="if(index == "+i+"){dTree"+i+" = new dTree('dTree2');return ('<span>' + dTree"+i+" + '</span>');}";
     				}
     				i++;
     			}
     		}
     		str +="}";
     		strMenu +=str;
     	}
    	strMenu +="</script>";
      	return "menu";
     }
     
     public String first() throws Exception {
      	return "first";
     }
     
     
     public String modifyPsd() throws Exception {
       	return "modifyPsd";
     }
     
     //保存密码
     public String savePsd() throws Exception {
    	 Object o = request.getSession().getAttribute(Constants.USER);
      	if(o!=null){
      		user = (User)request.getSession().getAttribute(Constants.USER);
      		user.setPassword(StringUtils.encodeBase64(password));
      		userService.update(user);
      	} 
       	return "savePsd";
     }
     
     /**
      * 从登录页面跳转注册页面
      * @return
      */
     public String reg(){
    	 return "reg";
     }
     
     /**
      * 注册页面处理
      * @return
      */
     public String regc(){
    	 
    	 return "regc";
     }
     
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getVerifyCode() {
		return verifyCode;
	}

	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTips() {
		return tips;
	}

	public void setTips(String tips) {
		this.tips = tips;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}

	public String getMenuCode() {
		return menuCode;
	}

	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	
	private boolean isExistMoudle(Moudle moudle,List<Moudle> modelList)
	{
		boolean bFlag=false;
		if(modelList!=null && modelList.size()>0){
			for(Moudle m:modelList){
				if(moudle.getId().equals(m.getId())){
					bFlag=true;
					break;
				}
			}
		}
		return bFlag;
	}

	public ModelService getModelService() {
		return modelService;
	}

	public void setModelService(ModelService modelService) {
		this.modelService = modelService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public RoleModelService getRoleModelService() {
		return roleModelService;
	}

	public void setRoleModelService(RoleModelService roleModelService) {
		this.roleModelService = roleModelService;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public List<Moudle> getListmodel() {
		return listmodel;
	}

	public void setListmodel(List<Moudle> listmodel) {
		this.listmodel = listmodel;
	}

	public String getStrMenu() {
		return strMenu;
	}

	public void setStrMenu(String strMenu) {
		this.strMenu = strMenu;
	}

	public LoginLogService getLoginLogService() {
		return loginLogService;
	}

	public void setLoginLogService(LoginLogService loginLogService) {
		this.loginLogService = loginLogService;
	}		
}
