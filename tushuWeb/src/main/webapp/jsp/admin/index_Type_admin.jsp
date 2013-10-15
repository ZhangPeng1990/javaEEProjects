<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>涂书网 - 后台管理系统</title>
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
	background: url(<%=path%>/styles/images/index/bg/book.jpg) no-repeat bottom right #fff;
	padding: 10px 15px 62px;
}

.nl_log {
	background: url(<%=path%>/styles/images/index/bg/log.jpg) no-repeat top right #fff;
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
	<!-- <%@ include file="../header.jsp"%> -->
	
	<script type="text/javascript">
		$(".index_nav > li").hover(function() {
			$(this).children(".nav_link").addClass("nav_link_hover");
			$(this).children(".nav_list").show();
		}, function() {
			$(this).children(".nav_link").removeClass("nav_link_hover");
			$(this).children(".nav_list").hide();
		});
	</script>
	<div class="contentBox pt10">
		<div class="m w980">
			<div class="clearfix pb10">
				<div class="l photoBg2" id="test00">
					<a href="###"><span
						class="photoTxt">修改头像</span> <img src="images/ad_hyheader.jpg"
						alt="${sessionUserName.userName}" id="user_face"> </a>
				</div>
				<div class="r w780 pr30 fc_gray6">
					<div class="clearfix bb_d padde">
						<div class="l grName">${sessionUserName.userName}</div>
					</div>
					<div class="bt_f padde2 lh26">
						<strong class="fc_orange inline">系统管理员</strong>
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
			})

			$('img#copy-dynamic').zclip({
				path : '<%=path%>/styles/flash/ZeroClipboard.swf',
				copy : function() {
					return $('input#dynamic').val();
				}
			});

		});
	</script>
	<script type="text/javascript" src="js/artDialog.js"></script>
	<div class="contentBox pb20">
		<div class="m w980">
			<div class="clearfix selectedBox2">
				<%@ include file="leftPanel.jsp"%>
				
				<div class="r selectRight2">
					<div class="pb30 bst4 fc_gray4 pt30 minH340">
						<table class="table_1 w780 m tc fc_gray6">
							<tbody>
								<tr>
									<th class="w60">分类名称</th>
									<th class="w320">描述信息</th>
									<th class="w90">该分类下产品数量</th>
									<th class="w57">操作</th>
								</tr>
								<c:forEach var="types" items="${types}">
								<tr>
									<td><a href="###">${types.name}</a></td>
									<td>
										${types.describe} 
									</td>
									<td><a href="###">${fn:length(types.objects)}</a></td>
									<td align="center"><a href="###" class="orderBtn_gray" onclick="return confirm('确认删除吗?');">删除</a></td>
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

		</script>
		<script src="js/h.js" type="text/javascript"></script>
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