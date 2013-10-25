<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1">
<meta property="qc:admins" content="21505450126453056375">
<meta name="keywords" content="涂书网、自制图书、同学录、个人写真、纪念册、生日礼物、结婚纪念、创意礼物、个性化定制、珍藏、成长日记、影集、制作照片、涂书网、涂书">
<meta name="description" content="涂书网是为那些热爱生活、善于分享的人,提供记录生活、分享感动、实现创意的个性图书定制分享平台。向用户提供自制图书、旅行日志、婚恋纪念册、宝宝成长录的画册设计和印制，让用户享受三分钟DIY照片书的乐趣。记录生活感动与真实，和朋友、同事一同分享无处不在的喜悦和感动。涂书网做自己的书">
<title>涂书网 - 个性图书定制分享平台</title>
<link type="text/css" rel="stylesheet" href="<%=path%>/styles/css/base.css?1379493573">
<link type="text/css" rel="stylesheet" href="<%=path%>/styles/css/common.css?1379493573">
<link href="<%=path%>/styles/images/favicon.ico" mce_href="images/favicon.ico" rel="bookmark" type="image/x-icon">
<link href="<%=path%>/styles/images/favicon.ico" mce_href="images/favicon.ico" rel="icon" type="image/x-icon">
<link href="<%=path%>/styles/images/favicon.ico" mce_href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
<script src="http://www.google-analytics.com/ga.js" async="" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/styles/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/styles/js/js.js?1379493573"></script>
<script type="text/javascript" src="<%=path%>/styles/js/area.js"></script>

<script type="text/javascript" src="<%=path%>/styles/js/artDialog.js"></script>
<script type="text/javascript" src="<%=path%>/styles/js/cart.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		showPopup();
		_init_area();
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
<style type="text/css" charset="utf-8">/* See license.txt for terms of usage */
/** reset styling **/
.firebugResetStyles {
    z-index: 2147483646 !important;
    top: 0 !important;
    left: 0 !important;
    display: block !important;
    border: 0 none !important;
    margin: 0 !important;
    padding: 0 !important;
    outline: 0 !important;
    min-width: 0 !important;
    max-width: none !important;
    min-height: 0 !important;
    max-height: none !important;
    position: fixed !important;
    transform: rotate(0deg) !important;
    transform-origin: 50% 50% !important;
    border-radius: 0 !important;
    box-shadow: none !important;
    background: transparent none !important;
    pointer-events: none !important;
    white-space: normal !important;
}

.firebugBlockBackgroundColor {
    background-color: transparent !important;
}

