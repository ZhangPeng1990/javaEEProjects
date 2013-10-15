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
<link type="text/css" rel="stylesheet" href="<%=path%>/styles/css/base.css?1378625426" />
<link type="text/css" rel="stylesheet" href="<%=path%>/styles/css/common.css?1378625426" />
<link href="<%=path%>/styles/images/favicon.ico" mce_href="images/favicon.ico" rel="bookmark" type="image/x-icon" />
<link href="<%=path%>/styles/images/favicon.ico" mce_href="images/favicon.ico" rel="icon" type="image/x-icon" />
<link href="<%=path%>/styles/images/favicon.ico" mce_href="images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<script type="text/javascript" src="<%=path%>/styles/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/styles/js/js.js?1378625426"></script>
<script type="text/javascript">
    if (window.opener) {
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
    .nl_book{background:url(<%=path%>/styles/images/index/bg/book.jpg) no-repeat bottom right #fff;padding:10px 15px 62px;}
    .nl_log{background:url(<%=path%>/styles/images/index/bg/log.jpg) no-repeat top right #fff;padding:7px 190px 30px 20px;;width:313px;}
    .nl_log ul{width:255px;}
</style>
</head>
<body>
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
        <div class="signBox">
            <div class="signTitleBox">
                <h1 class="l">注册涂书网账户</h1>
                <span class="r">已有账号？<a href="###" class="fc_orange">点击登录&gt;&gt;</a> 或使用合作账号登录 <i>|</i>
                <a href="###" class="icon_sina_hover">微博登录</a><i>|</i>
                <a href=### class="icon_rr_hover">人人登录</a><i>|</i>
                <a href="###" class="icon_q_hover">QQ登录</a></span>
            </div>
            <div class="m formBox">
                <fieldset>
                    <label>邮箱：</label>
                    <div class="textBox"><input type="text" name="email" /></div>
                    <div class="errorText">请输入联络用邮箱地址</div>
                </fieldset>
                <fieldset>
                    <label>密码：</label>
                    <div class="textBox"><input type="password" name="password" /></div>
                    <div class="errorText">密码长度为6位以上数字和字母组成的字符</div>
                </fieldset>
                <fieldset>
                    <label>确认密码：</label>
                    <div class="textBox"><input type="password" name="confirm_password" /></div>
                    <div class="errorText">密码长度为6位以上数字和字母组成的字符</div>
                </fieldset>
                <div class="pl130 fc_gray4 fs13 lh24">
                <input type="checkbox" id="is_accept_terms" class="vam mr5" checked />
                <span class="vam">同意并愿意遵守涂书网
                	<a href="/fuwu.html" target="_blank" class="fc_orange">用户协议</a>
                	和<a href="/privacy.html" target="_blank" class="fc_orange">隐私政策</a>
                </span>
                </div>
                <div class="pl130 pt20"><input class="btn_orange" name="submitBtn" type="button" value="立即注册" /></div>
                <input name="rewrite_url" type="hidden" value="<%=path%>/index/index.html">
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
var inpBl = [],inpVal = [];
for(var i=0;i<$("fieldset").length;i++){
    inpBl[i] = false;
}
var errArr = [
    "该用户已被注册",                      //errArr[0]
    "用户名过短 6~18位",                   //errArr[1]
    "用户名过长 6~18位",                   //errArr[2]
    "用户名不能为空",                      //errArr[3]
    "只能中文 数字、英文大小写字母 和-_",   //errArr[4]

    "邮箱不能为空",                        //errArr[5]
    "邮箱格式不正确",                      //errArr[6]
    "邮箱已注册",                          //errArr[7]

    "密码不能为空",                        //errArr[8]
    "密码必须6~18位",                      //errArr[9]
    "确认密码不能为空",                    //errArr[10]
    "确认密码必须6~18位",                //errArr[11]
    "密码与确认密码不一致",                //errArr[12]
];

var tipText;
var tipTexts = new Array();
var $userName = /^[\u4e00-\u9fa5_a-zA-Z0-9/-]+$/               //匹配中文,英文字母和数字及
//var $email = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/  //email
var $email = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,}){1,})$/;



//$("input[name=username]").bind("focus",inpFocus).bind("blur",userAction);
$("input[name=email]").bind("focus",inpFocus).bind("blur",emailAction);
$("input[name=password]").bind("focus",inpFocus).bind("blur",pwAction).keydown(function(event){if(event.keyCode == 13){$("input[name=submitBtn]").focus()}});
$("input[name=confirm_password]").bind("focus",inpFocus).bind("blur",cpwAction).keydown(function(event){if(event.keyCode == 13){$("input[name=submitBtn]").focus()}});
$("input[name=submitBtn]").bind("click",submitAction);

