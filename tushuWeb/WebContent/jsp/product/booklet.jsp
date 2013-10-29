<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${product.name}</title>

<script src="<%=path%>/styles/js/booklet/jquery.min.js" type="text/javascript"></script>
<script src="<%=path%>/styles/js/booklet/jquery-ui.min.js" type="text/javascript"></script>
<script src="<%=path%>/styles/js/booklet/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="<%=path%>/styles/js/booklet/jquery.booklet.latest.js" type="text/javascript"></script>
<script src="<%=path%>/styles/js/booklet/custom.js" type="text/javascript"></script>

<link href="<%=path%>/styles/js/booklet/jquery.booklet.latest.css" type="text/css" rel="stylesheet" media="screen, projection, tv" />

<link href="<%=path%>/styles/css/common_201308.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="<%=path%>/styles/css/base.css">
<link type="text/css" rel="stylesheet" href="<%=path%>/styles/css/common1.css">
<link href="http://www.tushu.com/images/favicon.ico" mce_href="images/favicon.ico" rel="bookmark" type="image/x-icon" />
<link href="http://www.tushu.com/images/favicon.ico" mce_href="images/favicon.ico" rel="icon" type="image/x-icon" />
<link href="http://www.tushu.com/images/favicon.ico" mce_href="images/favicon.ico" rel="shortcut icon" type="image/x-icon" />

    <style type="text/css">
        body {background:#ccc; font:normal 12px/1.2 arial, verdana, sans-serif;}
    </style>
    
</head>
<body>
	<h1>
		${product.name}--${product.pages - 2}页
	</h1>
	
    <div id="mybook">
    	<c:forEach begin="1" end="${product.pages}" step="1" varStatus="index">
    		<div title="page ${index.count}" >
    			<div id="canMoveDiv${index.count}" style="position: absolute;">
    				<button id="addText${index.count}" value="添加文字" onclick="showTextAdd('addText${index.count}', 'textArea${index.count}');">添加文字</button>
    				<button id="addPic${index.count}" value="添加图片" onclick="showImageAdd('addPic${index.count}', 'imageSelect${index.count}');">添加图片</button>
    				<button id="makeSure${index.count}" value="确定" onclick="makeSure('addText${index.count}', 
    							'addPic${index.count}', 'makeSure${index.count}', 'imageSelect${index.count}', 
    							'textArea${index.count}', 'canMoveDiv${index.count}');">确定</button>
    				<textarea rows="" cols="" id="textArea${index.count}" style="display: none" onblur="hideTextAdd('textArea${index.count}', 'describe${index.count}');"></textarea>
    				<img id="pictures${index.count}" alt="" src="">
    				<p id="describe${index.count}"></p>
    				<select id="imageSelect${index.count}" style="display: none">
	    				<c:choose>
	    					<c:when test="${images != null}">
	    						<option selected="selected">请选择图片</option>
	    					<c:forEach var="image" items="${images}">
	    						<option value="${image.url}" onclick="showImage('pictures${index.count}', '${image.url}');">${image.name}</option>
	    					</c:forEach>
	    					</c:when>
	    					<c:otherwise>
	    						<option>请先到我的图片上传图片</option>
	    					</c:otherwise>
    					</c:choose>
    				</select>
    			</div>
        	</div>
    	</c:forEach>
    </div>
    
    <div align="right">
    	<a class="js_book_preview cart_btn inline ml20 vam" onclick="addToShoppingCart(${product.productId})" title="加入购物车"></a>
    </div>
</body>
</html>