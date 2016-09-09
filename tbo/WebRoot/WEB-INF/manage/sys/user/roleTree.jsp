<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/common.jsp" %>

<html>
<head>
<title>部门列表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
function doAdd(){
	parent.location.href="<%=path %>/role/queryAction.do";
}
function doModelUser(roleId){
	parent.frames["modelList"].location.href="<%=path%>/role/queryModelAction.do?roleId="+roleId;
	parent.frames["userList"].location.href="<%=path%>/role/queryUserAction.do?roleId="+roleId;
}
</script>
</head>
<body>
<div class="history-item">
  <div class="title">角色列表</div>
	<div class="history-item-content">
	<form name="roleList" method="post" action="">
		<table width="160" border="0" cellspacing="1" cellpadding="1" class="listTable" height="80%">
		  <s:iterator value="roleList" status="st">
		  <tr>
			<td><a href="javascript:doModelUser('<s:property value="id"/>')"><s:property value="roleName"/></a></td>
		  </tr>
		  </s:iterator>
		</table>
		<div align="center">
			<input name="btnAdd" type="button" id="btnAdd" class="button_tt" value="管理" onClick="doAdd();">
		</div>
	</form>
	</div>
</div>
</body>
</html>