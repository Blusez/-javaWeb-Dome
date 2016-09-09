<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../common/common.jsp" %>
<html>
  <head>
    <title>联合会</title>  
	<script type="text/javascript">
       function deletebaseCode(id,pid){
         if(confirm("是否确定删除")){
            window.location.href="<%=path%>/league/deleteLeagueAction.do?id="+id;
            return;
         }
       }
       
        function editbaseCode(id,pid){
            window.location.href="<%=path%>/league/editLeagueAction.do?id="+id;
          }  
          
    function submitForm(form){
	var leagueCode= form["league.code"].value;
	var leagueName= form["league.name"].value;
	var leagueRegion = form["league.cityRegionId.id"].value;
	if(leagueName==null || leagueName==""){
		alert("联合会名称不能为空，请输入！");
		form["league.name"].focus();
		return;
	}else if(leagueCode==null || leagueCode==""){
		alert("联合会编码不能为空，请输入！");
		form["league.code"].focus();
		return;
	}else if(leagueRegion==null || leagueRegion=="" || leagueRegion=="-1"){
		alert("请选择行政区！");
		return;
	}
	
	form.action="<%=path%>/league/saveAction.do"; 
	form.submit();
} 
    </script>
    
	</head>

	<body>
	<div class="history-item">
		<div class="title">
			<s:if test="editable">
				<div>修改<b><s:property value="league.name"/></b>联合会&nbsp;&nbsp;<font color="red">(*为必填项)</font><span style="position:absolute;left:190px;width:500px"><font color='red'><s:property value="errorMessage"/></font></span></div>
  			</s:if>
		    <s:else>
		       <div>新增联合会&nbsp;&nbsp;<font color="red">(*为必填项)</font><span style="position:absolute;left:190px;width:500px"><font color='red'><s:property value="errorMessage"/></font></span></div>
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
								<input name="league.name" type="text"  value="<s:property value='league.name'/>" >
							</td>
							<td class="label">
								编码&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td class="text">
								<input name="league.code" type="text" value="<s:property value='league.code'/>">
							</td>
							
							<td class="label">
								logo
							</td>
							<td class="text">
								<input name="league.logoFile" type="text" value="<s:property value='league.logoFile'/>">
							</td>
						</tr>
						<tr>
							<td class="label">
								简称
							</td>
							<td class="text">
								<input name="league.shortName" type="text" value="<s:property value='league.shortName'/>">
							</td>
							<td class="label">
								所属行政区域&nbsp;&nbsp;<font color="red">*</font>
							</td>
							<td>
								<s:if test="editable">
									<s:select list="cityRegionList" listKey="id" listValue="name" name="league.cityRegionId.id" headerKey="" headerValue="" theme="simple"></s:select>
								</s:if>
								<s:else>
								<s:select list="cityRegionList" listKey="id" listValue="name" name="league.cityRegionId.id" headerKey="-1" headerValue="--请选择--" theme="simple"></s:select>
								</s:else>
							</td>
							
							<td class="label">
								模板url
							</td>
							<td class="text">
								<input name="league.templateUrl" type="text" value="<s:property value='league.templateUrl'/>">
					
								<input name="league.id" type="hidden" value="<s:property value='league.id'/>">
							</td>
						</tr>
						<tr>
							<td>
								简介
							</td>
							<td colspan="6">
								<s:textarea cols="117" rows="1" name="league.contents" theme="simple"></s:textarea>
							</td>
						</tr>
						<tr>
							<td >
								备注
							</td>
							<td colspan="6">
								<input name="league.comments"  type="text" value="<s:property value='league.comments'/>" size=150 maxlength="100">
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
				联合会列表
			</div>
			<div class="history-item-content">

				<table class="listTable">
					<tr  align="left"  class="header">
						<td align="center">
							名称
						</td>
						<td align="center">
							简介
						</td>
						<td align="center">
							logo
						</td>
						<td align="center">
							简称
						</td>
						<td align="center">
							编码
						</td>
						<td align="center">
							所属行政区
						</td>
						<td align="center">
							模板url
						</td>
						<td align="center">
							备注
						</td>
						
						<td align="center">
							操作
						</td>
					</tr>
             <s:iterator value="leagueList" var="league">
         <tr>
	         <td><s:property value="#league.name"/></td>
    	     <td><s:property value="#league.contents"/></td>
    	     <td><s:property value="#league.logoFile"/></td>
    	     <td><s:property value="#league.shortName"/></td>
    	     <td><s:property value="#league.code"/></td>
    	     <td><s:property value="#league.cityRegionId.name"/></td>
    	     <td><s:property value="#league.templateUrl"/></td>
    	     <td><s:property value="#league.comments"/></td>
    	     
    	     <td align="center">
    	     <!-- <a href="javascript:deletebaseCode('<s:property value='#league.id'/>','');"  >删除</a> -->
    	     <a href="javascript:editbaseCode('<s:property value='#league.id'/>','');">编辑</a>
    	     </td>
         </tr>
        </s:iterator>
	</table>
			</div>
			 <br><br>
			 <script type="text/javascript">
	var validate = new LiveValidation("league.name"); 
    validate.add( Validate.Length, { maximum: 30 } );
    validate = new LiveValidation("league.code"); 
    validate.add( Validate.Length, { maximum: 10 } );
    validate = new LiveValidation("league.shortName"); 
    validate.add( Validate.Length, { maximum: 10 } );
    validate = new LiveValidation("league.cityRegionId.id");
	validate.add(Validate.Exclusion, {within: [ '-1','0',''] ,failureMessage:""});
</script>
	
	</body>
</html>