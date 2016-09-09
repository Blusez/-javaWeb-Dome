<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
</head>
<script type="text/javascript">
</script>
<frameset cols="*,10" frameborder="no" border="0"  name="viewArea"  framespacing="0">
  <frame src="<%=path %>/main/menuAction.do?menuCode=<%=path %>" name="menuFrame" id="menuFrame" />
  <frame src="<%=path %>/main/sideControlAction.do" name="SizeControl" scrolling="No"  noresize="noresize" id="SizeControl" />
</frameset>
<noframes>  
<body>
</body>
</noframes></html>
