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
       dTree0001.add(0001, -1, '数据字典');
      //得取子菜单
      document.write('<s:iterator value="baseDictList" var="st">');
      dTree0001.add('0001'+'<s:property value="#st.categoryId"/>',0001,'<s:property value="#st.categoryName"/>',
                 '<%=path%>/baseData/getSubBaseCodeListByPIdAction.do?categoryId=<s:property value="#st.categoryId"/>','','baseCodeframe');
      document.write('</s:iterator>');
      document.write("<span>" + dTree0001 + "</span>");
      
	  </SCRIPT>
</head>

<body>
</body>
</html>
