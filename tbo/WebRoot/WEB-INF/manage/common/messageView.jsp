<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<html>
<head>
<title>系统提示信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>
<div class="history-item">
  <div class="title">提示信息</div>
  <div class="history-item-content">
	<table class="formTable">
	  <tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr>
		<td>&nbsp;</td>
		<td><s:property value="errorMessage"/></td>
		<td>&nbsp;</td>
		</td>
	  </tr>
	  <tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	  </tr>
	</table>
	<div align="center">
	<input type="button" value="返 回" class="button_tt" onClick="history.go(-1);">
	</div>
	</form>
  </div>
</div>
</body>
</html>