.firebugResetStyles:before, .firebugResetStyles:after {
    content: "" !important;
}
/**actual styling to be modified by firebug theme**/
.firebugCanvas {
    display: none !important;
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
.firebugLayoutBox {
    width: auto !important;
    position: static !important;
}

.firebugLayoutBoxOffset {
    opacity: 0.8 !important;
    position: fixed !important;
}

.firebugLayoutLine {
    opacity: 0.4 !important;
    background-color: #000000 !important;
}

.firebugLayoutLineLeft, .firebugLayoutLineRight {
    width: 1px !important;
    height: 100% !important;
}

.firebugLayoutLineTop, .firebugLayoutLineBottom {
    width: 100% !important;
    height: 1px !important;
}

.firebugLayoutLineTop {
    margin-top: -1px !important;
    border-top: 1px solid #999999 !important;
}

.firebugLayoutLineRight {
    border-right: 1px solid #999999 !important;
}

.firebugLayoutLineBottom {
    border-bottom: 1px solid #999999 !important;
}

.firebugLayoutLineLeft {
    margin-left: -1px !important;
    border-left: 1px solid #999999 !important;
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
.firebugLayoutBoxParent {
    border-top: 0 none !important;
    border-right: 1px dashed #E00 !important;
    border-bottom: 1px dashed #E00 !important;
    border-left: 0 none !important;
    position: fixed !important;
    width: auto !important;
}

.firebugRuler{
    position: absolute !important;
}

.firebugRulerH {
    top: -15px !important;
    left: 0 !important;
    width: 100% !important;
    height: 14px !important;
    background: url("data:image/png,%89PNG%0D%0A%1A%0A%00%00%00%0DIHDR%00%00%13%88%00%00%00%0E%08%02%00%00%00L%25a%0A%00%00%00%04gAMA%00%00%D6%D8%D4OX2%00%00%00%19tEXtSoftware%00Adobe%20ImageReadyq%C9e%3C%00%00%04%F8IDATx%DA%EC%DD%D1n%E2%3A%00E%D1%80%F8%FF%EF%E2%AF2%95%D0D4%0E%C1%14%B0%8Fa-%E9%3E%CC%9C%87n%B9%81%A6W0%1C%A6i%9A%E7y%0As8%1CT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AATE9%FE%FCw%3E%9F%AF%2B%2F%BA%97%FDT%1D~K(%5C%9D%D5%EA%1B%5C%86%B5%A9%BDU%B5y%80%ED%AB*%03%FAV9%AB%E1%CEj%E7%82%EF%FB%18%BC%AEJ8%AB%FA'%D2%BEU9%D7U%ECc0%E1%A2r%5DynwVi%CFW%7F%BB%17%7Dy%EACU%CD%0E%F0%FA%3BX%FEbV%FEM%9B%2B%AD%BE%AA%E5%95v%AB%AA%E3E5%DCu%15rV9%07%B5%7F%B5w%FCm%BA%BE%AA%FBY%3D%14%F0%EE%C7%60%0EU%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5JU%88%D3%F5%1F%AE%DF%3B%1B%F2%3E%DAUCNa%F92%D02%AC%7Dm%F9%3A%D4%F2%8B6%AE*%BF%5C%C2Ym~9g5%D0Y%95%17%7C%C8c%B0%7C%18%26%9CU%CD%13i%F7%AA%90%B3Z%7D%95%B4%C7%60%E6E%B5%BC%05%B4%FBY%95U%9E%DB%FD%1C%FC%E0%9F%83%7F%BE%17%7DkjMU%E3%03%AC%7CWj%DF%83%9An%BCG%AE%F1%95%96yQ%0Dq%5Dy%00%3Et%B5'%FC6%5DS%95pV%95%01%81%FF'%07%00%00%00%00%00%00%00%00%00%F8x%C7%F0%BE%9COp%5D%C9%7C%AD%E7%E6%EBV%FB%1E%E0(%07%E5%AC%C6%3A%ABi%9C%8F%C6%0E9%AB%C0'%D2%8E%9F%F99%D0E%B5%99%14%F5%0D%CD%7F%24%C6%DEH%B8%E9rV%DFs%DB%D0%F7%00k%FE%1D%84%84%83J%B8%E3%BA%FB%EF%20%84%1C%D7%AD%B0%8E%D7U%C8Y%05%1E%D4t%EF%AD%95Q%BF8w%BF%E9%0A%BF%EB%03%00%00%00%00%00%00%00%00%00%B8vJ%8E%BB%F5%B1u%8Cx%80%E1o%5E%CA9%AB%CB%CB%8E%03%DF%1D%B7T%25%9C%D5(%EFJM8%AB%CC'%D2%B2*%A4s%E7c6%FB%3E%FA%A2%1E%80~%0E%3E%DA%10x%5D%95Uig%15u%15%ED%7C%14%B6%87%A1%3B%FCo8%A8%D8o%D3%ADO%01%EDx%83%1A~%1B%9FpP%A3%DC%C6'%9C%95gK%00%00%00%00%00%00%00%00%00%20%D9%C9%11%D0%C0%40%AF%3F%EE%EE%92%94%D6%16X%B5%BCMH%15%2F%BF%D4%A7%C87%F1%8E%F2%81%AE%AAvzr%DA2%ABV%17%7C%E63%83%E7I%DC%C6%0Bs%1B%EF6%1E%00%00%00%00%00%00%00%00%00%80cr%9CW%FF%7F%C6%01%0E%F1%CE%A5%84%B3%CA%BC%E0%CB%AA%84%CE%F9%BF)%EC%13%08WU%AE%AB%B1%AE%2BO%EC%8E%CBYe%FE%8CN%ABr%5Dy%60~%CFA%0D%F4%AE%D4%BE%C75%CA%EDVB%EA(%B7%F1%09g%E5%D9%12%00%00%00%00%00%00%00%00%00H%F6%EB%13S%E7y%5E%5E%FB%98%F0%22%D1%B2'%A7%F0%92%B1%BC%24z3%AC%7Dm%60%D5%92%B4%7CEUO%5E%F0%AA*%3BU%B9%AE%3E%A0j%94%07%A0%C7%A0%AB%FD%B5%3F%A0%F7%03T%3Dy%D7%F7%D6%D4%C0%AAU%D2%E6%DFt%3F%A8%CC%AA%F2%86%B9%D7%F5%1F%18%E6%01%F8%CC%D5%9E%F0%F3z%88%AA%90%EF%20%00%00%00%00%00%00%00%00%00%C0%A6%D3%EA%CFi%AFb%2C%7BB%0A%2B%C3%1A%D7%06V%D5%07%A8r%5D%3D%D9%A6%CAu%F5%25%CF%A2%99%97zNX%60%95%AB%5DUZ%D5%FBR%03%AB%1C%D4k%9F%3F%BB%5C%FF%81a%AE%AB'%7F%F3%EA%FE%F3z%94%AA%D8%DF%5B%01%00%00%00%00%00%00%00%00%00%8E%FB%F3%F2%B1%1B%8DWU%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*UiU%C7%BBe%E7%F3%B9%CB%AAJ%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5*%AAj%FD%C6%D4%5Eo%90%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5%86%AF%1B%9F%98%DA%EBm%BBV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%AD%D6%E4%F58%01%00%00%00%00%00%00%00%00%00%00%00%00%00%40%85%7F%02%0C%008%C2%D0H%16j%8FX%00%00%00%00IEND%AEB%60%82") repeat-x !important;
    border-top: 1px solid #BBBBBB !important;
    border-right: 1px dashed #BBBBBB !important;
    border-bottom: 1px solid #000000 !important;
}

.firebugRulerV {
    top: 0 !important;
    left: -15px !important;
    width: 14px !important;
    height: 100% !important;
    background: url("data:image/png,%89PNG%0D%0A%1A%0A%00%00%00%0DIHDR%00%00%00%0E%00%00%13%88%08%02%00%00%00%0E%F5%CB%10%00%00%00%04gAMA%00%00%D6%D8%D4OX2%00%00%00%19tEXtSoftware%00Adobe%20ImageReadyq%C9e%3C%00%00%06~IDATx%DA%EC%DD%D1v%A20%14%40Qt%F1%FF%FF%E4%97%D9%07%3BT%19%92%DC%40(%90%EEy%9A5%CB%B6%E8%F6%9Ac%A4%CC0%84%FF%DC%9E%CF%E7%E3%F1%88%DE4%F8%5D%C7%9F%2F%BA%DD%5E%7FI%7D%F18%DDn%BA%C5%FB%DF%97%BFk%F2%10%FF%FD%B4%F2M%A7%FB%FD%FD%B3%22%07p%8F%3F%AE%E3%F4S%8A%8F%40%EEq%9D%BE8D%F0%0EY%A1Uq%B7%EA%1F%81%88V%E8X%3F%B4%CEy%B7h%D1%A2E%EBohU%FC%D9%AF2fO%8BBeD%BE%F7X%0C%97%A4%D6b7%2Ck%A5%12%E3%9B%60v%B7r%C7%1AI%8C%BD%2B%23r%00c0%B2v%9B%AD%CA%26%0C%1Ek%05A%FD%93%D0%2B%A1u%8B%16-%95q%5Ce%DCSO%8E%E4M%23%8B%F7%C2%FE%40%BB%BD%8C%FC%8A%B5V%EBu%40%F9%3B%A72%FA%AE%8C%D4%01%CC%B5%DA%13%9CB%AB%E2I%18%24%B0n%A9%0CZ*Ce%9C%A22%8E%D8NJ%1E%EB%FF%8F%AE%CAP%19*%C3%BAEKe%AC%D1%AAX%8C*%DEH%8F%C5W%A1e%AD%D4%B7%5C%5B%19%C5%DB%0D%EF%9F%19%1D%7B%5E%86%BD%0C%95%A12%AC%5B*%83%96%CAP%19%F62T%86%CAP%19*%83%96%CA%B8Xe%BC%FE)T%19%A1%17xg%7F%DA%CBP%19*%C3%BA%A52T%86%CAP%19%F62T%86%CA%B0n%A9%0CZ%1DV%C6%3D%F3%FCH%DE%B4%B8~%7F%5CZc%F1%D6%1F%AF%84%F9%0F6%E6%EBVt9%0E~%BEr%AF%23%B0%97%A12T%86%CAP%19%B4T%86%CA%B8Re%D8%CBP%19*%C3%BA%A52huX%19%AE%CA%E5%BC%0C%7B%19*CeX%B7h%A9%0C%95%E1%BC%0C%7B%19*CeX%B7T%06%AD%CB%5E%95%2B%BF.%8F%C5%97%D5%E4%7B%EE%82%D6%FB%CF-%9C%FD%B9%CF%3By%7B%19%F62T%86%CA%B0n%D1R%19*%A3%D3%CA%B0%97%A12T%86uKe%D0%EA%B02*%3F1%99%5DB%2B%A4%B5%F8%3A%7C%BA%2B%8Co%7D%5C%EDe%A8%0C%95a%DDR%19%B4T%C66%82fA%B2%ED%DA%9FC%FC%17GZ%06%C9%E1%B3%E5%2C%1A%9FoiB%EB%96%CA%A0%D5qe4%7B%7D%FD%85%F7%5B%ED_%E0s%07%F0k%951%ECr%0D%B5C%D7-g%D1%A8%0C%EB%96%CA%A0%A52T%C6)*%C3%5E%86%CAP%19%D6-%95A%EB*%95q%F8%BB%E3%F9%AB%F6%E21%ACZ%B7%22%B7%9B%3F%02%85%CB%A2%5B%B7%BA%5E%B7%9C%97%E1%BC%0C%EB%16-%95%A12z%AC%0C%BFc%A22T%86uKe%D0%EA%B02V%DD%AD%8A%2B%8CWhe%5E%AF%CF%F5%3B%26%CE%CBh%5C%19%CE%CB%B0%F3%A4%095%A1%CAP%19*Ce%A8%0C%3BO*Ce%A8%0C%95%A12%3A%AD%8C%0A%82%7B%F0v%1F%2FD%A9%5B%9F%EE%EA%26%AF%03%CA%DF9%7B%19*Ce%A8%0C%95%A12T%86%CA%B8Ze%D8%CBP%19*Ce%A8%0C%95%D1ae%EC%F7%89I%E1%B4%D7M%D7P%8BjU%5C%BB%3E%F2%20%D8%CBP%19*Ce%A8%0C%95%A12T%C6%D5*%C3%5E%86%CAP%19*Ce%B4O%07%7B%F0W%7Bw%1C%7C%1A%8C%B3%3B%D1%EE%AA%5C%D6-%EBV%83%80%5E%D0%CA%10%5CU%2BD%E07YU%86%CAP%19*%E3%9A%95%91%D9%A0%C8%AD%5B%EDv%9E%82%FFKOee%E4%8FUe%A8%0C%95%A12T%C6%1F%A9%8C%C8%3D%5B%A5%15%FD%14%22r%E7B%9F%17l%F8%BF%ED%EAf%2B%7F%CF%ECe%D8%CBP%19*Ce%A8%0C%95%E1%93~%7B%19%F62T%86%CAP%19*Ce%A8%0C%E7%13%DA%CBP%19*Ce%A8%0CZf%8B%16-Z%B4h%D1R%19f%8B%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1%A2%A52%CC%16-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2EKe%98-Z%B4h%D1%A2EKe%D02%5B%B4h%D1%A2EKe%D02%5B%B4h%D1%A2E%8B%96%CA0%5B%B4h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%16-%95a%B6h%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-Z*%C3l%D1%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z%B4T%86%D9%A2E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4h%A9%0C%B3E%8B%16-Z%B4h%A9%0CZf%8B%16-Z%B4h%A9%0CZf%8B%16-Z%B4h%D1R%19f%8B%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1%A2%A52%CC%16-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2EKe%98-Z%B4h%D1%A2EKe%D02%5B%B4h%D1%A2EKe%D02%5B%B4h%D1%A2E%8B%96%CA0%5B%B4h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%16-%95a%B6h%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-Z*%C3l%D1%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z%B4T%86%D9%A2E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4h%A9%0C%B3E%8B%16-Z%B4h%A9%0CZf%8B%16-Z%B4h%A9%0CZf%8B%16-Z%B4h%D1R%19f%8B%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1%A2%A52%CC%16-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2EKe%98-Z%B4h%D1%A2EKe%D02%5B%B4h%D1%A2EKe%D02%5B%B4h%D1%A2E%8B%96%CA0%5B%B4h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%16-%95a%B6h%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-Z*%C3l%D1%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z%B4T%86%D9%A2E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4%AE%A4%F5%25%C0%00%DE%BF%5C'%0F%DA%B8q%00%00%00%00IEND%AEB%60%82") repeat-y !important;
    border-left: 1px solid #BBBBBB !important;
    border-right: 1px solid #000000 !important;
    border-bottom: 1px dashed #BBBBBB !important;
}

.overflowRulerX > .firebugRulerV {
    left: 0 !important;
}

.overflowRulerY > .firebugRulerH {
    top: 0 !important;
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
.fbProxyElement {
    position: fixed !important;
    pointer-events: auto !important;
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



	<script type="text/javascript">
		$(".header_link_box").hover(function(){
			$(this).addClass("header_link_hover");
		},function(){
			$(this).removeClass("header_link_hover");
		});
	</script>

<div class="pathBg">
  <div class="w980 m"><a href="#">首页</a>&gt;<a href="/cart.html">购物车</a>&gt;<span>支付信息</span></div>
</div>
<div class="contentBox pt10 pb30">
<form action="<%=path%>/user/${sessionUserName.id}/createOrderSuccess.html">
<input type="hidden" name="pay_ids" value="${pay_ids}">
  <div class="m w980">
    <div class="buyTitle_2"><span class="hide">我的购物车-<strong>支付信息</strong>-生成订单</span></div>
    <div class="buyBox fc_gray6 pt20 pb30">
      <div class="w860 m bbdb pt20 pb30">
        <div class="lh26">
            <div class="dialogAddr js_address_edit_div hide">
            <div class="diaA_title">常用地址</div>
            <div class="diaA_main">
              <table class="table_1 w540 m tc bg_fff">
                <tbody><tr>
                  <th class="w57">选择</th>
                  <th>收货人</th>
                  <th>收货地址</th>
                  <th class="w57">操作</th>
                </tr>
                <c:forEach var="src" items="${addresses}">
                <tr id="tr_ads_14918">
                  <td><input checked="checked" name="address_id" id="radio_ads_14918" value="14918" onclick="change_form(14918)" type="radio"></td>
                  <td>${src.recipientsName}</td>
                  <td class="tl">${src.province}、${src.city}、${src.county}、${src.street}</td>
                  <td><a href="javascript:;" onclick="del_ads(14918);" class="fc_orange">删除</a></td>
                </tr>
                </c:forEach>
              </tbody>
              </table>
              <div class="btdb mt15">
                <div class="clearfix pt20">
                  <label class="l tr w90 mr10"><strong class="fc_orange vam">*</strong> 收货人：</label>
                  <input class="l inpBox w220 h18" id="uname" type="text">
                </div>
                <div class="clearfix pt10">
                  <label class="l tr w90 mr10"><strong class="fc_orange vam">*</strong> 省份：</label>
                  <div class="l">
                    <select id="s_province" name="s_province"></select>&nbsp;&nbsp;
				    <select id="s_city" name="s_city" ></select>&nbsp;&nbsp;
				    <select id="s_county" name="s_county"></select>
                  </div>
                </div>
                <div class="clearfix pt10">
                  <label class="l tr w90 mr10"><strong class="fc_orange vam">*</strong> 地址：</label>
                  <input class="l inpBox w350 h18" id="address" type="text">
                </div>
                <div class="clearfix pt10">
                  <label class="l tr w90 mr10"><strong class="fc_orange vam">*</strong> 手机号码：</label>
                  <input class="l inpBox w90 h18" id="mobiel" type="text">
                  <label class="l mr10 ml10">或 固定电话</label>
                  <input class="l inpBox w90 h18" id="tel" type="text">
                </div>
                <div class="clearfix pt10">
                  <label class="l tr w90 mr10">电子邮件：</label>
                  <input class="l inpBox w147 h18" id="email" type="text">
                  <p class="l ml10 fc_gray9">用来接受订单提醒邮件，便于您及时了解订单状态</p>
                </div>
                <div class="clearfix pt10">
                  <label class="l tr w90 mr10">邮编：</label>
                  <input class="l inpBox w57 h18" id="code" type="text">
                  <p class="l ml10 fc_gray9">有助于快速确定送货地址</p>
                </div>
                <div class="mt15 ml20 pl80 clearfix"> <a href="javascript:;" onclick="save_consignee(0)" class="l btn_gray3 m0">添加到常用地址</a>
                  <p class="l ml10 fc_gray9">注：标注<strong class="vam ml5 mr5 fc_orange">*</strong>为必填项</p>
                </div>
                <div class="mt15 pl80 pb10 ml20">
                  <input class="btn_addr" value="保存收货人信息" onclick="save_consignee(1)" type="button">
                </div>
              </div>
            </div>
          </div>
          
        <strong class="fs16">收货人信息</strong>
        <a id="editAddr" href="javascript:;" class="fc_orange ml10">[修改]</a> 
        </div>
        <c:if test="${address != null}">
        <ul class="pl15 fs13 lh24 pt10">
          <li><span class="inline w90 pr5 tr">收货人姓名：</span>${address.recipientsName}</li>
          <li><span class="inline w90 pr5 tr">省份：</span>${address.province}</li>
          <li><span class="inline w90 pr5 tr">地址：</span>${address.city}、${address.county}、${address.street}</li>
          <li><span class="inline w90 pr5 tr">手机号码：</span>${address.phone}</li>
          <li><span class="inline w90 pr5 tr">固定电话：</span>${address.tel}</li>
          <li><span class="inline w90 pr5 tr">电子邮件：</span>${address.email}</li>
          <li><span class="inline w90 pr5 tr">邮编：</span>${address.postCode}</li>
        </ul>
        </c:if>
        <input id="consignee_id" value="14918" type="hidden">
        <c:if test="${address == null}">
        <div class="btdb mt15">
                <div class="clearfix pt20">
                  <label class="l tr w90 mr10"><strong class="fc_orange vam">*</strong> 收货人：</label>
                  <input class="l inpBox w220 h18" id="uname" type="text">
                </div>
                <div class="clearfix pt10">
                  <label class="l tr w90 mr10"><strong class="fc_orange vam">*</strong> 省份：</label>
                  <div class="l">
					<select id="s_province" name="s_province"></select>&nbsp;&nbsp;
				    <select id="s_city" name="s_city" ></select>&nbsp;&nbsp;
				    <select id="s_county" name="s_county"></select>
                  </div>
                </div>
                <div class="clearfix pt10">
                  <label class="l tr w90 mr10"><strong class="fc_orange vam">*</strong> 地址：</label>
                  <input class="l inpBox w350 h18" id="address" type="text">
                </div>
                <div class="clearfix pt10">
                  <label class="l tr w90 mr10"><strong class="fc_orange vam">*</strong> 手机号码：</label>
                  <input class="l inpBox w90 h18" id="mobiel" type="text">
                  <label class="l mr10 ml10">或 固定电话</label>
                  <input class="l inpBox w90 h18" id="tel" type="text">
                </div>
                <div class="clearfix pt10">
                  <label class="l tr w90 mr10">电子邮件：</label>
                  <input class="l inpBox w147 h18" id="email" type="text">
                  <p class="l ml10 fc_gray9">用来接受订单提醒邮件，便于您及时了解订单状态</p>
                </div>
                <div class="clearfix pt10">
                  <label class="l tr w90 mr10">邮编：</label>
                  <input class="l inpBox w57 h18" id="code" type="text">
                  <p class="l ml10 fc_gray9">有助于快速确定送货地址</p>
                </div>
                <div class="mt15 ml20 pl80 clearfix"> <a href="javascript:;" onclick="save_consignee(0)" class="l btn_gray3 m0">添加到常用地址</a>
                  <p class="l ml10 fc_gray9">注：标注<strong class="vam ml5 mr5 fc_orange">*</strong>为必填项</p>
                </div>
                <div class="mt15 pl80 pb10 ml20">
                  <input class="btn_addr" value="保存收货人信息" onclick="save_consignee(1)" type="button">
                </div>
              </div>
         </c:if>
         
      </div>
      <div class="w860 m bbdb pt20 pb30">
        <div class="lh26"><strong class="fs16">选择支付方式</strong></div>
        <ul class="pl15 pt10">
          <li class="p5">
            <input class="vam" name="pay_use" value="1" id="bank_1" checked="checked" type="radio">
            <label for="bank_1" class="ml5"><img src="<%=path%>/styles/images/bank/btn_alipay.gif" class="vam"></label>
          </li>
        </ul>
        <!-- 目前只开放一个支付宝支付方式 -->
        <!--  
        <ul class="pl15 pt10">
          <li class="p5">
            <input class="vam" name="pay_use" value="6" id="bank_2" type="radio">
            <label for="bank_2" class="ml5"><img src="<%=path%>/styles/images/bank/btn_qqpay.gif" class="vam" height="52" width="130"></label>
          </li>
        </ul>
        <ul class="clearfix w560 pl15">
          <li class="l mr15 p5">
            <input class="vam" name="pay_use" id="bank_3" value="1025" type="radio">
            <label for="bank_3" class="ml5"><img src="<%=path%>/styles/images/bank/bank_gsyh2.gif" class="vam" alt="中国工商银行"></label>
          </li>
          <li class="l mr15 p5">
            <input class="vam" name="pay_use" id="bank_4" value="305" type="radio">
            <label for="bank_4" class="ml5"><img src="<%=path%>/styles/images/bank/bank_msyh2.gif" class="vam" alt="中国民生银行"></label>
          </li>
          <li class="l mr15 p5">
            <input class="vam" name="pay_use" id="bank_5" value="308" type="radio">
            <label for="bank_5" class="ml5"><img src="<%=path%>/styles/images/bank/bank_zsyh2.gif" class="vam" alt="招商银行"></label>
          </li>
          <li class="l mr15 p5">
            <input class="vam" name="pay_use" id="bank_6" value="105" type="radio">
            <label for="bank_6" class="ml5"><img src="<%=path%>/styles/images/bank/bank_jsyh2.gif" class="vam" alt="中国建设银行"></label>
          </li>
          <li class="l mr15 p5">
            <input class="vam" name="pay_use" id="bank_7" value="103" type="radio">
            <label for="bank_7" class="ml5"><img src="<%=path%>/styles/images/bank/bank_nyyh2.gif" class="vam"></label>
          </li>
          <li class="l mr15 p5">
            <input class="vam" name="pay_use" id="bank_8" value="104" type="radio">
            <label for="bank_8" class="ml5"><img src="<%=path%>/styles/images/bank/bank_zgyh2.gif" class="vam" alt="中国银行"></label>
          </li>
          <li class="l mr15 p5">
            <input class="vam" name="pay_use" id="bank_9" value="301" type="radio">
            <label for="bank_9" class="ml5"><img src="<%=path%>/styles/images/bank/bank_jtyh.gif" class="vam" alt="交通银行"></label>
          </li>
          <li class="l mr15 p5">
            <input class="vam" name="pay_use" id="bank_10" value="311" type="radio">
            <label for="bank_10" class="ml5"><img src="<%=path%>/styles/images/bank/bank_hxyh.gif" class="vam" alt="华夏银行"></label>
          </li>
          <li class="l mr15 p5">
            <input class="vam" name="pay_use" id="bank_11" value="309" type="radio">
            <label for="bank_11" class="ml5"><img src="<%=path%>/styles/images/bank/bank_xyyh.gif" class="vam" alt="兴业银行"></label>
          </li>
        </ul>
        <script type="text/javascript">
        $(document).ready(function(){
        	$(".js_hidebank a").click(function(){
        		$(this).hide();
        		$(".js_hidebank ul").slideDown();
        	});

        });
					</script>
        <div class="js_hidebank"> <a class="fc_orange" href="javascript:void(0);"><b>[选择其他银行]</b></a>
          <ul class="clearfix w560 pl15" style="display:none;">
            <li class="l mr15 p5">
              <input class="vam" name="pay_use" id="bank_12" value="306" type="radio">
              <label for="bank_12" class="ml5"><img class="vam" src="<%=path%>/styles/images/bank/bank_gdfz.gif" alt="广东发展银行"></label>
            </li>
            <li class="l mr15 p5">
              <input class="vam" name="pay_use" id="bank_13" value="307" type="radio">
              <label for="bank_13" class="ml5"><img class="vam" src="<%=path%>/styles/images/bank/bank_szfz.gif" alt="深圳发展银行"></label>
            </li>
            <li class="l mr15 p5">
              <input class="vam" name="pay_use" id="bank_14" value="314" type="radio">
              <label for="bank_14" class="ml5"><img class="vam" src="<%=path%>/styles/images/bank/bank_pfyh.gif" alt="上海浦东发展银行"></label>
            </li>
            <li class="l mr15 p5">
              <input class="vam" name="pay_use" id="bank_15" value="313" type="radio">
              <label for="bank_15" class="ml5"><img class="vam" src="<%=path%>/styles/images/bank/bank_zxyh.gif" alt="中信银行"></label>
            </li>
            <li class="l mr15 p5">
              <input class="vam" name="pay_use" id="bank_16" value="312" type="radio">
              <label for="bank_16" class="ml5"><img class="vam" src="<%=path%>/styles/images/bank/bank_gdyh.gif" alt="光大银行"></label>
            </li>
            <li class="l mr15 p5">
              <input class="vam" name="pay_use" id="bank_17" value="316" type="radio">
              <label for="bank_17" class="ml5"><img class="vam" src="<%=path%>/styles/images/bank/bank_njyh.gif" alt="南京银行"></label>
            </li>
            <li class="l mr15 p5">
              <input class="vam" name="pay_use" id="bank_18" value="317" type="radio">
              <label for="bank_18" class="ml5"><img class="vam" src="<%=path%>/styles/images/bank/bank_bhyh.gif" alt="渤海银行"></label>
            </li>
            <li class="l mr15 p5">
              <input class="vam" name="pay_use" id="bank_19" value="3279" type="radio">
              <label for="bank_19" class="ml5"><img class="vam" src="<%=path%>/styles/images/bank/bank_psbc.gif" alt="邮政储蓄银行"></label>
            </li>
            <li class="l mr15 p5">
              <input class="vam" name="pay_use" id="bank_20" value="327" type="radio">
              <label for="bank_20" class="ml5"><img class="vam" src="<%=path%>/styles/images/bank/bank_unionpay.gif" alt="中国银联"></label>
            </li>
          </ul>
          -->
        </div>
      </div>
      <div class="w860 m bbdb pt20 pb30">
        <div class="lh26"><strong class="fs16">选择配送方式</strong></div>
        <ul class="pl15 lh26 pt10">
        	<c:forEach var="item" items="${expressMessages}" varStatus="index">
        	<li>
            	<input id="payUse_${index.count}" class="vam mr15 posts" name="posts" 
            			money="${item.expressPrice}" value="${item.id}" checked="checked" type="radio">
            	<label class="vam" for="payUse_3">${item.expressName}</label>
          	  	需支付${item.expressPrice}元快递费
          	</li>
          	</c:forEach>
        </ul>
      </div>
      <div class="w860 m bbdb pt20 pb30">
        <div class="lh26"><strong class="fs16">商品信息</strong></div>
        <table class="table_1 w780 m tc fc_gray6 mt15">
          <tbody><tr>
            <th>商品信息</th>
            <th>类型</th>
            <!--<th>原价</th>-->
            <th>商品金额</th>
            <th>数量</th>
          </tr>
                                                  <tr>
            <td><img src="http://platform.tushu.com/book/86554?thumb&amp;wrap=70" height="100px" width="100px">
              <p></p></td>
            <td>佳缘</td>
            <!--<td>￥15.00</td>-->
            <td class="ts_color">￥9.90</td>
            <td class="ts_color">1</td>
          </tr>
                            </tbody></table>
      </div>
      <div class="w860 m bbdb pt20 pb30">
      	<!-- 代金券-->
        <!-- 
        <div class="lh26"><strong class="fs16">使用优惠券/代金券</strong></div>
        <div class="clearfix buyMoney">
            <div class="bm_content">
                <div class="bm_open">
                    <div class="bm_title"><a href="javascript:void(0)" class="bm_oc"></a><strong class="fs14">使用优惠券</strong><a href="javascript:void(0)" class="order_tip"><span><i></i>1. 优惠券通过涂书网随机赠送、线上活动等形式发放，不同优惠券可用于单类商品金额减免或包邮等优惠；<br>2. 单个订单限用一张优惠券，不能同时享有站内其他优惠，可与任一代金券叠加使用。</span></a></div>
                    <div class="bm_main">
                        <div class="pt10 pb20">
                            <label class="inline ml20 tr vam">输入优惠券：</label>
                            <span class="moneyCodeBox">
                                <input class="w175 h18 vam" id="money_code" onblur="ck_code()" type="text"><input class="vam" id="cancle_promo" title="取消使用优惠券" type="button">
                            </span>
                        </div>
                                                <table id="promotable">
                          <tbody><tr>
                              <th width="5%">&nbsp;</th>
                              <th>优惠券</th>
                              <th width="10%">适用类别</th>
                              <th width="15%">面值</th>
                              <th width="40%">使用期限</th>
                          </tr>
                                                    <tr>
                              <td class="tc"><input name="promoradio" value="AD756HI332FZUMAC" type="radio"></td>
                              <td class="tc fc_blue">AD756HI332FZUMAC</td>
                              <td class="tc">全部</td>
                              <td class="tr">￥10.00元</td>
                              <td class="tc">2013-08-15 00:00:00-2013-09-21 00:00:00</td>
                          </tr>
                                                  </tbody></table>                    </div>
                </div>

                <div class="bm_open">
                    <div class="bm_title mt10"><a href="javascript:void(0)" class="bm_oc"></a><strong class="fs14">使用代金券</strong><a href="javascript:void(0)" class="order_tip"><span><i></i>1. 代金券用于直接减免订单金额，可通过线上购买获得，具体购买渠道敬请期待；<br>2. 提交订单时，如代金券金额大于订单应付金额，差额不予退还，请调整订单金额；<br>3. 单个订单限用一张代金券，可与其他任一优惠券叠加使用。</span></a></div>
                    <div class="bm_main">
                        <div class="pt10">
                            <label class="inline ml20 tr vam">输入代金券：</label>
                            <span class="moneyCodeBox">
                                <input class="w175 h18 vam" name="voucher_code" id="money_code2" onblur="ck_code2()" type="text"><input style="display: none;" class="vam" id="cancle_promo2" title="取消使用优惠券" type="button">
                            </span>
                            <input value="" id="vstr" type="hidden">
                        </div>
                        <div class="bm_bgGray">
                            <p><strong>温馨提示：</strong></p>
                            <p>1. 单个订单可同时使用代金券、优惠券各一张，优惠券不能与站内其他优惠策略同时使用；</p>
                            <p>2. 使用的代金券金额若大于订单实付金额，差额不予退回，请注意调整订单金额；</p>
                            <p>3. 提交订单后，无论订单是否支付，已选用的代金券、优惠券均视为使用成功。</p>
                        </div>
                    </div>
                </div>
            </div>
            -->
            <div class="bm_bottom clearfix">
                <div class="tl fs14">商品金额：<span class="fs12 fc_orange">￥9.90</span> <span id="compute"> + 运费 10元</span></div>
                <div class="tr"><strong class="fs14">实付金额<span class="fc_orange ml10 fs20 ff_yahei">￥<span id="price_all" data-total="1990" discount="0" book_nums="1" posts="0">19.90</span>元</span></strong></div>
            </div>
            <input id="price_hide" value="990" type="hidden">
            <input name="pay_for_price" id="pay_for_price" value="990" type="hidden">
        </div>
      </div>
      <div class="w860 m pt20 pb30">
        <div class="lh26"><strong class="fs16">订单备注</strong><span class="ml20"></span></div>
        <div class="clearfix mt15 pl30 pr30">
          <textarea class="l inpBox w560 h60" id="order_text"></textarea>
          <!-- 
          <input class="r btn_orange mt5" onclick="goto_pay();" value="生成订单" id="goto_pay" cart_id="37119" type="button">
           -->
           <input class="r btn_orange mt5" value="生成订单" id="goto_pay" type="submit">
          <!--div class="tr pt10" style="clear:both"><a class="fc_red" href="http://www.tushu.com/blog/?p=4495&amp;preview=true" target="_blank">由于春节放假，从2013年1月29日起下单的用户，商品发货延期！
		  </a></div-->
        </div>
      </div>
    </div>
  </div>
  <input name="order_discount" id="order_discount" value="0" type="hidden">
  <input name="free_post" id="free_post" value="0" type="hidden">
  <input name="pm" id="pm" value="0" type="hidden">
</form>
</div>

<script type="text/javascript">

$(".bm_oc").click(function(){
	
    var $parent_bm = $(this).parent().parent();
    $parent_bm.attr("class") == "bm_open" ? $parent_bm.attr("class","bm_close") : $parent_bm.attr("class","bm_open");
});


$(document).ready(function(){
	//省的change事件
	$(".province_id").live('change', function(){
		$(".city_id").html("<option value='0'>请选择--市</option>");
		$(".county_id").html("<option value='0'>请选择--区</option>");
		var code = $(this).val();
		$.ajax({
			type: "GET",
			url: "/flow/get_options/"+code+"/get_city/province_id",
			dataType:'json',
			success:function(result) {
				$(".city_id").html("<option value='0'>请选择--市</option>" + result.data);
			}
		});
	});
	// 市 change
	$(".city_id").live('change', function(){
		$(".county_id").html("<option value='0'>请选择--区</option>");
		var code = $(this).val();
		$.ajax({
			type: "GET",
			url: "/flow/get_options/"+code+"/get_county/city_id",
			dataType:'json',
			success:function(result) {
				//alert(result);
				$(".county_id").html("<option value='0'>请选择--区</option>" + result.data);
			}
		});

	});

	var ad = $("#consignee_id").val();
	change_form(ad);
	$("#radio_ads_"+ad).attr("checked","checked");

	caculate_price();
});

function change_form(ad){
	if(ad<=0){
		return;
	}
	$.ajax({
		type: "GET",
		url: "/flow/get_consignee/" + ad,
		dataType: "json",
		success: function(msg){
			//改变表单内容
			$("#uname").val(msg.data.name);
			$("#address").val(msg.data.address);
			$("#mobiel").val(msg.data.telphone);
			$("#tel").val(msg.data.phone);
			$("#email").val(msg.data.email);
			$("#code").val(msg.data.code);
			$("#provin_"+msg.data.province_id).attr("selected","selected");
			//$(".city_id").html("<option value='"+msg.data.city_id+"'>"+msg.data.city_name+"</option>");
			//$(".county_id").html("<option value='"+msg.data.county_id+"'>"+msg.data.county_name+"</option>");
			$.ajax({
				type: "GET",
				url: "/flow/get_options/"+msg.data.province_id+"/get_city/province_id",
				dataType:'json',
				success:function(result) {
					$(".city_id").html("<option value='0'>请选择--市</option>" + result.data);
					$(".city_id option").each(function(i,v){
						if($(v).val()==msg.data.city_id){
							$(v).attr('selected','selected');
							$(v).attr('selected','true');

					}
					});
				}
				});



			$.ajax({
				type: "GET",
				url: "/flow/get_options/"+msg.data.city_id+"/get_county/city_id",
				dataType:'json',
				success:function(result) {
					//alert(result);
					$(".county_id").html("<option value='0'>请选择--区</option>" + result.data);
					$(".county_id option").each(function(ii,vv){
						if($(vv).val()==msg.data.county_id){
							//alert($(vv).val());
							$(vv).attr('selected','selected');
							$(vv).attr('selected','true');

					}
					});
				}
			});
			//改变外部地址内容
			$("#info_uname").html(msg.data.name);
			$("#info_area").html(msg.data.province_name+msg.data.city_name+msg.data.county_name);
			$("#info_address").html(msg.data.address);
			$("#info_mobiel").html(msg.data.telphone);
			$("#info_tel").html(msg.data.phone);
			$("#info_email").html(msg.data.email);
			$("#info_code").html(msg.data.code);
			//改变提交到订单地址的id
			$("#consignee_id").val(ad);
			$("#radio_ads_"+ad).attr("checked","checked");
		}
	});
}
function del_ads(id){
	var ad = $("#consignee_id").val();
	if(id == null || id == '')
	{
		adialog('提示系信息','参数非法',1);
		return;
	}
	var callback = function(){
		$.ajax({
			type: "GET",
			url: "/flow/drop_consignee/" + id,
			dataType:'json',
			success:function(result) {
				if(result.error > 0)
				{
					adialog('提示信息','错误代号：' + result.error + '\n错误描述：' + result.msg,1);
					return;
				}
				$('#tr_ads_'+id).hide();
				if(ad == id)
				{
					$("#consignee_id").val(0);
				}
			}
		});
	};
	adialog('提示信息','您确定删除这条收货人信息？',2,callback);
}



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



</script><script src=" http://hm.baidu.com/h.js?20301d57224db44ce1820fbf43208d85" type="text/javascript"></script><a href="http://tongji.baidu.com/hm-web/welcome/ico?s=20301d57224db44ce1820fbf43208d85" target="_blank"><img src="http://eiv.baidu.com/hmt/icon/21.gif" border="0" height="20" width="20"></a>
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