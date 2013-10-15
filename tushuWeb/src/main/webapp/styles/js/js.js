//js.js
$(function(){
    $(".icon_updown").mouseenter(function(){
        //setTimeout(function(){
            $(".menuBox").stop(true,true).show();//slideDown("fast");
       // },500);
    });
    $(".menuBox").mouseleave(function(){
        $(this).stop(true,true).hide();//slideUp("fast");
    });

    if($("#shownotificatontip").html() == ""){
        $("#shownotificatontip").hide();
    }else{
        $("#shownotificatontip").css({display:"inline-block"});
    }

    if($("#showcarttip").html() == ""){
        $("#showcarttip").hide();
    }else{
        $("#showcarttip").css({display:"inline-block"});
    }

    $(".inpBox").focus(function(){
        $(this).addClass("inpBox_focus");
    }).blur(function(){
        $(this).removeClass("inpBox_focus");
    })
});

$(function(){
    $(".menuBox > div.upListFun").hover(function(){
        var a = $(this).index()-1;
        if(jQuery.browser.version == "6.0"){
            $(this).addClass("por").children(".navListMenu").css({filter:"none",zIndex:5,position:"relative",background:"url(../images/bg/selectBg.png) no-repeat 3px -205px"}).children("a").css({height:45,borderBottom:"1px solid #ababab",backgroundColor:"#f5f5f5"});
        }else{
            $(this).addClass("por").addClass("_hover");
        }
        $(".upListFun .ulList").eq(a).show()//.css({zIndex:50});
    },function(){
        var a = $(this).index()-1;
        if(jQuery.browser.version == "6.0"){
            $(this).addClass("por").children(".navListMenu").css({filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(src=/images/btn/menu_mid.png)",position:"static",background:"none"}).children("a").css({height:45,borderBottom:0,backgroundColor:"#F0F0F0"});
        }else{
            $(this).removeClass("por").removeClass("_hover");
        }
        $(".upListFun .ulList").eq(a).hide()//.css({zIndex:50});
    });

});
$(function(){
    var pb_num = $(".postBox li").size();
    if(pb_num > 1){
        $(".icon_post").Scroll({line:1,speed:1000,timer:3000});
    }
});
(function($){
    $.fn.extend({
        Scroll:function(opt,callback){
                //参数初始化
                if(!opt) var opt={};
                var _this=this.eq(0).find("ul:first");
                var        lineH=_this.find("li:first").height(), //获取行高
                        line=opt.line?parseInt(opt.line,10):parseInt(this.height()/lineH,10), //每次滚动的行数，默认为一屏，即父容器高度
                        speed=opt.speed?parseInt(opt.speed,10):500, //卷动速度，数值越大，速度越慢（毫秒）
                        timer=opt.timer?parseInt(opt.timer,10):4000; //滚动的时间间隔（毫秒）
                if(line==0) line=1;
                var upHeight=0-line*lineH;
                //滚动函数
                scrollUp=function(){
                        _this.animate({
                                marginTop:upHeight
                        },speed,function(){
                                for(i=1;i<=line;i++){
                                        _this.find("li:first").appendTo(_this);
                                }
                                _this.css({marginTop:0});
                        });
                }
                //鼠标事件绑定
                _this.hover(function(){
                        clearInterval(timerID);
                },function(){
                        timerID=setInterval("scrollUp()",timer);
                }).mouseout();
        }
    })
})(jQuery);

$(function(){
    $(".navList li a").removeClass("on")
    var locatUrl=window.location.href.split('?')[0];
    locatUrl=locatUrl.split('/');
    switch (locatUrl[locatUrl.length-1]) {
        case "" :
            $(".navList").children("li").eq(0).children("a").addClass("on");
            break;
        case "library.html" :
            $(".navList").children("li").eq(2).children("a").addClass("on");
            break;
        case "story.html" :
            $(".navList").children("li").eq(3).children("a").addClass("on");
            break;
        case "activity.html" :
            $(".navList").children("li").eq(4).children("a").addClass("on");
            break;
        default :
            var ss = locatUrl[locatUrl.length-1].split("-")[0];


            if(ss == "lists" || ss == "detail"){
                $(".navList").children("li").eq(1).children("a").addClass("on");
            }else{
                $(".navList").children("li").children("a").removeClass("on");
            }
    }



});

//dialog
function getW(){
    return $(window).width();
}
function getH(){
    return $(window).height();
}

//$("body").append("11");

function tsDialog(obj){
    var btnArr = obj.btnFun;


    var titleStr = "<span class='l'>"+obj.title+"</span><a href='#' title='关闭' class='r closeBtn'>关闭</a>"
    var contentStr  = $(obj.content).html() + "<div class='btn_dialog'>";
    for(var i=0;i<btnArr.length;i++){
        contentStr += "<a class='btnDia_"+btnArr[i][1]+"' href='javascript:"+btnArr[i][2]+"'>"+btnArr[i][0]+"</a>";
    }
        contentStr += "</div>"

    var htmlStr  = "<table class='tsTable'><tr><td class='d1_tl'></td><td class='d1_tc'>"+titleStr+"</td><td class='d1_tr'></td></tr>";
        htmlStr += "<tr><td class='d1_ml'></td><td class='d1_mc'>"+contentStr+"</td><td class='d1_mr'></td></tr>";
        htmlStr += "<tr><td class='d1_bl'></td><td class='d1_bc'></td><td class='d1_br'></td></tr></table><br /><br /><br />";

    //alert(htmlStr)
    $("body").append(htmlStr);


    //return false;
}

/*
function callbackFun(){

}

function closeDialog(){

}
*/

function setC(c_name,value,expiredays)
{
  var exdate=new Date();
    exdate.setDate(exdate.getDate()+expiredays);
    var domain = '.tushu.com';
    document.cookie=c_name+ "=" +escape(value)+
    ((expiredays==null) ? "" : ";expires="+exdate.toGMTString()) + ';domain='+domain;
}

function deleteCookie(name)
{
   var expdate = new Date();
  expdate.setTime(expdate.getTime() - (86400 * 1000 * 1));
  setC(name, "", expdate);
}

$(document).ready(function(){
  $('#href_logout').click(function(){
    deleteCookie('autokey');
    deleteCookie('MI');
    deleteCookie('autologinsessid');
  });
});

function getCookie(c_name)
{
	/**
	var c_value = document.cookie;
	var c_start = c_value.indexOf(" " + c_name + "=");
	if (c_start == -1)
	{
		c_start = c_value.indexOf(c_name + "=");
	}
	if (c_start == -1)
	{
		c_value = null;
	}
	else
	{
		c_start = c_value.indexOf("=", c_start) + 1;
		var c_end = c_value.indexOf(";", c_start);
		if (c_end == -1)
		{
			c_end = c_value.length;
		}
		c_value = unescape(c_value.substring(c_start,c_end));
	}
	**/

	var c_value = document.cookie;
	var pattern = '\s*' + c_name + '\s*=\s*([^\s\;\'\"]*)';
	var pattern = new RegExp(pattern, 'g');
	var tt = c_value.match(pattern);
	if (tt && tt.length>0) {
		for (var i in tt) {
			var x = tt[i];
			if (x) {
				var v = x.substr(x.indexOf('=')+1);
				if (v) {
					return v;
				}
			}
		}
	}
	//return c_value;
}
function setCookie(name,value, expired)
{
	var expire = arguments[2] ? arguments[2] : 365*24*60*60*1000;
	var exp = new Date();
	exp.setTime(exp.getTime() + expire);
	var domain = ".tushu.com";
	document.cookie = name + "="+ escape (value) + ";domain="+domain+";path=/;expires=" + exp.toGMTString();
}
function showPopup() {
		var notShowPatterns = [
				/user\/regok/
			];
		if (notShowPatterns.length>0) {
			var currentLocation = window.location.href;
			for (i in notShowPatterns) {
				if (currentLocation.match(notShowPatterns[i])) {
					return false;
				}
			}
		}
		var registerPopup = getCookie('register_popup');
		var registerPopupPromo = getCookie('register_popup_promo');
		if (registerPopup) {
			prefere_dialog(registerPopupPromo);
			setCookie('register_popup', '',1);
			deleteCookie('register_popup');
			setCookie('register_popup_promo', '',1);
			deleteCookie('register_popup_promo');
		}
	}


//登录或者注册成功后弹窗（优惠码发放）
function prefere_dialog(s_code){
    if(!s_code){
        return false;
    }
    $(function(){
        $("body").append('<div class="bd_bg"></div>');
        $(".bd_bg").height($("body").height()).css({zIndex:1});
    });
    tsDialog({
        title:"提示信息",
        content:'<div><div class="pop_yhm clearfix"><div class="pop_top ff_yahei"><h2 class="tc ff_yahei" style="border:0;">恭喜您获得<span class="fc_orange">个性lomo卡免费印制</span>特权！！</h2><p class="tc pt10">下单时使用此优惠码即享免费：<span class="fc_orange">'+s_code+'</span><a href="http://www.tushu.com/my/promos.html" target="_blank" class="ml20">查看我的优惠码&gt;&gt;</a></p><div class="clearfix mt15"><p class="l fs14 ff_yahei">您可以免费制作以下商品：</p><a href="http://www.tushu.com/lists-22001.html?from=tc" target="_blank" class="r qb_btn">查看全部免费商品</a></div><ul class="clearfix tc fs14"><li class="l clearfix"><a href="http://www.tushu.com/detail-6023.html?from=tc" target="_blank" class="block"><img src="/images/pop_dialog/commodities1-1.jpg" alt=""/><span>简简单单lomo卡</span></a><a href="http://www.tushu.com/product-6023.html?from=tc" target="_blank" class="js_made_btn">立即制作</a></li><li class="l clearfix ml8"><a href="http://www.tushu.com/detail-6022.html?from=tc" target="_blank" class="block"><img src="/images/pop_dialog/commodities1-2.jpg" alt=""/><span>多彩生活lomo卡</span></a><a href="http://www.tushu.com/product-6022.html?from=tc" target="_blank" class="js_made_btn">立即制作</a></li><li class="l clearfix ml8"><a href="http://www.tushu.com/detail-6008.html?from=tc" target="_blank" class="block"><img src="/images/pop_dialog/commodities1-3.jpg" alt=""/><span>标准明信片</span></a><a href="http://www.tushu.com/product-6008.html?from=tc" target="_blank" class="js_made_btn">立即制作</a></li><li class="l clearfix ml8"><a href="http://www.tushu.com/detail-6012.html?from=tc" target="_blank" class="block"><img src="/images/pop_dialog/commodities1-5.jpg" alt=""/><span>旅行明信片</span></a><a href="http://www.tushu.com/product-6012.html?from=tc" target="_blank" class="js_made_btn">立即制作</a></li></ul></div><div class="pop_bottom clearfix"><p class="tl pt10 ml20 clearfix">小贴士：<span class="fc_red2">制作其他涂书，下单时使用此优惠码立减10元。</span><a href="http://www.tushu.com/lists-21000.html?from=tc" target="_blank" class="qb_btn">查看全部商品</a></p><ul class="clearfix tc fs14"><li class="l clearfix"><a href="http://www.tushu.com/detail-38.html?from=tc" target="_blank" class="block"><img src="/images/pop_dialog/commodities2-1.jpg" alt=""/></a><a href="http://www.tushu.com/detail-38.html?from=tc" target="_blank">幻彩童年</a></li><li class="l clearfix ml5"><a href="http://www.tushu.com/detail-36.html?from=tc" target="_blank" class="block"><img src="/images/pop_dialog/commodities2-2.jpg" alt=""/></a><a href="http://www.tushu.com/detail-36.html?from=tc" target="_blank">童年的颜色</a></li><li class="l clearfix ml5"><a href="http://www.tushu.com/detail-25.html?from=tc" target="_blank" class="block"><img src="/images/pop_dialog/2_3.jpg" alt=""/></a><a href="http://www.tushu.com/detail-25.html?from=tc" target="_blank">我们的旅行日志</a></li><li class="l clearfix ml5"><a href="http://www.tushu.com/detail-19.html?from=tc" target="_blank" class="block"><img src="/images/pop_dialog/commodities2-4.jpg" alt=""/></a><a href="http://www.tushu.com/detail-19.html?from=tc" target="_blank">摄影画册</a></li><li class="l clearfix ml5"><a href="http://www.tushu.com/product-100003.html?from=tc" target="_blank" class="block"><img src="/images/pop_dialog/2_5.jpg" alt=""/></a><a href="http://www.tushu.com/product-100003.html?from=tc" target="_blank">炫彩微博书</a></li><li class="l clearfix ml5"><a href="http://www.tushu.com/detail-29.html?from=tc" target="_blank" class="block"><img src="/images/pop_dialog/commodities2-6.jpg" alt=""/></a><a href="http://www.tushu.com/detail-29.html?from=tc" target="_blank">花样年华</a></li></ul></div></div></div>',
        btnFun:[]
    });
    $(".tsTable").css({
        position:"absolute",
        zIndex:2,
        top:120,
        marginLeft:-774/2,
        left:"50%"
    });
    $(".closeBtn").bind("click",function(){
        $(".tsTable,.bd_bg").remove();
    });
}

function google_click_log(eventName) {
	_gaq.push(['_trackEvent', 'tushu', 'click', eventName,"1"]);
}

//添加到购物车 操作
function addToShoppingCart(productId){
	$.ajax({
        type:"post",
        url:"addToShoppingCart.html",
        data: {"productId":productId,
        	   "type":"SHOPPING_CART"},
        success:function(newSize){
            $("#shopping_cart").html(newSize);
        },
		error:function(){
			//alert("error");
		}
});
}
