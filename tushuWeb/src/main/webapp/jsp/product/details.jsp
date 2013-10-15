<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>涂书网 - 个性图书定制分享平台</title>
<link type="text/css" rel="stylesheet"
	href="<%=path%>/styles/css/base.css">
<link type="text/css" rel="stylesheet"
	href="<%=path%>/styles/css/common1.css">
<link href="http://www.tushu.com/images/favicon.ico"
	mce_href="images/favicon.ico" rel="bookmark" type="image/x-icon">
<link href="http://www.tushu.com/images/favicon.ico"
	mce_href="images/favicon.ico" rel="icon" type="image/x-icon">
<link href="http://www.tushu.com/images/favicon.ico"
	mce_href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
	
<script src="<%=path%>/styles/js/ga.js" async="" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/styles/js/jquery-1.js"></script>
<script type="text/javascript" src="<%=path%>/styles/js/js.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		showPopup();
	});
</script>

<style type="text/css">
.index_header {
	border-bottom: 2px solid #fa5000;
}

.index_nav {
	position: relative;
	height: 33px;
	margin-top: 36px;
}

.index_nav ul {
	
}

.index_nav li {
	display: inline;
}

.index_nav .nav_link {
	padding: 0 16px;
	height: 33px;
	font: normal 16px/33px "microsoft yahei";
	display: inline-block;
}

.index_nav .nav_link i {
	border-color: #6d6d6d #fff #fff;
	border-style: solid;
	border-width: 5px 5px 0;
	width: 0;
	height: 0;
	display: inline-block;
	vertical-align: middle;
	margin-left: 12px;
}

.index_nav .nav_link:hover,.index_nav .nav_link_hover {
	color: #fff;
	background-color: #fa5000;
	text-decoration: none;
}

.index_nav .nav_link:hover i,.index_nav .nav_link_hover i {
	border-color: #fff #fa5000 #fa5000;
}

.nav_list {
	width: 493px;
	position: absolute;
	z-index: 3;
	border: 1px solid #fa5000;
	padding: 10px 15px;
	background-color: #fff;
	top: 33px;
	right: 0;
	line-height: 24px;;
	display: none;
}

.nav_list li.clearfix {
	border-bottom: 1px solid #ddd;
	display: block;
	padding: 5px 0;
	float: left;
	width: 100%;
}

.nav_list li strong {
	font-size: 14px;
	color: #333;
}

.nav_list ul {
	width: 415px;
}

.nav_list li a {
	color: #666;
	white-space: nowrap;
}

.nav_list li a:hover {
	color: #fa5000;
	text-decoration: none;
}

.fgf {
	margin: 0 3px;
	color: #ddd;
}

.noBorder {
	border: none !important;
}

.nl_book {
	background: url(<%=path%>/styles/images/index/bg/book.jpg) no-repeat
		bottom right #fff;
	padding: 10px 15px 62px;
}

.nl_log {
	background: url(<%=path%>/styles/images/index/bg/log.jpg) no-repeat top
		right #fff;
	padding: 7px 190px 30px 20px;;
	width: 313px;
}

