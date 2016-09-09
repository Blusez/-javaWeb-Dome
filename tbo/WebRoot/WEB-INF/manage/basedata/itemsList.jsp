<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../common/common.jsp" %>
<html>
  <head>
    <title>栏目行业</title>  
	<script type="text/javascript">
       function deletebaseCode(id,pid){
         if(confirm("是否确定删除")){
            parent.frames["itemframe"].location.href="<%=path%>/tree/deleteItemListAction.do?id="+id+"&pid="+pid;
            parent.frames["itemTree"].location.href="<%=path %>/tree/getItemsTreeAction.do";
         }
         
       }
       
        function editbaseCode(id,pid){
            parent.frames["itemframe"].location.href="<%=path%>/tree/editSubItemAction.do?id="+id+"&pid="+pid;
            parent.frames["itemTree"].location.href="<%=path %>/tree/getItemsTreeAction.do";
          }  
          
    function submitForm(form){
	var itemCode= form["subItem.code"].value;
	var itemName= form["subItem.itemName"].value;
	var cityregion= form["subItem.cityRegionId.id"].value;
	var league= form["subItem.leagueId.id"].value;
	var parentId = form["subItem.parentId.id"].value;
	if(parentId==null || parentId==""){
		alert("请在左边树中选择一个栏目！");
		return ;
	}
	if(itemName==null || itemName==""){
		alert("栏目名称不能为空，请输入！");
		form["subItem.itemName"].focus();
		return;
	}else if(itemCode==null || itemCode==""){
		alert("栏目编码不能为空，请输入！");
		form["subItem.code"].focus();
		return;
	}else if(cityregion==null || cityregion==""){
		alert("请选择所属行政区域");
		return;
	}else if(league==null || league==""){
		alert("请选择所属联合会");
		return;
	}
	
	form.action="<%=path%>/tree/saveAction.do"; 
	form.submit();
	window.parent.itemTree.location.reload(); 
} 
    </script>
    
	</head>

	<body>
	<div class="history-item">
		<div class="history-item-title">
			<s:if test="editable">
				<div>修改<b><s:property value="subItem.itemName"/></b>栏目&nbsp;&nbsp;<font color="red">(*为必填项)</font></div>
  			</s:if>
		    <s:else>
		       <div>为<b><s:property value="items.itemName"/></b>新增栏目&nbsp;&nbsp;<font color="red">(*为必填项)</font></div>
		    </s:else>
         </div>
         <div class="history-item-content">
			<form action="" name="Frm" method="post">
					<table border="0" cellspacing="1" cellpadding="1" class="formTable">
						<tr>
							<td class="label">
								栏目名称&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="subItem.itemName" type="text" class="text" value="<s:property value='subItem.itemName'/>" maxlength="30">
							</td>
							<td class="label">
								栏目编码&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="subItem.code" type="text" value="<s:property value='subItem.code'/>" class="text" maxlength="20">
							</td>
							<td class="label">
								简称
							</td>
							<td class="text">
								<input name="subItem.shortName" type="text" value="<s:property value='subItem.shortName'/>" class="text" maxlength="15">
							</td>
						</tr>
						<tr>
							<td class="label">
								url
							</td>
							<td class="text">
								<input name="subItem.url" type="text" value="<s:property value='subItem.url'/>" class="text" maxlength="100">
							</td>
							<td class="label">
								图标文件
							</td>
							<td class="text">
								<input name="subItem.imageFile" type="text" value="<s:property value='subItem.imageFile'/>" class="text" maxlength="100">
							</td>
							<td class="label">
								备注
							</td>
							<td class="text">
								<input name="subItem.comments" type="text" value="<s:property value='subItem.comments'/>" class="text" maxlength="100">
							</td>
						</tr>
						
						<tr>
							<td class="label">
								所属区域&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<s:if test="editable">
									<s:select list="cityRegionList" listKey="id" listValue="name" name="subItem.cityRegionId.id" headerKey="" headerValue="" theme="simple"></s:select>
								</s:if>
								<s:else>
								<s:select list="cityRegionList" listKey="id" listValue="name" name="subItem.cityRegionId.id" headerKey="" headerValue="--请选择--" theme="simple"></s:select>
								</s:else>
							</td>
							<td class="label">
								所属网站&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td colspan="3" class="text">
								<s:if test="editable">
									<s:select list="leagueList" listKey="id" listValue="name" name="subItem.leagueId.id" headerKey="" headerValue="" theme="simple"></s:select>
								</s:if>
								<s:else>
									<s:select list="leagueList" listKey="id" listValue="name" name="subItem.leagueId.id" headerKey="" headerValue="--请选择--" theme="simple"></s:select>
								</s:else>
							</td>
						</tr>
						 
						<s:if test="editable">
							<input name="subItem.parentId.id" type="hidden" value="<s:property value='subItem.parentId.id'/>">
						</s:if>
						<s:else>
							<input name="subItem.parentId.id" type="hidden" value="<s:property value='items.id'/>">
						</s:else>
						
						<input name="subItem.id" type="hidden" value="<s:property value='subItem.id'/>">
						<tr>
							<td colspan="6" align="center">
							<input type="button" value="提交" class="button_tt" onClick="submitForm(this.form);">
						  
						    </td>
					   </tr>
					</table>
				</form>
				</div>
			</div>
			<div class="title">
				子栏目列表<span style="position:absolute;left:190px;width:500px"><font id="waiting" color='red'>
				<s:if test="errorMessage=='hasdata'">此栏目有新闻内容或者有子栏目，无法删除！</s:if>
				<s:if test="errorMessage=='error'">删除失败！</s:if>
				<s:if test="errorMessage=='deleted'">删除成功！</s:if>
				<s:if test="errorMessage=='queryfail'">查询出错，栏目已经删除！</s:if></font></span>
			</div>
			<div class="history-item-content">

				<table class="listTable">
					<tr  align="left"  class="header">
						<td align="center">
							栏目名称
						</td>
						<td align="center">
							栏目编码
						</td>
						<td align="center">
							简称
						</td>
						<td align="center">
							url
						</td>
						<td align="center">
							图标文件
						</td>
						<td align="center">
							备注
						</td>
						<td align="center">
							所属行政区域
						</td>
						<td align="center">
							所属联合会
						</td>
						<td align="center">
							操作
						</td>
					</tr>
             <s:iterator value="subItemList" var="subItem">
         <tr>
	         <td><s:property value="#subItem.itemName"/></td>
    	     <td><s:property value="#subItem.code"/></td>
    	     <td><s:property value="#subItem.shortName"/></td>
    	     <td><s:property value="#subItem.url"/></td>
    	     <td><s:property value="#subItem.imageFile"/></td>
    	     <td><s:property value="#subItem.comments"/></td>
    	     <td><s:property value="#subItem.cityRegionId.name"/></td>
    	     <td><s:property value="#subItem.leagueId.name"/></td>
    	     <td align="center"> <a href="javascript:deletebaseCode('<s:property value='#subItem.id'/>','<s:property value='#subItem.parentId.id'/>');"  >删除</a> 
    	     <a href="javascript:editbaseCode('<s:property value='#subItem.id'/>','<s:property value='#subItem.parentId.id'/>');">编辑</a>
    	     </td>
         </tr>
        </s:iterator>
	</table>
			 <br><br>
	<script type="text/javascript">
	var validate = new LiveValidation("subItem.itemName"); 
    validate.add( Validate.Length, { maximum: 30 } );
    validate = new LiveValidation("subItem.code"); 
    validate.add( Validate.Length, { maximum: 20 } );
    validate = new LiveValidation("subItem.shortName"); 
    validate.add( Validate.Length, { maximum: 15 } );
  
</script>
	</body>
</html>