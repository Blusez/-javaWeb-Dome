<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
 String path = request.getContextPath()+"";
 String pathSys = request.getContextPath()+"/sys";
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
<!--
   var contextPath='<%=path%>';
//-->
</script>
<link href="<%=pathSys%>/css/all.css" rel="stylesheet" type="text/css">
<link href="<%=pathSys%>/css/forms.css" rel="stylesheet" type="text/css">
<link href="<%=pathSys%>/css/frame.css" rel="stylesheet" type="text/css">
<script src="<%=pathSys%>/js/common_form.js" type="text/javascript"></script>
<script src="<%=pathSys%>/js/livevalidation.js" type="text/javascript"></script>
<script src="<%=pathSys%>/js/datepicker/WdatePicker.js" type="text/javascript"></script>