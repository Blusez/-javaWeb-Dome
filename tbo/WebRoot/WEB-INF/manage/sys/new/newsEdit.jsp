<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="../../common/common.jsp" %>
<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/editor_config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/editor_all_min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path %>/ueditor/themes/default/ueditor.css"/>

<html>
	<HEAD>
		<TITLE>修改新闻</TITLE>

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
		<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=path%>/dwr/util.js'></script>
		<script type='text/javascript' src='<%=path%>/dwr/interface/NewsAction.js'></script>
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
		var newstitle= form["news.title"].value;
		var newstype= form["news.newsTypeId.id"].value;
		
		var newsshowlev = form["news.showLevelId.id"].value;
		var newscity= form["news.cityRegionId.id"].value;
		var newsleague= form["news.leagueId.id"].value;
		var newstrade= form["news.tradeId.id"].value;
		var imagefile = document.getElementById("image").value;
		var videofile = document.getElementById("video").value;
		
		alert(form["news.tradeId.id"].value);
		if(newstitle==null || newstitle==""){
			alert("标题不能为空，请输入！");
			form["news.title"].focus();
			return false;
		}
		if(newsshowlev==null || newsshowlev==""){
			alert("请选择新闻显示级别！");
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
	function deleteFile(newid,type){
		ques=window.confirm("确实要删除吗？") 
		if(ques==true){
		NewsAction.deleteFile(newid,type,function(data){
			if(data=="success"){
				if(type=="2"){
					document.getElementById("newcommdocfile").value="";
					document.getElementById("commfile").innerHTML="<font color='red'>删除成功！</font>";
				}
				if(type=="1"){
					document.getElementById("newvideofile").value="";
					document.getElementById("videofile").innerHTML="<font color='red'>删除成功！</font>";
				}
				if(type=="0"){
					document.getElementById("newimagefile").value="";
					document.getElementById("imagefile").innerHTML="<font color='red'>删除成功！</font>";
				}
			}
			if(data=="error"){alert("删除失败！");}
			});
		}
	}
	</script>
	</HEAD>

	<BODY>

		<form name="form" action="<%=path %>/news/saveAction.do" method="post" onsubmit="return checkdata()">
		<s:hidden name="id"/>
		<s:hidden name="news.itemsId.id"/>
		<s:hidden name="news.id"/>
		<s:if test="news.creator!=null">
			<s:hidden name="news.creator.id"/>
		</s:if>
		<!--s:hidden name="news.createTime"/-->
		<s:hidden name="news.shenheReason"/>
		<s:hidden name="news.newsContentsId.id"/>
		<s:hidden name="news.imageFile" id="newimagefile"/>
		<s:hidden name="news.videoFile" id="newvideofile"/>
		<s:hidden name="news.commDocFile" id="newcommdocfile"/>
		<s:hidden name="news.status"/>
		<s:if test="news.memberId!=null">
			<s:hidden name="news.memberId.id"/>
		</s:if>
		
		<s:hidden name="queryNews.title"/>
		<s:hidden name="queryNews.cityRegionId.id"/>
		<s:hidden name="queryNews.tradeId.id"/>
		<s:hidden name="queryNews.leagueId.id"/>
		<s:hidden name="queryNews.createTime"/>
		<s:hidden name="queryNews.modifyTime"/>
		<s:hidden name="queryNews.status"/>
		<div class="history-item" style="text-align:left">
			<div class="title">
		 		新闻信息
			</div>
		 	<div class="history-item-content">
		 		<table class="formTable">
		 			<tr>
		 				<td class="label">标题&nbsp;<font color="red">*</font></td>
		 				<td ><s:textfield name="news.title" theme="simple" id="news.title" cssStyle="width:310px"></s:textfield></td>
		 				<td class="label">副标题</td>
		 				<td ><s:textfield name="news.subTitle" theme="simple" id="news.subTitle" cssStyle="width:310px"></s:textfield></td>
		 				
		 			</tr>
		 			<tr>
		 			    <td class="label">所属行业&nbsp;<font color="red">*</font></td>
		 				<td><s:select theme="simple" list="tradeList" name="news.tradeId.id" listKey="id" listValue="tradeName" headerKey="" headerValue="--请选择--"></s:select></td>
		 				<td class="label">新闻分类&nbsp;<font color="red">*</font></td>
		 				<td><s:select theme="simple" list="newsTypeList" name="news.newsTypeId.id" listKey="id" listValue="name" headerKey="" headerValue="--请选择--"></s:select></td>
		 			</tr>
		 			<tr>	
		 				<td class="label">显示级别&nbsp;<font color="red">*</font></td>
		 				<td><s:select theme="simple" name="news.showLevelId.id" list="showLevelList"  listKey="id" listValue="categoryName" headerKey="" headerValue="--请选择--"></s:select></td>
		 				<td class="label">所属单位&nbsp;<font color="red">*</font></td>
		 				<td><s:select theme="simple" list="leagueList" name="news.leagueId.id" listKey="id" listValue="name" headerKey="" headerValue="--请选择--"></s:select></td>
		 			</tr>
		 			<tr>
		 				<td class="label">是否置顶<font color="red">*</font></td>
		 				<td><s:radio list="#{true:'是',false:'否'}" name="news.isTop" listKey="key" listValue="value" theme="simple"></s:radio></td>
		 				<td class="label">所属区域&nbsp;<font color="red">*</font></td>
		 				<td>
		 					<input id="newregionid" name="news.cityRegionId.id" type="hidden" value="<s:property value="news.cityRegionId.id"/>"/>
							<div id="newregionname" style="float:left;width:80px;height:18px;border:1px #B5B8C8 solid;"><s:property value="news.cityRegionId.name"/></div>
							&nbsp;&nbsp;<a href="#" onclick="selectCity()"><img src="<%=pathSys%>/images/search.png" title="选择行政区" border="0"></a>
							<ul id="tree" class="ztree" style="display:none;width:180px;height:220px;border:1px #FFB951 solid;"></ul>
		 				</td>
		 			</tr>
		 			<tr>	
		 				<td class="label">作者&nbsp;</td>
		 				<td><s:textfield theme="simple" name="news.author" id="news.author"></s:textfield></td>
		 				<td class="label">来源</td>
		 				<td><s:textfield theme="simple" name="news.source" id="news.source"></s:textfield></td>
		 			</tr>
		 			
		 			<tr>
			 		<td class="label">新闻摘要&nbsp;</td>
		 				<td colspan="7"><s:textarea cols="120" rows="4" name="news.summary" theme="simple"></s:textarea></td>
			 		</tr>
		 			<tr>
			 			<td class="label">发生时间&nbsp;</td>
		 				<td ><input type="text" name="news.publishTime" class="Wdate"
								onClick="WdatePicker()" value='<s:date name="news.publishTime" format="yyyy-MM-dd" />'></td>
			 		    <td class="label">创建时间：</td>
		 				<td ><input type="text" name="news.createTime" class="Wdate"
								onClick="new WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="<s:date name="news.createTime" format="yyyy-MM-dd HH:mm:ss" />" style="width:190px;"></td>
		 			
			 		</tr>
			 		<s:if test="news.shenheReason!=null && news.shenheReason!=''">
			 		<tr>
			 			<td class="label">批注</td>
		 				<td colspan="4"><font color="red"><s:property value="news.shenheReason"/></font></td>
			 		</tr>
			 		</s:if>
		 			<tr>
		 				<td colspan="4" >
		 				<textarea  id="newsContents.contents" name="newsContents.contents" >
        					<s:property value="news.newsContentsId.contents" />
    					</textarea>
		 			</tr>
		 			
		 		</table>
		 		<br>
		 		<s:hidden name="page.pageIndex"/>
		 		<DIV  align=center>
					<input type="submit" value="保存">&nbsp;&nbsp;<input type="reset" value="重置" onclick="">&nbsp;&nbsp;<input type="button" value="返回" onclick="backtoMain();">
				</DIV>
			</div>
		</div>
		<br>
	<script type="text/javascript">
	     var editor_a1 = new baidu.editor.ui.Editor({
	            autoHeightEnabled:false,
	            minFrameHeight:400
	        });
	   editor_a1.render( 'newsContents.contents' );
	</script>	
	<script type="text/javascript">
	var validate = new LiveValidation("news.title"); 
    validate.add( Validate.Length, { maximum: 200 } );
    validate = new LiveValidation("news.author"); 
    validate.add( Validate.Length, { maximum: 30 } );
   validate = new LiveValidation("news.source"); 
    validate.add( Validate.Length, { maximum: 60 } );
    var validate = new LiveValidation("news.subTitle"); 
    validate.add( Validate.Length, { maximum: 200 } );
</script>
		</form>
	</BODY>
</HTML>