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
