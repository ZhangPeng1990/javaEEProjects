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
<meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1">
<meta property="qc:admins" content="21505450126453056375">
<meta name="keywords"
	content="涂书网、自制图书、同学录、个人写真、纪念册、生日礼物、结婚纪念、创意礼物、个性化定制、珍藏、成长日记、影集、制作照片、涂书网、涂书">
<meta name="description"
	content="涂书网是为那些热爱生活、善于分享的人,提供记录生活、分享感动、实现创意的个性图书定制分享平台。向用户提供自制图书、旅行日志、婚恋纪念册、宝宝成长录的画册设计和印制，让用户享受三分钟DIY照片书的乐趣。记录生活感动与真实，和朋友、同事一同分享无处不在的喜悦和感动。涂书网做自己的书">
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
	background: url(/images/index/bg/book.jpg) no-repeat bottom right #fff;
	padding: 10px 15px 62px;
}

.nl_log {
	background: url(/images/index/bg/log.jpg) no-repeat top right #fff;
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
		})
	</script>
	<div class="pathBg">
		<div class="w980 m">
			<a href="###">首页</a>&gt;<a
				href="###">会员中心</a>&gt;<span>我的通知</span>
		</div>
	</div>
	<div class="contentBox pt10">
		<div class="m w980">
			<div class="clearfix pb10">
				<div class="l photoBg2" id="test00">
					<a href="###"><span
						class="photoTxt">修改头像</span> <img src="<%=path%>/styles/images/ad_hyheader.jpg"
						alt="${sessionUserName.userName}" id="user_face"> </a>
				</div>
				<div class="r w780 pr30 fc_gray6">
					<div class="clearfix bb_d padde">
						<div class="l grName">${sessionUserName.userName}</div>
						<div class="r mt10 pt10">
							<span for="dynamic" class="vam">邀请链接：</span> <input size="60"
								class="vam ml5 h20 w300" id="dynamic"
								value="###"
								type="text"> <img src="images/cp_03.jpg"
								id="copy-dynamic" class="vam">
							<div
								style="position: absolute; left: 1061px; top: 148px; width: 60px; height: 25px; z-index: 99;"
								id="zclip-ZeroClipboardMovie_1" class="zclip">
								<embed id="ZeroClipboardMovie_1" src="flash/ZeroClipboard.swf"
									loop="false" menu="false" quality="best" bgcolor="#ffffff"
									name="ZeroClipboardMovie_1" allowscriptaccess="always"
									allowfullscreen="false" type="application/x-shockwave-flash"
									pluginspage="http://www.macromedia.com/go/getflashplayer"
									flashvars="id=1&amp;width=60&amp;height=25" wmode="transparent"
									align="middle" height="25" width="60">
							</div>
						</div>
					</div>
					<div class="bt_f padde2 lh26">
						<strong class="fc_orange inline"> 普通用户 </strong> <span
							class="icon_mail_true"><span>邮箱已验证</span></span> <span
							class="ml20 fc_gray9"> 积分：70分 [今年已消费￥0元 ] </span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=path%>/styles/js/jquery.js"></script>
	<script>
		$(document).ready(function() {

			$.ajax({
				type : "GET",
				url : "/user/generate_invite_url",
				dataType : 'json',
				success : function(data) {
					if (data.status == 200) {
						$("#dynamic").val(data.msg);
						return;
					} else {
					}
				}
			});

			$('img#copy-dynamic').zclip({
				path : '<%=path%>/styles/flash/ZeroClipboard.swf',
				copy : function() {
					return $('input#dynamic').val();
				}
			});

		});
	</script>
	<script type="text/javascript" src="<%=path%>/styles/js/artDialog.js"></script>
	<div class="contentBox pb20">
		<div class="m w980">
			<div class="clearfix selectedBox2">
				<%@ include file="leftPanel.jsp"%>

				<div class="r selectRight2">
					<div class="pb30 bst4 fc_gray4 pt30 minH340">
						<table class="table_1 w780 m tc fc_gray6">
							<tbody>
								<tr>
									<th>发件人</th>
									<th class="w175">标题</th>
									<th>时间</th>
									<th class="w57">操作</th>
								</tr>
								<c:forEach var="src" items="${list}">
								<tr>
									<td>${src.sender.userName}</td>
									
									<td class="mesTxt">
									${src.title}
									<span class="noread" data-id="9" data-readed="0" data-content="${src.content}">
										<span class="openOrder"></span>
									</span>
									</td>
									
									<td><fmt:formatDate value="${src.insertTime}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
									<td><a href="<%=path%>/user/deleteInform/${sessionUserName.id}/${src.id}.html" class="orderBtn_gray">删除此条</a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function del(id) {
			if (id) {
				$.ajax({
					type : 'GET',
					url : '/user/delete_notice',
					data : 'id=' + id,
					dataType : 'json',
					success : function(data) {
						alert(data.msg);
						location.reload();
					}
				});
			} else {
				return false;
			}

		}
		$("document")
				.ready(
						function() {
							$("span[data-content]")
									.each(
											function(i, v) {
												var $this = $(v);
												var content = $(v).attr(
														'data-content');
												var isreaded = $(v).attr(
														'data-readed');
												var id = $(v).attr('data-id');
												$(v)
														.bind(
																'click',
																function() {
																	if ($("#appendtr").length) {
																		$(
																				"#appendtr")
																				.remove();
																		$(
																				".closeOrder")
																				.attr(
																						"class",
																						"openOrder");
																	} else {
																		$(v)
																				.parent()
																				.parent()
																				.after(
																						"<tr id='appendtr'><td colspan='4'>"
																								+ content
																								+ "</td></tr>");
																		$(v)
																				.children(
																						"span")
																				.attr(
																						"class",
																						"closeOrder");
																		if (isreaded == 0) {
																			//更新读状态
																			$
																					.ajax({
																						type : "POST",
																						dataType : 'json',
																						url : "/user/changereadstatus",
																						data : "id="
																								+ id,
																						success : function(
																								data) {
																							if (data.status == 200) {
																								var noreadnum = parseInt($(
																										"#shownotificatontip")
																										.html());
																								var tipcontent = (noreadnum - 1) > 0 ? (noreadnum - 1)
																										: '';
																								if (tipcontent == '') {
																									$(
																											"#shownotificatontip")
																											.removeClass(
																													'redNum');
																								}
																								$this
																										.attr(
																												'data-readed',
																												1);
																								$this
																										.removeClass('noread');
																								$(
																										"#shownotificatontip")
																										.html(
																												tipcontent);
																							}
																						}

																					});
																		}
																	}
																});

											});

						});
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

			$(document).ready(function() {
				//获取并填充友情链接数据
				/*$.ajax({
					type: "GET",
					url: "/tools/getfriendlink/",
					dataType:'json',
					success:function(result) {
						var flstr = '';
						if(result){
							for(var i=0;i<result.length;i++){
								flstr +="<li><a target='_blank' href='"+result[i]['link']+"' alt='"+result[i]['desc']+"' title='"+result[i]['desc']+"'>"+result[i]['name']+"</a></li>";
						}
							$("#flink").html(flstr);
						$("#flarea").show();
					}

					}

				});*/

			});
		</script>
		<script src="<%=path%>/styles/js/h.js" type="text/javascript"></script>
		<a
			href="http://tongji.baidu.com/hm-web/welcome/ico?s=20301d57224db44ce1820fbf43208d85"
			target="_blank"><img src="images/21.gif" border="0" height="20"
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