
$(function(){    
	$("#win").css("opacity", 0);
    $("#btnShow").click(showwin);
    $("#close").click(hide);
});

function showwin(){
    //找到所对应的div节点
    var win=$("#win");
    //让该窗口显示出来    
    win.css("display","block");
     //从下往上慢慢升起
	win.animate({
        bottom: "-1px",
        opacity: 1
    },1000);
    
}

function hide()
{
    //找到所对应的div节点
    var win=$("#win");
    //让该窗口隐藏起来   
	win.animate({
        bottom: "-150px",
        opacity: 0
    },1000);		
}
