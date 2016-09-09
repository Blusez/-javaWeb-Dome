<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><s:text name="application.title" /></title>
<script type="text/javascript">
//隐藏上部视图区
function changeTop() {
    window.parent.actioncument.all('bigFrame').rows = "0,10,*";
    var imageId = document.getElementById("img");
    var imgSrc = "<a href=" + "javascript:changeDown();" + "><img src='<%=pathSys%>/" + "images/down.gif' width='50' height='7' border='0'" + "></a>";
    imageId.innerHTML = imgSrc;
}

//显示上部视图区
function changeDown() {
    window.parent.actioncument.all('bigFrame').rows = "96,10,*";
    var imageId = document.getElementById("img");
    var imgSrc = "<a href=" + "javascript:changeTop();" + "><img src='<%=pathSys%>/" + "images/up.gif' width='50' height='7' border='0'" + "></a>";
    imageId.innerHTML = imgSrc;
}
</script>
</head>

<body>
<table style="border:1px solid #8facf8; border-right:1px solid #8facf8"  width="100%" cellpadding="0" cellspacing="0">
    <tr>
	  <td bgcolor="#d0ddff"  align="center" height="7"><div id="img"><A 
      href="javascript:changeTop();" onclick=""><IMG src="<%=pathSys %>/images/up.gif" 
      width=50 height=7 border=0 ></A></div></td>
	</tr>
</table>
</body>
</html>