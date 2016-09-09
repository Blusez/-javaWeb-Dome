<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/common.jsp" %>
<html>
<head>
<title>修改用户密码</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
function submitForm(form){
	var roleName = form["role.roleName"].value;
	form.action="<%=path%>/role/roleSaveAction.do";
	return true;
}

function doReturn(){
	this.location.href="<%=path %>/role/queryAction.do";
}
</script>
</head>
<body>
<div class="history-item">
  <div class="title">
  	<s:if test="role.id!=''">编辑</s:if><s:else>添加</s:else>角色信息
  </div>
  <div class="history-item-content">
	<form action="#" name="editForm" id="editForm" method="post" onsubmit="return submitForm(this);">
	<input id="role.id" name="role.id" type="hidden" value="<s:property value="role.id"/>"/>
	<table class="formTable">
	  <tr>
		<td class="label">角色名称：</td>
		<td><input id="role.roleName" name="role.roleName" type="text" value="<s:property value="role.roleName"/>"/><font color=red>*</font></td>
	  </tr>
	  <tr>
		<td class="label">所属行政区：</td>
		<td></td>
	  </tr>
	  <tr>
		<td class="label">所属联合会：</td>
		<td></td>
	  </tr>
	</table>
	<div align="center">
	<input type="submit" value="提 交" class="button_tt" />
	<input type="button" value="返 回" class="button_tt" onClick="javascript:doReturn();">
	</div>
	</form>
  </div>
</div>
<script type="text/javascript">
	var validate = new LiveValidation("role.roleName"); 
    validate.add(Validate.Presence,{failureMessage:"角色名称不能为空，请输入!", wait: 100});
    validate.add( Validate.Length, { maximum: 30 } );
</script>
</body>
</html>