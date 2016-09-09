<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><s:text name="application.title" /></title>
<script type="text/javascript">
//隐藏整个视图区
function changeLeft() {
    window.parent.parent.actioncument.all('main').cols = "10,*";
    var imageId =document.all('image');
    var imgSrc = "<a href=" + "javascript:showRight();" + "><img src='<%=pathSys%>/" + "images/open.gif' width='7' height='50' border='0'" + "></a>";
    imageId.innerHTML = imgSrc;
}

//显示整个视图区
function showRight() {
    window.parent.parent.actioncument.all('main').cols = "180,*";
    var imageId =document.all('image');
    var imgSrc = "<a href=" + "javascript:changeLeft();" + "><img src='<%=pathSys%>/" + "images/close.gif' width='7' height='50' border='0'" + "></a>";
    imageId.innerHTML = imgSrc;
}
</script>
</head>

<body>
<table style="border-left:1px solid #8facf8; border-right:1px solid #8facf8"  height="100%" cellpadding="0" cellspacing="0">
    <tr>
	  <td bgcolor="#d0ddff" valign="middle" width="6" height="100%"><div id="image"><A 
      href="javascript:changeLeft();"><IMG src="<%=pathSys%>/images/close.gif" 
      width=6 height=47 border=0 ></A></div></td>
	</tr>
</table>
</body>
</html>