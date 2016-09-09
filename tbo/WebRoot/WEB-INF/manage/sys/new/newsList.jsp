<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../../common/common.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>新闻中心</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
	var zNodes =[{ id:'7CA766E7-26E0-4FF5-B876-84DEA53F647B', pId:0, name:'江苏',isParent:true}];

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
	function deleteCity(){
		$("#newregionid").val("");
			$("#newregionname").html(
						  '<a href="#" onclick="deleteCity()"><img src="<%=pathSys%>/images/delete.gif" title="清空" border="0" style="float:right;">'
						+ '<a href="#" onclick="selectCity()"><img src="<%=pathSys%>/images/search.png" title="选择行政区" border="0" style="float:right;"></a>');
	}
	function setCity(treeNode){
		if(treeNode!=null && treeNode!=''){
			$("#newregionid").val(treeNode.id);
			$("#newregionname").html("<span style='float:left'>&nbsp;&nbsp;"+treeNode.name
						+ '</span><a href="#" onclick="deleteCity()"><img src="<%=pathSys%>/images/delete.gif" title="清空" border="0" style="float:right;">'
						+ '<a href="#" onclick="selectCity()"><img src="<%=pathSys%>/images/search.png" title="选择行政区" border="0" style="float:right;"></a>');
			tempAlert.close();
		}
	}
	$(document).ready(function(){
		$.fn.zTree.init($("#tree"), setting, zNodes);
	});
</script>
		<script language="JavaScript"> 
		function deletenews(newid,itemsid){
         if(confirm("是否确定删除")){
         	document.forms[0].method="post";
			document.forms[0].action="<%=path%>/news/newsdeleteAction.do?newsId="+newid;
			document.forms[0].submit();
            //window.location.href=
            return;
         }
       }
       function shenheenews(newid){
       		document.forms[0].method="post";
			document.forms[0].action="<%=path%>/news/transferToShenHeAction.do?newsId="+newid;
			document.forms[0].submit();
       }
       function editNews(newsid,itemsid){
       		document.forms[0].method="post";
			document.forms[0].action="<%=path%>/news/newseditAction.do?newsId="+newsid;
			document.forms[0].submit();
       }
		function goPage(pIndex){
		   var currentPage = pIndex;
		   var totalPage ='<s:property value="page.pageCount"/>';
		   if(pIndex<1){
			  currentPage=1;
		   }
		
		   if(pIndex>totalPage){
			  currentPage=totalPage;
			}     
		   //window.location.href="<%=path%>/news/getNewsItemsListAction.do?page.pageIndex="+currentPage;
		   document.forms["newslist"].action="<%=path%>/news/getNewsItemsListAction.do";
   			document.forms["newslist"]["page.pageIndex"].value=currentPage;
   			document.forms["newslist"].submit();
		}
function add()
{
	var itemsid = '<s:property value="id"/>';
	if(itemsid==null || itemsid==""){
		alert("请选择栏目！");
		return;
	}
	document.forms[0].method="post";
	document.forms[0].action="<%=path%>/news/newsaddAction.do";
	document.forms[0].submit();
}
function query(){
	document.forms[0].method="post";
	document.forms[0].do="<%=path%>/news/transferToNewsListAction.do"
	document.forms[0].submit();
}

