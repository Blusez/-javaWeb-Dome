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
function doAdd(form){
	form.action="<%=path%>/role/roleModelAddAction.do";
	form.submit();
}

function doAdd1(form){
	form.action="<%=path%>/role/roleModelSaveAction.do";
	form.submit();
}

function doDel(form){
	if(hasSelectItem(form,'id')){
		form.action="<%=path%>/role/roleModelDelAction.do";
		if(! confirm("确定要移除这些模板与角色关联吗？")){
	    	return;
	    }else{
	       form.submit();
	    }
    }else{
		alert("请选择要移除的模块！");
	}
}
function goRoleList(){
	window.location.href="<%=path%>/role/queryAction.do";
}
function goPage(pIndex){
   var currentPage = pIndex;
   var totalPage ='<s:property value="page.pageCount"/>';
   if(pIndex<1){
	  currentPage=1;
   }

   if(pIndex>totalPage){
	  currentPage=totalPage;
	}     
   window.location.href="<%=path%>/role/queryModelAction.action?page.pageIndex="+currentPage;
}
</script>
</head>
<body>
<div class="history-item">
  <div class="title">
  	<s:if test="state=='query'">模块列表</s:if>
  	<s:else>角色添加模块</s:else>
  </div>
	<div class="history-item-content">
	<form name="modelList" method="post" action="">
	<s:hidden name="roleId"></s:hidden>
	<table width="100%" border="0" cellspacing="1" cellpadding="1" class="listTable">
	  <tr class="header">
	  	<td>选择</td>
		<td>序号</td>
		<td>模块名称</td>
		<td>模块编码</td>
		<td>级别</td>
		<td>主模块图片</td>
		<td>Action地址</td>
		<td>模块主页</td>
	  </tr>
	  <s:iterator value="modelList" status="st">
	  <tr>
	  	<td width="10"><input type="checkbox" name="id" value="<s:property value='id'/>" class="checkbox"></td>
		<td width="10"><s:property value="#st.index+1"/></td>
		<td>&nbsp;<s:property value="moudleName"/></td>
		<td>&nbsp;<s:property value="code"/></td>
		<td>&nbsp;<s:property value="grade"/></td>
		<td>&nbsp;<s:property value="image"/></td>
		<td>&nbsp;<s:property value="url"/></td>
		<td>&nbsp;<s:property value="indexUrl"/></td>
	  </tr>
	  </s:iterator>
	</table>
	<div align="center">
		<s:if test="state=='query'">
			<input name="btnAdd" type="button" id="btnAdd" class="button_tt" value="引  入" onClick="doAdd(this.form);">
			<input name="btnSel" type="button" id="btnSel" class="button_tt" value="全选/反选" onClick="selectOrReverse1(this.form,'id');">
			<input name="btnDel" type="button" id="btnDel" class="button_tt" value="移  除" onClick="doDel(this.form);">
			<input name="btnRet" type="button" id="btnAdd" class="button_tt" value="返回" onClick="goRoleList();">
		</s:if>
		<s:else>
			<input name="btnAdd" type="button" id="btnAdd" class="button_tt" value="保存" onClick="doAdd1(this.form);">
			<input name="btnSel" type="button" id="btnSel" class="button_tt" value="全选/反选" onClick="selectOrReverse1(this.form,'id');">
			<input name="btnRet" type="button" id="btnAdd" class="button_tt" value="返回" onClick="history.go(-1);">
		</s:else>
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