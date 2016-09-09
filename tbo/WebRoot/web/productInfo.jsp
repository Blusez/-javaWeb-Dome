<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>productInfo</title>
  <style type="text/css">
  *{margin:0;padding:0}
  *{margin:0;padding:0}
  .grade{border:4px solid #CFDFF4;margin:10px auto 0;border-radius:3px;height:450px}
  .grade .header{width:98%;height:30px;font-size:18px;color:#3A93D2;text-align:center;line-height:30px;background:#CFDFF4;margin:0 auto;margin-top:5px}
  .option{width:600px;height:30px;margin:0 auto;font-size:14px;margin-top:10px}
  input[type='text']{width:150px;height:24px;}
  input[type='button']{width:50px;height:26px;border:0;margin-left:5px;}
  input[type='button']:hover{background:#66cc99}
  table{width:98%;margin:0 auto;border-collapse:collapse;margin-top:10px}
  table tr{height:30px}
  table tr:hover{background:#ccc;transition:all 0.6s ease;}
  table tr td{text-align:center}
  table tr td a{text-decoration:none;color:#66cc99}
  table tr td img{width:40px;height:30px;margin-top:2px}
  </style>
 </head>
 <body>
    <div class="grade">
     <div class="header">
	    产品信息查询
	 </div>
	 <div class="option">
	    <form action="search()">
	    产品名称：
			<select>
				<s:iterator value="products" var="product">
				<option id="productName" ><s:property value="#product.productName"/></option>
				</s:iterator>
			</select>

			宽：
			<select>
				<s:iterator value="products" var="product">
				<option><s:property value="#product.width"/></option>
				</s:iterator>
			</select>
			长：
			<select>
				<s:iterator value="products" var="product">
				<option><s:property value="#product.lon"/></option>
				</s:iterator>
			</select>
			高：
			<select>
				<s:iterator value="products" var="product">
				<option><s:property value="#product.hight"/></option>
				</s:iterator>
			</select>
			厚度：
			<select>
				<s:iterator value="products" var="product">
				<option><s:property value="#product.weight"/></option>
				</s:iterator>
			</select>
	    <input type="button" value="查询" onclick="search()"></form>
	 </div>
	 <table>
	    <tr>
		  <th>产品名称</th>
		  <th>产品分类</th>
		  <th>产品宽度</th>
		  <th>产品长度</th>
		  <th>产品高度</th>
		  <th>产品厚度</th>
		  <th>产品价格</th>
		  <th>产品样图</th>
		 
		</tr>
		<c:forEach var="product" items="${products}">
		
		<tr>
		   <td>${product.productName}</td>
		   <td>${product.productType}</td>
		   <td>${product.width}</td>
		   <td>${product.lon}</td>
		   <td>${product.hight}</td>
		   <td>${product.weight}</td>
		   <td>￥:${product.price}</td>
		   <td><img src="${product.picture}"></td>
		  
		</tr>
		</c:forEach>
		
	 </table>
  </div>
  <script type="text/javascript" src="<%=path%>/js/jquery-1.11.2.min.js"></script>
  <script type="text/javascript">
     function search(){
    	 var productName=$("#productName").val();
    	 alert(productName);
    	 window.location.href="<%=path%>/findbyname?productName="+productName;
    	 
    	 
     }
  </script>
 </body>
</html>