<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/common.jsp" %>

<html>
<head>
<title>登录日志列表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
function submitForm(form){
	var c1=document.all["dateTime1"].value;
	var c2=document.all["dateTime2"].value;
	var c3=document.all["dateTime3"].value;
	var c4=document.all["dateTime4"].value;
	if(c1==""&&c2==""&&c3==""&&c4==""){
		document.forms["userList"]["page.pageIndex"].value=1;
		form.action="<%=path%>/log/queryLoginLogAction.do";
		return true;
	}else if(c1!=""&&c2==""){
	 alert("请填写完整的登录时间段！");
			return false;
	}else if(c1==""&&c2!=""){
	 alert("请填写完整的登录时间段！");
			return false;
	}else if(c3!=""&&c4==""){
	 alert("请填写完整的退出时间段！");
			return false;
	}else if(c3==""&&c4!=""){
	 alert("请填写完整的退出时间段！");
			return false;
	}else if(c1!="" && c2!=""){
		if(c1<=c2){
		document.forms["userList"]["page.pageIndex"].value=1;
		form.action="<%=path%>/log/queryLoginLogAction.do";
			return true;
		}else{
			alert("时间段有误！");
			return false;
		}
	}else if(c3!="" && c4!=""){
		if(c3<=c4){
		document.forms["userList"]["page.pageIndex"].value=1;
		form.action="<%=path%>/log/queryLoginLogAction.do";
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
   document.forms["loginLogList"].action="<%=path%>/log/queryLoginLogAction.do";
   document.forms["loginLogList"]["page.pageIndex"].value=currentPage;
   document.forms["loginLogList"].submit();
}

function doDel(form){
	if(hasSelectItem(form,'id')){
		form.action="<%=path%>/log/delLoginLogAction.do";
		if(! confirm("确定要删除这些登录日志？")){
	    	return;
	    }else{
	       form.submit();
	    }
    }else{
		alert("请选择要删除的登录日志！");
	}
}

function doDelAll(form){
	form.action="<%=path%>/log/delLoginLogAction.do?type=delAll";
	if(! confirm("确定要删除全部登录日志？")){
    	return;
    }else{
       form.submit();
    }
}
</script>
</head>
<body>
<div class="history-item">
  <div class="title">登录日志列表</div>
	<div class="history-item-content">
	<form name="loginLogList" method="post" action="" onsubmit="return submitForm(this);">
	<table class="formTable">
		<tr>
			<td class="label">账号：</td>
			<td colspan="3"><input id="loginLog.account" name="loginLog.account" type="text" value="<s:property value="loginLog.account"/>"/></td>
		</tr>
		<tr>
			<td class="label">所属行政区:</td>
			<td></td>
			<td class="label">所属联合会：</td>
			<td></td>
		</tr>
		<tr>
			<td class="label">登录时间：</td>
			<td colspan="3">
				从<input name="dateTime1" type="text" class="Wdate" onClick="WdatePicker()" value="<s:property value="dateTime1"/>">
				到<input name="dateTime2" type="text"  class="Wdate" onClick="WdatePicker()" value="<s:property value="dateTime2"/>">
			</td>
		</tr>
		<tr>
			<td class="label">退出时间：</td>
			<td colspan="3">
				从<input name="dateTime3" type="text" class="Wdate" onClick="WdatePicker()" value="<s:property value="dateTime3"/>">
				到<input name="dateTime4" type="text"  class="Wdate" onClick="WdatePicker()" value="<s:property value="dateTime4"/>">
			</td>
		</tr>
	</table>
	<div align="center">
	<input name="btnQuery" type="submit" id="btnQuery" class="button_tt" value="查询"/>
	<input name="btnReset" type="button" id="btnReset" class="button_tt" value="重置" onClick="doReset(this.form);"/>
	</div>
	<table width="100%" border="0" cellspacing="1" cellpadding="1" class="listTable">
	  <tr class="header">
	  	<td>选择</td>
		<td>序号</td>
		<td>账号</td>
		<td>登录时间</td>
		<td>退出时间</td>
		<td>所属行政区</td>
		<td>所属联合会</td>
	  </tr>
	  <s:iterator value="loginLogList" status="st">
	  <tr>
	  	<td width="10"><input type="checkbox" name="id" value="<s:property value='id'/>" class="checkbox"></td>
		<td width="10"><s:property value="#st.index+1"/></td>
		<td>&nbsp;<s:property value="account"/></td>
		<td>&nbsp;<s:date name="loginTime" format="yyyy-MM-dd HH:mm"/></td>
		<td>&nbsp;<s:date name="logoutTime" format="yyyy-MM-dd HH:mm"/></td>
		<td>&nbsp;<s:property value="region"/></td>
		<td>&nbsp;<s:property value="leagueName"/></td>
	  </tr>
	  </s:iterator>
	</table>
	<div align="right">
		<s:property value="page.pageBar" escape="false"/>
		<s:hidden name="page.pageIndex"/>
	</div>
	<div align="center">
	<input name="btnDel" type="button" id="btnDel" class="button_tt" value="删  除" onClick="doDel(this.form);">
	<s:if test="#session.user.account=='admin'">
		<input name="btnAllDel" type="button" id="btnAllDel" class="button_tt" value="清  空" onClick="doDelAll(this.form);">
	</s:if>
	</div>
	</form>
	</div>
</div>
<br>
<div id="errorMessage" align="center">
       		<font color='red'><s:property value="errorMessage"/></font>
</div>
<br>
</body>
</html>