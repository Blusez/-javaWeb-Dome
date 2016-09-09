<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=pathSys %>/css/dtree.css" rel="stylesheet" type="text/css">
<script src="<%=pathSys %>/js/dtree.js" type="text/javascript"></script>

<title>menu</title>
	<SCRIPT LANGUAGE="JavaScript">
	dTree0001 = new dTree('dTree0001');
	dTree0001.add(0001, -1, '行政区树');
	//得取子菜单
	
	document.write('<s:iterator value="cityRegionsList" var="region">');
	dTree0001.add('<s:property value="#region.id"/>','<s:property value="#region.parentId.id"/>',
			'<s:property value="#region.name"/>','<%=path%>/region/getSubRegionListByPIdAction.do?id=<s:property value="#region.id"/>',
			'','regionframe');
	document.write('</s:iterator>');
	document.write("<span>" + dTree0001 + "</span>");
	</SCRIPT>
</head>
<body>
</body>
</html>
