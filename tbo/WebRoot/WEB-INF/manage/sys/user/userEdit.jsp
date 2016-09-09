<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/common.jsp" %>
<html>
<head>
<title></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="<%=pathSys%>/zTree/css/zTreeStyle.css" rel="stylesheet" type="text/css">
<script type='text/javascript' src='<%=path%>/web/js/jquery-1.6.min.js'></script>
<script type="text/javascript" src="<%=pathSys%>/zTree/js/jquery.ztree.core-3.3.js"></script>
<script type="text/javascript" src="<%=pathSys%>/artDialog/artDialog.js?skin=blue"></script>
<script type="text/javascript">
function submitForm(form){
	var cityVal=$("#userregionid").val();
	var userType=$("#userType").val();
	if(userType=='emp' &&(cityVal==null || cityVal=='')){
		art.dialog({title:'提示',content:'用户类型为普通用户，必须选择所属行政区！',ok:true});
		return false;
	}
	var age= form["user.age"].value;
	if(age==null || age==''){
		form["user.age"].value=0;
	}
	form.action="<%=path%>/user/userSaveAction.do";
	return true;
}

function doReturn(form){
	var formStr="page.pageIndex="+document.forms["editForm"]["page.pageIndex"].value;
	formStr +="&account="+document.forms["editForm"]["account"].value;
	formStr +="&name="+document.forms["editForm"]["name"].value;
	formStr +="&accountType="+document.forms["editForm"]["accountType"].value;
	formStr +="&status="+document.forms["editForm"]["status"].value;
	formStr +="&dateTime1="+document.forms["editForm"]["dateTime1"].value;
	formStr +="&dateTime2="+document.forms["editForm"]["dateTime2"].value;
	window.location.href="<%=path%>/user/queryAction.do?"+formStr;
}

		var setting = {
				async: {enable: true,url: getUrl},
				check: {enable: true},
				data: {simpleData: {enable: true}},
				view: {selectedMulti: false},
				callback: {beforeExpand: beforeExpand,onDblClick: zTreeOnDblClick,onAsyncSuccess: onAsyncSuccess,onAsyncError: onAsyncError}};
		var zNodes =[{ id:'7CA766E7-26E0-4FF5-B876-84DEA53F647B', pId:0, name:'河南',isParent:true}];

		function getUrl(treeId, treeNode) {
			var param = "id="+treeNode.id;
			return "<%=path%>/user/getCityAction.do?" + param;
		}
		function beforeExpand(treeId, treeNode) {
			if (!treeNode.isAjaxing) {
				ajaxGetNodes(treeNode, "refresh");
				return true;
			} else {
				alert("zTree 正在下载数据中，请稍后展开节点。。。");
				return false;
			}
		}
		function onAsyncSuccess(event, treeId, treeNode, msg) {
			if (!msg || msg.length == 0) {
				return;
			}
			var zTree = $.fn.zTree.getZTreeObj("tree");
			treeNode.icon = "";
			zTree.updateNode(treeNode);
			zTree.selectNode(treeNode.children[0]);
		}
		function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			alert("异步获取数据出现异常。");
			treeNode.icon = "";
			zTree.updateNode(treeNode);
		}
		function ajaxGetNodes(treeNode, reloadType) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			if (reloadType == "refresh") {
				treeNode.icon = "<%=pathSys%>/zTree/css/zTreeStyle/img/loading.gif";
				zTree.updateNode(treeNode);
			}
			zTree.reAsyncChildNodes(treeNode, reloadType, true);
		}
		function zTreeOnDblClick(event, treeId, treeNode){
			if(treeNode!=null && !treeNode.isParent){
				setCity(treeNode);
			}
		}
		var tempAlert=null;
		function selectCity(){
			if(tempAlert==null || tempAlert==''){
			tempAlert=art.dialog({title:'选择行政区',
						content: document.getElementById('tree'),
						width: 200,
	    				height: 220,
	    				resize:false,padding:'10px',									
						ok: function () {
							var treeObj = $.fn.zTree.getZTreeObj("tree");
							var nodes = treeObj.getSelectedNodes();
							if(nodes[0]!=null && !nodes[0].isParent){
								setCity(nodes[0]);
					        	return true;
							}else{								
								return false;
							}
					    },
					    cancel:function(){tempAlert=null;return true},
					    close:function(){tempAlert=null;return true}});
			}
		}
		function setCity(treeNode){
			if(treeNode!=null && treeNode!=''){
				$("#userregionid").val(treeNode.id);
				$("#userregionname").html("&nbsp;&nbsp;"+treeNode.name);
				tempAlert.close();
			}
		}
		$(document).ready(function(){
			$.fn.zTree.init($("#tree"), setting, zNodes);
		});
