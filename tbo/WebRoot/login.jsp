<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="web/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
  *{margin:0;padding:0}
  .logo{width:300px;height:400px;background:/* -webkit-linear-gradient(top,blue,#fff) */;position:absolute;top:50%;left:50%;margin-top:-200px;margin-left:-150px;box-shadow:0 0 10px #ccc;border-radius:5px;display:none}
  .logo .h_img{width:150px;margin:50px auto 30px;font-size:24px;;text-align:center;padding:5px;font-weight:500}
  .logo .ulist{list-style:none;width:180px;margin:0 auto;font-size:18px;}
  .logo .ulist li{height:32px;margin-bottom:5px;line-height:32px;}
  .logo .ulist li input{width:98%;height:92%;outline:none;text-indent:3px;border-radius:3px;border:0}
  .logo .ulist li input[type='button']{width:100%;height:100%;border:0;font-size:18px;color:#fff;margin-top:20px;outline:none}
  .logo .ulist li input[type='button']:hover{background:#333;cursor:pointer}
  .check{height:40px;background:red;font-size:18px;position:fixed;left:0;top:0;width:100%;opacity:0.7;display:none;text-align:center;line-height:40px;color:#fff}
  </style>
 </head>
 <body>
  <div class="check"></div>
  <div class="logo">
        <div class="h_img">
		  登 录
		</div> 
		<ul class="ulist">
		  <li>用户名：</li>
		  <li><input type="text" name="name" id="name" placeholder="请输入用户名" autofocus></li>
		  <li>密  &nbsp;码:</li>
		  <li><input type="password" name="passwd" id="passwd" placeholder="请输入密码"></li>
		  <li><a href="<%=path %>/web/main.jsp"><input type="button" value="用户登录" onclick="login()"></a></li>
		  <li><input type="button" value="管理员登陆" onclick="javascript:document.location.href='<%=path %>/login/reloginAction.do'"></li>
		  
		</ul>
  </div>

  <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
 <script>
     $(function(){
          $(".logo").fadeIn(1000);
	 });
    function login(){
    	 var comname=$("#name").val();
    	 var password=$("#passwd").val();
    	 $.ajax({
    		type:"post",
    		url:"<%=path%>/json/login",
    		data:{"comname":comname,"password":password},
    		success:function(data){
    			if(data.result=="success"){
    				window.location.href="<%=path%>/myher/loginsuccess";
    			}else{
    				 
    				 $(".check").html("登录失败!").slideDown(1000).slideUp(1000);
    			}
    		}
    	 });
    	 
     } 
  </script>
</body>
</html>