<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<html>
<head>
<title>行政区列表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
function doAdd(form){
	form.action="<%=path%>/region/CityRegionEdit.do";
	form.submit();
}

function submitForm(form){
    var pid= form["subCityRegion.parentId.id"].value;
	var number= form["subCityRegion.code"].value;
	var name= form["subCityRegion.name"].value; 
	if (pid==null||pid==""){
	    alert("请选择所属行政区！");
	    return;
	}
	if(number==null || number==""){
		alert("行政区编码不能为空，请输入！");
		form["subCityRegion.code"].focus();
		return;
	}
	else if(name==null || name==""){
		alert("行政区名称不能为空，请输入！");
		form["subCityRegion.name"].focus();
		return;
	}
	form.action="<%=path%>/region/saveAction.do";
	form.submit();
}

function deleteRegion(id){
         if(confirm("是否确定删除")){
            window.location.href="<%=path%>/region/deleteRegionListAction.do?id="+id;
            //window.parent.itemTree.location.reload();         
         }
}

function doDelete(form,id){
	if(hasSelectItem(form,id))
	{
	    
		if(confirm("确认要删除已选择的记录吗？"))
		{
			form.action="<%=path%>/basedata/deleteRegionListAction.do";
			form.submit();
		}
	}
	else
	{
		alert("请选择要删除的记录！");
	}
}

function editRegion(id,parentId){
    window.location.href="<%=path%>/region/editSubRegionAction.do?id="+id+"&pid="+parentId;
}
</script>
</head>
<body>
<div class="history-item">
  <s:if test="%{editable==false}">
    <div class="title">为<b><s:property value="cityRegions.name"/></b>新增行政区</div>
  </s:if>
  <s:else>
    <div class="title">为<b><s:property value="cityRegions.name"/></b>编辑行政区</div>
  </s:else>
	<div class="history-item-content">
	<form name="basedataedit" method="post" action="">

	<input name="subCityRegion.parentId.id" type="hidden" value="<s:property value='CityRegions.id'/>">
	<s:hidden name="subCityRegion.id"></s:hidden>
	<!--<s:hidden name="region.id" />
	<s:hidden name="subRegion.parentId.id" />-->
	<table class="formTable">
	  <tr>
		<td class="label">行政区编码：</td>
		<td><input name="subCityRegion.code" type="text" value="<s:property value='subCityRegion.code'/>" class="text" maxlength="20"></td>
	  </tr>
	  <tr>
		<td class="label">行政区名称：</td>
		<td><input name="subCityRegion.name" type="text" value="<s:property value='subCityRegion.name'/>" class="text" maxlength="15"></td>
	  </tr>
	</table>
	<div align="center">
	<input type="button" value="提 交" class="button_tt" onClick="submitForm(this.form);"/>
	</div>
	</form>
	</div>
  	<div class="title"><b><s:property value="cityRegions.name"/></b>行政区列表</div>
	<div class="history-item-content">
	<form name="userList" method="post" action="">
		<table width="100%" border="0" cellspacing="1" cellpadding="1" class="listTable">
		  <tr class="header">
			<td>行政区编码</td>
			<td>行政区名称</td>
			<td>操作</td>
		  </tr>
		  <s:iterator value="cityRegionsList" var="region">
		  <tr>
			<td>&nbsp;<s:property value="#region.code"/></td>
			<td>&nbsp;<s:property value="#region.name"/></td>
			<td align="center"><!-- <a href="javascript:deleteRegion('<s:property value='#region.id'/>');" >删除</a> -->
			    <a href="javascript:editRegion('<s:property value='#region.id'/>','<s:property value='#region.parentId.id'/>');">编辑</a>
			</td>
		  </tr>
		  </s:iterator>
		</table>
	</form>
	</div>
</div>
</body>
</html>