</script>
</head>
<body>
<div class="history-item">
  <div class="title">
  	<s:if test="user.id!=''">编辑</s:if><s:else>添加</s:else>用户信息
  </div>
  <div class="history-item-content">
	<form action="#" name="editForm" id="editForm" method="post" onsubmit="return submitForm(this);">
	<s:hidden id="page.pageIndex" name="page.pageIndex"/>
	<s:hidden id="account" name="account"/>
	<s:hidden id="name" name="name"/>
	<s:hidden id="accountType" name="accountType"/>
	<s:hidden id="status" name="status"/>
	<s:hidden id="dateTime1" name="dateTime1"/>
	<s:hidden id="dateTime2" name="dateTime2"/>
	<input id="user.id" name="user.id" type="hidden" value="<s:property value="user.id"/>"/>
	<table class="formTable">
	  <tr>
		<td class="label">用户账号：</td>
		<td>
			<s:if test="user.id!=''">
				<s:hidden name="user.account"/>
				<s:property value="user.account"/>
			</s:if>
			<s:else>
				<input id="user.account" name="user.account" type="text"/><font color=red>*</font>
			</s:else>
		</td>
	  	<td class="label">用户名称：</td>
		<td><input id="user.name" name="user.name" type="text" value="<s:property value="user.name"/>"/><font color=red>*</font></td>
	  </tr>
	  <tr>
		<td class="label">用户类型：</td>
		<td>
			<s:select list="uMap" id="userType" name="user.accountType" listKey="key" listValue="value" theme="simple" value="user.accountType"/>
			<font color=red>*</font>
		</td>
		<td class="label">用户性别：</td>
		<td>
			<s:radio list="sMap" name="user.sex" listKey="key" listValue="value" theme="simple" value="user.name"/>	 	
		</td>
	  </tr>
	  <tr>
		<td class="label">年龄：</td>
		<td>	
			<input id="userage" name="user.age" type="text" value="<s:property value="user.age"/>"/>
		</td>
		<td class="label">联系电话：</td>
		<td><input id="user.telephone" name="user.telephone" type="text" value="<s:property value="user.telephone"/>"/></td>
	  </tr>
	  <tr>
		<td class="label">电子邮箱：</td>
		<td><input id="user.email" name="user.email" type="text" value="<s:property value="user.email"/>" maxlength="60"/></td>
	  	<td class="label">所属行政区域：</td>
		<td>
			<input id="userregionid" name="user.region.id" type="hidden" value="<s:property value="user.region.id"/>"/>
			<div id="userregionname" style="float:left;width:120px;height:18px;border:1px #B5B8C8 solid;"><s:property value="user.region.name"/></div>
			&nbsp;&nbsp;<a href="#" onclick="selectCity()"><img src="<%=pathSys%>/images/search.png" title="选择行政区" border="0"></a>
		</td>
	  </tr>
	  <tr>
		<td class="label">所属联合会：</td>
		<td colspan="3"></td>
	  </tr>
	</table>
	<s:if test="user.id!=''">
		<s:hidden name="user.password"/>
		<s:hidden name="user.status"/>
		<s:hidden name="user.isAdmin"/>
		<s:hidden name="user.loginSum"/>
		<s:hidden name="user.lastLoginTime"/>
		<s:hidden name="user.createTime"/>
	</s:if>
	<div align="center">
	<input type="submit" value="提 交" class="button_tt" />
	<input type="button" value="返 回" class="button_tt" onClick="javascript:doReturn(this.form);">
	</div>
	</form>
  </div>
  <br>
  <div id="errorMessage" align="center">
       	<font color='red'><s:property value="errorMessage"/></font>
  </div>
  <br>
<ul id="tree" class="ztree" style="display:none;width:180px;height:220px;border:1px #FFB951 solid;"></ul>
</div>
<script type="text/javascript">
	var validate = new LiveValidation("user.account"); 
    validate.add(Validate.Presence,{failureMessage:"用户账号不能为空，请输入!", wait: 100});
    validate.add( Validate.Length, { maximum: 30 } );
    validate = new LiveValidation("user.name"); 
    validate.add(Validate.Presence,{failureMessage:"用户名称不能为空，请输入！", wait: 100});
    validate.add( Validate.Length, { maximum: 50 } );
    validate = new LiveValidation("user.accountType"); 
    validate.add( Validate.Exclusion, { within: [ '-1' ] } );
    validate = new LiveValidation("user.age"); 
    validate.add(Validate.Numericality, {onlyInteger: true } );
    validate.add( Validate.Numericality, { maximum: 200 } );
    validate = new LiveValidation("user.telephone"); 
    validate.add(Validate.Numericality, {onlyInteger: true } );
    validate.add( Validate.Length, { maximum: 11 } );
</script>
</body>
</html>