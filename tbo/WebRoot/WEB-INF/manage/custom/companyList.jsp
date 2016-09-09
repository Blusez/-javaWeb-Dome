<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../common/common.jsp" %>
<html>
  <head>
    <title>厂家列表</title>  
	<script type="text/javascript">
       function deletecompany(id){
         if(confirm("是否确定删除")){
            window.location.href="<%=path%>/company/deleteCompanyAction.do?id="+id;
            return;
         }
       }
       
        function editcompany(id){
            window.location.href="<%=path%>/company/editCompanyAction.do?id="+id;
          }  
          
    function submitForm(form){
	var companyName= form["company.companyName"].value;
	var contactName= form["company.contactName"].value;
	var email= form["company.email"].value;
	var phone= form["company.phone"].value;
	var mobile= form["company.mobile"].value;
	var qq= form["company.qq"].value;
	var address= form["company.address"].value;
	var sortNum= form["company.sortNum"].value;
	var isTop= form["company.isTop"].value;
	if(companyName==null || companyName==""){
		alert("厂家名称不能为空，请输入！");
		form["company.companyName"].focus();
		return;
	}else if(contactName==null || contactName==""){
		alert("联系人不能为空，请输入！");
		form["company.contactName"].focus();
		return;
	}else if(email==null || email==""){
		alert("邮箱不能为空，请输入！");
		form["company.email"].focus();
		return;
	}else if(phone==null || phone==""){
		alert("固定电话不能为空，请输入！");
		form["company.phone"].focus();
		return;
	}else if(mobile==null || mobile==""){
		alert("手机号不能为空，请输入！");
		form["company.mobile"].focus();
		return;
	}else if(qq==null || qq==""){
		alert("QQ不能为空，请输入！");
		form["company.qq"].focus();
		return;
	}else if(address==null || address==""){
		alert("地址不能为空，请输入！");
		form["company.address"].focus();
		return;
	}else if(sortNum==null || sortNum==""){
		alert("排序号不能为空，请输入！");
		form["company.sortNum"].focus();
		return;
	}else if(isTop==null || isTop==""){
		alert("是否置顶不能为空，请输入！");
		form["company.isTop"].focus();
		return;
	}
	
	form.action="<%=path%>/company/saveAction.do"; 
	form.submit();
} 
    </script>
    
	</head>

	<body>
	<div class="history-item">
		<div class="title">
			<s:if test="editable">
				<div>修改<b><s:property value="company.name"/></b>厂家&nbsp;&nbsp;<font color="red">(*为必填项)</font><span style="position:absolute;left:190px;width:500px"><font color='red'><s:property value="errorMessage"/></font></span></div>
  			</s:if>
		    <s:else>
		       <div>新增厂家&nbsp;&nbsp;<font color="red">(*为必填项)</font><span style="position:absolute;left:190px;width:500px"><font color='red'><s:property value="errorMessage"/></font></span></div>
		    </s:else>
		    
         </div>
         <div class="history-item-content">
			<form action="" name="Frm" method="post" theme="simple">
					<table class="formTable" border="1">
						<tr>
							<td class="label">
								厂名&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="company.companyName" type="text"  value="<s:property value='company.companyName'/>" >
							</td>
							<td class="label">
								联系人&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="company.contactName" type="text" value="<s:property value='company.contactName'/>">
							</td>
							<td class="label">
								邮箱&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="company.email" type="text" value="<s:property value='company.email'/>">
							</td>
						</tr>
						<tr>
							<td class="label">
								固定电话&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="company.phone" type="text"  value="<s:property value='company.phone'/>" >
							</td>
							<td class="label">
								移动电话&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="company.mobile" type="text" value="<s:property value='company.mobile'/>">
							</td>
							<td class="label">
								QQ&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="company.qq" type="text" value="<s:property value='company.qq'/>">
							</td>
						</tr>
						<tr>
							<td class="label">
								地址&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="company.address" type="text"  value="<s:property value='company.address'/>" >
							</td>
							<td class="label">
								排序号&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="company.sortNum" type="text" value="<s:property value='company.sortNum'/>">
							</td>
							<td class="label">
								置顶&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="company.isTop" type="text" value="<s:property value='company.isTop'/>">
							</td>
						</tr>
						<tr>
							<td class="label">
								厂家图标&nbsp;&nbsp;
							</td>
							<td class="text">
								<input name="company.logoUrl" type="text" value="<s:property value='company.logoUrl'/>">
							</td>
							<td class="label">
								点击数&nbsp;&nbsp;
							</td>
							<td class="text">
								<input name="company.clickCount" type="text" value="<s:property value='company.clickCount'/>">
							</td>
							<td>
								<input name="company.id" type="hidden" value="<s:property value='company.id'/>">
							</td>
						</tr>
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
				厂家列表
			</div>
			<div class="history-item-content">

				<table class="listTable">
					<tr  align="left"  class="header">
						<td align="center">
							厂标
						</td>
						<td align="center">
							厂名
						</td>
						<td align="center">
							联系人
						</td>
						<td align="center">
							邮件
						</td>
						<td align="center">
							固话
						</td>
						<td align="center">
							手机
						</td>
						<td align="center">
							QQ
						</td>
						<td align="center">
							地址
						</td>
						<td align="center">
							排序
						</td>
						<td align="center">
							置顶
						</td>
						<td align="center">
							点击数
						</td>
						<td align="center">
							操作
						</td>
					</tr>
             <s:iterator value="companies" var="company">
         <tr>
	         <td><s:property value="#company.logoUrl"/></td>
    	     <td><s:property value="#company.companyName"/></td>
    	     <td><s:property value="#company.contactName"/></td>
    	     <td><s:property value="#company.email"/></td>
    	     <td><s:property value="#company.phone"/></td>
    	     <td><s:property value="#company.mobile"/></td>
    	     <td><s:property value="#company.qq"/></td>
    	     <td><s:property value="#company.address"/></td>
    	     <td><s:property value="#company.sortNum"/></td>
    	     <td><s:property value="#company.isTop"/></td>
    	     <td><s:property value="#company.clickCount"/></td>
    	     
    	     
    	     <td align="center">
    	      <a href="javascript:deletecompany('<s:property value='#company.id'/>','');"  >删除</a> 
    	     <a href="javascript:editcompany('<s:property value='#company.id'/>','');">编辑</a>
    	     </td>
         </tr>
        </s:iterator>
	</table>
			</div>
			 <br><br>
			 <script type="text/javascript">
	var validate = new LiveValidation("company.logoUrl"); 
    validate.add( Validate.Length, { maximum: 60 } );
    validate = new LiveValidation("company.companyName"); 
    validate.add( Validate.Length, { maximum: 30 } );
    validate = new LiveValidation("company.phone"); 
    validate.add( Validate.Length, { maximum: 11 } );
    validate = new LiveValidation("company.mobile"); 
    validate.add( Validate.Length, { maximum: 11 } );
    validate = new LiveValidation("company.qq"); 
    validate.add( Validate.Length, { maximum: 10 } );
    validate = new LiveValidation("company.address"); 
    validate.add( Validate.Length, { maximum: 60 } );
    validate = new LiveValidation("company.clickCount");
	//validate.add(Validate.Exclusion, {within: [ '-1','0',''] ,failureMessage:""});
</script>
	
	</body>
</html>