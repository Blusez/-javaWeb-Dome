<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>main</title>
  <style type="text/css">
  *{margin:0;padding:0}
  .header{height:50px;background:#53868B;}
  .header .h_left{width:150px;height:32px;float:left;margin:10px 0 0 700px;font-size:24px;color:#fff;padding-left:5px;line-height:32px}
  .header .h_right{float:right;width:210px;height:32px;margin-top:8px;margin-right:20px;}
  .header .h_right .ulist{list-style:none;}
  .header .h_right .ulist li{float:left;margin-left:10px;width:60px;height:24px;margin-top:6px}
  .header .h_right .ulist li a{display:block;text-decoration:none;border-radius:5px;background:#1A1A1A;text-align:center;line-height:24px;color:#fff} 
  .m_left{width:200px;background:#53868B;position:absolute;left:0;top:50px;height:90%;color:#fff}
  .m_left .ulist{list-style:none;}
  .m_left .ulist li{width:100%;height:40px;border-top:2px solid #000}
  .m_left .ulist li:last-child{border-bottom:2px solid #000}
  .select{background:#1A1A1A}
  .m_left .ulist li a{display:block;text-decoration:none;color:#fff;font-size:16px;text-align:center;line-height:40px;}
  .m_right{position:absolute;top:50px;left:200px;width:84%;height:90%;}
  .m_right .iframe{position:absolute;top:0px;left:0px;width:100%;height:100%;border:0}
  </style>
 </head>
 <body>
   <div class="header">
     <div class="h_left">家具购物</div>
     <div class="h_right">
	   <ul class="ulist">
	     <li><a href="<%=path%>/login.jsp">登录</a></li>
	     <li><a href="<%=path%>/web/register.jsp" target="rame">注册</a></li>
	     <li><a href="<%=path%>/login.jsp">退出</a></li>
	   </ul>
	 </div>
   </div>

   <div class="m_left">
     <ul class="ulist">
	   <li class="select"><a href="<%=path%>/blo/findcom.do" target="rame">商家信息查询</a></li>
	   <li><a href="<%=path%>/blo/findproductAction.do" target="rame">产品信息查询</a></li>
	   <li><a href="<%=path%>/web/product.jsp" target="rame">订单信息</a></li>
	 </ul>
   </div>
   <div class="m_right">
      <iframe src="<%=path%>/blo/fenyecomp.do" class="iframe" name="rame"></iframe>
   </div>

   <script type="text/javascript" src="<%=path%>/js/jquery-1.11.2.min.js"></script>
   <script>
     $(function(){
    	 var li=$(".m_left .ulist").find("li");
  	     li.mouseover(function(){
            $(this).addClass("select").siblings().removeClass("select");
  	     }); 
     });
   </script>
 </body>
</html>