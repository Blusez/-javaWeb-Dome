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
	form.action="<%=path%>/role/roleUserAddAction.do";
	form.submit();
}

function doAdd1(form){
	form.action="<%=path%>/role/roleUserSaveAction.do";
	form.submit();
}

function doDel(form){
	if(hasSelectItem(form,'id')){
		form.action="<%=path%>/role/roleUserDelAction.do";
		if(! confirm("确定要移除这些用户与角色关联吗？")){
	    	return;
	    }else{
	       form.submit();
	    }
    }else{
		alert("请选择要移除的用户！");
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
   window.location.href="<%=path%>/role/queryUserAction.do?page.pageIndex="+currentPage;
}
</script>
</head>
<body>
<div class="history-item">
  <div class="title">
  	<s:if test="state=='query'">用户列表</s:if>
  	<s:else>角色添加用户</s:else>
  </div>
	<div class="history-item-content">
	<form name="userList" method="post" action="">
	<s:hidden name="roleId"></s:hidden>
	<table width="100%" border="0" cellspacing="1" cellpadding="1" class="listTable">
	  <tr class="header">
	  	<td>选择</td>
		<td>序号</td>
		<td>账号</td>
		<td>用户名</td>
		<td>账号类型</td>
		<td>性别</td>
		<td>电话</td>
		<td>创建时间</td>
	  </tr>
	  <s:iterator value="userList" status="st">
	  <tr>
	  	<td width="10"><input type="checkbox" name="id" value="<s:property value='id'/>" class="checkbox"></td>
		<td width="10"><s:property value="#st.index+1"/></td>
		<td width="20%">&nbsp;<s:property value="account"/></td>
		<td width="15%">&nbsp;<s:property value="name"/></td>
		<td width="15%">&nbsp;
			<s:if test="accountType=='adm'">超级管理员</s:if>
			<s:elseif test="accountType=='mana'">管理员</s:elseif>
			<s:else>普通用户</s:else>
			
		</td>
		<td width="10%" align="center">
			<s:if test="sex == 1">男</s:if>
			<s:elseif test="sex == 2">女</s:elseif>
		</td>
		<td width="20%">&nbsp;<s:property value="telephone"/></td>
		<td width="20%" align="center"><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></td>
	  </tr>
	  </s:iterator>
	</table>
	<div align="right"><s:property value="page.pageBar" escape="false"/></div>
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