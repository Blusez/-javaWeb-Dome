<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../common/common.jsp" %>
<html>
  <head>
    <title>产品</title>  
	<script type="text/javascript">
       function deleteProduct(id){
         if(confirm("是否确定删除")){
            window.location.href="<%=path%>/product/deleteProductAction.do?id="+id;
            return;
         }
       }
       
        function editProduct(id){
            window.location.href="<%=path%>/product/editProductAction.do?id="+id;
          }  
          
    function submitForm(form){
	var productName= form["product.productName"].value;
	var category= form["product.category"].value;
	var companyId= form["product.companyId"].value;
	var length= form["product.length"].value;
	var width= form["product.width"].value;
	var heigth= form["product.heigth"].value;
	var thickess= form["product.thickess"].value;
	var price= form["product.price"].value;
	var imageUrl= form["product.imageUrl"].value;
	if(productName==null || productName==""){
		alert("名称不能为空，请输入！");
		form["product.productName"].focus();
		return;
	}else if(category==null || category==""){
		alert("编码不能为空，请输入！");
		form["product.category"].focus();
		return;
	}else if(companyId==null || companyId==""){
		alert("分类不能为空，请输入！");
		form["product.companyId"].focus();
		return;
	}else if(length==null || length==""){
		alert("分类不能为空，请输入！");
		form["product.length"].focus();
		return;
	}else if(heigth==null || heigth==""){
		alert("分类不能为空，请输入！");
		form["product.heigth"].focus();
		return;
	}else if(width==null || width==""){
		alert("分类不能为空，请输入！");
		form["product.width"].focus();
		return;
	}else if(thickess==null || thickess==""){
		alert("分类不能为空，请输入！");
		form["product.thickess"].focus();
		return;
	}else if(price==null || price==""){
		alert("分类不能为空，请输入！");
		form["product.price"].focus();
		return;
	}else if(imageUrl==null || imageUrl==""){
		alert("分类不能为空，请输入！");
		form["product.imageUrl"].focus();
		return;
	}
	
	form.action="<%=path%>/product/saveAction.do"; 
	form.submit();
} 
    </script>
    
	</head>

	<body>
	<div class="history-item">
		<div class="title">
			<s:if test="editable">
				<div>修改<b><s:property value="product.name"/></b>产品&nbsp;&nbsp;<font color="red">(*为必填项)</font><span style="position:absolute;left:190px;width:500px"><font color='red'><s:property value="errorMessage"/></font></span></div>
  			</s:if>
		    <s:else>
		       <div>添加产品&nbsp;&nbsp;<font color="red">(*为必填项)</font><span style="position:absolute;left:190px;width:500px"><font color='red'><s:property value="errorMessage"/></font></span></div>
		    </s:else>
		    
         </div>
         <div class="history-item-content">
			<form action="" name="Frm" method="post" theme="simple">
					<table class="formTable" border="1">
						<tr>
							<td class="label">
								产品名称&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="product.productName" type="text"  value="<s:property value='product.productName'/>" >
							</td>
							<td class="label">
								产品分类&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="product.category" type="text" value="<s:property value='product.category'/>">
							</td>
							<td class="label">
								所属厂家&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="product.companyId" type="text" value="<s:property value='product.companyId'/>">
							</td>
						</tr>
						<tr>
							<td class="label">
								长&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="product.length" type="text"  value="<s:property value='product.length'/>" >
							</td>
							<td class="label">
								宽&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="product.width" type="text" value="<s:property value='product.width'/>">
							</td>
							<td class="label">
								高&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="product.heigth" type="text" value="<s:property value='product.heigth'/>">
							</td>
						</tr>
						<tr>
							<td class="label">
								厚度&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="product.thickess" type="text" value="<s:property value='product.thickess'/>">
							</td>
							<td class="label">
								价格&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="product.price" type="text" value="<s:property value='product.price'/>">
							</td>
							<td class="label">
								产品样图&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td>
								<input name="product.imageUrl" type="text" value="<s:property value='product.imageUrl'/>">
								<input name="product.id" type="hidden" value="<s:property value='product.id'/>">
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
							产品名称
						</td>
						<td align="center">
							样图
						</td>
						<td align="center">
							产品分类
						</td>
						<td align="center">
							产品厂家
						</td>
						<td align="center">
							长
						</td>
						<td align="center">
							宽
						</td>
						<td align="center">
							高
						</td>
						<td align="center">
							厚度
						</td>
						<td align="center">
							价格
						</td>
						<td align="center">
							操作
						</td>
					</tr>
             <s:iterator value="productList" var="product">
         <tr>
	         <td><s:property value="#product.productName"/></td>
    	     <td><s:property value="#product.imageUrl"/></td>
    	     <td><s:property value="#product.category"/></td>
    	     <td><s:property value="#product.companyId"/></td>
    	     <td><s:property value="#product.length"/></td>
    	     <td><s:property value="#product.width"/></td>
    	     <td><s:property value="#product.heigth"/></td>
    	     <td><s:property value="#product.thickess"/></td>
    	     <td><s:property value="#product.price"/></td>
    	     
    	     <td align="center">
    	      <a href="javascript:deleteProduct('<s:property value='#product.id'/>','');"  >删除</a> 
    	     <a href="javascript:editProduct('<s:property value='#product.id'/>','');">编辑</a>
    	     </td>
         </tr>
        </s:iterator>
	</table>
			</div>
			 <br><br>
			 <script type="text/javascript">
	var validate = new LiveValidation("product.productName"); 
    validate.add( Validate.Length, { maximum: 40 } );
    validate = new LiveValidation("product.category"); 
    validate.add( Validate.Length, { maximum: 30 } );
   /*  validate = new LiveValidation("product.categroyType"); 
    validate.add( Validate.Length, { maximum: 60 } );
    validate = new LiveValidation("product.orderNum"); */
	//validate.add(Validate.Exclusion, {within: [ '-1','0',''] ,failureMessage:""});
</script>
	
	</body>
</html>