.nl_log ul {
	width: 255px;
}
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
		$(".index_nav > li").hover(function() {
			$(this).children(".nav_link").addClass("nav_link_hover");
			$(this).children(".nav_list").show();
		}, function() {
			$(this).children(".nav_link").removeClass("nav_link_hover");
			$(this).children(".nav_list").hide();
		});
	
		$(document).ready(function() {
			$('a.made_btn').click(function() {
				google_click_log("detail/todo");
			});
			$('#lbox_pic_link').click(function() {
				google_click_log("detail/ad1");
			});
			$('#bottom_pic_link').click(function() {
				google_click_log("detail/ad2");
			});
		});
	</script>
	<link href="<%=path%>/styles/css/common_201308.css" rel="stylesheet" type="text/css" />
	<div class="ff_yahei w980 m pt20">
		<div class="bg_gray_08 por clearfix pb10">
			<div class="kan_box">
				<div class="kan_boxt tc fs14">— 看了又看 —</div>
				<ul class="kan_boxb">
					<c:forEach var="item" items="${productLooks}" varStatus="index">
					<li>
						<a href="<%=path%>/product/details/${item.productId}.html">
							<c:choose>
								<c:when test="${index.count ==1}">
									<img src="<%=path%>/styles/images/list6038.png" alt="${item.name}">
								</c:when>
								<c:when test="${index.count ==2}">
									<img src="<%=path%>/styles/images/list6005.png" alt="${item.name}">
								</c:when>
								<c:when test="${index.count ==3}">
									<img src="<%=path%>/styles/images/list32.png" alt="${item.name}">
								</c:when>
							</c:choose>
							
							<span class="fc_orange fs14 block">￥${item.sellPrice}</span>
							<span class="fs12 block">${item.name}</span>
						</a>
					</li>
					</c:forEach>
				</ul>
			</div>
			<div></div>
			<div class="Preview l">
				<div class="Preview_t">
					<img alt="" src="<%=path%>/styles/images/1_002.jpg"> <img alt=""
						src="<%=path%>/styles/images/2.jpg" class="hide"> <img
						alt="" src="<%=path%>/styles/images/3.jpg" class="hide"> <img
						alt="" src="<%=path%>/styles/images/4_002.jpg" class="hide">
					<img alt="" src="<%=path%>/styles/images/5_002.jpg" class="hide">
					<img alt="" src="<%=path%>/styles/images/6_002.jpg" class="hide">
				</div>
				<ul class="Preview_b clearfix">
					<li class="mr5 on"><img
						src="<%=path%>/styles/images/thumb_1.jpg" alt=""></li>
					<li class="mr5"><img src="<%=path%>/styles/images/thumb_2.jpg"
						alt=""></li>
					<li class="mr5"><img src="<%=path%>/styles/images/thumb_3.jpg"
						alt=""></li>
					<li class="mr5"><img src="<%=path%>/styles/images/thumb_4.jpg"
						alt=""></li>
					<li class="mr5"><img src="<%=path%>/styles/images/thumb_5.jpg"
						alt=""></li>
					<li><img src="<%=path%>/styles/images/thumb_6.jpg" alt=""></li>
				</ul>
			</div>
			<script type="text/javascript">
				$(".Preview_b li").bind(
						"click",
						function() {
							if (!$(this).hasClass("on")) {
								$(this).addClass("on").siblings().removeClass(
										"on");
								$(".Preview_t img").eq($(this).index())
										.removeClass("hide").siblings()
										.addClass("hide");
							}
						})
			</script>

			<div class="information r">
				<h2>${product.name}</h2>
				<h3>${product.content1}</h3>
				<div class="pt25">
					<div>
						<span class="fs20 fc_orange">￥<strong class="fs26">${product.sellPrice}</strong></span>
					</div>
					<div class="kan_tip w350 tc ml65 mt10">同款产品5本以上有折扣，多购多折！</div>
					<ul class="new_type_list">
						<li><span>市场价</span>${product.marketPrice}元</li>
						<li><span>页数</span>内页${product.pages}页，可加至52页</li>
						<li><span>运费</span>中通${product.freight}元 EMS/顺丰${product.freight}元</li>
						<li><span>浏览量</span>${product.viewCount}次</li>
						<!-- <li><span>已售出</span>300件</li>-->
					</ul>
					<div class="pt20">
						<a href="<%=path%>/product/${product.productId}/beginMake.html" target="_blank" class="made_btn inline vam" title="立即制作"></a>
						
						<!--   
						<a class="js_book_preview cart_btn inline ml20 vam" onclick="addToShoppingCart(${product.productId})" title="加入购物车"></a>
						<a href="javascript:;" class="js_book_preview preview_btn inline ml20 vam" ookid="10684" booktype="22" title="预览样书"></a>
						-->
					</div>
				</div>
			</div>
		</div>
		<div class="mt30">
			<div class="hd_btn" id="js_tagBtn">
				<a href="javascript:;" class="on">产品详情</a> <a href="javascript:;">用户晒单</a>
				<a href="javascript:;">作品精选</a>
			</div>
		</div>
		<div>
			<div class="clearfix pb20" id="js_tagBox_1">
				<div class="details_box mt15">
					<ul>
						<li>产品规格：125x125mm</li>
						<li>产品材质：牛皮纸，哑粉纸，欧维斯</li>
					</ul>
					<ul>
						<li>产品工艺：模切，Indigo印刷</li>
						<li>装订说明：环保胶装</li>
					</ul>
					<ul class="last">
						<li>制作周期：3—5个工作日（不包含配送时间）</li>
						<li>加页说明：1元/2页，可加至52页</li>
					</ul>
				</div>
				<div class="pt20 clearfix">
					<div class="L_box">
						<div>
							<a href="###" target="_blank" id="lbox_pic_link"> 
								<img src="<%=path%>/styles/images/gg2.jpg" alt="">
							</a>
						</div>
						<div class="hot mt40">
							<div class="hot_t fc_orange">
								<span>热销商品</span>
							</div>
							<div id="hot_books" class="mt10">
								<c:forEach var="item" items="${productSelles}" varStatus="index">
								<a href="<%=path%>/product/details/${item.productId}.html" class="mt15 clearfix">
									
								<c:choose>
								<c:when test="${index.count ==1}">
									<img src="<%=path%>/styles/images/33.jpg" alt="${item.name}">
								</c:when>
								<c:when test="${index.count ==2}">
									<img src="<%=path%>/styles/images/31.jpg" alt="${item.name}">
								</c:when>
								<c:when test="${index.count ==3}">
									<img src="<%=path%>/styles/images/6028.jpg" alt="${item.name}">
								</c:when>
								<c:when test="${index.count ==4}">
									<img src="<%=path%>/styles/images/6023.jpg" alt="${item.name}">
								</c:when>
								</c:choose>									
									<span class="l pl10 pt5 lh33 fs14 fc_gray6">${item.name} </span>
									
									<span class="r pr10 pt5 lh33 fs14 fc_orange"> ￥${item.sellPrice} </span>
								</a>
								</c:forEach>
							</div>
						</div>
						<div class="service">
							<p class="tc fc_orange fw_b">在线时间</p>
							<p class="tl lh22">
								每周一至周五9:00至17:00<br> 为你提供各种专业咨询
							</p>
							<ul class="mt10">
								<li class="lh30"><span class="w60">客服电话：</span><span>4008009556</span></li>
								<li class="lh30"><span class="w60">服务邮箱：</span><span>service@tushu.com</span></li>
								<li class="lh30"><span class="w60 l">在线咨询：</span><a
									target="_blank"
									href="http://wpa.qq.com/msgrd?v=3&amp;uin=4008009556&amp;site=qq&amp;menu=yes"><img
										src="<%=path%>/styles/images/q.jpg" alt="点击这里给我发消息" title="点击这里给我发消息"
										border="0"></a></li>
							</ul>
						</div>
					</div>
					<div class="R_box">
						<div id="detailpic">
							<div class="tc">
								<img src="<%=path%>/styles/images/aa1.jpg" />
							</div>
							<div class="tc">
								<img src="<%=path%>/styles/images/2_002.jpg" alt="">
							</div>
							<div class="tc">
								<img src="<%=path%>/styles/images/3_002.jpg" alt="">
							</div>
							<div class="tc">
								<img src="<%=path%>/styles/images/4.jpg" alt="">
							</div>
							<div class="tc">
								<img src="<%=path%>/styles/images/5.jpg" alt="">
							</div>
							<div class="tc">
								<img src="<%=path%>/styles/images/6.jpg" alt="">
							</div>
						</div>
						
						<div class="tc pt20">
							<img src="<%=path%>/styles/images/details/2.jpg" class="block" alt="">
						</div>
						
						<div class="lomo_box">
							<p>﻿用眼睛读懂人生，用照片讲述自己的故事。</p>
							<p>将那些记录着美好时光的照片，装订成一册CD书，</p>
							<p>一册小巧精致的口袋书，随身携带，感受爱的温暖让思念无距离。</p>
							<p>此款还可以导入自己或好友的微博，牛皮纸封套可用于收纳闲置光盘~</p>
							<p></p>
						</div>
						<div class="tc pt20">
							<a href="###" target="_blank" id="bottom_pic_link">
							<img src="<%=path%>/styles/images/gg.jpg" class="block" alt=""></a>
						</div>
					</div>
				</div>
			</div>


			<div class="clearfix ml10" id="js_tagBox_2" style="display: none;">
				<div class="tr pt10 pr20">
					<a href="http://e.weibo.com/tushuwang2011" target="_blank"
						class="fs14 fc_orange">关注我们，立即晒单，得包邮券！Go&gt;&gt;</a>
				</div>
				<div id="container" class="transitions-enabled centered clearfix">
					<div class="masBox" data-bt="22">
						<img
							src="<%=path%>/styles/images/9d3ec29a960cddc5dcb4ae6435594b7b.jpg"
							datetime="2013年05月21日 16:30" alt="CD书">
						<div class="clearfix masUser">
							<span class="l"><img
								src="<%=path%>/styles/images/70744084192b2c0fab3f0e349e296e77.jpg"
								alt="晚楠平安"></span>
							<div class="r">
								<strong class="noWrap fs14 lh28" title="CD书">CD书</strong>
								<div class="fc_gray9 lh24">晚楠平安</div>
							</div>
						</div>
						<p class="fc_gray6 lh20"
							links="http://weibo.com/1376850683/zpoRAkJW0">@涂书网
							效果不错，很满意内～～～</p>
					</div>
					<div class="masBox" data-bt="22">
						<img
							src="<%=path%>/styles/images/68b3a4a4be0a2f56613d0aca2ef9e176.jpg"
							datetime="2013年05月21日 16:25" alt="CD书">
						<div class="clearfix masUser">
							<span class="l"><img
								src="<%=path%>/styles/images/354fc89f0d7b4a72cffa9b1f761c90de.jpg"
								alt="t-sen"></span>
							<div class="r">
								<strong class="noWrap fs14 lh28" title="CD书">CD书</strong>
								<div class="fc_gray9 lh24">t-sen</div>
							</div>
						</div>
						<p class="fc_gray6 lh20"
							links="http://weibo.com/1236345020/zvpZkqe0Q">补图吧,,手机拍的不是很清晰,,所以呢,,,@涂书网
							,,</p>
					</div>
					<div class="masBox" data-bt="22">
						<img
							src="<%=path%>/styles/images/44e73944d53b4e82c74a722fe9b64cf0.jpg"
							datetime="2013年04月25日 09:19" alt="微博书">
						<div class="clearfix masUser">
							<span class="l"><img
								src="<%=path%>/styles/images/69542842f4c987d69dcb8ded3064d3a4.jpg"
								alt="rainefi"></span>
							<div class="r">
								<strong class="noWrap fs14 lh28" title="微博书">微博书</strong>
								<div class="fc_gray9 lh24">rainefi</div>
							</div>
						</div>
						<p class="fc_gray6 lh20"
							links="http://weibo.com/1820600747/zlr0SC3Nu ">我
							的微博书[鼓掌][鼓掌]@涂书网 #爱印微博书# 书中除了我可爱的胖胖胖妈和老师外 还有@夏天的夏Cicilia @胖子蘺癟
							@华藏世界060626 @烂苹果2068526271 @Damon-Q @M貓大人M @Bling-MiMi @天才cici
							@動力Neos 感谢你们一直在身边 [爱你][爱你]</p>
					</div>
					<div class="masBox" data-bt="22">
						<img
							src="<%=path%>/styles/images/34b6899cae097ee2b0cabe70bb646cc1.jpg"
							datetime="2013年04月16日 12:17" alt="微博书">
						<div class="clearfix masUser">
							<span class="l"><img
								src="<%=path%>/styles/images/9fa496402b4866c993f2d3beaec7a500.jpg"
								alt="小祖宗L"></span>
							<div class="r">
								<strong class="noWrap fs14 lh28" title="微博书">微博书</strong>
								<div class="fc_gray9 lh24">小祖宗L</div>
							</div>
						</div>
						<p class="fc_gray6 lh20"
							links="http://weibo.com/1301343385/zgZzSimWd">Thanks❤@涂书网</p>
					</div>
					<div class="masBox" data-bt="22">
						<img
							src="<%=path%>/styles/images/45504135c0cbd2123d1dc86776b62041.jpg"
							datetime="2013年04月09日 09:57" alt="《我的微博脚印》">
						<div class="clearfix masUser">
							<span class="l"><img
								src="<%=path%>/styles/images/f8a8d2c7f6731ec00db4c0858bbebf38.jpg"
								alt="摆摆630"></span>
							<div class="r">
								<strong class="noWrap fs14 lh28" title="《我的微博脚印》">《我的微博脚印》</strong>
								<div class="fc_gray9 lh24">摆摆630</div>
							</div>
						</div>
						<p class="fc_gray6 lh20"
							links="http:// http://weibo.com/1840496370/zj9UN43jW">【最美的新年礼物】蛇年尹始，突然收到@新浪重庆
							为偶在@涂书网
							特别订制的《我的微博脚印》微博书，这里有我的微博记忆碎片！好鸡动……好敢动哟[鼓掌]！这是我收到了最美新年礼物。[给力]特别感谢@翔宇小鲸鱼
							和@一抹嫣蓝--妞儿 祝你们[蛇年快乐]</p>
					</div>
					<div class="masBox" data-bt="22">
						<img
							src="<%=path%>/styles/images/9567060b31aba5b2216be71fc5c0b2fa.jpg"
							datetime="2013年03月19日 16:14" alt="微博书">
						<div class="clearfix masUser">
							<span class="l"><img
								src="<%=path%>/styles/images/579b32bc8e63de399caaceb3aaaf3f14.jpg"
								alt="小Hen_Hen"></span>
							<div class="r">
								<strong class="noWrap fs14 lh28" title="微博书">微博书</strong>
								<div class="fc_gray9 lh24">小Hen_Hen</div>
							</div>
						</div>
						<p class="fc_gray6 lh20"
							links="http://weibo.com/1789311470/zejbKoCsr">#涂书网#[爱你][爱你][爱你]
							很喜欢噢！[心][心]以后继续支持！@涂书网 @DreamRhyme-梦韵 @FZL紫玲 @蕾丝一直没有说 @桀骜不驯小均均</p>
					</div>
					<div class="masBox" data-bt="22">
						<img
							src="<%=path%>/styles/images/a733f282e882b41cc452f68b6a5c3f6f.jpg"
							datetime="2013年03月14日 10:05" alt="微博书">
						<div class="clearfix masUser">
							<span class="l"><img
								src="<%=path%>/styles/images/df07af59ec8b435a1619bffcf5713b79.jpg"
								alt="雨菲妮"></span>
							<div class="r">
								<strong class="noWrap fs14 lh28" title="微博书">微博书</strong>
								<div class="fc_gray9 lh24">雨菲妮</div>
							</div>
						</div>
						<p class="fc_gray6 lh20"
							links="http://weibo.com/1657338487/zfXa1c9m0">回忆 是一本书快乐依旧
							笑脸依旧谢谢@张籽沐 @糖小糖妈咪 送的微博书，一定好好珍藏！</p>
					</div>

				</div>
				<div id="page-nav">
					<a href="###"></a>
				</div>
			</div>

			<div class="clearfix" id="js_tagBox_3" style="display: none;">
				<div class="clearfix pt10" id="lbooks">
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1853053.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">絮晚_@weibo</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1850566.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">絮晚_@weibo</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1788725.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">絮晚_@weibo</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1746290.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">女儿Yuki@weibo</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1678334.png" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">越橘Halcyon@weibo</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1654403.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">_栗色的小兔子@weibo</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1602440.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">涂书网</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1591475.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">坏丫头jimmy@weibo</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1587930.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">Lyn-Lai退伍喇@weibo</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1569767.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">水萧-潇@weibo</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1583216.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">寂离别不流泪</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1438598.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">宇儿5942@weibo</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1023528.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">宇儿5942@weibo</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1566042.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">bloomymay</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1564278.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">夏加尔@weibo</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1538961.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">驴脑袋</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1028517.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">印刷情报站</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1535311.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">路灯摄影@weibo</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1533247.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">不慰@weibo</a>
						</dd>
					</dl>
					<dl class="chosen_book_box l">
						<dt>
							<a href="###" target="_blank"><img
								src="<%=path%>/styles/images/1529151.jpg" alt=""></a>
						</dt>
						<dd class="icon_head_s">
							<a href="">dT_Tlll@weibo</a>
						</dd>
					</dl>
				</div>
				<div class="tc page_num pt10 pb20" id="lbookpage">
					<a href="javascript:;" onclick="showlbooks(22,1)" class="on">1</a>
					<a href="javascript:;" onclick="showlbooks(22,2)">2</a> <a
						href="javascript:;" onclick="showlbooks(22,3)">3</a> <a
						href="javascript:;" onclick="showlbooks(22,4)">4</a> <a
						href="javascript:;" onclick="showlbooks(22,5)">5</a>
				</div>
			</div>
		</div>
	</div>


	<style>
