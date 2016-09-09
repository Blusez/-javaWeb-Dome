<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>zhuce</title>
  <style type="text/css">
  *{margin:0;padding:0}
  body{font-family:"微软雅黑";}
  .title{width:100px;height:30px;margin:0 auto;font-size:24px;}
  .ulist{list-style:none;width:90%;margin:0 auto}
  .ulist li{width:100%;margin-top:10px;font-size:16px;margin-left:10px;font-size:16px}
  .ulist li input{width:100%;height:30px;text-indent:5px;min-width:300px;border:1px solid #ccc;outline:none;border-radius:3px}
  .ulist li input[type='button']{color:#fff;font-size:16px}
  .ulist li input[type='button']:hover{background:#333;cursor:pointer}
  .ulist li p{height:20px;border:1px solid transpaent;font-size:14px;margin-top:3px}
   .tishi{width:300px;height:150px;background:#fff;position:absolute;left:50%;top:50%;margin-left:-150px;margin-top:-70px;
  box-shadow:0 0 10px #ccc;text-align:center;line-height:150px;font-size:18px;display:none}
  .success{color:blue}
  .fail{color:red}
  </style>
 </head>
 <body>
  <div class="title">
     注册用户
  </div>
  <ul class="ulist">
    <li><label>公司名称:<input type="text" name="compName" id="compName" placeholder="输入公司名称" autofocus></label>
	    <p></p>
	</li>
    <li><label>密    码:<input type="password" name="password" id="password" placeholder="输入密码"></label>
	   <p></p>
	</li>
    <li><label>联系人姓名:<input type="text" name="username" id="username" placeholder="输入联系人姓名"></label>
	   <p></p>
	</li>
    <li><label>邮箱地址:<input type="text" name="email" id="email" placeholder="输入邮箱地址"></label>
	   <p></p>
	</li>
    <li><label>手机号码:<input type="text" name="phono" id="phono" placeholder="输入手机号码"></label>
	   <p></p>
	</li>
    <li><label>营业执照:<input type="text" name="slience" id="slience" placeholder="输入营业执照"></label>
	   <p></p>
	</li>
    <li><input type="button" value="注册" onclick="zhuce()"></li>
  </ul>
  <div class="tishi"></div>
  <script type="text/javascript" src="<%=path%>/js/jquery-1.11.2.min.js"></script>
  <script>
     function zhuce(){
    	 var  compName=$("#compName").val();
    	 var  password=$("#password").val();
    	 var  username=$("#username").val();
    	 var  email=$("#email").val();
    	 var  phono=$("#phono").val();
    	 var  slience=$("#slience").val();
    	 var para={"user.compName":compName,"user.password":password,"user.username":username,"user.email":email,"user.phono":phono,"user.slience":slience};
    	 
    	 $.ajax({
    		 type:"post",
    		 url:"<%=path%>/json/register",
    		 data:para,
    		 success:function(data){
    			 if(data.result=="success"){
    				 $(".tishi").text("保存成功!").addClass("success").slideDown().delay(1000).slideUp();
    			 }else{
    				$(".tishi").text("保存失败!").addClass("fail").slideDown().delay(1000).slideUp();
    			 }
    		 }
    	 });
    	 
     }
  </script>
 </body>
</html>