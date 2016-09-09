<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="../../common/common.jsp" %>
<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/editor_config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/editor_all_min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path %>/ueditor/themes/default/ueditor.css"/>

<html>
	<HEAD>
		<TITLE>添加新闻</TITLE>

		<LINK href="<%=pathSys%>/resource/style/all/style_1.css" type=text/css
			rel=stylesheet>
		<LINK href="<%=pathSys%>/resource/js/jqueryUI/flora/flora.all.css"
			type=text/css rel=stylesheet>
<style>
		.LV_validation_message{
		    font-weight:bold;
		    margin:0 0 0 5px;
		}
		
		.LV_valid {
		    color:#00CC00;
		}
			
		.LV_invalid {
		    color:#CC0000;
		}
		    
		.LV_valid_field,
		input.LV_valid_field:hover, 
		input.LV_valid_field:active,
		textarea.LV_valid_field:hover, 
		textarea.LV_valid_field:active {
		    border: 1px solid #00CC00;
		}
		    
		.LV_invalid_field, 
		input.LV_invalid_field:hover, 
		input.LV_invalid_field:active,
		textarea.LV_invalid_field:hover, 
		textarea.LV_invalid_field:active {
		    border: 1px solid #CC0000;
		}

	</style>

	
		<script type="text/javascript" src="<%=pathSys%>/resource/js/json2.js"></script>
		<script type="text/javascript" src="<%=pathSys%>/resource/js/jsonrpc.js"></script>
		<script type="text/javascript" src="<%=pathSys%>/resource/js/common.js"></script>
		<script src="<%=pathSys%>/js/livevalidation.js" type="text/javascript"></script>
		<script type="text/javascript"
			src="<%=pathSys%>/resource/js/jqueryUI/jquery-1.2.6.js"></script>
		<script type="text/javascript" language="javascript"
			src="<%=pathSys%>/resource/js/ajaxfileupload.js"></script>

		<script type="text/javascript"
			src="<%=pathSys%>/resource/js/jqueryUI/ui.core.js"></script>
		<script type="text/javascript"
			src="<%=pathSys%>/resource/js/jqueryUI/ui.tabs.js"></script>
<link href="<%=pathSys%>/zTree/css/zTreeStyle.css" rel="stylesheet" type="text/css">
<script type='text/javascript' src='<%=path%>/web/js/jquery-1.6.min.js'></script>
<script type="text/javascript" src="<%=pathSys%>/zTree/js/jquery.ztree.core-3.3.js"></script>
<script type="text/javascript" src="<%=pathSys%>/artDialog/artDialog.js?skin=blue"></script>
<script language="JavaScript">
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
			$("#newregionid").val(treeNode.id);
			$("#newregionname").html("&nbsp;&nbsp;"+treeNode.name);
			tempAlert.close();
		}
	}
	$(document).ready(function(){
		$.fn.zTree.init($("#tree"), setting, zNodes);
	});
