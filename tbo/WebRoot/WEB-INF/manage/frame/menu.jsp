<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--  
<meta name="decorator" content="none"/>
-->
<title><s:text name="application.title" /></title>

<link href="<%=pathSys %>/css/dtree.css" rel="stylesheet" type="text/css">
<script src="<%=pathSys %>/js/dtree.js" type="text/javascript"></script>
</head>
<script language="JavaScript"> 
/**
 *写出带有链接的子菜单
 */
function showitem(id,name)
{
	return ("<span><a href='"+id+"' target=_blank>"+name+"</a></span><br>")
}
 
/**
 *选择菜单项
 */
function switchoutlookBar(number){
	var i = outlookbar.opentitle;
	outlookbar.opentitle=number;
	var id1,id2,id1b,id2b
	if (number!=i && outlooksmoothstat==0){
		if (number!=-1){
			if (i==-1){
				id2="blankdiv";
				id2b="blankdiv";
			}else{
				id2="outlookdiv"+i;
				id2b="outlookdivin"+i;
				document.all("outlooktitle"+i).style.background=outlookbar.maincolor;
				document.all("outlooktitle"+i).style.color="#013368";
				document.all("outlooktitle"+i).style.textalign="center";
			}
			id1="outlookdiv"+number
			id1b="outlookdivin"+number
			document.all("outlooktitle"+number).style.background=outlookbar.maincolor; //title
			document.all("outlooktitle"+number).style.color="#013368";
			document.all("outlooktitle"+number).style.textalign="center";
			smoothout(id1,id2,id1b,id2b,0);
		}else{
			document.all("blankdiv").style.display="";
			document.all("blankdiv").sryle.height="100%";
			document.all("outlookdiv"+i).style.display="none";
			document.all("outlookdiv"+i).style.height="0%";
			document.all("outlooktitle"+i).style.background=outlookbar.maincolor;
			document.all("outlooktitle"+i).style.color="#013368";
			document.all("outlooktitle"+i).style.textalign="center";
		}
	}
}
function smoothout(id1,id2,id1b,id2b,stat){
	if(stat==0){
		tempinnertext1=document.all(id1b).innerHTML;
		tempinnertext2=document.all(id2b).innerHTML;
		document.all(id1b).innerHTML="";
		document.all(id2b).innerHTML="";
		outlooksmoothstat=1;
		document.all(id1b).style.overflow="hidden";
		document.all(id2b).style.overflow="hidden";
		document.all(id1).style.height="0%";
		document.all(id1).style.display="";
		setTimeout("smoothout('"+id1+"','"+id2+"','"+id1b+"','"+id2b+"',"+outlookbar.inc+")",outlookbar.timedalay);
	}else{
		stat+=outlookbar.inc;
		if (stat>100){
			stat=100;
		}
		document.all(id1).style.height=stat+"%";
		document.all(id2).style.height=(100-stat)+"%";
		if (stat<100){
			setTimeout("smoothout('"+id1+"','"+id2+"','"+id1b+"','"+id2b+"',"+stat+")",outlookbar.timedalay);
		}else{
			document.all(id1b).innerHTML=tempinnertext1;
			document.all(id2b).innerHTML=tempinnertext2;
			outlooksmoothstat=0;
			document.all(id1b).style.overflow="auto";
			document.all(id2).style.display="none";
		}
	}
}
 
function getOutLine(){
	outline="<table "+outlookbar.otherclass+">";
	for (i=0;i<(outlookbar.titlelist.length);i++){
		outline+="<tr><td name=outlooktitle"+i+" id=outlooktitle"+i+" "; 
		if (i!=outlookbar.opentitle) //当栏目没有打开时字体
			outline+=" nowrap align=center style='cursor:hand;background-image:url(<%=pathSys %>/images/title_bg.gif);color:#033266;height:26' ";
		else
			outline+=" nowrap align=center style='cursor:hand;background-image:url(<%=pathSys %>/images/title_bg.gif);color:#033266;height:26;' ";
		outline+=outlookbar.titlelist[i].otherclass
		outline+=" onclick='switchoutlookBar("+i+")'><span class=smallFont>";
		outline+=outlookbar.titlelist[i].title+"</span></td></tr>";
		outline+="<tr><td name=outlookdiv"+i+" valign=top align=left id=outlookdiv"+i+" style='width:100%;padding-left:10px;"
		if (i!=outlookbar.opentitle) //判断是否书写内容
			outline+=";display:none;height:0%;";
		else
			outline+=";display:;height:100%;";
		outline+="'><div name=outlookdivin"+i+" id=outlookdivin"+i+" style='overflow:auto;width:100%;height:100%'>";
		//展开项内容
        outline+=menuScript(i);
			//key为链接title为名字
		outline+="</div></td></tr>";
	}
	outline+="</table>";
	return outline;
}
 
function show(){
	var outline;
	outline="<div id=outLookBarDiv name=outLookBarDiv style='width=100%;height:100%'>";//整体的框架格局背景
	outline+=outlookbar.getOutLine();
	outline+="</div>";
	document.write(outline);
}
function theitem(intitle,instate,inkey){
	this.state=instate;
	this.otherclass=" nowrap ";
	this.key=inkey;
	this.title=intitle;
}
function addtitle(intitle){
	outlookbar.itemlist[outlookbar.titlelist.length]=new Array();
	outlookbar.titlelist[outlookbar.titlelist.length]=new theitem(intitle,1,0);
	return(outlookbar.titlelist.length-1);
}

function outlook(){
	this.titlelist=new Array();
	this.itemlist=new Array();
	this.divstyle="style='height:100%;width:100%;overflow:auto' align=center";
	this.otherclass="border=0 cellspacing='0' cellpadding='0' style='height:100%;width:100%'valign=middle align=center ";
	this.addtitle=addtitle;
	//this.additem=additem;
	this.starttitle=-1;
	this.show=show;
	this.getOutLine=getOutLine;
	this.opentitle=this.starttitle;
	this.reflesh=outreflesh;
	this.timedelay=50;
	this.inc=10;
	this.maincolor = "url(<%=pathSys %>/images/title_bg.gif) repeat-x"; 
}
 
function outreflesh(){
	document.all("outLookBarDiv").innerHTML=outlookbar.getOutLine();
}
 
function locatefold(foldname){
	if (foldname==""&&outlookbar.titlelist.length>0)
		foldname = outlookbar.titlelist[0].title
	for (var i=0;i<outlookbar.titlelist.length;i++)
	{
		if(foldname==outlookbar.titlelist[i].title)
		{
			outlookbar.starttitle=i;
			outlookbar.opentitle=i;
		}
	}
}
var outlookbar=new outlook();
var tempinnertext1,tempinnertext2,outlooksmoothstat;
outlooksmoothstat = 0;
</script>
<body>
<table id=mnuList style="WIDTH:170px;HEIGHT: 100%" cellspacing=0 cellpadding=0 align=center border=0>
	<tr> 
		<td bgcolor=#f1f5ff id=outLookBarShow style="HEIGHT: 100%" valign=top align=center name="outLookBarShow">
			<s:property value="strMenu" escape="false"/>
			<script language="JavaScript">
			<!--
			locatefold("")
			outlookbar.show() 
			//-->
			</script>
		</td>
	</tr>
</table>
</body>
</html>