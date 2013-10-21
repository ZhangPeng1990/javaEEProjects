<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>涂书网 - 个性定制微博书,个人创意设计摄影写真作品集,家庭宝宝亲子儿童情侣恋爱爱情婚礼旅行旅游相册照片书,校园班级学生毕业同学校友聚会纪念册留念册同学录,DIY生日礼物纪念品,Lomo卡明信片海报贺卡请柬创意印品模板制作印刷</title>
<link type="text/css" rel="stylesheet" href="<%=path%>/styles/css/base.css">
<link type="text/css" rel="stylesheet" href="<%=path%>/styles/css/common1.css">
<link href="http://www.tushu.com/images/favicon.ico" mce_href="images/favicon.ico" rel="bookmark" type="image/x-icon">
<link href="http://www.tushu.com/images/favicon.ico" mce_href="images/favicon.ico" rel="icon" type="image/x-icon">
<link href="http://www.tushu.com/images/favicon.ico" mce_href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
<link href="<%=path%>/styles/css/index_201308.css" rel="stylesheet" type="text/css">

<script src="<%=path%>/styles/js/ga.js" async="" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/styles/js/jquery-1.js"></script>
<script type="text/javascript" src="<%=path%>/styles/js/js_002.js"></script>
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
    .nl_book{background:url(<%=path%>/styles/images/index/bg/book.jpg) no-repeat bottom right #fff;padding:10px 15px 62px;}
    .nl_log{background:url(<%=path%>/styles/images/index/bg/log.jpg) no-repeat top right #fff;padding:7px 190px 30px 20px;;width:313px;}
    .nl_log ul{width:255px;}
</style>


</head>
<body>
<!-- here -->
<c:choose>
	<c:when test="${sessionUserName != null}">
		<%@ include file="logined.jsp"%>
	</c:when>
	<c:otherwise>
		<%@ include file="not_login.jsp"%>
	</c:otherwise>
</c:choose>
<%@ include file="header.jsp"%>
<script type="text/javascript">
        $(".index_nav > li").hover(function(){
            $(this).children(".nav_link").addClass("nav_link_hover");
            $(this).children(".nav_list").show();
        },function(){
            $(this).children(".nav_link").removeClass("nav_link_hover");
            $(this).children(".nav_list").hide();
        });
    </script>
<style type="text/css">

.banner_l,.banner_r {display:none;}
.bannerImg {POSITION: relative; z-index:0;}
.bannerImg .bannerPage {POSITION: absolute; bottom: 8px; right:10px;z-index:1;}
.bannerImg .bannerPage A IMG {VERTICAL-ALIGN: middle}
.slides_container {	POSITION: relative; WIDTH:980px; OVERFLOW: hidden;height:304px;z-index:0;}


.pagination {MARGIN: 26px auto 0px;text-align:center;}
.pagination li {MARGIN: 0px; FLOAT: left}
.pagination li a {width:22px;height:22px;background:url("<%=path%>/styles/images/bullets2.png") no-repeat;text-indent:-9999px;border:0;float:left;}
.pagination li.current a{background-position:0 -22px;}
</style>
    

    <div class="w980 m clearfix pt20">
        <div id="slides">
            <div class="bannerImg">
                <div style="overflow: hidden; position: relative; display: block;" class="slides_container">

                    <div style="position: relative; width: 2940px; height: 304px; left: -980px;" class="slides_control">
                    <div id="banner_pic_1" style="position: absolute; top: 0px; left: 980px; z-index: 0; display: none;">
                    	<a href="<%=path%>/product/details/1.html" target="_blank">
                    	<img src="<%=path%>/styles/images/1_003.jpg" class="b1d6" alt="" title=""></a>
                    </div>
                    <div id="banner_pic_2" style="position: absolute; top: 0px; left: 980px; z-index: 0; display: none;">
                    	<a href="<%=path%>/product/details/1.html" target="_blank">
                    	<img src="<%=path%>/styles/images/5_005.jpg" class="b1d6" alt="" title="">
                    	</a></div>
                    <div id="banner_pic_1" style="position: absolute; top: 0px; left: 980px; z-index: 0; ">
                    	<a href="<%=path%>/product/details/1.html" target="_blank">
                    	<img src="<%=path%>/styles/images/2_005.jpg" class="b1d6" alt="" title=""></a>
                    </div>
                    
                    <div id="banner_pic_3" style="position: absolute; top: 0px; left: 980px; z-index: 0; display: none;">
                    	<a href="<%=path%>/product/details/1.html" target="_blank">
                    	<img src="<%=path%>/styles/images/7.jpg" class="b1d6" alt="" title=""></a>
                    </div>
                    </div>
                </div>
            <div style="margin-left: -55px;" class="bannerPage">
            	<ul class="pagination">
            		<li class="">
            		<a href="#0">1</a>
            		</li><li class=""><a href="#1">2</a></li><li class=""><a href="#2">3</a>
            		</li><li class="current"><a href="#3">4</a></li><li class=""><a href="#4">5</a></li></ul></div></div>
        </div>

	</div>
	<div class="w980 m clearfix mt20">
		<div class="made_box clearfix">
			<a href="###" target="_blank" class="l"></a>
			<a href="http://e.weibo.com/tushuwang2011" target="_blank" class="r">
				<img src="<%=path%>/styles/images/lomoka.jpg" alt="">
			</a>
		</div>
	</div>
	
	<c:forEach var="types" items="${indexShowType}">
	<div class="w980 mt30 m">
		
		<h2 class="
		<c:choose>
			<c:when test="${types.index == 1}">clearfix h2_orange</c:when>
			<c:when test="${types.index == 2}">h2_green</c:when>
			<c:when test="${types.index == 3}">h2_blue</c:when>
			<c:when test="${types.index == 4}">h2_orange2</c:when>
			<c:when test="${types.index == 5}">h2_pink</c:when>
			<c:otherwise>clearfix h2_orange</c:otherwise>
		</c:choose>
		">
			<strong>${types.name}</strong>
			<span>${types.describe}</span>
			<c:if test="${types.index == 1}">
				<a href="###" target="_blank" class="more r">查看全部</a>
			</c:if>
		</h2>
		<ul class="img_list mt10">
			<c:forEach var="products" items="${types.objects}" varStatus="index">
				<li class="
				<c:choose>
					<c:when test="${index.count == 1}"></c:when>
					<c:when test="${index.count == 2}">ml11</c:when>
					<c:when test="${index.count == 3}">ml11</c:when>
					<c:when test="${index.count == 4}">ml10</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
				">
				
				<a href="<%=path%>/product/details/${products.productId}.html" target="_blank" title="${products.name}">
				<img class="b1c" src="<%=path%>${products.indexShowImage.url}" alt=""></a>
				</li>
				
			</c:forEach>
		</ul>
	</div>
	</c:forEach>
	
	<div class="w980 mt30 pb30 m">
		<h2 class="h2_orange2">
		<strong>活动汇</strong>
		<a href="###" target="_blank" class="more r">查看全部</a></h2>
		<div class="clearfix mt10">
			<ul class="list l">
				<li class="bgc_g">
				<a href="###" target="_blank" class="clearfix"><span class="l">明星同款微博书</span><span class="r pr20">2013-08-01</span></a></li>
				<li class=""><a href="###" target="_blank" class="clearfix"><span class="l">晒毕业照，赢 ipad</span><span class="r pr20">2013-06-03</span></a></li>
				<li class="bgc_g"><a href="http://e.weibo.com/2315608862/zyVSjBwCS" target="_blank" class="clearfix"><span class="l">超龄儿童欢乐多</span><span class="r pr20">2013-05-29</span></a></li>
				<li class=""><a href="###" target="_blank" class="clearfix"><span class="l">涂书体验师第六季</span><span class="r pr20">2013-05-06</span></a></li>
				<li class="bgc_g"><a href="###" target="_blank" class="clearfix"><span class="l">爱心接力 祝福雅安</span><span class="r pr20">2013-05-03</span></a></li>
				<li class=""><a href="###" target="_blank" class="clearfix"><span class="l">涂书网体验师 第五季</span><span class="r pr20">2013-03-15</span></a></li>
			</ul>
			<ul class="banner r">
				<li><a target="_blank" href="http://mail.sina.com.cn/qixigift.html?from=homeact">
					<img src="<%=path%>/styles/images/1_006.jpg" alt=""></a></li>
				<li><a target="_blank" href="http://www.mafengwo.cn/activity/postal.php?from=homeact">
					<img src="<%=path%>/styles/images/2_002.jpg" alt=""></a></li>
				<li><a target="_blank" href="http://www.yinba.cn/m/yinba.yb?from=homeact">
					<img src="<%=path%>/styles/images/3_002.jpg" alt=""></a></li>
				<li><a target="_blank" href="http://www.yinba.cn/m/yinba.yb?from=homeact">
					<img src="<%=path%>/styles/images/2_002.jpg"" alt=""></a></li>
			</ul>
		</div>
	</div>

    <script src="<%=path%>/styles/js/slides.js" type="text/javascript"></script>
    <script src="<%=path%>/styles/js/js.js" type="text/javascript"></script>

<%@ include file="footer.jsp"%>

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

<script src="<%=path%>/styles/js/h.js" type="text/javascript"></script>
<a href="http://tongji.baidu.com/hm-web/welcome/ico?s=20301d57224db44ce1820fbf43208d85" target="_blank">
	<img src="<%=path%>/styles/images/21.gif" border="0" height="20" width="20"></a>
</div>
<!--****-->
<br><br><br>
</body>
</html>