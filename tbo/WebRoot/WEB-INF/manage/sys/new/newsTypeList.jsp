<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../../common/common.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>新闻分类</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
       function deletebaseCode(id,pid){
         if(confirm("是否确定删除")){
            window.location.href="<%=path%>/newstype/deleteNewsTypeAction.do?id="+id+"&pid="+pid;
            return;
         }
       }
       
        function editbaseCode(id,pid){
            window.location.href="<%=path%>/newstype/editNewsTypeAction.do?id="+id+"&pid="+pid;
          }  
          
    function submitForm(form){
	var newstypename= form["newsType.name"].value;
	var newstypecode= form["newsType.code"].value;

	if(newstypename==null || newstypename==""){
		alert("分类名称不能为空，请输入！");
		form["newsType.name"].focus();
		return;
	}
	else if(newstypecode==null || newstypecode==""){
		alert("分类编码不能为空，请输入！");
		form["newsType.code"].focus();
		return;
	}
	
	form.action="<%=path%>/newstype/saveAction.do"; 
	form.submit();
} 
    </script>
	</head>

	<body>
		<div class="history-item">
			<div class="title">
			<s:if test="editable">
				<div>修改<b><s:property value="newsType.name"/></b>分类&nbsp;&nbsp;<font color="red">(*为必填项)</font></div>
  			</s:if>
		    <s:else>
		       <div>新增新闻分类&nbsp;&nbsp;<font color="red">(*为必填项)</font></div>
		    </s:else>
         </div>
			<div class="history-item-content">
			<form action="" name="Frm" method="post">
					<table border="0" cellspacing="1" cellpadding="1" class="formTable">
						<tr>
							<td class="label">
								名称&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="newsType.id" type="hidden"  value="<s:property value='newsType.id'/>" >
								<input name="newsType.name" type="text"  value="<s:property value='newsType.name'/>" >
							</td>
							<td class="label">
								编码&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="newsType.code" type="text"  value="<s:property value='newsType.code'/>" >
							</td>
							<td class="label">
								分类
							</td>
							<td class="text">
								<input name="newsType.type" type="text"  value="<s:property value='newsType.type'/>" >
							</td>
						</tr>
						
						<tr>
							<td colspan="6" align="center">
							<input type="button" value="提交" class="button_tt" onClick="submitForm(this.form);">
					
						    </td>
						 </tr>
					</table>
				</form>
				<div class="title">
					新闻分类列表<span style="position:absolute;left:190px;width:500px"><font id="waiting" color='red'>
				<s:property value="errorMessage"/></font></span>
				</div>
				<div class="history-item-content">
				
					<table class="listTable">
						<tr align="left" class="header">
							<td align="center">
								序号
							</td>
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
								操作
							</td>
						</tr>
						<s:iterator value="newsTypeList" var="newsType" status="id">
								<tr>
									<td>
										<s:property value="#id.index+1" />
									</td>
									<td>
										<s:property value="#newsType.name" />
									</td>
									<td>
										<s:property value="#newsType.code" />
									</td>
									<td>
										<s:property value="#newsType.type" />
									</td>
									
									<td align="center"><!-- <a href="javascript:deletebaseCode('<s:property value='#newsType.id'/>','');"  >删除</a> -->
						    	     	<a href="javascript:editbaseCode('<s:property value='#newsType.id'/>','');">编辑</a>
						    	     </td>
								</tr>
						</s:iterator>
					</table>
				
				</div>
				</div>
				<script type="text/javascript">
	var validate = new LiveValidation("newsType.name"); 
    validate.add( Validate.Length, { maximum: 60 } );
    validate = new LiveValidation("newsType.code"); 
    validate.add( Validate.Length, { maximum: 20 } );
     validate = new LiveValidation("newsType.type"); 
    validate.add( Validate.Length, { maximum: 20 } );
   
  
</script>
	</body>
</html>
