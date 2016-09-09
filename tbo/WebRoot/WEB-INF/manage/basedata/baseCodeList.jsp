<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../common/common.jsp" %>
<html>
  <head>
    <title>数据字典</title>  
	<script type="text/javascript">
       function deletebaseCode(id,categoryId){
         if(confirm("是否确定删除")){
            window.location.href="<%=path%>/baseData/deleteAction.do?id="+id+"&categoryId="+categoryId;
            return;
         }
       }
       
        function editbaseCode(id,categoryId){
            window.location.href="<%=path%>/baseData/baseCodeListAction.do?id="+id+"&categoryId="+categoryId;
          }  
          
    function submitForm(form){
		var categoryCode= form["baseCode.categoryCode"].value;
		var categoryName= form["baseCode.categoryName"].value;
		var orderNum= form["baseCode.orderNum"].value;
		if(categoryCode==null || categoryCode==""){
			alert("分类编码不能为空，请输入！");
			form["baseCode.categoryCode"].focus();
			return;
		}
		else if(categoryName==null || categoryName==""){
			alert("分类名称不能为空，请输入！");
			form["baseCode.categoryName"].focus();
			return;
		}
		else if(orderNum==null || orderNum==""){
			alert("序号不能为空，请输入！");
			form["baseCode.orderNum"].focus();
			return;
		}
		form.action="<%=path%>/baseData/saveAction.do";
		form.submit();
	} 
    </script>
    
	</head>

	<body>
	<div class="history-item">
			<s:if test="%{baseCode==null}">
	    		<div class="title">为<b><s:property value="baseDict.categoryName"/></b>新增数据字典</div>
  			</s:if>
		    <s:else>
		       <div class="title">修改<b><s:property value="baseDict.categoryName"/></b>数据字典</div>
		    </s:else>
         <div class="history-item-content">
			 <form action="" name="Frm" method="post" > 
			<input type="hidden" name="baseCode.categoryId" value="<s:property value='categoryId'/>">
			<s:hidden name="baseCode.id"></s:hidden>
					<table class="formTable" border="1">
						<tr>
							<td>
								分类编码
							</td>
							<td>
								<input name="baseCode.categoryCode" type="text" class="text" value="<s:property value='baseCode.categoryCode'/>" maxlength="6">
							</td>
							<td>
								分类名称
							</td>
							<td>
								<input name="baseCode.categoryName" type="text" value="<s:property value='baseCode.categoryName'/>" class="text" maxlength="30">
							</td>
							</tr>
							<tr>
							<td>
								序号
							</td>
							<td>
								<input name="baseCode.orderNum" type="text" value="<s:property value='baseCode.orderNum'/>" class="text" title="请填入数字">
								
							</td>
						<td colspan="2">
						
						</td>
						</tr>
						<tr>
						<td colspan="4" align="center">
						<input type="button" value="提交" class="button_tt" onClick="submitForm(this.form);">
					   <input type="reset" value="重置" class="button_tt">
					    </td>
					   </tr>
					</table>
				</form>
				</div>
			</div>
			<div class="title">
				<b><s:property value="baseDict.categoryName"/></b>数据字典列表
			</div>
			<div class="history-item-content">

				<table class="listTable">
					<tr  align="left"  class="header">
						<td align="center" width="100px">
							分类编码
						</td>
						<td align="center">
							分类名称
						</td>
						<td align="center">
							序号
						</td>
						<td align="center">
							操作
						</td>
					</tr>
             <s:iterator value="baseCodeList" var="b">
         <tr>
	         <td><s:property value="#b.categoryCode"/></td>
    	     <td><s:property value="#b.categoryName"/></td>
    	     <td><s:property value="#b.orderNum"/></td>
    	     <td align="center"><!-- <a href="javascript:deletebaseCode('<s:property value='#b.id'/>','<s:property value='#b.categoryId'/>');"  >删除</a> -->
    	     <a href="javascript:editbaseCode('<s:property value='#b.id'/>','<s:property value='#b.categoryId'/>');">编辑</a>
    	     </td>
         </tr>
        </s:iterator>
       
	</table>
			</div>
			 <br><br>
	
	</body>
</html>