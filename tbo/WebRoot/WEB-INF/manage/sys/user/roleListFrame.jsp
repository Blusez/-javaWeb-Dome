<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>角色</title>
</head>
<frameset cols="100,*" frameborder="no" border="1" framespacing="0">
  <frame src="<%=path %>/role/treeAction.do" name="roleTree" scrolling="No" noresize="noresize" id="roleTree" title="角色">
  <frameset rows="50%,50%" frameborder="no" border="1" framespacing="0">
  	<frame src="<%=path %>/role/queryModelAction.do" name="modelList" id="modelList" title="模块">
  	<frame src="<%=path %>/role/queryUserAction.do" name="userList" id="userList" title="用户">
  </frameset>
</frameset>
<body>
</body>
</html>
