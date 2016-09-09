<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/common.jsp" %>

<html>
<head>
<title>用户列表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
function doAdd(form){
	form.action="<%=path%>/model/modelAddAction.do";
	form.submit();
}

function doDel(id){
	document.modelList.action="<%=path%>/model/modelDelAction.do?model.id="+id;
	if(! confirm("确定要删除这个模板吗？")){
    	return;
    }else{
       document.modelList.submit();
    }
}
</script>
</head>
<body>
<div class="history-item">
  <div class="title">模块列表</div>
	<div class="history-item-content">
	<form name="modelList" method="post" action="">
	<s:hidden name="organId"></s:hidden>
	<table width="100%" border="0" cellspacing="1" cellpadding="1" class="listTable">
	  <tr class="header">
		<td>序号</td>
		<td>模块名称</td>
		<td>模块编码</td>
		<td>级别</td>
		<td>主模块图片</td>
		<td>Action地址</td>
		<td>模块主页</td>
		<td>操作</td>
	  </tr>
	  <s:iterator value="modelList" status="st">
	  <tr>
		<td width="10"><s:property value="#st.index+1"/></td>
		<td>&nbsp;<a href="<%=path%>/model/modelEditAction.do?model.id=<s:property value='id'/>"><s:property value="moudleName"/></a></td>
		<td>&nbsp;<s:property value="code"/></td>
		<td>&nbsp;<s:property value="grade"/></td>
		<td>&nbsp;<s:property value="image"/></td>
		<td>&nbsp;<s:property value="url"/></td>
		<td>&nbsp;<s:property value="indexUrl"/></td>
		<td>&nbsp;
			<a href="<%=path%>/model/modelEditAction.do?model.id=<s:property value='id'/>">编辑</a>
			<a href="javascript:doDel('<s:property value='id'/>');">删除</a>
		</td>
	  </tr>
	  </s:iterator>
	</table>
	<div align="center">
	<input name="btnAdd" type="button" id="btnAdd" class="button_tt" value="新 增" onClick="doAdd(this.form);">
	</div>
	</form>
	</div>
	<br>
	<div id="msg" align="center">
       		<font color='red'><s:property value="msg"/></font>
    </div>
    <br>
    <br>
</div>
</body>
</html>