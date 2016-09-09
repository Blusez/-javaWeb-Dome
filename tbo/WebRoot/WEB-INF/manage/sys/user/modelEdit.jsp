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
	var moudleName = form["model.moudleName"].value;
	var code= form["model.code"].value;
	var grade= form["model.grade"].value;
	form.action="<%=path%>/model/saveModelAction.do";
	return true;
}

function doReturn(){
	this.location.href="<%=path %>/model/queryAction.do";
}
</script>
</head>
<body>
<div class="history-item">
  <div class="title">
  	<s:if test="model.id!=''">编辑</s:if><s:else>添加</s:else>模板信息
  </div>
  <div class="history-item-content">
	<form action="#" name="editForm" id="editForm" method="post" onsubmit="return submitForm(this);">
	<input id="model.id" name="model.id" type="hidden" value="<s:property value="model.id"/>"/>
	<table class="formTable">
	  <tr>
		<td class="label">模块名称：</td>
		<td><input id="model.moudleName" name="model.moudleName" type="text" value="<s:property value="model.moudleName"/>"/><font color=red>*</font></td>
	  	<td class="label">模块编码：</td>
		<td><input id="model.code" name="model.code" type="text" value="<s:property value="model.code"/>"/><font color=red>*</font></td>
	  </tr>
	  <tr>
		<td class="label">模块级别：</td>
		<td><input id="model.grade" name="model.grade" type="text" value="<s:property value="model.grade"/>"/><font color=red>* (一级模块的显示次序)</font></td>
		<td class="label">上级模块：</td>
		<td>
			<s:select list="mpList" id="parent" name="parent" listKey="id" listValue="moudleName" theme="simple" headerKey="-1" headerValue="请选择父模块" value="#request.parent"/>
		</td>
	  </tr>
	  <tr>
		<td class="label">图片名字：</td>
		<td colspan=3><input id="model.image" name="model.image" type="text" value="<s:property value="model.image"/>" maxlength="90"/></td>
	  </tr>
	  <tr>
		<td class="label">链接地址：</td>
		<td colspan=3><input id="model.url" name="model.url" type="text" value="<s:property value="model.url"/>" maxlength="90"/><font color=red>(二级模块的Action)</font></td>
	  </tr>
	  <tr>
		<td class="label">模块主页地址：</td>
		<td colspan=3><input id="model.indexUrl" name="model.indexUrl" type="text" value="<s:property value="model.indexUrl"/>" maxlength="90"/><font color=red>(一级模块显示在欢迎页面的主页地址)</font></td>
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
	var validate = new LiveValidation("model.moudleName"); 
    validate.add(Validate.Presence,{failureMessage:"模块名称不能为空，请输入!", wait: 100});
    validate.add( Validate.Length, { maximum: 50 } );
    validate = new LiveValidation("model.code"); 
    validate.add(Validate.Presence,{failureMessage:"模块编码不能为空，请输入！", wait: 100});
    validate.add( Validate.Length, { maximum: 50 } );
    validate = new LiveValidation("model.grade"); 
    validate.add(Validate.Presence,{failureMessage:"模块级别不能为空，请输入！", wait: 100});
    validate.add( Validate.Numericality, { maximum: 30 } );
    validate.add(Validate.Numericality, {onlyInteger: true } );
</script>
</body>
</html>