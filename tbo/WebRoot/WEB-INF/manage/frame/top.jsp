<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><s:text name="application.title" /></title>
		<link href="<%=pathSys%>/css/frame.css" rel="stylesheet"
			type="text/css" />
		<link href="<%=pathSys%>/css/all.css" rel="stylesheet" type="text/css" />
	
		<!--  <script type='text/javascript' src='<%=path%>/dwr/interface/Msg.js'></script>
		<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=path%>/dwr/util.js'></script>-->
		<script type="text/javascript">
			 function showPage(menuCode,url)
			 {
			  	parent.frames["leftFrame"].frames["menuFrame"].switchoutlookBar(menuCode);
			  	if(url!=null && url!=''){
			   		parent.frames["mainFrame"].location.href=url;
			   	}else{
			   		parent.frames["mainFrame"].location.href="<%=path%>/main/mainPanelAction.do";
			   	}
			 }
		</script>
		<script language="javascript">
			function tick() {
			var hours, minutes, seconds, xfile;
			var intHours, intMinutes, intSeconds;
			var today, theday;
			today = new Date();
			function initArray(){
			this.length=initArray.arguments.length
			for(var i=0;i<this.length;i++)
			this[i+1]=initArray.arguments[i] }
			var d=new initArray(
			"星期日",
			"星期一",
			"星期二",
			"星期三",
			"星期四",
			"星期五",
			"星期六");
			theday = today.getFullYear()+"年" + [today.getMonth()+1]+"月" +today.getDate()+"日 "+ d[today.getDay()+1];
			intHours = today.getHours();
			intMinutes = today.getMinutes();
			intSeconds = today.getSeconds();
			if (intHours == 0) {
			hours = "12:";
			xfile = "午夜";
			} else if (intHours < 12) {
				hours = intHours+":";
				xfile = "上午";
			} else if (intHours == 12) {
				hours = "12:";
				xfile = "正午";
			} else {
				intHours = intHours - 12
				hours = intHours + ":";
				xfile = "下午";
			}
			if (intMinutes < 10) {
				minutes = "0"+intMinutes+":";
			} else {
				minutes = intMinutes+":";
			}
			if (intSeconds < 10) {
				seconds = "0"+intSeconds+" ";
			} else {
				seconds = intSeconds+" ";
			}
			timeString = theday+" "+xfile+" "+hours+minutes+seconds;
			Clock.innerHTML = timeString;
			window.setTimeout("tick();", 100);
			}
			window.onload = tick;
		</script>
	
		<script type="text/javascript">
			//退出系统
			function exit(){
				var value = confirm("确实要退出系统吗？");
				if(value==true){
				 window.open('<%=path%>/login/reloginAction.do','_top');
			   }
		    }
		    //打开首页
		    function firstPage(){
				 window.open('<%=path%>/main/firstAction.do?menuCode=101','_top');
		    }
		    
		    //修改用户密码
		    function modifyPsd(){
		       window.open('<%=path%>/main/modifyPsdAction.do','mainFrame');
		    }
		</script>
	</head>

	<body>
		<div class="head">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="276">
						<img src="<%=pathSys%>/images/logo.gif" width="276" height="68">
					</td>
					<td>
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<s:if test="listmodel.size>0">
									<s:iterator value="listmodel" var="menu" status='st'>
										<td align="center">
											<a href="#"
												onClick="showPage(<s:property value="#st.index"/>,'<s:property value="#menu.indexurl"/>')"><img
													src="<%=pathSys%>/images/<s:property value="#menu.image"/>"
													border="0"> </a>
										</td>
									</s:iterator>
								</s:if>
								<s:else><td align="center">&nbsp;</td></s:else>
							</tr>
							<tr><s:if test="listmodel.size>0">
								<s:iterator value="listmodel" var="menu1" status='st1'>
									<td align="center">
										<a href="#"
											onClick="showPage(<s:property value="#st1.index"/>,'<s:property value="#menu.indexurl"/>')"><s:property
												value="#menu1.moudleName" /> </a>
									</td>
								</s:iterator></s:if>
							</tr>
						</table>
					</td>
					<td height="68" width="91"
						background="<%=pathSys%>/images/huxian.gif">
						<table width="100%">
							<tr>
								<td style="padding-left: 20px;">
									<a href="<%=pathSys%>/manual/manual.htm" target="_blank"><img
											border="0" src="<%=pathSys%>/images/help.png" title="帮助">
									</a>
									<!-- onclick="javascript:firstPage();" -->
								</td>
							</tr>
							<tr>
								<td style="padding-left: 35px; padding-top: 3px;">
									<a href="#" onClick="javascript:modifyPsd();">
										<img src="<%=pathSys%>/images/icon2.gif" title="修改密码" border="0">
									</a>
								</td>
							</tr>
							<tr>
								<td style="padding-left: 60px;">
									<a href="#" onClick="javascript:exit();">
										<img src="<%=pathSys%>/images/icon3.gif" title="退出" border="0">
									</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="100%">
				<tr valign="bottom">
					<td height="20" width="25%">
						&nbsp;当前用户：
						<span class="orange"><s:property
								value="#session.user.name" /> </span>
					</td>
					<td>
					</td>
					<td align="right" width="40%">
						<span class="orange"><div id="msgId"
								style="font-size: 12px; color: blue">
							</div> </span>
					</td>
					<td align="right" width="35%">
						<span class="orange"><div id="Clock"
								style="font-size: 12px; color: blue"></div> </span>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>