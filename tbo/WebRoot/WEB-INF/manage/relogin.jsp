<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/common.jsp" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><s:text name="application.title" />
		</title>
		<script type="text/javascript">
		   function switchPage(){
		      window.top.open("<%=path%>/login/reloginAction.do","_self");
		   }
		</script>
	</head>

	<body onload="switchPage();">
	</body>
</html>
