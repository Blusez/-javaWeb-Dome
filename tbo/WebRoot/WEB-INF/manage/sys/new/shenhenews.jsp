<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="../../common/common.jsp" %>
<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/editor_config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/editor_all_min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path %>/ueditor/themes/default/ueditor.css"/>

<html>
	<HEAD>
		<TITLE>审核新闻</TITLE>

		
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

		<script language="JavaScript">
	
	$(document).ready(function(){
	    $("#example > ul").tabs();
	}); 
		function pass(){
			document.forms["form"].method="post";
			document.forms["form"].action="<%=path%>/news/shenhePassAction.do"
			document.forms["form"].submit();
		}
		
		function getback(){
			document.forms["form"].method="post";
			document.forms["form"].action="<%=path%>/news/shenheBackAction.do"
			document.forms["form"].submit();
		}
	</script>
	</HEAD>

	<BODY>
		<form name="form" action="" method="post">
		<s:hidden name="id"/>
		<s:hidden name="news.id"/>
		<s:hidden name="news.source"/>
		<s:if test="news.creator!=null">
			<s:hidden name="news.creator.id"/>
		</s:if>
		<s:hidden name="news.author"/>
		<s:hidden name="news.title"/>
		<s:hidden name="news.subTitle"/>
		<s:hidden name="news.createTime"/>
		<s:hidden name="news.modifyTime"/>
		<s:hidden name="news.browseSum"/>
		<s:if test="news.newsTypeId!=null">
			<s:hidden name="news.newsTypeId.id"/>
		</s:if>
		<s:hidden name="news.isTop"/>
		<s:hidden name="news.summary"/>
		<s:hidden name="news.publishTime"/>
		<s:hidden name="news.cityRegionId.id"/>
		<s:hidden name="news.leagueId.id"/>
		<s:hidden name="news.itemsId.id"/>
		<s:hidden name="news.tradeId.id"/>
			<s:if test="news.showLevelId!=null">
			<s:hidden name="news.showLevelId.id"/>
		</s:if>
		<s:hidden name="news.imageFile"/>
		<s:hidden name="news.videoFile"/>
		<s:if test="news.memberId!=null">
			<s:hidden name="news.memberId.id"/>
		</s:if>
		<s:if test="news.modifier!=null">
			<s:hidden name="news.modifier.id"/>
		</s:if>
		<s:if test="news.newsContentsId!=null">
			<s:hidden name="news.newsContentsId.id"/>
		</s:if>
		
		<s:hidden name="queryNews.title"/>
		<s:hidden name="queryNews.cityRegionId.id"/>
		<s:hidden name="queryNews.tradeId.id"/>
		<s:hidden name="queryNews.leagueId.id"/>
		<s:hidden name="queryNews.createTime"/>
		<s:hidden name="queryNews.modifyTime"/>
		<s:hidden name="queryNews.status"/>
		<s:hidden name="page.pageIndex"/>
		<div class="history-item" style="text-align:left">
			<div class="title">
		 		新闻信息
			</div>
			<div align="center">
				<input type="button" class="button_tt" value="审核通过" onclick="pass()"><input type="button" class="button_tt" value="退回" onclick="getback()"><input  class="button_tt" type="button" value="返回" onclick="javascript :history.back(-1);">
			</div>
		 	<div class="history-item-content">
		 		<table class="formTable">
		 			<tr>
		 				<td class="label">标题</td>
		 				<td><s:property value="news.title"/></td>
		 			</tr>
		 			<tr>
		 				<td class="label">创建人</td>
		 				<td><s:property value="news.creator.name"/></td>
		 			</tr>
		 			<tr>
		 				<td class="label">作者</td>
		 				<td><s:property value="news.author"/></td>
		 			</tr>
		 			<tr>
		 				<td class="label">来源</td>
		 				<td><s:property value="news.source"></s:property></td>
		 			</tr>
		 			<tr>
		 				<td class="label">新闻分类</td>
		 				<td><s:property value="news.newsTypeId.name"/></td>
		 			</tr>
		 			<tr>
		 				<td class="label">所属行政区域</td>
		 				<td><s:property value="news.cityRegionId.name"/></td>
		 			</tr>
		 			<tr>
		 				<td class="label">所属栏目</td>
		 				<td><s:property value="news.itemsId.itemName"/></td>
		 			</tr>
		 			<tr>
		 				<td class="label">所属行业</td>
		 				<td><s:property value="news.tradeId.tradeName"/></td>
		 			</tr>
		 			<tr>
		 				<td class="label">所属联合会</td>
		 				<td><s:property  value="news.leagueId.name" /></td>
		 			</tr>
		 			<tr>
		 				<td class="label">新闻显示级别</td>
		 				<td><s:property value="news.showLevelId.categoryName"/></td>
		 			</tr>
		 			<tr>
		 				<td class="label">是否置顶</td>
		 				<td>
		 				<s:if test="#news.isTop">是</s:if>
							<s:else>否</s:else>
						</td>
		 			</tr>
		 			<tr>
		 				<td class="label">批注</td>
		 				<td><s:textarea name="news.shenheReason" cols="90" rows="3" theme="simple"></s:textarea></td>
		 			</tr>
		 	
		 			<tr>
		 				<td class="label">新闻内容</td>
		 				<td>
		 					<s:property value="news.newsContentsId.contents" escape="false"/>
		 				</td>
		 			</tr>
		 		</table>
		 		<br>
			</div>
		</div>
		<br>
		<script type="text/javascript">
						var validate = new LiveValidation("news.shenheReason"); 
					    validate.add( Validate.Length, { maximum: 200 } );
					     
					</script>
		</form>
	</BODY>
</HTML>