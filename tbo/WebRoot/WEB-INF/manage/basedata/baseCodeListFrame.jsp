<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>

<frameset cols="160,*" frameborder="no" border="1" framespacing="0">
  <frame src="<%=path %>/baseData/baseDictTreeAction.do" name="baseDictTree" scrolling="no" noresize="noresize" id="leftFrame" title="">
   <frame src="<%=path %>/baseData/baseCodeListAction.do?categoryId=T_ICS_BaseDict_FcategoryId" name="baseCodeframe" id="baseCodeframe" title="">
</frameset>
<noframes><body>
</body>
</noframes></html>