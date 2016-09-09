<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>factoryInfo</title>
  <style type="text/css">
  .title{width:200px;height:30px;margin:0 auto;font-size:24px;}
  *{margin:0;padding:0}
  .grade{border:4px solid #CFDFF4;margin:10px auto 0;border-radius:3px;height:480px}
  .grade .header{width:98%;height:30px;font-size:18px;color:#3A93D2;text-align:center;line-height:30px;background:#CFDFF4;margin:0 auto;margin-top:5px}
  .option{width:600px;height:30px;margin:0 auto;font-size:14px;margin-top:10px}
  input[type='text']{width:150px;height:24px;}
  input[type='button']{width:50px;height:26px;border:0;margin-left:5px;}
  input[type='button']:hover{background:#66cc99}
  table{width:98%;margin:0 auto;border-collapse:collapse;margin-top:10px;font-size:14px;font-weight:500}
  table tr{height:30px}
  table tr td{text-align:center}
  table tr td a{text-decoration:none;color:#66cc99}
  table tr td img{width:40px;height:30px;margin-top:2px}
  table tr:hover{background:#ccc;transition:all 0.6s ease;}
  .page{margin-top:5px;float:right;}
  </style>
  <link type="text/css" href="<%=path%>/css/layout.css" rel="stylesheet">
  <link type="text/css"  href="<%=path%>/css/magic.css" rel="stylesheet">
  <script type="text/javascript" src="<%=path%>/js/tmDialog.js"></script>
  
  
 </head>
 <body>
    <div class="grade">
     <div class="header">
	    厂家信息查询
	 </div>
	 <div class="option">
	    <form action="###">厂家名称:<input type="text" id="companyName" name="companyName" autofocus placeholder="输入厂家名称"><input type="button" value="查询" onclick="search();"></form>
	 </div>
	 <table>
	    <tr>
		  <th>厂家名称</th>
		  <th>联系人</th>
		  <th>所属分类</th>
		  <th>电子邮箱</th>
		  <th>手机</th>
		  <th>QQ</th>
		  <th>地址</th>
		  <th>点击次数</th>
		  <th>logo</th>
		  <th>排序号</th>
		  <th>是否置顶</th>
		  <th>是否删除</th>
		</tr>
		
		<c:forEach var="factory" items="${fa}">
		   <tr class="tr_items">
		   <td>${factory.compName}</td>
		   <td>${factory.username}</td>
		   <td>${factory.type}</td>
		   <td>${factory.email}</td>
		   <td>${factory.phono}</td>
		   <td>${factory.qq}</td>
		   <td>${factory.address}</td>
		   <td>${factory.clicknum}</td>
		   <td><img src="${factory.logo}"></td>
		   <td>${factory.sort}</td>
		   <td><a href="###">置顶</a></td>
		   <td><a href="javascript:void(0)" onclick="deleteCom(this)" data-opid="${factory.id}">删除</a></td>
		</tr>
		</c:forEach>
	</table>
  </div>
  <div class="page" id="page"></div>
  <script type="text/javascript" src="<%=path%>/js/jquery-1.11.2.min.js"></script>
  <script type="text/javascript" src="<%=path%>/js/jquery.pagination.js"></script>
  <script type="text/javascript">
     var total="${result}";
     $(function(){
    	 
    	 $(".page").pagination(total, {
				num_display_entries : 3, //主体页数
				num_edge_entries : 4,//边缘页数
				current_page : 0,//指明选中页码
				items_per_page : 10, //每页显示多条条
				prev_text : "首页",
				next_text : "尾页",
				showGo:true,//控制是否显示go 页 ,默认是true
				showSelect:true,//控制是否现在下拉框 默认是true
				callback : function(pageNo, psize) {//会回传两个参数一个当前页，显示的页数
					alert(pageNo);
				}
			}); 
     });
     
    
			
		
     function  deleteCom(obj){
    	 tm_dialoag({content:"请确定删除吗?",callback:function(ok){
    		  if(ok){
		    	 var opid=$(obj).data("opid");
    			  $.ajax({
    				  type:"post",
    				  url:"<%=path%>/json/delete",
    			      data:{"id":opid,"isdele":0},
    			      success:function(data){
    			    	  if(data.result=="success"){
    			    		  $(obj).parents(".tr_items").fadeOut("slow",function(){
    			    			  $(this).remove();
    			    		  });
    			    	  }else{
    			    		  alert("删除失败");
    			    	  }
    			      }
    			      
    			  });
    			  
    		  }
    	 }});
    	 
     }
     
     function search(){
    	 var $name=$("#companyName").val();
    	
    	 window.location.href="findcombyname?comname="+$name;
     }
  </script>
 </body>
</html>