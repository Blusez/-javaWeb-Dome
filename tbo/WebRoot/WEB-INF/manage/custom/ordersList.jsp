<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../common/common.jsp" %>
<html>
  <head>
    <title>订单</title>  
	<script type="text/javascript">
       function deleteOrder(id){
         if(confirm("是否确定删除")){
            window.location.href="<%=path%>/order/deleteOrderAction.do?id="+id;
            return;
         }
       }
       
        function editOrder(id){
            window.location.href="<%=path%>/order/editOrderAction.do?id="+id;
          }  
          
    function submitForm(form){
	var orderNo= form["order.orderNo"].value;
	var count= form["order.count"].value;
	var placeOrder= form["order.placeOrder"].value;
	var placeOrderTime= form["order.placeOrderTime"].value;
	var confirmer= form["order.confirmer"].value;
	var confirmTime= form["order.confirmTime"].value;
	var status= form["order.status"].value;
	if(orderNo==null || orderNo==""){
		alert("订单编号不能为空，请输入！");
		form["order.orderNo"].focus();
		return;
	}else if(count==null || count==""){
		alert("订单总数不能为空，请输入！");
		form["order.count"].focus();
		return;
	}else if(placeOrder==null || placeOrder==""){
		alert("下单人不能为空，请输入！");
		form["order.placeOrder"].focus();
		return;
	}else if(placeOrderTime==null || placeOrderTime==""){
		alert("下单时间不能为空，请输入！");
		form["order.placeOrderTime"].focus();
		return;
	}else if(confirmer==null || confirmer==""){
		alert("确认人不能为空，请输入！");
		form["order.confirmer"].focus();
		return;
	}else if(confirmTime==null || confirmTime==""){
		alert("确认时间不能为空，请输入！");
		form["order.confirmTime"].focus();
		return;
	}else if(status==null || status==""){
		alert("状态不能为空，请输入！");
		form["order.status"].focus();
		return;
	}
	
	form.action="<%=path%>/order/saveAction.do"; 
	form.submit();
} 
    </script>
    
	</head>

	<body>
	<div class="history-item">
		<div class="title">
			<s:if test="editable">
				<div>修改<b><s:property value="order.name"/></b>订单&nbsp;&nbsp;<font color="red">(*为必填项)</font><span style="position:absolute;left:190px;width:500px"><font color='red'><s:property value="errorMessage"/></font></span></div>
  			</s:if>
		    <s:else>
		       <div>新增订单&nbsp;&nbsp;<font color="red">(*为必填项)</font><span style="position:absolute;left:190px;width:500px"><font color='red'><s:property value="errorMessage"/></font></span></div>
		    </s:else>
		    
         </div>
         <div class="history-item-content">
			<form action="" name="Frm" method="post" theme="simple">
					<table class="formTable" border="1">
						<tr>
							<td class="label">
								订单编号&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="order.orderNo" type="text"  value="<s:property value='order.orderNo'/>" >
							</td>
							<td class="label">
								合计&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="order.count" type="text" value="<s:property value='order.count'/>">
							</td>
						</tr>
						<tr>
							<td class="label">
								下单人&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="order.placeOrder" type="text"  value="<s:property value='order.placeOrder'/>" >
							</td>
							<td class="label">
								下单时间&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="order.placeOrderTime" type="text" value="<s:property value='order.placeOrderTime'/>">
							</td>
						</tr>
						<tr>
							<td class="label">
								确认人&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="order.confirmer" type="text"  value="<s:property value='order.confirmer'/>" >
							</td>
							<td class="label">
								确认时间&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="order.confirmTime" type="text" value="<s:property value='order.confirmTime'/>">
							</td>
						</tr>
						<tr>
							<td class="label">
								状态&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td>
								<input name="order.status" type="text" value="<s:property value='order.status'/>">
								<input name="order.id" type="hidden" value="<s:property value='order.id'/>">
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
				订单列表
			</div>
			<div class="history-item-content">

				<table class="listTable">
					<tr  align="left"  class="header">
						<td align="center">
							订单编号
						</td>
						<td align="center">
							合计
						</td>
						<td align="center">
							下单人
						</td>
						<td align="center">
							下单时间
						</td>
						<td align="center">
							确认人
						</td>
						<td align="center">
							确认时间
						</td>
						<td align="center">
							状态
						</td>
						<td align="center">
							操作
						</td>
					</tr>
             <s:iterator value="orderList" var="order">
         <tr>
	         <td><s:property value="#order.orderNo"/></td>
    	     <td><s:property value="#order.count"/></td>
    	     <td><s:property value="#order.placeOrder"/></td>
    	     <td><s:property value="#order.placeOrderTime"/></td>
    	     <td><s:property value="#order.confirmer"/></td>
    	     <td><s:property value="#order.confirmTime"/></td>
    	     <td><s:property value="#order.status"/></td>
    	     <td align="center">
    	      <a href="javascript:deleteOrder('<s:property value='#order.id'/>','');"  >删除</a> 
    	     <a href="javascript:editOrder('<s:property value='#order.id'/>','');">编辑</a>
    	     </td>
         </tr>
        </s:iterator>
	</table>
			</div>
			 <br><br>
			 <script type="text/javascript">
	var validate = new LiveValidation("order.orderNo"); 
    validate.add( Validate.Length, { maximum: 20 } );
    validate = new LiveValidation("order.count"); 
    validate.add( Validate.Length, { maximum: 10 } );
    validate = new LiveValidation("order.confirmer"); 
    validate.add( Validate.Length, { maximum: 40 } );
    validate = new LiveValidation("order.status");
	//validate.add(Validate.Exclusion, {within: [ '-1','0',''] ,failureMessage:""});
</script>
	
	</body>
</html>