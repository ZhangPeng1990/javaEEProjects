<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>涂书网 - 个性图书定制分享平台</title>
<link type="text/css" rel="stylesheet" href="<%=path%>/styles/css/base.css">
<link type="text/css" rel="stylesheet" href="<%=path%>/styles/css/common1.css">
<link href="http://www.tushu.com/images/favicon.ico" mce_href="images/favicon.ico" rel="bookmark" type="image/x-icon">
<link href="http://www.tushu.com/images/favicon.ico" mce_href="images/favicon.ico" rel="icon" type="image/x-icon">
<link href="http://www.tushu.com/images/favicon.ico" mce_href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
<script src="<%=path%>/styles/js/ga.js" async="" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/styles/js/jquery-1.js"></script>
<script type="text/javascript" src="<%=path%>/styles/js/js.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		showPopup();
	});
</script>

<style type="text/css">

    .index_header{border-bottom:2px solid #fa5000;}
    .index_nav{position:relative;height:33px;margin-top:36px;}
    .index_nav ul{}
    .index_nav li{display:inline;}
    .index_nav .nav_link{padding:0 16px;height:33px;font:normal 16px/33px "microsoft yahei";display:inline-block;}
    .index_nav .nav_link i{border-color:#6d6d6d #fff #fff;border-style:solid;border-width:5px 5px 0;width:0;height:0;display:inline-block;vertical-align:middle;margin-left:12px;}
    .index_nav .nav_link:hover,.index_nav .nav_link_hover{color:#fff;background-color:#fa5000;text-decoration:none;}
    .index_nav .nav_link:hover i,.index_nav .nav_link_hover i{border-color:#fff #fa5000 #fa5000;}
    .nav_list{width:493px;position:absolute;z-index:3;border:1px solid #fa5000;padding:10px 15px;background-color:#fff;top:33px;right:0;line-height:24px;;display:none;}

    .nav_list li.clearfix{border-bottom:1px solid #ddd;display:block;padding:5px 0;float:left;width:100%;}
    .nav_list li strong{font-size:14px;color:#333;}
    .nav_list ul{width:415px;}
    .nav_list li a{color:#666;white-space:nowrap;}
    .nav_list li a:hover{color:#fa5000;text-decoration:none;}

    .fgf{margin:0 3px;color:#ddd;}
    .noBorder{border:none!important;}
    .nl_book{background:url(/images/index/bg/book.jpg) no-repeat bottom right #fff;padding:10px 15px 62px;}
    .nl_log{background:url(/images/index/bg/log.jpg) no-repeat top right #fff;padding:7px 190px 30px 20px;;width:313px;}
    .nl_log ul{width:255px;}
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
        $(".index_nav > li").hover(function(){
            $(this).children(".nav_link").addClass("nav_link_hover");
            $(this).children(".nav_list").show();
        },function(){
            $(this).children(".nav_link").removeClass("nav_link_hover");
            $(this).children(".nav_list").hide();
        });
    </script>
    <div class="contentBox pt10 pb20">
        <div class="m w980">
            <div class="clearfix selectedBox">
                <div class="l selectLeft">
                    <div class="clearfix">
                    
                    <c:forEach var="father" items="${productTypes}">
                    <div class="clearfix">
                            <span class=""><a href="<%=path%>/product/listByType/${father.id}.html" class="icon_21001">${father.name}&nbsp;</a>
                            </span>
                               <div style="display: none;" class="ulList clearfix">
                               		<c:forEach var="son" items="${father.sons}">
                                       <div class="clearfix">
           								<strong class="l"><a href="<%=path%>/product/listByType/${son.id}.html">${son.name}&nbsp;</a></strong>
                                               <ul class="r">
                                               		<c:forEach var="grandChild" items="${son.sons}">
                                                    <li class="l"><a href="<%=path%>/product/details/${grandChild.prodcut.productId}.html">${grandChild.name}&nbsp;</a>
                                                    <!-- <img src="images/hot.png">-->
                                                    </li>
                                                    </c:forEach>
                                                </ul>
                                           </div>
                                       </c:forEach>
                              </div>
                      </div>
                    </c:forEach>
			
                 </div>
                </div>
                
                <div class="r selectRight">
                    <div class="bst4 padde">
                        <div class="clearfix minH340 pb20">
                        <c:forEach var="fatherType" items="${types}">
                        	<c:choose>
                        		<c:when test="${fn:length(fatherType.sons) > 0}">
	                            <c:forEach var="sons" items="${fatherType.sons}">
                      				<div class="l pl40 pt20 pb10 w154">
	                            	<a href="<%=path%>/product/details/${sons.prodcut.productId}.html" class="cpImg">
	                            	<img src="<%=path%>/styles/images/list22.png" alt="" width="154px"></a>
	                                <div class="pt10"><a href="<%=path%>/product/details/${sons.prodcut.productId}.html" class="fc_gray4">${sons.prodcut.name}</a></div>
	                                <div class="mt5"><span class="fc_red2 vam mr10">价格：${sons.prodcut.sellPrice}元起</span></div>
	                                <div class="clearfix mt5"><a href="<%=path%>/product/details/${sons.prodcut.productId}.html" class="l fc_gray4">详细介绍</a>
	                                <a href="###" class="r grayCpBtn">立即制作</a></div>
	                            </div>
	                        	</c:forEach>
                        		</c:when>
                        		<c:otherwise>
                        		<div class="l pl40 pt20 pb10 w154">
	                            	<a href="<%=path%>/product/details/${fatherType.prodcut.productId}.html" class="cpImg">
	                            	<img src="<%=path%>/styles/images/list22.png" alt="" width="154px"></a>
	                                <div class="pt10"><a href="<%=path%>/product/details/${fatherType.prodcut.productId}.html" class="fc_gray4">${fatherType.prodcut.name}</a></div>
	                                <div class="mt5"><span class="fc_red2 vam mr10">价格：${fatherType.prodcut.sellPrice}元起</span></div>
	                                <div class="clearfix mt5"><a href="<%=path%>/product/details/${fatherType.prodcut.productId}.html" class="l fc_gray4">详细介绍</a>
	                                <a href="###" class="r grayCpBtn">立即制作</a></div>
	                            </div>
                        		</c:otherwise>
                        	</c:choose>
                         </c:forEach>
                         </div>
                        <div class="pageBox">
                        </div>
                </div>
               </div>
            </div>
        </div>
    </div>

	<script type="text/javascript" src="<%=path%>/styles/js/artDialog.js"></script>

	<div class="poa js_book_preview_div" style="display:none">
	    <div id="flashView"></div>
	</div>


	<script type="text/javascript" src="<%=path%>/styles/js/swfobject.js"></script>
	<script type="text/javascript">
		$(".js_book_preview").click(function(){
			var bookid = $(this).attr("bookid");
			$.ajax({
				type: "GET",
				url: "/home/get_book_view/" + bookid,
				dataType: "json",
				success: function(data){
					if(data.status != 200)
					{
						adialog('提示信息',data.message,1);
						return;
					}
					var bookdata = data.data;
					var bookWidth=bookdata.width,bookHeight=bookdata.height,urls=bookdata.urls;
					var booktype =bookdata.BookType;

					var swfname = '';
					if(bookdata.viewclass == 1){
						swfname = '/js/bookView/FocusView.swf';
					}else{
						swfname = '/js/bookView/BookPreview.swf';
					}
					var duplex=bookdata.duplex;

					show_book_prewiew(bookWidth,bookHeight,urls,booktype,swfname,duplex);

					$(".js_book_preview_div").css({zIndex:2,top:(document.documentElement.scrollTop+document.body.scrollTop+30),left:(($(window).width()-$(".js_book_preview_div").width())/2)}).show().after("<div id='js_book_bg' class='hide'></div>").prepend("<span id='js_book_btn'>×</span>");
                    $("#js_book_btn").css({color:"#fff",backgroundColor:"#666",display:"block",position:"absolute",textAlign:"center",width:25,height:25,marginTop:10,marginLeft:945,lineHeight:"22px",cursor:"pointer",borderRadius:15,fontSize:18}).click(function(){
                        $("#js_book_bg").remove();
                        $(this).parent().html("<div id='flashView'></div>");
                    })
                    $("#js_book_bg").css({backgroundColor:"#000",opacity:.5,width:"100%",height:($("body").height()),position:"absolute",top:0}).removeClass("hide");

					return;
				}
			});
		});

		function show_book_prewiew(bookWidth,bookHeight,urls,booktype,swfname,duplex){
			var swfwidth = 980;
			var swfheight = 550;
			eval('var url_json = ' + urls);url_json = encodeURIComponent(JSON.stringify(url_json));
			var flashvars = {skinSwf:'http://www.tushu.com/js/bookView/Asset.swf',bookWidth:bookWidth,bookHeight:bookHeight,duplex:duplex,urls:url_json,book_type:booktype},params = {menu: "false",allowFullscreen: "true",allowScriptAccess: "always",bgcolor: "#FFFFFF",wmode: "opaque"},attributes = {id:"fff"};
			swfobject.embedSWF(swfname, "flashView", swfwidth, swfheight, "9.0.0", "expressInstall.swf", flashvars, params, attributes);
		}
	</script>






<script type="text/javascript">
    var r = 0,e = 0;
	$(".bookTitle a").mouseover(function() {
		r = 1;
        detailType(r,e);
	}).mouseout(function() {
		r = 0;
        detailType(r,e);
	});
    $(".bookDetail").mouseover(function(){
        e = 1;
        detailType(r,e);
    }).mouseout(function(){
        e = 0;
        detailType(r,e);
    });

    function detailType(a,b){
        if(a == 0 && b == 0){
            $(".bookTitle a").removeClass("_hover");
            $(".bookDetail").stop(true).hide();
        }else{
            $(".bookTitle a").addClass("_hover");
            $(".bookDetail").stop(true).show();
        }
    }

</script>
<script type="text/javascript">
    var current = 0;
    var imgNum = 1;
    var interval = 0;
    function showContent(index){
        var oldTag = document.getElementById("list" + current.toString());
        var oldCon = document.getElementById("showCon" + current.toString());
        var newTag = document.getElementById("list" + index.toString());
        var newCon = document.getElementById("showCon" + index.toString());
        if(current != index){
            oldTag.className= " ";
            oldCon.style.display = "none";
            current = index;
            newTag.className="on";
            newCon.style.display = "block";
        }
    }
    function setMode(n){
        if(n != null){
            imgNum = n+1;
        }
        if(interval == 0){
            interval = setInterval("showTime()", 3000);  //时间调整
        }
    }
    function showTime(){
        if(imgNum > 4){
            imgNum = 0;
        }
        showContent(imgNum);
        imgNum ++;
    }
    setMode();
</script>
<script type="text/javascript">
    var ison = false;
    $(".selectLeft > div.clearfix > div.clearfix").hover(function(){
        var a = $(this).index();
        if(jQuery.browser.version == "6.0"){
            if($(this).children("span").attr("class") == "on"){
                ison = true;
            }
            $(this).addClass("por").children("span").css({zIndex:5,position:"relative",backgroundPosition:"0 -205px"});
        }else{
            $(this).addClass("por").children("span").addClass("_hover");
        }
        $(".selectLeft .ulList").eq(a).show();
    },function(){
        var a = $(this).index();
        if(jQuery.browser.version == "6.0"){
            if(ison){
                $(this).addClass("por").children("span").css({position:"static",backgroundPosition:"0 -48px"});
                ison = false;
            }else{
                $(this).addClass("por").children("span").css({position:"static",backgroundPosition:"0 0"});
            }
        }else{
            $(this).removeClass("por").children("span").removeClass("_hover");
        }
        $(".selectLeft .ulList").eq(a).hide();
    });
</script>

<%@ include file="../footer.jsp"%>

<!--谷歌Google Analytics代码-->
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-27037508-1']);
	_gaq.push(['_trackPageview']);

	(function() {
	  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();
</script>
<!--****-->

<div style="display: none;">
	<!--百度统计代码-->
	<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F20301d57224db44ce1820fbf43208d85' type='text/javascript'%3E%3C/script%3E"));

$(document).ready(function(){
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




</script><script src="js/h.js" type="text/javascript"></script><a href="http://tongji.baidu.com/hm-web/welcome/ico?s=20301d57224db44ce1820fbf43208d85" target="_blank"><img src="images/21.gif" border="0" height="20" width="20"></a>
</div>
<!--****-->


<div class="aui_focus" style="display: none;"><div class="aui_outer"><table style="" class="aui_table aui_outerTable"><tbody><tr><td class="aui_border aui_nw"></td><td class="aui_border aui_n"></td><td class="aui_border aui_ne"></td></tr><tr><td class="aui_border aui_w"></td><td class="aui_center"></td><td class="aui_border aui_e"></td></tr><tr><td class="aui_border aui_sw"></td><td class="aui_border aui_s"></td><td style="cursor: se-resize;" class="aui_border aui_se"></td></tr></tbody></table></div></div>
</body>
</html>