function inpFocus(){
    var cName = $(this).parent().next().attr("class");
    $(this).css({borderColor:"#f09509"});
    if(cName == "errorText"){
        //tipText = $(this).parent().next().html();
        tipTexts[$(this).attr('name')] = $(this).parent().next().html();
    }else{
        //$(this).parent().next().removeClass("err").addClass("errorText").html(tipText);
        $(this).parent().next().removeClass("err").addClass("errorText").html( tipTexts[$(this).attr('name')]);
    }
}

function userAction(){
    var $this = $(this);
    var v = $this.val();
    $(this).css({borderColor:"#C8C8C8"});
    if(v == ""){
        $this.parent().next(".errorText").removeClass("errorText").addClass("err").html(errArr[3]);
        inpBl[0] = false;
    }else if($userName.test(v) == false){
        $this.parent().next(".errorText").removeClass("errorText").addClass("err").html(errArr[4]);
        inpBl[0] = false;
    }else{
        $.ajax({
            type:"post",
            url:"/user/check_nickname",
            data:"nickname="+v,
            dataType:"json",
            success:function(msg){
                if(msg.status != 200) {
                    $this.parent().next().removeClass("errorText").addClass("err").html(msg.message);
                    inpBl[0] = false;
                }else{
                    if (msg.data!='0'||msg.data!='')
                    {
                        $this.parent().next().removeClass("errorText").addClass("err").html(msg.message);
                        inpBl[0] = false;
                    }
                    else
                    {
                        $this.parent().next().html(tipText);
                        inpVal[0] = v;
                        inpBl[0] = true;
                    }
                }
            }
        });
    }
}

function emailAction(){
    var $this = $(this);
    var v = $this.val();
    $(this).css({borderColor:"#C8C8C8"});
    if(v == ""){
        $this.parent().next(".errorText").removeClass("errorText").addClass("err").html(errArr[5]);
        inpBl[0] = false;
    }else if($email.test(v) == false){
        $this.parent().next(".errorText").removeClass("errorText").addClass("err").html(errArr[6]);
        inpBl[0] = false;
    }else{
        $.ajax({
            type:"post",
            url:"check_email.html",
            data:"username="+v,
            dataType:"json",
            success:function(state){
            	if(state != '200') {
                    $this.parent().next(".errorText").removeClass("errorText").addClass("err").html("此用户名无效，请更换！");
                    inpBl[0] = false;
                }else{
                	$this.parent().next(".errorText").removeClass("errorText").addClass("errorText").html("此用户名可以使用");
                	inpBl[0] = true;
                    inpBl[1] = true;
                }
            }
        });
    }
}

function pwAction(){
    var v = $(this).val();
    $(this).css({borderColor:"#C8C8C8"});
    if(v == ""){
        $(this).parent().next(".errorText").removeClass("errorText").addClass("err").html(errArr[8]);
        inpBl[1] = false;
    }else if(v.length < 6 || v.length > 18){
        $(this).parent().next(".errorText").removeClass("errorText").addClass("err").html(errArr[9]);
        inpBl[1] = false;
    }else{
        $(this).parent().next().html(tipText);
        inpVal[1] = v;
        inpBl[1] = true;
    }
}


function cpwAction(){
    var v = $(this).val();
    var pwd = $('input[name=password]').val();
    $(this).css({borderColor:"#C8C8C8"});
    if(v == ""){
        $(this).parent().next(".errorText").removeClass("errorText").addClass("err").html(errArr[10]);
        inpBl[2] = false;
    }else if(v.length < 6 || v.length > 18){
        $(this).parent().next(".errorText").removeClass("errorText").addClass("err").html(errArr[11]);
        inpBl[2] = false;
    }else if(v!=pwd) {
        $(this).parent().next(".errorText").removeClass("errorText").addClass("err").html(errArr[12]);
        inpBl[2] = false;
    }
    else{
        $(this).parent().next().html(tipText);
        inpVal[2] = v;
        inpBl[2] = true;
    }
}

//注册提交
function submitAction(){
	var isAccept = $('#is_accept_terms').attr('checked');
    if (isAccept!='checked') {
        alert('请先选择同意服务条款');
        return false;
    }
    inpBl[0] = true;
    if(inpBl == "true,true,true"){
        var username = '';
        var email = $('input[name=email]').val();
        username = email.substring(0, email.indexOf('@'));
        $.ajax({
            type:"post",
            url:"register.html",
            data:"password="+inpVal[1]+"&username="+email,//inpVal[0]+"&nickname="+username,
            success:function(state){
                if(state == '200'){
                	alert('注册成功，点击确定跳转到登录页面');
                	window.location = '<%=path%>/login/returnLogin.html';
                }else{
                    alert('注册失败，请确认用户资料格式正确，如仍有问题，请联系客服人员或稍后重试');
                }
            }
        });
    }else{
        return false;
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

</script>
</div>
<!--****-->
</body>
</html>