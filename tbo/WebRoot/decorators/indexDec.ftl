<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<noscript><iframe src=*.html></iframe></noscript>
<title><@s.property value="%{getText('application.title')}"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="keywords" content="河南天博科技发展有限公司,天博网络教育,网络改变教育，天博教育服务">
<meta http-equiv="description" content="河南天博科技发展有限公司,天博网络教育,网络改变教育，天博教育服务">
<link href="${base}/web/css/style.css" rel="stylesheet" type="text/css" />
<link href="${base}/web/css/menu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/web/js/msClass.js"></script>
<script type='text/javascript' src='${base}/web/js/jquery-1.6.min.js'></script>
<script type="text/javascript" src="${base}/web/js/common.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="${base}/web/images/logo.ico" />
<!-- 添加google数据分析功能 -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-29406894-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script type="text/javascript"> 
<!-- 
//document.oncontextmenu=function(e){return false;} 
//--> 
</script> 
</head>

<!--<body oncontextmenu=self.event.returnValue=false onselectstart="return false">-->
<body>
<table width="960" height="110" border="0" cellpadding="0" cellspacing="0" align="center" >
  <!-- 欢迎词栏 -->
  <tr >
    <td align="left" width="728" height="33" bgcolor="#f5f5f5" class="top_1">&nbsp;&nbsp;&nbsp;&nbsp;欢迎光临天博教育，零风险、零投入我们为您提供在线教育培训一体化解决方案 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color='red' size="2">热线电话：18838061533</font></td>
    <td width="350"  height="33" class="top_right" align="right" bgcolor="#f5f5f5" >
    	<a href="#" onclick="AddFavorite('http://www.tboedu.com','河南天博教育网')">收藏本站</a>&nbsp; |&nbsp;
    	<a href="#" onclick="SetHomepage('http://www.tboedu.com')">设为首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
  </tr>
  
  <tr>
    <td height="105" colspan="2" background="${base}/web/images/topbar.jpg">		
	</td>
  </tr>
  <tr>
    <td height="30" colspan="2" align="center" bgcolor="#f5f5f5">
    
    	<!--一级菜单-->
    	<div id="menu" class="men">
			<div id="menu1" class="menu" onmouseover="changeBackground(this);">
				<a href="${base}/web/getIndex.do?menuid=1" >首页</a>
			</div>
			<div id="menu2" class="menu" onmouseover="changeBackground(this);" >
				<a href="${base}/web/queryTrade.do?items.code=ITEM00101&type=1&news.id=ff74ea23-dcd3-4fe1-bfe4-62c0cec912c3&menuid=2">我们的服务</a>
			</div>
			<div id="menu3" class="menu" onmouseover="changeBackground(this);" >
				<a href="${base}/web/queryTrade.do?items.code=ITEM00102&type=1&news.id=40532f94-9585-4bcd-b245-5f01852ba4d4&menuid=3">平台功能</a>
			</div>
			<div id="menu4" class="menu" onmouseover="changeBackground(this);">
				<a href="${base}/web/queryTrade.do?items.code=ITEM00103&type=1&news.id=18c4b6f2-2f64-4202-be8d-4bd3704c1668&menuid=4">服务及流程</a>
			</div>
			<div id="menu5" class="menu" onmouseover="changeBackground(this);">
				<a href="${base}/web/queryTrade.do?items.code=ITEM00104&type=1&news.id=fc3b308b-f423-4fc8-b8a5-0f18b782d12e&menuid=5">我们的特色</a>
			</div>
			<div id="menu6" class="menu" onmouseover="changeBackground(this);">
				<a href="${base}/web/queryTrade.do?items.code=ITEM00105&page.pageIndex=1&menuid=6">公司资讯</a>
			</div>
			<div id="menu7" class="menu" onmouseover="changeBackground(this);">
				<a href="${base}/web/queryTrade.do?items.code=ITEM00106&type=1&news.id=a24fbf3f-b288-4b56-9cc5-9233ae9778cb&menuid=7">成功案例</a>
			</div>
			<div id="menu8" class="menu" onmouseover="changeBackground(this);">
				<a href="${base}/web/queryTrade.do?items.code=ITEM00107&type=1&news.id=441fb84b-54c6-481c-8de4-72a1fdec5a20&menuid=8">关于天博</a>
			</div>
			
		</div>
		<!--二级菜单 首页-->
		<div id="menu1m" class="menu1">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
				    <td><img src="${base}/web/images/note.gif" width="25" height="20"/></td>
					<td align="left" vAlign="middle"><b>最新资讯:</b>&nbsp;</td>
					<td width="690">
						<marquee scrollAmount="2" onmouseover=this.stop()   onmouseout=this.start()>
				          <span class="contentList">
				          	<#if todayNewsList?exists>
					            <#list todayNewsList as x>
					         		<a href="${base}/web/queryTrade.do?items.code=${todayNewsCode}&type=1&news.id=${x.id}" >${x.title}<#if x_has_next></#if></a>&nbsp;&nbsp;&nbsp;
					        	</#list>
					        </#if>
				          </span>
				        </marquee>
					</td>
					<td>
						<span id="time" style="margin-left:10px;"></span>
						<script>
							var str="&nbsp;";
							var todayDate = new Date();date = todayDate.getDate();month= todayDate.getMonth() +1;year= (todayDate.getYear() < 1900)?(1900 + todayDate.getYear()) : todayDate.getYear();day= todayDate.getDay();str="<font color='#920000'>今天是: ";if(navigator.appName == "Netscape" || navigator.appName =="Opera"){year= todayDate.getFullYear();str+=year+"年"+month+"月"+date+"日"+" ";}else if(navigator.appVersion.indexOf("MSIE") != -1){str+=year+"年"+month+"月"+date+"日"+" ";}switch (todayDate.getDay()){case 5: str+="星期五";break;case 6: str+="星期六";break;case 0: str+="星期日";break;case 1: str+="星期一";break;case 2: str+="星期二";break;case 3: str+="星期三";break;case 4: str+="星期四";break;}str+="</font>";
							$('#time').html(str);
						</script>
					</td>
				</tr>
			</table>
		</div>	
    </td>
  </tr>