</script>

		<script language="JavaScript">
		function backtoMain(){
			document.forms[0].method="post";
			document.forms[0].action="<%=path%>/news/getNewsItemsListAction.do";
			document.forms[0].submit();
	}
	function checkdata(){
		var newstype= form["news.newsTypeId.id"].value;
		var newsshowlev = form["news.showLevelId.id"].value;		
		var newscity= form["news.cityRegionId.id"].value;
	
		var newsleague= form["news.leagueId.id"].value;
		var newstrade= form["news.tradeId.id"].value;
		var imagefile = document.getElementById("image").value;
		var videofile = document.getElementById("video").value;
		
		if(newsshowlev==null || newsshowlev==""){
			alert("请选择显示级别！");
			return false;
		}
		if(newstype==null || newstype==""){
			alert("请选择新闻类型！");
			return false;
		}
		if(newscity==null || newscity==""){
			alert("请选择所属行政区！");
			return false;
		}
		if(newsleague==null || newsleague==""){
			alert("请选择所属联合会！");
			return false;
		}
		
		if(newstrade==null || newstrade==""){
			alert("请选择所属行业！");
			return false;
		}
		
		if((imagefile==null || imagefile=="")&&(videofile!=null && videofile!="")){
			alert("请选择图片附件");
			return false;
		}
		var divTip1 = document.getElementById("image").value;
		var divTip2 = document.getElementById("video").value;
		var divTip3 = document.getElementById("connfile").value;
		if(divTip1!=null && divTip1!=''){
			var hA = document.getElementById("divTip1");
			hA.innerHTML = "<img alt='' title='正在上传中...' src='<%=pathSys%>/images/Loading.gif' />"; //初始化内容
		}
		if(divTip2!=null && divTip2!=''){
			var hA = document.getElementById("divTip2");
			hA.innerHTML = "<img alt='' title='正在上传中...' src='<%=pathSys%>/images/Loading.gif' />"; //初始化内容
		}
		if(divTip3!=null && divTip3!=''){
			var hA = document.getElementById("divTip3");
			hA.innerHTML = "<img alt='' title='正在上传中...' src='<%=pathSys%>/images/Loading.gif' />"; //初始化内容
		}
		
		
	}
	</script>
	</HEAD>

	<BODY>
		<form name="form" action="<%=path %>/news/saveAction.do" method="post" onsubmit="return checkdata()">
		<input name="news.itemsId.id" type="hidden" value='<s:property value="items.id"/>'/>
		<s:hidden name="id"/>
		<div class="history-item" style="text-align:left">
			<div class="title">
		 		新闻信息
			</div>
		 	<div class="history-item-content">
		 		<table class="formTable">
		 			<tr>
		 				<td class="label">标题&nbsp;<font color="red">*</font></td>
		 				<td ><input name="news.title" theme="simple" id="news.title" style="width:310px"></td>
		 				<td class="label">副标题</td>
		 				<td ><input name="news.subTitle" theme="simple" id="news.subTitle" style="width:310px"></td>
		 			</tr>
		 			<tr>
		 				
		 				<td class="label">所属行业&nbsp;<font color="red">*</font></td>
		 				<td><s:select theme="simple" list="tradeList" name="news.tradeId.id" id="news.tradeId.id"  listKey="id" listValue="tradeName"  headerKey="" headerValue="--请选择--"></s:select></td>
		 				<td class="label">新闻分类&nbsp;<font color="red">*</font></td>
		 				<td><s:select theme="simple" list="newsTypeList" name="news.newsTypeId.id" id="news.newsTypeId.id" listKey="id" listValue="name" headerKey="" headerValue="--请选择--"></s:select></td>
		 			</tr>
		 			<tr>	
		 				<td class="label">显示级别&nbsp;<font color="red">*</font></td>
		 				<td><s:select theme="simple" name="news.showLevelId.id" id="news.showLevelId.id" list="showLevelList"  listKey="id" listValue="categoryName" ></s:select></td>
		 				<td class="label">所属单位&nbsp;<font color="red">*</font></td>
		 				<td><s:select theme="simple" list="leagueList" name="news.leagueId.id" id="news.leagueId.id" listKey="id" listValue="name" ></s:select></td>
		 				
		 			</tr>
		 			<tr>
		 				<td class="label">是否置顶<font color="red">*</font></td>
		 				<td><s:radio list="#{true:'是',false:'否'}" name="news.isTop" id="news.isTop" value="false" theme="simple"></s:radio></td>
		 				<td class="label" onclick="selectCity();">所属区域&nbsp;<font color="red">*</font></td>
		 				<td >
		 					<input id="newregionid" name="news.cityRegionId.id" type="hidden" value="<s:property value="news.cityRegionId.id"/>"/>
							<div id="newregionname" style="float:left;width:80px;height:18px;border:1px #B5B8C8 solid;"><s:property value="news.cityRegionId.name"/></div>
							&nbsp;&nbsp;<a href="#" onclick="selectCity()"><img src="<%=pathSys%>/images/search.png" title="选择行政区" border="0"></a>
							<ul id="tree" class="ztree" style="display:none;width:180px;height:220px;border:1px #FFB951 solid;"></ul>
		 				</td>
		 			</tr>
		 			<tr>	
		 				<td class="label">作者&nbsp;</td>
		 				<td><s:textfield theme="simple" name="news.author" id="news.author" value="匿名"></s:textfield></td>
		 				<td class="label">来源</td>
		 				<td><s:textfield theme="simple" name="news.source" id="news.source" value="天博科技"></s:textfield></td>
		 			</tr>
		 			<tr>   
		 			    <td class="label">发生时间&nbsp;</td>
		 				<td colspan="7"><input type="text" name="news.publishTime" id="news.publishTime" class="Wdate"
								onClick="WdatePicker()"></td>
		 			</tr>
		 			<tr>
		 			</tr>
		 			<tr>
			 		<td class="label">新闻摘要&nbsp;</td>
		 				<td colspan="7"><s:textarea cols="120" rows="3" name="news.summary" theme="simple"></s:textarea></td>
			 		</tr>
		 			<tr>
		 			
		 				<td colspan="8">
		 				<textarea id="newsContents.contents" name="newsContents.contents" style="height="600""></textarea>
		 				</td>
		 			</tr>
		 		</table>
				
		 		<br>
		 		<DIV  align=center>
					<input type="submit" value="保存">&nbsp;&nbsp;<input type="reset" value="重置" onclick="">&nbsp;&nbsp;<input type="button" value="返回" onclick="backtoMain();">
				</DIV>
			</div>
		</div>
		<br>
		
		<script type="text/javascript">
	        var editor_a = new baidu.editor.ui.Editor({
	            autoHeightEnabled:false,
	            minFrameHeight:400,
	            initialContent:""
	            
	        });
	        editor_a.render( 'newsContents.contents' );
         </script>   
		<script type="text/javascript">
			var valid = new LiveValidation("news.title"); 
			valid.add(Validate.Presence,{failureMessage:"标题不能为空，请输入!", wait: 100});
		    valid.add( Validate.Length, { maximum: 200 } );
		    
		    valid = new LiveValidation("news.author"); 
		    valid.add( Validate.Length, { maximum: 30 } );
		    valid = new LiveValidation("news.source"); 
		    valid.add( Validate.Length, { maximum: 60 } );
		    valid = new LiveValidation("news.subTitle"); 
		    valid.add( Validate.Length, { maximum: 200 } );
			valid = new LiveValidation("news.publishTime"); 
			valid.add(Validate.Presence ,{failureMessage:"请选择新闻发生时间！"});
		</script>
		</form>
	</BODY>
</HTML>
