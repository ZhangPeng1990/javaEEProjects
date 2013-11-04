<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书网--${product.name}</title>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<object id="zip_uploader" width="100%" height="836" align="middle"  style="visibility: visible;"
		 data="<%=path%>/styles/flash/swf/editorframe.swf?ver=20130524" name="zip_uploader" id="zip_uploader" type="application/x-shockwave-flash">
		<param value="high" name="quality">
		<param value="#ffffff" name="bgcolor">
		<param value="true" name="allowfullscreen">
		<param value="always" name="allowScriptAccess">
		<param value="transparent" name="wmode">
		<param value="true" name="hasPriority">
		<param value="uploadUrl=<%=path%>/user/${sessionUserName.id}/uploadFile.html" name="flashvars">
	</object>
</body>
</html>