</table>
<script type="text/javascript">
   <#if menuid?exists>
     cid="menu"+${menuid};
   <#else>
      cid="menu1";
   </#if>
   
	$("#"+ cid +" a").css("color","#f9112c");
	$("#"+cid).addClass("menuLB");
	$("#"+ cid).show();
</script>
${body}
<!--页脚 -->
<table width="960" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="10" align="center"></td>
  </tr>
  <tr valign='bottom'>
    <td height="35" background="${base}/web/images/index_05a.gif" align="center" >
    	<span class="footer">
    		<a href="${base}/web/queryTrade.do?items.code=ITEM00901&type=1&news.id=674d9711-3035-4d5e-a433-e271d0658dc8">联系我们</a> | 
    		<a href="${base}/web/queryTrade.do?items.code=ITEM00902&type=1&news.id=2d7ee08b-2cdd-4fa2-86f4-2e30c9494951">网站地图</a> | 
    		<a href="${base}/web/queryTrade.do?items.code=ITEM00903&type=1&news.id=7e9143bc-b913-4493-8f8c-641071231b10">服务条款</a> | 
    		<a href="${base}/web/queryTrade.do?items.code=ITEM00903&type=1&news.id=6f62a5c2-818e-4015-a950-856e12d9a9b9">招贤纳士</a> 
    	</span>
    </td>
  </tr>
  <tr>
    <td class="title1"  align="center"><span class="context">服务电话：18838061533   Email：<a href='mailto:tboedu@sohu.com' >tboedu@sohu.com</a></span></td>
  </tr>
  <tr>
    <td class="title1"  align="center">©
             <script type="text/javascript">
                 var d = new Date() 
                 document.write(d.getFullYear())
             </script> 
             河南天博科技发展有限公司 豫ICP07047148 &nbsp;&nbsp;</br><script src="http://s21.cnzz.com/stat.php?id=3894978&web_id=3894978&show=pic1" language="JavaScript"></script>
    </td>
  </tr>
</table>
</br>
</body>
</html>