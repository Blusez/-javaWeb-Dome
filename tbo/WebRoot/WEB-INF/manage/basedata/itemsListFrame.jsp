<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>

<frameset cols="160,*" frameborder="no" border="1" framespacing="0">
  <frame src="<%=path %>/tree/getItemsTreeAction.do" name="itemTree" scrolling="yes" noresize="noresize" id="itemTree" title="">
   <frame src="<%=path %>/tree/getItemsTradeListAction.do" name="itemframe" id="itemframe" title="">
</frameset>
<noframes><body>
</body>
</noframes></html>