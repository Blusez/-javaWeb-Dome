<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/common.jsp" %>
<html>
  <head>
    <base href="<%=basePath%>">
	<title><s:text name="application.title" /></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=pathSys%>/css/login.css" />
</head>
<frameset rows="96,10,*" cols="*" frameborder="no" border="0" framespacing="0" id="bigFrame">
  <frame src="<%=path%>/main/topAction.do" name="topFrame" scrolling="no" noresize="noresize" />
  <frame src="<%=path%>/main/controlAction.do" name="SizeControl" scrolling="no"  noresize="noresize" id="SizeControl" />
  <frameset id="main" rows="*" cols="180,*" framespacing="0" frameborder="no" border="0">
    <frame src="<%=path%>/main/leftPanelAction.do?menuCode=<s:property value='menuCode'/>" name="leftFrame" scrolling="no" noresize="noresize"  />
    <frame src="<%=path%>/main/mainPanelAction.do" name="mainFrame" />
  </frameset>
</frameset>
<noframes><body>
</body>
</noframes>
</html>
