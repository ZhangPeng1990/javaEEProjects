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
<title></title>
</head>
<body>
	<form action="<%=path%>/temp/add.html">
		<fieldset>
			<span>name</span>
			<input type="text" name="name"/>
		</fieldset>
		<fieldset>
			<span>li_Class</span>
			<input type="text" name="li_Class"/>
		</fieldset>
		<fieldset>
			<span>a_Class</span>
			<input type="text" name="a_Class"/>
		</fieldset>
		<input type="submit">
	</form>
</body>
</html>