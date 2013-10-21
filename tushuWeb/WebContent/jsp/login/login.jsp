<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>涂书网 - 个性图书定制分享平台</title>
<link href="http://www.tushu.com/user/images/favicon.ico" mce_href="images/favicon.ico" rel="bookmark" type="image/x-icon">
<link href="http://www.tushu.com/user/images/favicon.ico" mce_href="images/favicon.ico" rel="icon" type="image/x-icon">
<link href="http://www.tushu.com/user/images/favicon.ico" mce_href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
<link type="text/css" rel="stylesheet" href="<%=path%>/styles/css/base.css">
<link type="text/css" rel="stylesheet" href="<%=path%>/styles/css/common1.css">

<script src="<%=path%>/styles/js/ga.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/styles/js/jquery-1.js"></script>
<script type="text/javascript" src="<%=path%>/styles/js/js.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		showPopup();
	});
</script>

<style type="text/css">

    .index_header{border-bottom:2px solid #fa5000;}
    .index_nav{position:relative;height:33px;margin-top:36px;}
    .index_nav ul{}
    .index_nav li{display:inline;}
    .index_nav .nav_link{padding:0 16px;height:33px;font:normal 16px/33px "microsoft yahei";display:inline-block;}
    .index_nav .nav_link i{border-color:#6d6d6d #fff #fff;border-style:solid;border-width:5px 5px 0;width:0;height:0;display:inline-block;vertical-align:middle;margin-left:12px;}
    .index_nav .nav_link:hover,.index_nav .nav_link_hover{color:#fff;background-color:#fa5000;text-decoration:none;}
    .index_nav .nav_link:hover i,.index_nav .nav_link_hover i{border-color:#fff #fa5000 #fa5000;}
    .nav_list{width:493px;position:absolute;z-index:3;border:1px solid #fa5000;padding:10px 15px;background-color:#fff;top:33px;right:0;line-height:24px;;display:none;}

    .nav_list li.clearfix{border-bottom:1px solid #ddd;display:block;padding:5px 0;float:left;width:100%;}
    .nav_list li strong{font-size:14px;color:#333;}
    .nav_list ul{width:415px;}
    .nav_list li a{color:#666;white-space:nowrap;}
    .nav_list li a:hover{color:#fa5000;text-decoration:none;}

    .fgf{margin:0 3px;color:#ddd;}
    .noBorder{border:none!important;}
    .nl_book{background:url(/images/index/bg/book.jpg) no-repeat bottom right #fff;padding:10px 15px 62px;}
    .nl_log{background:url(/images/index/bg/log.jpg) no-repeat top right #fff;padding:7px 190px 30px 20px;;width:313px;}
    .nl_log ul{width:255px;}
</style>
</head>
<body>
<!-- here -->
<c:choose>
	<c:when test="${sessionUserName != null}">
		<%@ include file="../logined.jsp"%>
	</c:when>
	<c:otherwise>
		<%@ include file="../not_login.jsp"%>
	</c:otherwise>
</c:choose>
	<%@ include file="../header.jsp"%>
    <script type="text/javascript">
        $(".index_nav > li").hover(function(){
            $(this).children(".nav_link").addClass("nav_link_hover");
            $(this).children(".nav_list").show();
        },function(){
            $(this).children(".nav_link").removeClass("nav_link_hover");
            $(this).children(".nav_list").hide();
        })
    </script>
<div class="contentBox pt10 pb20">
    <div class="m w980">
        <div class="loginBg">
            <div class="loginBox">
                <h1 class="pl45">欢迎登录涂书网账户</h1>
                <div class="pl45">
                    <div class="loginText"><label style="display: block;" class="poa fc_gray6 label_email">请输入注册的电子邮箱</label>
                    	<input name="username" type="text">
                    </div>
                    <div class="err hide" style="margin-left:0;"></div>
                    <div class="loginText mt10"><label class="poa fc_gray6">密码</label>
                    	<input name="password" type="password">
                    </div>
                    
                    <div class="err hide" style="margin-left:0;"></div>
                    <div class="pt20 clearfix"><input id="autoCheck" class="mr5 vam" type="checkbox"><label class="vam" for="autoCheck">自动登录</label></div>
                    <div class="pt25">
                    	<input value="登 录" class="btn_orange_s vam" id="login_submit" type="button">
                    	<a href="###" class="ml10 fc_gray4 fs13">忘记密码？</a>
                    </div>
                    <div class="pt25">用合作网站账号登录：
                    <a href="###" class="icon_sina_hover" title="新浪微博帐号登录"></a>
                    <a href="###" class="icon_renren_hover" title="人人网帐号登录"></a>
                    <a href="###" class="icon_qq_ehover" title="腾讯QQ帐号登录"></a></div>
                </div>
                <div class="loginBottom mt30">
                    <input name="rewrite_url" value="" type="hidden">
                    <a href="###" class="btn_gray1">立即注册</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        $(".bindBox a").click(function(){
            $(this).addClass("on").siblings().removeClass("on");
            $(".form_"+($(this).index()+1)).removeClass("hide").siblings().addClass("hide");
        });
        var txtVal = $(".loginText input[type=text]").val();
        if(txtVal != ""){
            $(".loginText input[type=text]").prev().hide();
        }
        $(".loginText label").click(function(){
            $(this).hide().next().focus();
        });
        $(".loginText input").focus(function(){
            $(this).prev().hide();
			$(this).parent().next().addClass('hide');
        });
		$(".loginText password").focus(function(){
            $(this).prev().hide();
			$(this).parent().next().addClass('hide');
        });
        $(".loginText input").blur(function(){
            if($(this).val() == ""){
                $(this).prev().show();
            }
        });
        $("input[name=password]").keydown(function(event){
            if(event.keyCode == 13){
                $("#login_submit").focus();
            }
        })

        $("#login_submit").bind('click', function(){
            checkloginform();
        });
    });

    function checkloginform()
    {
        var username = $("input[name=username]").val();
        if(username == '')
        {
            $('.loginText input[name=username]').parent().next().html('邮箱不能为空！').removeClass('hide');
            return false;
        }
        var password = $("input[name=password]").val();
        if(password == '')
        {
            $('.loginText input[name=password]').parent().next().html('密码不能为空！').removeClass('hide');
            return false;
        }


        var rewrite_url = $("input[name=rewrite_url]").val();
        if(rewrite_url == ''){
            urls = '/';
        }else {
            urls = rewrite_url;
        }
        var autologin = 0;
        if($("#autoCheck").attr("checked") == 'checked'){
            autologin = 1;
        }

        $.ajax({
                type:"post",
                url:"login.html",
                data:"password=" + password +"&username=" + username + "&autologin=" + autologin,
                success:function(state){
                    if(state == '200'){
                        window.location = '<%=path%>/index/index.html';
                    }else if(state == 'admin'){
                    	window.location = '<%=path%>/admin/index.html';
                    }
                    else
                    {
                        $('.loginText input[name=password]').parent().next().html('邮箱或密码错误！').removeClass('hide');
                        return false;
                    }
                },
				error:function(){
					//alert("error");
        		}
        });
    }
    $(".label_email").css('display', 'none');
    $("input[name=username]").focus();
    $('input[name=password]').bind("keydown",keySubmit);
    $('#autoCheck').bind("keydown",keySubmit);
    function keySubmit(e){
        var key = window.event ? e.keyCode : e.which;
        if (key == 13)
        {
            checkloginform();
        }
    }
</script>

<%@ include file="../footer.jsp"%>

<!--谷歌Google Analytics代码-->
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-27037508-1']);
	_gaq.push(['_trackPageview']);

	(function() {
	  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();
</script>
<!--****-->

<div style="display: none;">
	<!--百度统计代码-->
	<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F20301d57224db44ce1820fbf43208d85' type='text/javascript'%3E%3C/script%3E"));



</script><script src="<%=path%>/styles/js/h.js" type="text/javascript">
</script><a href="http://tongji.baidu.com/hm-web/welcome/ico?s=20301d57224db44ce1820fbf43208d85" target="_blank">
<img src="<%=path%>/styles/images/21.gif" border="0" height="20" width="20"></a>
</div>
<!--****-->
</body>
</html>