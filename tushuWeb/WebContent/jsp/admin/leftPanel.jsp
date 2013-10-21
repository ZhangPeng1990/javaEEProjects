<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<ul class="l selectLeft2">
		<li class="${operation eq 'USER' ? 'on' : ''}">
			<a href="<%=path%>/admin/users.html" class="noBg">用户管理</a>
		</li>
		<li class="${operation eq 'WEB_HEAD' ? 'on' : ''}">
			<a href="<%=path%>/admin/productType.html" class="noBg">网页头部分类</a>
		</li>
		<li class="${operation eq 'INDEX_TYPE' ? 'on' : ''}">
			<a href="<%=path%>/admin/indexType.html" class="noBg">首页显示分类</a>
		</li>
		<li class="${operation eq 'PRODUCT' ? 'on' : ''}">
			<a href="<%=path%>/admin/product.html" class="noBg">产品管理</a>
		</li>
		<li class="${operation eq 'IMAGE' ? 'on' : ''}">
			<a href="<%=path%>/admin/index.html" class="noBg">图片管理</a>
		</li>
	</ul>
</body>
</html>