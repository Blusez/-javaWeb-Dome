<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../common/common.jsp" %>
<html>
  <head>
    <title>字典</title>  
	<script type="text/javascript">
       function deleteDict(id){
         if(confirm("是否确定删除")){
            window.location.href="<%=path%>/dict/deleteDictAction.do?id="+id;
            return;
         }
       }
       
        function editDict(id){
            window.location.href="<%=path%>/dict/editDictAction.do?id="+id;
          }  
          
    function submitForm(form){
	var code= form["dict.code"].value;
	var name= form["dict.name"].value;
	var categoryType= form["dict.categoryType"].value;
	if(name==null || name==""){
		alert("名称不能为空，请输入！");
		form["dict.name"].focus();
		return;
	}else if(code==null || code==""){
		alert("编码不能为空，请输入！");
		form["dict.code"].focus();
		return;
	}else if(categoryType==null || categoryType==""){
		alert("分类不能为空，请输入！");
		form["dict.categoryType"].focus();
		return;
	}
	
	form.action="<%=path%>/dict/saveAction.do"; 
	form.submit();
} 
    </script>
    
	</head>

	<body>
	<div class="history-item">
		<div class="title">
			<s:if test="editable">
				<div>修改<b><s:property value="dict.name"/></b>字典&nbsp;&nbsp;<font color="red">(*为必填项)</font><span style="position:absolute;left:190px;width:500px"><font color='red'><s:property value="errorMessage"/></font></span></div>
  			</s:if>
		    <s:else>
		       <div>新增字典&nbsp;&nbsp;<font color="red">(*为必填项)</font><span style="position:absolute;left:190px;width:500px"><font color='red'><s:property value="errorMessage"/></font></span></div>
		    </s:else>
		    
         </div>
         <div class="history-item-content">
			<form action="" name="Frm" method="post" theme="simple">
					<table class="formTable" border="1">
						<tr>
							<td class="label">
								名称&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="dict.name" type="text"  value="<s:property value='dict.name'/>" >
							</td>
							<td class="label">
								编码&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="dict.code" type="text" value="<s:property value='dict.code'/>">
							</td>
						</tr>
						<tr>
							<td class="label">
								分类<font color="red">*</font>
							</td>
							<td class="text">
								<input name="dict.categoryType" type="text" value="<s:property value='dict.categoryType'/>">
							</td>
							<td class="label">
								序号&nbsp;&nbsp;
							</td>
							<td>
								<input name="dict.orderNum" type="text" value="<s:property value='dict.orderNum'/>">
								<input name="dict.id" type="hidden" value="<s:property value='dict.id'/>">
							</td>
						</tr>
						<tr>
							<td colspan="4" align="center">
							<input type="button" value="提交" class="button_tt" onClick="submitForm(this.form);">
						  
						    </td>
					   </tr>
					</table>
				</form>
				</div>
			</div>
			<div class="title">
				字典列表
			</div>
			<div class="history-item-content">

				<table class="listTable">
					<tr  align="left"  class="header">
						<td align="center">
							名称
						</td>
						<td align="center">
							编码
						</td>
						<td align="center">
							分类
						</td>
						<td align="center">
							序号
						</td>
						<td align="center">
							操作
						</td>
					</tr>
             <s:iterator value="dictList" var="dict">
         <tr>
	         <td><s:property value="#dict.name"/></td>
    	     <td><s:property value="#dict.code"/></td>
    	     <td><s:property value="#dict.categoryType"/></td>
    	     <td><s:property value="#dict.orderNum"/></td>
    	     
    	     <td align="center">
    	      <a href="javascript:deleteDict('<s:property value='#dict.id'/>','');"  >删除</a> 
    	     <a href="javascript:editDict('<s:property value='#dict.id'/>','');">编辑</a>
    	     </td>
         </tr>
        </s:iterator>
	</table>
			</div>
			 <br><br>
			 <script type="text/javascript">
	var validate = new LiveValidation("dict.name"); 
    validate.add( Validate.Length, { maximum: 60 } );
    validate = new LiveValidation("dict.code"); 
    validate.add( Validate.Length, { maximum: 30 } );
    validate = new LiveValidation("dict.categroyType"); 
    validate.add( Validate.Length, { maximum: 60 } );
    validate = new LiveValidation("dict.orderNum");
	//validate.add(Validate.Exclusion, {within: [ '-1','0',''] ,failureMessage:""});
</script>
	
	</body>
</html>