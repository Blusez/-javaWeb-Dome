var cid="menu1";
function changeBackground(div){
	$(".menu").removeClass("menuLB");
	$(".menu a").css("color","#000");

	$("#"+div.id).addClass("menuLB");
	$("#"+div.id+" a").css("color","#f9112c");
    
//	$(".menu1").hide();
//	$("#"+cid).show();
//	cid=div;
}

//url：要收藏的链接；title：收藏项的名称
function AddFavorite(url, title)
{
    //如果url或者title为空，默认为当前页面url和title。
    if (!(url && title))
    {
        url = document.URL;
        title = document.title;
    }

    if (document.all)//IE
    {
        window.external.addFavorite(url, title);
    }
    else if (window.sidebar)//火狐
    {
        window.sidebar.addPanel(title, url, "");
    }
}

//url：要设置为首页的链接
function SetHomepage(url)
{
    //如果url为空，默认为当前页面url。
    if (!url)
    {
        url = document.URL;
    }

    if (document.all)//IE 
    {
        document.body.style.behavior = 'url(#default#homepage)';
        document.body.setHomePage(url);
    }
    else if (window.sidebar)//火狐
    {
        if (window.netscape)
        {
            try
            {
                window.netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            }
            catch (e)
            {
                alert("此操作被浏览器拒绝！请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
            }
        }
        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
        prefs.setCharPref('browser.startup.homepage', url);
    }
}

test = "";
$(function()
{
    $(".MainNavA").removeClass("current");
    window.name ? $(".MainNavA:contains(" + window.name + ")").addClass("current") : $(".MainNavA:eq(0)").addClass("current");
    $(".MainNavA").click(function()
    {
        window.name = $(this).text();
    });

    $(".MainNavB").removeClass("curry");
    window.name ? $(".MainNavB[lang=" + window.name + "]").addClass("curry") : $(".MainNavB:eq(0)").addClass("curry");
    $(".MainNavB").click(function()
    {
        window.name = $(this).attr("lang");
    });

    $(".MainNavC").removeClass("curry02");
    if (window.name.indexOf("_") > 0)
    {
        var i = window.name.indexOf("_");
        window.name ? $(".MainNavA:contains('关于天博')").addClass("current") : $(".MainNavA:eq(0)").addClass("current");
        window.name ? $(".MainNavC[lang=" + window.name.substr(i+1) + "]").addClass("curry02") : $(".MainNavC:eq(0)").addClass("curry02");
    }
    if (window.name == "关于天博")
    {
        window.name ? $(".MainNavC[lang='公司简介']").addClass("curry02") : $(".MainNavC:eq(0)").addClass("curry02");
    }
    $(".MainNavC").click(function()
    {
        window.name = "关于天博_" + $(this).attr("lang");
    });
});    