<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/common.jsp" %>
<html>
  <head>
    <base href="<%=basePath%>">
	<title><s:text name="application.title" /></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=pathSys%>/css/login.css" />
	<script language="JavaScript">     
	if (window != top)     
	top.location.href = location.href;     
	</script> 
  <SCRIPT language=Javascript>
	   function fnShowMsg()
		{
			obj = arguments[0];
			sty = arguments[1];
			if(sty==1)
			  document.getElementById(obj).style.display	= "";
			else
			  document.getElementById(obj).style.display	= "none";
			  
		
		}
		
		//删除字符串头尾的空格
		function trim(str)
		{
		 while(str.charAt(0)==" ")
		 {
		  str=str.substr(1);
		 }
		 while(str.charAt(str.length-1)==" ")
		 {
		  str=str.substring(0,str.length-1);
		 }
		 return str;
		
		}
		
		function changepwd(id){
		    var pwd=window.open("admin_changepwd.jsp?id="+id,id,"toolbar=no,resizable=no,scrollbars=no,dependent,width=300,height=120");
		}
		
		//验证用户名密码，提交
		function login(){
			var username = document.LogonForm.loginName.value;
			username = trim(username);
			if(username == "")
			{
				fnShowMsg("AccountMsg",1);
				document.LogonForm.loginName.focus();
				return false;
			}else{
				fnShowMsg("AccountMsg",0);
			}
			
		
			var password = document.LogonForm.password.value;
			if(password == "")
			{
				fnShowMsg("PasswordMsg",1);
				document.LogonForm.password.focus();
				return false;
			}else{
				fnShowMsg("PasswordMsg",0);
			}
			
		   // document.LogonForm.submit();
		   submitForm();
		}
		</script>
		
		<script type="text/javascript">
		
		function GetCookieVal(offset)
		//get cookie value
		{
			var endstr = document.cookie.indexOf (";", offset);
			if (endstr == -1)
			endstr = document.cookie.length;
			return unescape(document.cookie.substring(offset, endstr));
		}
		function SetCookie(name, value) {
			var today = new Date();
			var expires = new Date();
			expires.setTime(today.getTime() + 1000*60*60*24*365);
			document.cookie = name + "=" + escape(value) + "; expires=" + expires.toGMTString();
		}
		function DelCookie(name)
		//delete Cookie
		{
			var exp = new Date();
			exp.setTime (exp.getTime() - 1);
			var cval = GetCookie (name);
			document.cookie = name + "=" + cval + "; expires="+ exp.toGMTString();
		}
		function GetCookie(name)
		//get cookie initialize value
		{
			var arg = name + "=";
			var alen = arg.length;
			var clen = document.cookie.length;
			var i = 0;
			while (i < clen)
			{
			var j = i + alen;
			if (document.cookie.substring(i, j) == arg)
			return GetCookieVal (j);
			i = document.cookie.indexOf(" ", i) + 1;
			if (i == 0) break;
			}
			return null;
		}
		
		function submitForm(){
			if(document.LogonForm.isRememberMsg.checked){
			
				SetCookie("loginName",document.LogonForm.loginName.value);
				SetCookie("password",document.LogonForm.password.value);
				SetCookie("isRememberMsg","1");
			}else{
			
				DelCookie("loginName");
				DelCookie("password");
				SetCookie("isRememberMsg","0");
			}
				
			 document.LogonForm.submit();
		}
		
		//初始化，返回原有的cookie值
		function initValue(){
			var isRMsg;
			var vAccount;
			var vPassword;
			isRMsg = GetCookie("isRememberMsg");
			if(isRMsg==1){
				vAccount = GetCookie("loginName");
				vPassword = GetCookie("password");
				document.LogonForm.isRememberMsg.checked = true;
				document.LogonForm.loginName.value = vAccount;
				document.LogonForm.password.value = vPassword;
			}
		}
	</script>
</head>

<body onload="initValue();">
<form name="LogonForm" method="post" action="<%=path%>/login/loginAction.do">
<div id="Container"><!--页面层容器-->
	<div id="loginBody"><!--登录主体容器-->
		<div id="title"><span class="software_name"><s:text name="application.title" /></span></div><!--登录标题容器-->
	  	<div id="main"><!--登录主体-->
			<div id="main_left"><img src="<%=pathSys%>/images/left.jpg"></div><!--登录主体左侧图片容器-->
			<div id="main_right"><!--登录主体右侧容器-->
				<div id="list"><img src="<%=pathSys%>/images/login.jpg"></div>
					<div id="div_height">帐号：<INPUT  class=input name="loginName" value="" size=15 onkeydown="js:if(event.keyCode==13) password.focus();"  ></div>
					<div id="div_height"><img src="<%=pathSys%>/images/button_login.jpg" width="84" height="22" border="0" style="CURSOR: hand"  onClick="login();"></div>
				
					<div id="div_height">密码：<INPUT  class=input type=password  name="password" value="" size=15  onkeydown="javaScript:if(event.keyCode==13) login();"  ></div>
					<div id="div_height"><img src="<%=pathSys%>/images/button_huan.jpg" width="84" height="22" border="0" style="CURSOR: hand" onClick="LogonForm.reset();fnShowMsg('AccountMsg',0);fnShowMsg('PasswordMsg',0);" ></div>
				
				<div id="list">
					<input type="checkbox" name="isRememberMsg" value="记住密码">记住密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%-- <input type="button" value="   注     册   " onclick="javascript:document.location.href='<%=path%>/login/regAction.do'"> --%>
				</div>
		  </div>
		</div>
		<center>
	        <font color="red" align="center">
        <div id="AccountMsg" style="display:none">用户名不能为空
        </div>
        <div id="PasswordMsg" style="display:none">密码不能为空
        </div>
        </br>
        <div id="ErrMsg" style="width:590px;text-algin:center;">
       		<s:property value="tips"/>
        </div>
		</font>
	</center>
	</div>
</div>



</form>
 <!-- setfocus to account -->
  	<script>
    	document.all("loginName").focus();
	</script>
</body>


</html>
