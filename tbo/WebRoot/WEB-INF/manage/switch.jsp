<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><s:text name="application.title" />
		</title>
		<%
		String path = request.getContextPath();
		%>
		<script type="text/javascript">
		   function switchPage(){
		      window.top.open("<%=path %>/WEB-INF/manage/login.jsp","_self");
		   }
		</script>
	</head>

	<body onload="switchPage();">
	</body>
</html>
