<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

<div class="head_post">
    <div class="m w980 clearfix">
        <div class="r tr">
        	您好，
            <a href="###" id="358456" class="fc_orange">${sessionUserName.userName}</a><span class="h_hr"></span>
            	
            <a href="<%=path%>/user/informs/${sessionUserName.id}.html">我的通知
            	<c:if test="${informNum > 0}">
            		<span id="showcarttip" class="redNum" style="display: inline-block;">${informNum}</span>
            	</c:if>
            </a>
            <span class="h_hr"></span>
           	 	
            <a href="<%=path%>/user/listWorks/${sessionUserName.id}.html">我的作品
            </a><span class="h_hr"></span>
            
            <a href="<%=path%>/user/${sessionUserName.id}/order.html">我的订单
            	<!--  
            	<span id="showcarttip" class="redNum" style="display: inline-block;">1</span>
            	-->
            </a><span class="h_hr"></span>
            
			<a href="<%=path%>/user/${sessionUserName.id}/cart.html">
				购物车
				<c:choose>
					<c:when test="${shopingCart > 0}">
						<span id="shopping_cart" class="redNum" style="display: inline-block;">${shopingCart}</span>
					</c:when>
					<c:otherwise>
						<span id="shopping_cart" class="redNum" style="display: none;"></span>
					</c:otherwise>
				</c:choose>
			</a><span class="h_hr"></span>
			
            <a href="<%=path%>/login/loginOut.html" id="href_logout">退出</a>
            <a href="###" class="h_icon_3">帮助</a>
            <a href="###" class="ml10">用户晒单</a>
            <c:if test="${sessionUserName.userType eq 'ADMIN'}">
            	<a href="<%=path%>/admin/index.html">网站后台</a>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>