.backToTop {
	background: url("<%=path%>/styles/images/rocket01.png") no-repeat;
	bottom: 160px;
	cursor: pointer;
	height: 106px;
	position: fixed;
	right: 10px;
	width: 52px;
	_position: absolute;
	_top: expression(eval(document.compatMode &&   document.compatMode == 
		 'CSS1Compat')?documentElement.scrollTop+(documentElement.clientHeight-this.clientHeight)
		-62:   document.body.scrollTop+(document.body.clientHeight-this.clientHeight)
		-0);
	z-index: 1;
	display: none;
}
</style>
	<div style="display: none;" class="backToTop" id="toolBackTo"></div>
	<script type="text/javascript" src="<%=path%>/styles/js/jquery_002.js"></script>
	<!--[if lt IE 8]>
		<script type="text/javascript" src="/js/bookView/json2.js"></script>
	<![endif]-->

	<script type="text/javascript" src="<%=path%>/styles/js/artDialog.js"></script>

	<div class="poa js_book_preview_div" style="display: none" id="swfView">
		<div id="flashView"></div>
	</div>


	<script type="text/javascript" src="<%=path%>/styles/js/swfobject.js"></script>
	<script type="text/javascript">
		$(".js_book_preview")
				.click(
						function() {
							var bookid = $(this).attr("bookid");
							$
									.ajax({
										type : "GET",
										url : "/home/get_book_view/" + bookid,
										dataType : "json",
										success : function(data) {
											//console.log(data);
											if (data.status != 200) {
												adialog('提示信息', data.message, 1);
												return;
											}
											var bookdata = data.data;
											var bookWidth = bookdata.width, bookHeight = bookdata.height, urls = bookdata.urls;
											var booktype = bookdata.BookType;

											var swfname = '';
											if (bookdata.viewclass == 1) {
												swfname = '<%=path%>/styles/js/bookView/FocusView.swf';
											} else {
												swfname = '<%=path%>
		/styles/js/bookView/BookPreview.swf';
											}
											var duplex = bookdata.duplex;

											show_book_prewiew(bookWidth,
													bookHeight, urls, booktype,
													swfname, duplex);

											$(".js_book_preview_div")
													.css(
															{
																zIndex : 2,
																top : (document.documentElement.scrollTop
																		+ document.body.scrollTop + 30),
																left : (($(
																		window)
																		.width() - $(
																		".js_book_preview_div")
																		.width()) / 2)
															})
													.show()
													.after(
															"<div id='js_book_bg' class='hide'></div>")
													.prepend(
															"<span id='js_book_btn'>×</span>");
											$("#js_book_btn")
													.css(
															{
																color : "#fff",
																backgroundColor : "#666",
																display : "block",
																position : "absolute",
																textAlign : "center",
																width : 25,
																height : 25,
																marginTop : 10,
																marginLeft : 945,
																lineHeight : "22px",
																cursor : "pointer",
																borderRadius : 15,
																fontSize : 18
															})
													.click(
															function() {
																$("#js_book_bg")
																		.remove();
																$(this)
																		.parent()
																		.html(
																				"<div id='flashView'></div>");
															})
											$("#js_book_bg").css({
												backgroundColor : "#000",
												opacity : .5,
												width : "100%",
												height : ($("body").height()),
												position : "absolute",
												top : 0
											}).removeClass("hide");

											return;
										}
									});
						});

		function show_book_prewiew(bookWidth, bookHeight, urls, booktype,
				swfname, duplex) {
			var swfwidth = 980;
			var swfheight = 550;
			eval('var url_json = ' + urls);
			url_json = encodeURIComponent(JSON.stringify(url_json));
			var flashvars = {
				skinSwf : '<%=path%>/styles/js/bookView/Asset.swf',
				bookWidth : bookWidth,
				bookHeight : bookHeight,
				duplex : duplex,
				urls : url_json,
				book_type : booktype,
				order_url : '/product-22.html';
			}, params = {
				menu : "false",
				allowFullscreen : "true",
				allowScriptAccess : "always",
				bgcolor : "#FFFFFF",
				wmode : "opaque";
			}, attributes = {
				id : "fff";
			};
			swfobject.embedSWF(swfname, "flashView", swfwidth, swfheight,
					"9.0.0", "expressInstall.swf", flashvars, params,
					attributes);
		}
	</script>


	<script type="text/javascript">
		$("#js_tagBtn a").bind("click", function() {
			$(this).attr("class", "on").siblings().removeAttr("class");
			var a = $(this).index() + 1;
			$("#js_tagBox_" + a).show().siblings().hide();
			if (a == 2) {
				var $container = $('#container');
				$container.imagesLoaded(function() {
					$container.masonry({
						itemSelector : '.masBox',
						columnWidth : 0,
						// isAnimated: !Modernizr.csstransitions,
						isFitWidth : false
					});
				});
				$container.infinitescroll({
					navSelector : '#page-nav', // selector for the paged navigation
					nextSelector : '#page-nav a', // selector for the NEXT link (to page 2)
					itemSelector : '.masBox', // selector for all items you'll retrieve
					loading : {
						finishedMsg : '没有更多内容加载.',
						img : '/images/weibo_memory/loading_circle.gif'
					}
				},
				// trigger Masonry as a callback
				function(newElements) {
					// hide new items while they are loading
					var $newElems = $(newElements).css({
						opacity : 0
					});
					// ensure that images load before adding to masonry layout
					$newElems.imagesLoaded(function() {
						// show elems now they're ready
						$newElems.animate({
							opacity : 1
						});
						$container.masonry('appended', $newElems, true);
					});
				});
				//setInterval("gethot()",5000);
				//setInterval("getcomment()",10000)
			}
		});
	</script>




	<script type="text/javascript">
		// 用户晒单
		$(function() {
			var n;
			var b = false;
			var len;
			$(".masBox").live("click", masFull);

			$(".odm_cls").live("click", closeMas);

			function masFull() {
				n = $(this).index();
				openMas(n);
			}

			function openMas(n) {
				var len = $(".masBox").length;
				var $this = $(".masBox").eq(n);
				var mas_data = {
					masImg : $this.children("img").attr("src"),
					userImg : $this.find(".masUser").find("img").attr("src"),
					userName : $this.find(".masUser").find("img").attr("alt"),
					masTitle : $this.find(".masUser").find("strong").attr(
							"title"),
					masTime : $this.children("img").attr("dateTime"),
					masText : $this.find("p").html(),
					masUrl : $this.find("p").attr("links"),
					bookType : $this.attr('data-bt')
				};
				if (!b) {
					createMas(mas_data);
				} else {
					editMas(mas_data);
				}
				switch (n) {
				case 0:
					$(".storyLeft").attr("class", "storyLeft_off");
					break;
				case len - 1:
					$(".storyRight").attr("class", "storyRight_off");
					break;
				default:

					$(".storyRight_off").attr("class", "storyRight");
					$(".storyLeft_off").attr("class", "storyLeft");

				}
			}
			function closeMas() {
				$(".openDg").stop(true, true).fadeOut('fast', function() {
					$("html").css({
						overflow : "auto"
					});
					$(".openDg").remove();
					$(".openDiv").html("").remove();
					//$(window).unbind("resize");
				});
				$(".openDiv").fadeOut('fast');
				urlShit = "";
				b = false;
			}
			function createMas(data) {
				var strDiv = '<div class="openDg"></div>';
				strDiv += '<div class="openDiv">';
				strDiv += '<div class="od_mas"><div class="clearfix"><span class="odm_l"><strong class="l" id="masTitle">'
						+ data.masTitle
						+ '</strong><span class="r" id="dateTime">'
						+ data.masTime
						+ '</span></span><span class="odm_cls">×</span></div>';
				strDiv += '<div class="clearfix mas_cm"><div class="odmm_l"><span class="storyLeft">left</span><div id="masImg"><img id="masImgId" src="'+data.masImg+'" alt="'+data.masTitle+'" /></div><span class="storyRight">right</span></div>';
				strDiv += '<div class="odmm_r"><div><img src="'+data.userImg+'" id="userImg" alt="'+data.userName+'" /><br /><span id="userName">'
						+ data.userName
						+ '</span></div><p id="masText">'
						+ data.masText
						+ '</p><div id="create_link">'
						+ (data.bookType ? '<span class="block">还不错吧，行动起来！</span><a target="_blank" href="http://www.tushu.com/product-'+data.bookType+'.html">立即制作</a>'
								: '') + '</div></div></div>';
				strDiv += '<div class="clearfix"><div class="odf_l"><span class="l">图片来自网友：'
						+ data.userName
						+ '</span><a class="r" id="go_pic_source" href="'+data.masUrl+'" target="_blank">查看图片来源</a></div></div></div>';
				strDiv += '</div>';
				$("body").append(strDiv);
				//alert($(".openDiv").html())
				$(".openDg").height($("body").height());
				$("html").css({
					overflow : "hidden"
				});
				$(".openDiv").css(
						{
							top : document.documentElement.scrollTop
									+ document.body.scrollTop,
							height : $(window).height()
						});
				//alert($(".openDiv").attr("class"));
				$(".storyLeft").click(function() {
					if (n > 0) {
						openMas(n - 1);
						n--;
					}

				});
				$(".storyRight").click(function() {
					if (n <= $(".masBox").length) {
						openMas(n + 1);
						n++;
					}
				});
				autoMoveImg();
				b = true;
			}

			function editMas(data) {
				$("#masTitle").html(data.masTitle);
				$("#userName").html(data.userName);
				$("#dateTime").html(data.masTime);
				$("#masImg img").attr("src", data.masImg).attr("alt",
						data.masTitle);
				$("#userImg").attr("src", data.userImg).attr("alt",
						data.userName);
				$("#masText").html(data.masText);
				$("#go_pic_source").attr('href', data.masUrl);

				if (data.bookType) {
					$("#create_link")
							.html(
									data.bookType ? '<span class="block">还不错吧，行动起来！</span><a href="http://www.tushu.com/product-'+data.bookType+'.html">立即制作</a>'
											: '');
				} else {
					$("#create_link").html('');
				}
				autoMoveImg();
			}
			var urlShit = "";
			function autoMoveImg() {
				//alert($(".openDiv").html());
				//alert($(".od_mas").height())
				//alert(it+"..."+ih)
				var urlNew = $("#masImg").attr("src");

				if (urlShit != urlNew) {
					var mt = 0;
					document.getElementById("masImgId").onload = function() {

						var ih = $("#masImg img").height();
						var dh = $(".odmm_r").height() + 50 + 105 + 38;
						var ch = ih > dh ? ih : dh;
						var it = (dh - 162 - ih) / 2;
						it = it < 0 ? 0 : it;
						$("#masImg").css({
							marginTop : it
						});

						//alert(ih)
						if (ch < $(window).height()) {
							mt = ($(window).height() - dh) / 2
							//mt = 0;
						} else {
							mt = 0;
						}
						$(".od_mas").stop(true, true).animate({
							marginTop : mt
						}, 300);

						if ($("#masImgId").width() > 480) {
							$("#masImgId").css({
								width : 480
							});
						}
						$(
								".storyLeft,.storyRight,.storyLeft_off,.storyRight_off")
								.css({
									height : ih + it * 2 + 40
								});
						urlShit = urlNew;
					}
				}
				//$(window).resize(function(){closeMas()});
			}

		});
	</script>

	<script src="<%=path%>/styles/js/jquery.js"></script>
	<script src="<%=path%>/styles/js/jquery_003.js"></script>
	<script src="<%=path%>/styles/js/desc.js" type="text/javascript"></script>
	<script>
		function gethot() {
			$
					.ajax({
						type : "GET",
						url : "/product/gethot",
						dataType : 'json',
						success : function(data) {
							var str = '';
							if (data) {
								for ( var i = 0; i < data.length; i++) {
									str += '<a href="'
											+ data[i]['url']
											+ '?from=xqrx" class="mt15 clearfix">';
									str += '<img src="'+data[i]['pic']+'" alt="'+data[i]['title']+'" />';
									str += '<span class="l pl10 pt5 lh33 fs14 fc_gray6">'
											+ data[i]['title'] + ' </span>';
									str += '<span class="r pr10 pt5 lh33 fs14 fc_orange"> ￥'
											+ data[i]['price'] + ' </span>';
									str += '</a>';
								}
							}
							$("#hot_books").html(str);
						}

					});
		}

		function getcomment() {
			$
					.ajax({
						type : "POST",
						url : "/product/getcomment",
						dataType : 'json',
						success : function(data) {
							var str = '';
							if (data) {
								for ( var i = 0; i < data.length; i++) {
									str += '<li>';
									str += '<a href="/detail-'+data[i]['book_type']+'.html">';
									str += '<img src="/upload/typelist/booktype/'+data[i]['book_type']+'/list'+data[i]['book_type']+'.png" alt="'+data[i]['book_type_name']+'"/>';
									str += '<span class="fc_orange fs14 block">￥'
											+ data[i]['book_price'] + '</span>';
									str += '<span class="fs12 block">'
											+ data[i]['book_type_name']
											+ '</span>';
									str += '</a>';
									str += '</li>';

								}
							}
							$(".kan_boxb").html(str);
						}
					});
		}

		function showlbooks(booktype, page) {
			$
					.ajax({
						type : "GET",
						url : "/library/showBook2?booktype=" + booktype
								+ "&page=" + page,
						dataType : 'json',
						success : function(data) {
							var str = '';
							if (data) {
								var books = data['books'];
								if (books) {
									for ( var i = 0; i < books.length; i++) {
										str += '<dl class="chosen_book_box l">';
										str += '<dt><a href="/book-'+books[i]['BookID']+'.html" target="_blank"><img src="'+books[i]['imgurl']+'" alt="" /></a></dt>';
										str += '<dd class="icon_head_s"><a href="">'
												+ data['nickname'][books[i]['UserID']]
												+ '</a></dd>';
										str += '</dl>';
									}
									$("#lbooks").html(str);

								}
								$("#lbookpage").html(data['pages']);
							}

						}
					});
		}

		gethot();
		getcomment();
		showlbooks(22, 1);

		$(function() {

		});

		var picstr = '';
		var constr = '';
		if (book_type_details) {
			if (book_type_details['pictures']) {
				function sortName(a, b) {
					var aa = a.match(/\/([^\/]*)\./);
					if (aa[1]) {
						aa = aa[1];
					}
					var bb = b.match(/\/([^\/]*)\./);
					if (bb[1]) {
						bb = bb[1];
					}
					return aa - bb;
				}
				book_type_details.pictures.sort(sortName);
				for ( var i = 0; i < book_type_details['pictures'].length; i++) {
					picstr += '<div class="tc"><img src="/upload/admin/adminPic'+book_type_details['pictures'][i]+'" alt="" /></div>';
				}
				$("#detailpic").html(picstr);
			}
			if (book_type_details['contents']) {
				for ( var i = 0; i < book_type_details['contents'].length; i++) {
					constr += '<p>' + book_type_details['contents'][i] + '</p>';
				}
				$(".lomo_box").html(constr);
			}
		}
	</script>

	<%@ include file="../footer.jsp"%>
	<!--谷歌Google Analytics代码-->
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-27037508-1' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
	<!--****-->

	<div style="display: none;">
		<!--百度统计代码-->
		<script type="text/javascript">
			var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://"
					: " http://");
			document
					.write(unescape("%3Cscript src='"
							+ _bdhmProtocol
							+ "hm.baidu.com/h.js%3F20301d57224db44ce1820fbf43208d85' type='text/javascript'%3E%3C/script%3E"));
		</script>
		<script src="<%=path%>/styles/js/h.js" type="text/javascript"></script>
		<a
			href="http://tongji.baidu.com/hm-web/welcome/ico?s=20301d57224db44ce1820fbf43208d85"
			target="_blank"><img src="<%=path%>/styles/images/21.gif" border="0" height="20"
			width="20"></a>
	</div>
	<!--****-->


	<div class="aui_focus" style="display: none;">
		<div class="aui_outer">
			<table style="" class="aui_table aui_outerTable">
				<tbody>
					<tr>
						<td class="aui_border aui_nw"></td>
						<td class="aui_border aui_n"></td>
						<td class="aui_border aui_ne"></td>
					</tr>
					<tr>
						<td class="aui_border aui_w"></td>
						<td class="aui_center"></td>
						<td class="aui_border aui_e"></td>
					</tr>
					<tr>
						<td class="aui_border aui_sw"></td>
						<td class="aui_border aui_s"></td>
						<td style="cursor: se-resize;" class="aui_border aui_se"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>