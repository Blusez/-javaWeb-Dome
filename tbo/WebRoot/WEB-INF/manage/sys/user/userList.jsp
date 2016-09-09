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
	form.action="<%=path%>/user/userEditAction.do";
	form.submit();
}

function submitForm(form){
	var c1=document.all["dateTime1"].value;
	var c2=document.all["dateTime2"].value;
	if(c1==""&&c2==""){
	document.forms["userList"]["page.pageIndex"].value=1;
	form.action="<%=path%>/user/queryAction.do";
	return true;
	}else if(c1!=""&&c2==""){
	 alert("请填写完整的时间段！");
			return false;
	}else if(c1==""&&c2!=""){
	 alert("请填写完整的时间段！");
			return false;
	}else if(c1!="" && c2!=""){
		if(c1<=c2){
		document.forms["userList"]["page.pageIndex"].value=1;
		form.action="<%=path%>/user/queryAction.do";
			return true;
		}else{
			alert("时间段有误！");
			return false;
		}
	}
}

function doReset(form){
	form.reset();
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
   document.forms["userList"].action="<%=path%>/user/queryAction.do";
   document.forms["userList"]["page.pageIndex"].value=currentPage;
   document.forms["userList"].submit();
}
</script>
</head>
<body>
<div class="history-item">
  <div class="title">用户列表</div>
	<div class="history-item-content">
	<form name="userList" method="post" action="" onsubmit="return submitForm(this);">
	<table class="formTable">
		<tr>
			<td class="label">账号：</td>
			<td><input id="account" name="account" type="text" value="<s:property value="account"/>"/></td>
			<td class="label">用户名：</td>
			<td><input id="name" name="name" type="text" value="<s:property value="name"/>"/></td>
		</tr>
		<tr>
			<td class="label">账号类型:</td>
			<td><s:select id="accountType" list="uMap" name="accountType" listKey="key" listValue="value" theme="simple" value="accountType"/></td>
			<td class="label">状态：</td>
			<td>
				<s:select id="status" list="#{'0':'全部','s1':'启用','s2':'禁用'}" name="status" listKey="key" listValue="value" theme="simple" value="status"/>
			</td>
		</tr>
		<tr>
			<td class="label">创建时间：</td>
			<td colspan="3">
				从<input name="dateTime1" type="text" class="Wdate" onClick="WdatePicker()" value="<s:property value="dateTime1"/>">
				到<input name="dateTime2" type="text"  class="Wdate" onClick="WdatePicker()" value="<s:property value="dateTime2"/>">
			</td>
		</tr>
	</table>
	<div align="center">
	
       		<font color='red'><s:property value="errorMessage"/></font>
    
	<input name="btnQuery" type="submit" id="btnQuery" class="button_tt" value="查询"/>
	<input name="btnReset" type="button" id="btnReset" class="button_tt" value="重置" onClick="doReset(this.form);"/>
	</div>
	<table width="100%" border="0" cellspacing="1" cellpadding="1" class="listTable">
	  <tr class="header">
		<td>序号</td>
		<td>账号</td>
		<td>用户名</td>
		<td>账号类型</td>
		<td>性别</td>
		<td>电话</td>
		<td>状态</td>
		<td>所属行政区</td>
		<td>创建时间</td>
		<td>操作</td>
	  </tr>
	  <s:iterator value="userList" status="st">
	  <tr>
		<td width="10"><s:property value="#st.index+1"/></td>
		<td width="15%">&nbsp;<a href="<%=path%>/user/userEditAction.do?user.id=<s:property value='id'/>"><s:property value="account"/></a></td>
		<td width="15%">&nbsp;<s:property value="name"/></td>
		<td width="15%">&nbsp;
			<s:if test="accountType=='adm'">超级管理员</s:if>
			<s:elseif test="accountType=='mana'">管理员</s:elseif>
			<s:else>普通用户</s:else>
			
		</td>
		<td width="5%" align="center">
			<s:if test="sex == 1">男</s:if>
			<s:elseif test="sex == 2">女</s:elseif>
		</td>
		<td width="15%">&nbsp;<s:property value="telephone"/></td>
		<td width="5%" align="center">
			<s:if test="status == 's1'">启用</s:if>
			<s:else>禁用</s:else>
		</td>
		<td align="center"><s:property value="region.name"/></td>
		<td width="15%" align="center"><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></td>
		<td width="15%" align="center">
			<s:if test="account != 'admin'">
				<s:if test="status == 's1'">
				<a href="<%=path%>/user/userEnableAction.do?user.id=<s:property value='id'/>">禁用</a>
				</s:if>
				<s:else>
				<a href="<%=path%>/user/userEnableAction.do?user.id=<s:property value='id'/>">启用</a>
				</s:else>
			</s:if>
			<s:else>-----&nbsp;&nbsp;</s:else>
			<s:if test="accountType != 'adm' || #session.user.accountType=='adm'">
			<a href="<%=path%>/user/userPwdAction.do?user.id=${id}">初始化密码</a>
			</s:if>
			<s:else> --------------</s:else>
		</td>
	  </tr>
	  </s:iterator>
	</table>
	<div align="right">
		<s:property value="page.pageBar" escape="false"/>
		<s:hidden name="page.pageIndex"/>
	</div>
	<div align="center">
	<input name="btnAdd" type="button" id="btnAdd" class="button_tt" value="新 增" onClick="doAdd(this.form);">
	</div>
	</form>
	</div>
</div>
<br>
<br>
</body>
</html>