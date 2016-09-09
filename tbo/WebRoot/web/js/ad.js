var lastScrollY=0;     
function heartBeat(){    
var diffY;     
if (document.documentElement && document.documentElement.scrollTop)     
    diffY = document.documentElement.scrollTop;     
else if (document.body)     
    diffY = document.body.scrollTop     
else     
    {/*Netscape stuff*/}     
         
percent=.1*(diffY-lastScrollY);      
if(percent>0)percent=Math.ceil(percent);      
else percent=Math.floor(percent);      
document.getElementById("adleft").style.top=parseInt(document.getElementById("adleft").style.top)+percent+"px";     
document.getElementById("adright").style.top=parseInt(document.getElementById("adright").style.top)+percent+"px";     
lastScrollY=lastScrollY+percent;      
}     
   
function adhide(){
	document.getElementById("adleft").style.display='none';
	document.getElementById("adright").style.display='none';
}    
function screencl(){if(screen.width<=800){adhide();}}    
zcode="<div id='adleft' style='left:10px;position: absolute;z-index:1;top:100px;'><div style='width:100px;height:300px;background:#ccc;border:#999 solid 1px;'>左联</div><img src='web/images/close.gif' alt='关闭' title='关闭' onclick=adhide() style='cursor:pointer;margin-left:50px;'></div>";    
ycode="<div id='adright' style='right:10px;position: absolute;z-index:1;top:100px;'><div style='width:100px;height:300px;background:#ccc;border:#999 solid 1px;'>右联</div><img src='web/images/close.gif' alt='关闭' title='关闭' onclick=adhide() style='cursor:pointer'></div>";    
document.write(zcode);    
document.write(ycode);    
screencl();    
window.setInterval("heartBeat()",1);