﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=pathSys %>/css/dtree.css" rel="stylesheet" type="text/css">
<script src="<%=pathSys %>/js/dtree.js" type="text/javascript"></script>

<title>menu</title>
	<SCRIPT LANGUAGE="JavaScript">
	dTree0001 = new dTree('dTree0001');
	dTree0001.add(0001, -1, '栏目树');
	//得取子菜单
	document.write('<s:iterator value="itemsList" var="item">');
	dTree0001.add('<s:property value="#item.id"/>','<s:property value="#item.parentId.id"/>',
			'<s:property value="#item.itemName"/>','<%=path%>/tree/getSubItemsListByPIdAction.do?id=<s:property value="#item.id"/>',
			'','itemframe');
	document.write('</s:iterator>');
	document.write("<span>" + dTree0001 + "</span>");
	  </SCRIPT>
</head>
<body>
</body>
</html>
