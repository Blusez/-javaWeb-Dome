<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../common/common.jsp" %>
<html>
  <head>
    <title>行业</title>  
	<script type="text/javascript">
       function deletebaseCode(id,pid){
         if(confirm("是否确定删除")){
            window.location.href="<%=path%>/trade/deleteTradeAction.do?id="+id+"&pid="+pid;
            return;
         }
       }
       
        function editbaseCode(id,pid){
            window.location.href="<%=path%>/trade/editTradeAction.do?id="+id+"&pid="+pid;
          }  
          
    function submitForm(form){
	var tradename= form["trade.tradeName"].value;
	var tradecode= form["trade.code"].value;
	var tradecity= form["trade.cityRegionId.id"].value;
	var tradeleague= form["trade.leagueId.id"].value;
	var tradeitem= form["trade.itemId.id"].value;
	if(tradename==null || tradename==""){
		alert("行业名称不能为空，请输入！");
		form["trade.tradeName"].focus();
		return;
	}
	else if(tradecode==null || tradecode==""){
		alert("行业编码不能为空，请输入！");
		form["trade.code"].focus();
		return;
	}else if(tradecity==null || tradecity==""){
		alert("请选择所属行政区域");
		return;
	}else if(tradeleague==null || tradeleague==""){
		alert("请选择所属联合会");
		return;
	}else if(tradeitem==null || tradeitem==""){
		alert("请选择所属栏目");
		return;
	}
	
	form.action="<%=path%>/trade/saveAction.do"; 
	form.submit();
} 
    </script>
    
	</head>

	<body>
	<div class="history-item">
		<div class="title">
			<s:if test="editable">
				<div>修改<b><s:property value="trade.tradeName"/></b>行业&nbsp;&nbsp;<font color="red">(*为必填项)</font><span style="position:absolute;left:190px;width:500px"><font color='red'><s:property value="errorMessage"/></font></span></div>
  			</s:if>
		    <s:else>
		       <div>新增行业&nbsp;&nbsp;<font color="red">(*为必填项)</font><span style="position:absolute;left:190px;width:500px"><font color='red'><s:property value="errorMessage"/></font></span></div>
		    </s:else>
         </div>
         <div class="history-item-content">
			<form action="" name="Frm" method="post">
					<table border="0" cellspacing="1" cellpadding="1" class="formTable">
						<tr>
							<td class="label">
								行业名称&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="trade.tradeName" type="text"  value="<s:property value='trade.tradeName'/>" >
							</td>
							<td class="label">
								行业编码&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="trade.code" type="text" value="<s:property value='trade.code'/>"  >
							</td>
							<td class="label">
								简称
							</td>
							<td class="text">
								<input name="trade.shortName" type="text" value="<s:property value='trade.shortName'/>">
							</td>
						</tr>
						<tr>
							<td class="label">
								url
							</td>
							<td class="text">
								<input name="trade.url" type="text" value="<s:property value='trade.url'/>" maxlength="100">
							</td>
							<td class="label">
								图标文件
							</td>
							<td class="text">
								<input name="trade.imageFile" type="text" value="<s:property value='trade.imageFile'/>" maxlength="100">
							</td>
							<td class="label">
								备注
							</td>
							<td class="text">
								<input name="trade.comments" type="text" value="<s:property value='trade.comments'/>" class="text" maxlength="100">
							</td>
						</tr>
						<tr>
							<td class="label">
								所属行政区域&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td>
								<s:if test="editable">
									<s:select list="cityRegionList" listKey="id" listValue="name" name="trade.cityRegionId.id" headerKey="" headerValue="" theme="simple"></s:select>
								</s:if>
								<s:else>
									<s:select list="cityRegionList" listKey="id" listValue="name" name="trade.cityRegionId.id" headerKey="" headerValue="--请选择--" theme="simple"></s:select>
								</s:else>
							</td>
							<td class="label">
								所属联合会&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<s:if test="editable">
									<s:select list="leagueList" listKey="id" listValue="name" name="trade.leagueId.id" headerKey="" headerValue="" theme="simple"></s:select>
								</s:if>
								<s:else>
								<s:select list="leagueList" listKey="id" listValue="name" name="trade.leagueId.id" headerKey="" headerValue="--请选择--" theme="simple"></s:select>
								</s:else>
							</td>
							<td class="label">
								所属栏目&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<s:if test="editable">
									<s:select list="itemList" name="trade.itemId.id" listKey="id" listValue="itemName" headerKey="" headerValue="" theme="simple"></s:select>
								</s:if>
								<s:else>
									<s:select list="itemList" name="trade.itemId.id" listKey="id" listValue="itemName" headerKey="" headerValue="--请选择--" theme="simple"></s:select>
								</s:else>
							</td>
						</tr>
						
						<!--  
						
						-->
			            <input name="trade.id" type="hidden" value="<s:property value='trade.id'/>">
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
				行业列表
			</div>
			<div class="history-item-content">

				<table class="listTable">
					<tr  align="left"  class="header">
						<td align="center">
							行业名称
						</td>
						<td align="center">
							行业编码
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
							所属栏目
						</td>
						<td align="center">
							操作
						</td>
					</tr>
             <s:iterator value="tradeList" var="trade">
         <tr>
	         <td><s:property value="#trade.tradeName"/></td>
    	     <td><s:property value="#trade.code"/></td>
    	     <td><s:property value="#trade.shortName"/></td>
    	     <td><s:property value="#trade.url"/></td>
    	     <td><s:property value="#trade.imageFile"/></td>
    	     <td><s:property value="#trade.comments"/></td>
    	     <td><s:property value="#trade.cityRegionId.name"/></td>
    	     <td><s:property value="#trade.leagueId.name"/></td>
    	     <td><s:property value="#trade.itemId.itemName"/></td>
    	     <td align="center">
    	     <!-- <a href="javascript:deletebaseCode('<s:property value='#trade.id'/>','<s:property value='#subItem.parentId.id'/>');"  >删除</a> -->
    	     <a href="javascript:editbaseCode('<s:property value='#trade.id'/>','<s:property value='#subItem.parentId.id'/>');">编辑</a>
    	     </td>
         </tr>
        </s:iterator>
	</table>
			</div>
			 <br><br>
	 <script type="text/javascript">
	var validate = new LiveValidation("trade.tradeName"); 
    validate.add( Validate.Length, { maximum: 30 } );
    validate = new LiveValidation("trade.code"); 
    validate.add( Validate.Length, { maximum: 10 } );
    validate = new LiveValidation("trade.shortName"); 
    validate.add( Validate.Length, { maximum: 15 } );
  
</script>
	</body>
</html>