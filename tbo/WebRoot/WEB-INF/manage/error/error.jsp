<%@ page language="java" errorPage="/error/error.jsp"  pageEncoding="utf-8"  %>

<html>
<head>
<title>Error</title><style type="text/css">
<!-- a:link       { text-decoration: none; color: #2222FF }
a:visited    { text-decoration: none; color: #2222FF }
a:active     { text-decoration: underline }
a:hover      { text-decoration: underline; color: #FF0000 }
body, table  { font-size: 10.5pt; text-decoration: none 10.5pt; line-height: 13pt;}
tr, td       { font-size: 10.5pt; WORD-WRAP: break-word;}
.e           { font-size: 9pt; text-decoration: none }
.ri           { font-size: 9pt; text-decoration: none }
--></style>
</head>

<body>

<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1" height="81">
  <tr>
    <td width="100%" height="50">
    <p align="center">
    <img border="0" src="<%=request.getContextPath()%>/error/images/error_title.gif" width="190" height="50"></td>
  </tr>
  <tr>
    <td width="100%" height="15"></td>
  </tr>
  <tr>
    <td width="100%" height="16">
    <p align="center"><b>
     
    </b></p>
    </td>
  </tr>
</table>
<p align="center">
<a href="javascript:history.back();">
<img border="0" src="<%=request.getContextPath()%>/error/images/error_return.jpg" width="480" height="200" alt="按这里返回上一页"></a></p>

</body>

</html>