function queryByCondition(){
	var c1=document.all["queryNews.createTime"].value;
	var c2=document.all["queryNews.modifyTime"].value;
	if(c1==""&&c2==""){
	document.forms[0]["page.pageIndex"].value=1;
	document.forms[0].do="<%=path%>/news/getNewsItemsListAction.do";
	document.forms[0].submit();
	}else if(c1!="" && c2!=""){
		if(c1<=c2){
		document.forms[0]["page.pageIndex"].value=1;
		document.forms[0].action="<%=path%>/news/getNewsItemsListAction.do";
		document.forms[0].submit();
		}else{
			alert("时间段有误！");
			return ;
		}
	}
}
function clearCondition(){
	document.all["queryNews.title"].value="";
	document.all["queryNews.createTime"].value="";
	document.all["queryNews.modifyTime"].value="";
	<s:if test="treeStyle==0">
	document.all["queryNews.cityRegionId.id"].value="";
	</s:if>
	document.all["queryNews.tradeId.id"].value="";
	document.all["queryNews.leagueId.id"].value="";
	document.all["queryNews.status"].value="";
}
</script>
	</head>

	<body>
		<div class="history-item">
			<div class="title">
				<s:property value="items.itemName"/>新闻中心<span style="position:absolute;left:190px;width:500px"><font color='red'><s:property value="errorMessage"/></font></span>
			</div>
			<div class="history-item-content">
			<form name="newslist" method="post" action="" onsubmit="return submitForm(this);">
				<s:hidden name="items.id"/>
				<s:hidden name="id"/>
				<div align="center">
					<table border="0" cellspacing="1" cellpadding="1" class="formTable">
					  <tr>
							<td class="label">新闻标题</td>
							<td class="text" >
								<s:textfield name="queryNews.title" theme="simple" size="40"/>
							</td>
							<td class="label">创建时间</td>
							<td class="text">
								&nbsp;从&nbsp;<input type="text" name="queryNews.createTime" class="Wdate"
										onClick="WdatePicker()" value='<s:date name="queryNews.createTime" format="yyyy-MM-dd" />'>&nbsp;&nbsp;</br>&nbsp;到
								<input type="text" name="queryNews.modifyTime" class="Wdate"
								onClick="WdatePicker()" value='<s:date name="queryNews.modifyTime" format="yyyy-MM-dd" />'>
							</td>
						</tr>
						<tr>
							<s:if test="treeStyle==0">
			 				<td class="label">所属区域</td>
			 				<td class="text">
			 					<div id="newregionname" style="width:120px;height:20px;border:1px #B5B8C8 solid;"><s:property value="queryNews.cityRegionId.name"/>
									<a href="#" onclick="deleteCity()"><img src="<%=pathSys%>/images/delete.gif" title="清空" border="0" style="float:right;"></a>
									<a href="#" onclick="selectCity()"><img src="<%=pathSys%>/images/search.png" title="选择行政区" border="0" style="float:right;"></a>
								</div>
								<input id="newregionid" name="queryNews.cityRegionId.id" type="hidden" value="<s:property value="queryNews.cityRegionId.id"/>"/>
								<ul id="tree" class="ztree" style="display:none;width:180px;height:220px;border:1px #FFB951 solid;"></ul>
			 				</td>
			 				</s:if>
							<td class="label">
								所属行业
							</td>
							<td class="text">
								<s:select theme="simple" list="tradeList" name="queryNews.tradeId.id" listKey="id" listValue="tradeName" headerKey="" headerValue="--请选择--"></s:select>
							</td>
						</tr>
						<tr>
							<td class="label">所属单位</td>
							<td class="text">
								<s:select theme="simple" list="leagueList" name="queryNews.leagueId.id" listKey="id" listValue="name" headerKey="" headerValue="--请选择--"></s:select>
							</td>
							<input name="news.itemsId.id" type="hidden" value='<s:property value="items.id"/>'/>
							<td class="label">状态</td>
							<td class="text">
								<s:select theme="simple" list="#{0:'已审核',1:'未审核',2:'已退回'}" name="queryNews.status" headerKey="" headerValue="---请选择---"></s:select>
							</td>
						</tr>
					
						
						<tr>
							<td colspan="4" align="center">
								<input type="button" class="button_tt" value="查询" onclick="queryByCondition();">
								<input type="button" class="button_tt" value="重置" onclick="clearCondition();">
							</td>
						</tr>
					</table>
				</div>
				<div align="right">
					<s:property value="page.pageBar" escape="false"/>
					<s:hidden name="page.pageIndex"/>
				</div>
				
					<table border="0" cellspacing="1" cellpadding="1" class="listTable">
						<tr align="left" class="header">
							<td align="center">
								序号
							</td>
							<td align="center">
								标题
							</td>
							<td align="center">
								所属区域
							</td>
							<td align="center">
								所属单位
							</td>
							<td align="center">
								所属栏目
							</td>
							<td align="center">
								所属行业
							</td>
							<td align="center">
								分类
							</td>
							<td align="center">
								浏览<br>次数
							</td>
							<td align="center">
								创建时间
							</td>
							<td align="center">
								作者
							</td>
							<td align="center">
								创建人
							</td>
							<td align="center">
								状态
							</td>
							<td align="center">
								置顶
							</td>
							<td align="center">
								级别
							</td>
							<td align="center">
								选择
							</td>
						</tr>
						<s:iterator value="newsList" var="news" status="id">
							
								<tr>
									<td>
										<s:property value="#id.index+1" />
									</td>
									<td>
										<s:property value="#news.title"/>
									</td>
									<td>
										<s:property value="#news.cityRegionId.name" />
									</td>
									<td>
										<s:property value="#news.leagueId.name" />
									</td>
									<td>
										<s:property value="#news.itemsId.itemName" />
									</td>
									<td>
										<s:property value="#news.tradeId.tradeName" />
									</td>
									<td>
										<s:property value="#news.newsTypeId.name" />
									</td>
									<td>
										<s:property value="#news.browseSum" />
									</td>
									<td>
										<s:date name="#news.createTime" format="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td>
										<s:property value="#news.author" />
									</td>
									<td>
										<s:property value="#news.creator.name" />
									</td>
									<td>
									<s:if test='#news.status=="已审核"'>
										<font color="green"><s:property value="#news.status" /></font>
									</s:if>
									<s:elseif test='#news.status=="未审核"'>
										<font color="red"><s:property value="#news.status" /></font>
									</s:elseif>
									<s:else>
										<s:property value="#news.status" />
									</s:else>
									</td>
									<td>
										<s:if test="#news.isTop">
											是
										</s:if>
										<s:else>
											否
										</s:else>
									</td>
									<td>
										<s:property value="#news.showLevelId.categoryName" />
									</td>
									<td width="55">
									<s:if test="boolNewsShenHe">
									<a href="javascript:shenheenews('<s:property value='#news.id'/>');">审核页面</a>
									</s:if>
									<s:else>
										<a href="javascript:deletenews('<s:property value='#news.id'/>','<s:property value='#news.itemsId.id'/>');"  >删除</a>
						    	     	<a href="javascript:editNews('<s:property value='#news.id'/>','<s:property value='#news.itemsId.id'/>');">编辑</a>
						    	    </s:else> 	
									</td>
								</tr>
								
						</s:iterator>
					</table>
					<div align="center">

						<input type="button" class="button_tt" value="添加" onclick="add()">

					</div>
				</form>
				</div>
				</div>
	</body>
</html>
