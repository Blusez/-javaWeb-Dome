<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/common.jsp" %>

<html>
<head>
<title>模块列表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
<s:if test="#session.user.accountType=='adm'">
function doAdd(form){
	form.action="<%=path%>/role/roleAddAction.do";
	form.submit();
}

function doEdit(id){
	document.roleList.action="<%=path%>/role/roleEditAction.do?roleId="+id;
    document.roleList.submit();
}

function doDel(id){
	document.roleList.action="<%=path%>/role/removeRoleAction.do?roleId="+id;
	if(! confirm("确定要删除这个角色吗？")){
    	return;
    }else{
       document.roleList.submit();
    }
}
</s:if>
</script>
</head>
<body>
<div class="history-item">
  <div class="title">角色列表</div>
	<div class="history-item-content">
	<form name="roleList" method="post" action="">
	<s:token/>
	<table width="100%" border="0" cellspacing="1" cellpadding="1" class="listTable">
	  <tr class="header">
		<td width="5%">序号</td>
		<td>角色名称</td>
		<td>所属行政区</td>
		<td>操作</td>
	  </tr>
	  <s:iterator value="roleList" status="st">
	  <s:if test="#session.user.accountType=='adm' || (#session.user.accountType!='adm' && id!='43958C98-5DD9-4C50-B18B-F33017922041')">
	  <tr>
		<td><s:property value="#st.index+1"/></td>
		<td>
			<s:if test="#session.user.accountType=='adm'">
				&nbsp;<a href="javascript:doEdit('<s:property value="id"/>')"><s:property value="roleName"/></a>
			</s:if>
			<s:else>
				&nbsp;<s:property value="roleName"/>
			</s:else>
		</td>
		<td>&nbsp;<s:property value="organ.name"/></td>
		<td>			
			<s:if test="#session.user.accountType=='adm'">
				&nbsp;<a href="javascript:doDel('<s:property value="id"/>')"><img align="absMiddle" src="<%=path %>/sys/images/delete.gif" border="0" title="删除"></a>
			   	&nbsp;&nbsp;<a href="<%=path%>/role/queryModelAction.do?roleId=<s:property value="id"/>"><img align="absMiddle" src="<%=path %>/sys/images/right.gif" border="0" title="角色授权"></a>
			   	&nbsp;&nbsp;<a href="<%=path%>/role/queryUserAction.do?roleId=<s:property value="id"/>"><img align="absMiddle" src="<%=path %>/sys/images/user.gif" border="0" title="此角色下用户"></a>
		   	</s:if>
		   	<s:else>
		   		&nbsp;&nbsp;<a href="<%=path%>/role/queryUserAction.do?roleId=<s:property value="id"/>"><img align="absMiddle" src="<%=path %>/sys/images/user.gif" border="0" title="此角色下用户"></a>
		   	</s:else>
		</td>
	  </tr>
	  </s:if>
	  </s:iterator>
	</table>
	<div align="center">
		<s:if test="#session.user.accountType=='adm'">
			<input name="btnAdd" type="button" id="btnAdd" class="button_tt" value="新  增" onClick="doAdd(this.form);">
		</s:if>
	</div>
	</form>
	</div>
</div>
</body>
</html>