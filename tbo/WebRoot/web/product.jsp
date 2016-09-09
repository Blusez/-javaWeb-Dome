<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>product</title>
  <style type="text/css">
  *{margin:0;padding:0}
  body{font-family:"微软雅黑";}
  .title{width:200px;height:30px;margin:0 auto;font-size:24px;}
  .ulist{list-style:none;width:90%;margin:0 auto}
  .ulist li{width:100%;margin-top:25px;font-size:16px;margin-left:10px;font-size:16px}
  .ulist li input{width:100%;height:30px;text-indent:5px;min-width:300px;border:1px solid #ccc;outline:none;border-radius:3px}
  .ulist li input[type='button']{color:#fff;font-size:16px}
  .ulist li input[type='button']:hover{background:#333;cursor:pointer}
  .ulist li p{height:20px;border:1px solid transpaent;font-size:14px;margin-top:3px}
  .ulist li select{width:100px;height:30px;font-size:16px;margin-right:5px}
  .ulist li .option{width:80px;height:28px;background:#ccc;position:absolute;top:23px;right:0px;text-align:center;line-height:28px;
  text-decoration:none;color:#fff}
  .tishi{width:300px;height:150px;background:#fff;position:absolute;left:50%;bottom:100px;margin-left:-150px;
  box-shadow:0 0 10px #ccc;text-align:center;line-height:150px;font-size:18px;display:none}
  .success{color:blue}
  .fail{color:red}
  </style>
 </head>
 <body>
    <div class="title">
    订单信息添加
  </div>
  <ul class="ulist">
    <li><label>产品名称:<input type="text" name="productName" id="productName" placeholder="输入产品名称" autofocus></label>
	    <p></p>
	</li>
    <li>产品类型:<select name="opt" id="type">
	       <option value="">选择分类</option>
	       <option value="">家具分类</option>
	       <option value="">用具分类</option>
	       <option value="">桌子分类</option>
	       <option value="">椅子分类</option>
		 </select>
		 产品宽度:<select name="width">
	       <option value="">选择宽度</option>
	       <option value="">1米以下</option>
	       <option value="">2米-3米</option>
	       <option value="">3米-5米</option>
	       <option value="">5米-6米</option>
		 </select>
		 产品长度:<select name="long">
	       <option value="">选择长度</option>
	       <option value="">4米-6米</option>
	       <option value="">4米-6米</option>
	       <option value="">4米-6米</option>
	       <option value="">4米-6米</option>
		 </select>
		 产品高度:<select name="height">
	       <option value="">选择高度</option>
	       <option value="">1米-2米</option>
	       <option value="">1米-2米</option>
	       <option value="">1米-2米</option>
	       <option value="">1米-2米</option>
		 </select>
		 产品厚度:<select name="weight">
	       <option value="">选择厚度</option>
	       <option value="">1米-2米</option>
	       <option value="">1米-2米</option>
	       <option value="">1米-2米</option>
	       <option value="">1米-2米</option>
		 </select>
	   
	</li>
    <li><label>价钱:<input type="text" name="price" id="price" placeholder="输入产品价钱"></label>
	   <p></p>
	</li>
    <li style="position:relative"><label>样图:<input type="text" name="picture" id="picture" value="images/1.jpg"></label>
	    <a href="###" class="option">选择图片</a>
	    <input type="file" name="file" onchange="" style="display:none">
	</li>
  
    <li><input type="button" value="添加" onclick="addproduct()"></li>
  </ul>
  <div class="tishi"></div>
  <script type="text/javascript" src="<%=path%>/js/jquery-1.11.2.min.js"></script>
  <script>
       function addproduct(){
    	   var productName=$("#productName").val();
    	   var type=$("select[name='opt']").find("option:selected").text();
    	   var width=$("select[name='width']").find("option:selected").text();
    	   var length=$("select[name='long']").find("option:selected").text();
    	   var height=$("select[name='height']").find("option:selected").text();
    	   var hou=$("select[name='weight'").find("option:selected").text();
    	   var price=$("#price").val();
    	   var picture=$("#picture").val();
    	   var para={"product.productName":productName,"product.productType":type,"product.width":width,"product.lon":length,"product.hight":height,"product.weight":hou,"product.price":price,"product.picture":picture};
    	   $.ajax({
    		   type:"post",
    		   url:"<%=path%>/json/addproduct",
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