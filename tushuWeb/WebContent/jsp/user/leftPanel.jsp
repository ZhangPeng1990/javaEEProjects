<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<ul class="l selectLeft2">
		<li class="${operation eq 'ACCOUNT' ? 'on' : ''}"><a href="###"
			class="noBg">账号资料</a></li>
		<li class="${operation eq 'ORDER' ? 'on' : ''}"><a href="<%=path%>/user/${sessionUserName.id}/order.html" class="noBg">我的订单</a></li>
		<li class="${operation eq 'WORKS' ? 'on' : ''}"><a href="###"
			class="noBg">我的作品</a></li>
		<li class="${operation eq 'DRAFT' ? 'on' : ''}"><a href="###"
			class="noBg">我的草稿</a></li>
		<li class="${operation eq 'PICTURE' ? 'on' : ''}"><a href="<%=path%>/user/pic/${sessionUserName.id}.html" class="noBg">我的图片</a></li>
		
		<li class="${operation eq 'ADDRESS' ? 'on' : ''}"><a href="<%=path%>/user/address/${sessionUserName.id}.html"
			class="noBg">地址管理</a></li>
		<li class="${operation eq 'INFORMS' ? 'on' : ''}"><a href="<%=path%>/user/informs/${sessionUserName.id}.html" class="noBg">我的通知</a></li>
		<!--  
		<li class=""><a href="###"
			class="noBg">我的优惠券</a></li>
		<li class=""><a href="###"
			class="noBg">网友上传</a></li>
		-->
	</ul>
</body>
</html>