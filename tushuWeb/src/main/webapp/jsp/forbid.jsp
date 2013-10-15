<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sorry! 您无权限访问该页面！</title>
<STYLE type=text/css>TD {
	FONT-SIZE: 9pt; FONT-FAMILY: "Arial", "Helvetica", "sans-serif"
}
BODY {
	FONT-SIZE: 9pt; FONT-FAMILY: "Arial", "Helvetica", "sans-serif"
}
.tbl1 {
	BORDER-RIGHT: #3f5294 1px solid; BORDER-TOP: #3f5294 1px solid; FONT-SIZE: 9pt; BORDER-LEFT: #3f5294 1px solid; BORDER-BOTTOM: #3f5294 1px solid
}
.td1 {
	BORDER-RIGHT: #ffffff 0px solid; BORDER-TOP: #ffffff 1px solid; BORDER-LEFT: #ffffff 1px solid; BORDER-BOTTOM: #ffffff 0px solid
}
</STYLE>

<STYLE type=text/css>A {
	COLOR: #000000; TEXT-DECORATION: none
}
A:hover {
	COLOR: #ff0000; TEXT-DECORATION: none
}
</STYLE>

<STYLE type=text/css>.style6 {
	FONT-FAMILY: "Courier New", Courier, mono
}
</STYLE>

<META content="MSHTML 6.00.2900.2180" name=GENERATOR>
<script type="text/javascript" src="<%=path%>/styles/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
var i = 5;
$(function(){
	window.setInterval("clock()", 1000);
});

function load(){
	window.location = '<%=path%>/index/index.html';
}

function clock(){
	i--;
    $("#time").html(i + "秒钟后自动跳转。");
    if(i == 0){
    	load();
    }
}
</script>
</head>
<body bgColor=#ffffff>
	<P>　</P>
<DIV align=center>
<TABLE height=257 cellSpacing=0 cellPadding=0 width=306 
background="<%=path%>/styles/images/404.jpg" border=0>
  <TBODY>
  <TR>
    <TD vAlign=top background=""><BR>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="14%">　</TD>
          <TD width="86%">
            <TABLE style="FILTER: glow(color=#ffffff, strength=5)" width="100%" 
            align=center>
              <TBODY>
              <TR>
                <TD align=middle height=14><B><SPAN class=style6>
                <FONT color=#ff0000 size=4>Sorry!</FONT>
                </SPAN></B></TD></TR>
               </TBODY></TABLE></TD></TR>
        <TR>
          <TD>　</TD>
          <TD>
            <DIV align=center>
            <TABLE cellSpacing=2 cellPadding=0 width="100%" align=center 
            border=0>
              <TBODY>
              <TR>
                <TD height=22>您无权限访问该页面。</TD></TR>
              <TR>
                <TD height=22>
                  <LI>请访问<A href="<%=path%>/index/index.html">
                  <FONT color=#990000>首页</FONT></A></LI></TD></TR>
              <TR>
                <TD style="PADDING-RIGHT: 8px">
                  <LI id="time">5秒钟后自动跳转。</LI></TD></TR></TBODY></TABLE><BR></DIV></TD></TR></TBODY></TABLE>
      <P>　</P></TD></TR>
  <TR>
    <TD vAlign=bottom align=right><A href="<%=path%>/index/index.html">
    <FONT color=#ff0000>[由此返回主页]</FONT></A></TD></TR></TBODY></TABLE></DIV>
</body>
</html>