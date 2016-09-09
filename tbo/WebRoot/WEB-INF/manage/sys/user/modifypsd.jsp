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
	var password = form["password"].value;
	var otherPassword= form["otherPassword"].value;
	form.action="<%=path%>/main/savePsdAction.do";
	return true;
}
</script>
</head>
<body>
<div class="history-item">
  <div class="title">修改用户密码</div>
  <div class="history-item-content">
	<form action="#" name="editForm" id="editForm" method="post" onsubmit="return submitForm(this);">
	<table class="formTable">
	  <tr>
		<td class="label">登录名：</td>
		<td><s:property value="#session.user.loginName"/></td>
	  </tr>
	  <tr>
		<td class="label">姓名：</td>
		<td><s:property value="#session.user.name"/></td>
	  </tr>
	  <tr>
		<td class="label">新密码：</td>
		<td><input id="password" name="password" type="password" value="" class="text"><font color=red>*</font></td>
	  </tr>
	  <tr>
		<td class="label">确认密码：</td>
		<td><input id="otherPassword" name="otherPassword" type="password" value="" class="text"><font color=red>*</font></td>
	  </tr>
	</table>
	<div align="center">
	<input type="submit" value="提 交" class="button_tt" />
	<input type="button" value="返 回" class="button_tt" onClick="history.go(-1);">
	</div>
	</form>
  </div>
</div>
<script type="text/javascript">
	var validate = new LiveValidation("password"); 
    validate.add(Validate.Presence,{failureMessage:"密码不能为空，请输入!", wait: 100});
    validate = new LiveValidation("otherPassword"); 
    validate.add(Validate.Presence,{failureMessage:"确认密码不能为空，请输入！", wait: 100});
    validate.add(Validate.Confirmation, { match: 'password',failureMessage:'密码不一致，请重新输入！'} );
</script>
</body>
</html>