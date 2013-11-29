<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<link type="text/css" rel="stylesheet" href="<%=path%>/styles/css/base.css?1380270927">
<link type="text/css" rel="stylesheet" href="<%=path%>/styles/css/common.css?1380270927">
<link href="<%=path%>/styles/images/favicon.ico" mce_href="images/favicon.ico" rel="bookmark" type="image/x-icon">
<link href="<%=path%>/styles<%=path%>/styles/images/favicon.ico" mce_href="images/favicon.ico" rel="icon" type="image/x-icon">
<link href="/images/favicon.ico" mce_href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
<script src="http://www.google-analytics.com/ga.js" async="" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/styles/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/styles/js/js.js?1380270927"></script>
<script src="<%=path%>/styles/js/photoBookEditer/custom.js" type="text/javascript"></script>
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
    .nl_book{background:url(<%=path%>/styles/images/index/bg/book.jpg) no-repeat bottom right #fff;padding:10px 15px 62px;}
    .nl_log{background:url(<%=path%>/styles/images/index/bg/log.jpg) no-repeat top right #fff;padding:7px 190px 30px 20px;;width:313px;}
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
    <div class="w980 m"><a href="http://www.tushu.com/">首页</a>&gt;<a href="http://www.tushu.com/my/book.html">会员中心</a>&gt;<span>我的订单</span></div>
</div>
<div class="contentBox pt10">
    <div class="m w980">
        <div class="clearfix pb10">
            <div class="l photoBg2" id="test00">
                <a href="http://www.tushu.com/my/info.html#nav"><span class="photoTxt">修改头像</span>
                                        <img src="/img/ad/ad_hyheader.jpg" alt="123456" id="user_face">
                                    </a>
            </div>
            <div class="r w780 pr30 fc_gray6">
                <div class="clearfix bb_d padde">
                                        <div class="l grName">123456</div>
                                        <div class="r mt10 pt10">
                    <div style="position: absolute; left: 1061px; top: 148px; width: 60px; height: 25px; z-index: 99;" id="zclip-ZeroClipboardMovie_1" class="zclip"><embed id="ZeroClipboardMovie_1" src="/js/ZeroClipboard.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" name="ZeroClipboardMovie_1" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=1&amp;width=60&amp;height=25" wmode="transparent" align="middle" height="25" width="60"></div></div>
                </div>
                <div class="bt_f padde2 lh26">
                    <strong class="fc_orange inline">
                    普通用户                    </strong>
                                            <span class="icon_mail_true"><span>邮箱已验证</span></span>
                                        <span class="ml20 fc_gray9">
                        <!--积分：70分--> [今年已消费￥0元
                        ]
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/js/jquery.zclip.js"></script>
<script>
$(document).ready(function(){

	$('img#copy-dynamic').zclip({
	path:'/js/ZeroClipboard.swf',
	copy:function(){return $('input#dynamic').val();}
	});

});

</script>
<script type="text/javascript" src="/js/avatar/js/artDialog.js"></script>
<input type="hidden" id="addOrderRequestPath" value="<%=path%>/product/addShoppingCart.html">
<div class="contentBox pb20">
    <div class="m w980">
        <div class="clearfix selectedBox2">
			<%@ include file="../user/leftPanel.jsp"%> 
            <div class="r selectRight2">
                <div class="selectListBox bst4 pl40">
			<ul class="clearfix pt10">
				<!-- 作品 -->
				<c:forEach var="item" items="${works}">
				
				<li class="l por">
					<a class="bookEdit" target="_blank"	href="<%=path%>/user/editWork/${item.id}.html">
					<i class="icon_see"></i>
					<b>${item.product.name}</b>
					<img alt="" src="http://platform.tushu.com/img/2295307.jpeg?thumb"></a>
					<em class="bookEditEm">
						<a class="icon_no l" title="保密" href="javascript:;"></a> 
						<a class="icon_rem l" title="删除" onclick="return confirm('确认删除作品吗?删除后将不可恢复');" href="<%=path%>/user/deleteWork/${item.id}.html">&nbsp;</a> 
						<a class="icon_print r" title="添加到购物车" onclick="addToShoppingCart(${item.id})"></a>
					</em>
				</li>
				
				</c:forEach>
			</ul>
			<div class="tr pt10 pb30 pr30 mr10 fc_gray6">隐私声明：您在涂书网注册的信息、资料、照片及作品内容，涂书网均严格保密，确保您的隐私安全。</div>
			</div>
            </div>
        </div>
    </div>
</div>

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





</script><script src="http://hm.baidu.com/h.js?20301d57224db44ce1820fbf43208d85" type="text/javascript"></script><a href="http://tongji.baidu.com/hm-web/welcome/ico?s=20301d57224db44ce1820fbf43208d85" target="_blank"><img src="http://eiv.baidu.com/hmt/icon/21.gif" border="0" height="20" width="20"></a>
</div>
<!--****-->


<div class="aui_focus" style="display: none;"><div class="aui_outer"><table style="" class="aui_table aui_outerTable"><tbody><tr><td class="aui_border aui_nw"></td><td class="aui_border aui_n"></td><td class="aui_border aui_ne"></td></tr><tr><td class="aui_border aui_w"></td><td class="aui_center"></td><td class="aui_border aui_e"></td></tr><tr><td class="aui_border aui_sw"></td><td class="aui_border aui_s"></td><td style="cursor: se-resize;" class="aui_border aui_se"></td></tr></tbody></table></div></div>
</body>
</html>