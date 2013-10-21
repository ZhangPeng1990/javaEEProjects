<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<div class="w980 m clearfix index_header">
    <h1 class="l"><a href="<%=path%>/index/index.html"><img src="<%=path%>/styles/images/logo.jpg" alt=""></a></h1>
    <ul class="r index_nav">
        <li class="">
            <a href="<%=path%>/index/index.html" class="nav_link"><strong>&nbsp;&nbsp;首页&nbsp;&nbsp;</strong></a>
        </li>
        
        <c:forEach var="father" items="${productTypes}">
        <li>
            <a href="<%=path%>/product/listByType/${father.id}.html" class="nav_link"><strong>${father.name}</strong><i></i></a>
            <ul class="nav_list nl_book hide">
            	<c:forEach var="son" items="${father.sons}">
            	<li class="clearfix">
					<a href="<%=path%>/product/listByType/${son.id}.html" class="l"><strong>${son.name}</strong></a>
					<ul class="r">
						<c:forEach var="grandChild" items="${son.sons}">
							<li><a href="<%=path%>/product/details/${grandChild.prodcut.productId}.html">${grandChild.name}</a></li>
							<li class="fgf">|</li>
						</c:forEach>
					</ul>
				</li>
            	</c:forEach>
            </ul>
        </li>
        </c:forEach>
    </ul>
</div>
</body>
</html>