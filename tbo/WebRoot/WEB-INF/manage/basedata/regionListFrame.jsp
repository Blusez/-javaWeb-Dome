<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
	<script language="JavaScript">     
	if (window != top.frames["mainFrame"])     
	top.frames["mainFrame"].location.href = "<%=path %>/region/switchToItemAction.do?id=<s:property value='id'/>";     
	</script>
</head>

<frameset cols="160,*" frameborder="no" border="1" framespacing="0">
   <frame src="<%=path %>/region/getRegionTreeAction.do" name="regionTree" scrolling="yes" noresize="noresize" id="regionTree" title="">
   <frame src="<%=path %>/region/getRegionListAction.do?id=<s:property value='id'/>" name="regionframe" id="regionframe" title="">
</frameset>
<noframes><body>
</body>
</noframes></html>