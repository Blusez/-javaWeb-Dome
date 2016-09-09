<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/manage/common/common.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="application.title" /></title>
</head>

<frameset rows="100,*" cols="1024" frameborder="yes" border="1" framespacing="0">
  <frame src="top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topPage">
  <frameset rows="*" cols="160,*" framespacing="0" frameborder="yes" border="1">
    <frame src="menu.action" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftPage">
    <frame src="main.action" name="mainFrame" id="mainFrame" title="mainPage">
  </frameset>
</frameset>
<noframes><body>
</body>
</noframes></html>
