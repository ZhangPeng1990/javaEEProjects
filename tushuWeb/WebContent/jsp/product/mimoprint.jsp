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
<link rel="stylesheet" type="text/css" href="<%=path%>/styles/css/edit/reset.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/styles/css/edit/editor_base.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/styles/css/edit/upgrade.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/styles/css/edit/lightbox.css">
<link href="<%=path%>/styles/css/edit/header.css" rel="stylesheet">
    <style type="text/css">
        #header-wrapper
        {
            display: none;
        }
    </style>
    <script src="http://www.google-analytics.com/ga.js" async="" type="text/javascript"></script>
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-9580877-1']);
        _gaq.push(['_setDomainName', 'mimoprint.com']);
        _gaq.push(['_trackPageview']);
        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>
    <script type="text/javascript" src="<%=path%>/styles/js/edit/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="<%=path%>/styles/js/edit/jquery-ui-1.9.0.custom.min.js"></script>
    <script type="text/javascript" src="<%=path%>/styles/js/edit/mimo_base.js"></script>
    <script type="text/javascript" src="<%=path%>/styles/js/edit/mimo_editor.js"></script>
    <script type="text/javascript" src="<%=path%>/styles/js/edit/book_layout.js"></script>
    <script type="text/javascript" src="<%=path%>/styles/js/edit/upgrade.js"></script>
    <script type="text/javascript" src="<%=path%>/styles/js/edit/swfobject.js"></script>
    <script type="text/javascript" src="<%=path%>/styles/js/edit/uploader.js"></script>
    <script type="text/javascript" src="<%=path%>/styles/js/edit/json2.js"></script>
    <script type="text/javascript" src="<%=path%>/styles/js/edit/lightbox.js"></script>
    <script src="<%=path%>/styles/js/edit/custom.js" type="text/javascript"></script>
    <script type="text/javascript">
        var JSONBookInfo = {"complete_page":"0","page":"33","author_info":null,"copyright_info":null,"spine_info":null,"page_list":[{"num":"cover","finish":"false","template_name":"C1","page_side":null,"page_data":null},{"num":"0","finish":"false","template_name":"T1","page_side":null,"page_data":null},{"num":"1","finish":"false","template_name":"T8","page_side":null,"page_data":null},{"num":"2","finish":"false","template_name":"T8","page_side":null,"page_data":null},{"num":"3","finish":"false","template_name":"T11","page_side":null,"page_data":null},{"num":"4","finish":"false","template_name":"T5","page_side":null,"page_data":null},{"num":"5","finish":"false","template_name":"T5","page_side":null,"page_data":null},{"num":"6","finish":"false","template_name":"T17","page_side":null,"page_data":null},{"num":"7","finish":"false","template_name":"T20","page_side":null,"page_data":null},{"num":"8","finish":"false","template_name":"T20","page_side":null,"page_data":null},{"num":"9","finish":"false","template_name":"T13","page_side":null,"page_data":null},{"num":"10","finish":"false","template_name":"T6","page_side":null,"page_data":null},{"num":"11","finish":"false","template_name":"T9","page_side":null,"page_data":null},{"num":"12","finish":"false","template_name":"T9","page_side":null,"page_data":null},{"num":"13","finish":"false","template_name":"T3","page_side":null,"page_data":null},{"num":"14","finish":"false","template_name":"T6","page_side":null,"page_data":null},{"num":"15","finish":"false","template_name":"T6","page_side":null,"page_data":null},{"num":"16","finish":"false","template_name":"T18","page_side":null,"page_data":null},{"num":"17","finish":"false","template_name":"T11","page_side":null,"page_data":null},{"num":"18","finish":"false","template_name":"T11","page_side":null,"page_data":null},{"num":"19","finish":"false","template_name":"T14","page_side":null,"page_data":null},{"num":"20","finish":"false","template_name":"T7","page_side":null,"page_data":null},{"num":"21","finish":"false","template_name":"T7","page_side":null,"page_data":null},{"num":"22","finish":"false","template_name":"T20","page_side":null,"page_data":null},{"num":"23","finish":"false","template_name":"T4","page_side":null,"page_data":null},{"num":"24","finish":"false","template_name":"T4","page_side":null,"page_data":null},{"num":"25","finish":"false","template_name":"T16","page_side":null,"page_data":null},{"num":"26","finish":"false","template_name":"T19","page_side":null,"page_data":null},{"num":"27","finish":"false","template_name":"T12","page_side":null,"page_data":null},{"num":"28","finish":"false","template_name":"T12","page_side":null,"page_data":null},{"num":"29","finish":"false","template_name":"T5","page_side":null,"page_data":null},{"num":"30","finish":"false","template_name":"T8","page_side":null,"page_data":null},{"num":"31","finish":"false","template_name":"T8","page_side":null,"page_data":null},{"num":"32","finish":"false","template_name":"T2","page_side":null,"page_data":null}]};
        var JSONBookPreview = {"preview_list":[{"num":"cover","path":"","storage_type":"","type":null},{"num":"0","path":"","storage_type":"","type":null},{"num":"1","path":"","storage_type":"","type":null},{"num":"2","path":"","storage_type":"","type":null},{"num":"3","path":"","storage_type":"","type":null},{"num":"4","path":"","storage_type":"","type":null},{"num":"5","path":"","storage_type":"","type":null},{"num":"6","path":"","storage_type":"","type":null},{"num":"7","path":"","storage_type":"","type":null},{"num":"8","path":"","storage_type":"","type":null},{"num":"9","path":"","storage_type":"","type":null},{"num":"10","path":"","storage_type":"","type":null},{"num":"11","path":"","storage_type":"","type":null},{"num":"12","path":"","storage_type":"","type":null},{"num":"13","path":"","storage_type":"","type":null},{"num":"14","path":"","storage_type":"","type":null},{"num":"15","path":"","storage_type":"","type":null},{"num":"16","path":"","storage_type":"","type":null},{"num":"17","path":"","storage_type":"","type":null},{"num":"18","path":"","storage_type":"","type":null},{"num":"19","path":"","storage_type":"","type":null},{"num":"20","path":"","storage_type":"","type":null},{"num":"21","path":"","storage_type":"","type":null},{"num":"22","path":"","storage_type":"","type":null},{"num":"23","path":"","storage_type":"","type":null},{"num":"24","path":"","storage_type":"","type":null},{"num":"25","path":"","storage_type":"","type":null},{"num":"26","path":"","storage_type":"","type":null},{"num":"27","path":"","storage_type":"","type":null},{"num":"28","path":"","storage_type":"","type":null},{"num":"29","path":"","storage_type":"","type":null},{"num":"30","path":"","storage_type":"","type":null},{"num":"31","path":"","storage_type":"","type":null},{"num":"32","path":"","storage_type":"","type":null}]};
        var UserId = 103691;
        var BookId = 153296;
        var WorksId = 169391;
        var ProductId = "1005";
        var BookName = "";
        var IsFirst = 1;
        var EndDate = '2013/11/24';
        var JSONPrice = {"1000_48_4":68.0,"1005_64_4":188.0,"1000_48_6":88.0,"1001_24_6":98.0,"1006_26_4":58.0,"1001_80_4":158.0,"1001_24_4":78.0,"1001_80_6":208.0,"1004_64_6":298.0,"1005_36_4":128.0,"1005_64_6":228.0,"1003_8_4":12.0,"1001_96_6":248.0,"1001_32_4":88.0,"1001_96_4":188.0,"1004_96_6":378.0,"1004_96_4":318.0,"1004_36_6":198.0,"1004_72_6":328.0,"1004_36_4":168.0,"1004_72_4":258.0,"1000_24_4":48.0,"1005_72_4":198.0,"1000_24_6":68.0,"1005_56_4":168.0,"1005_72_6":248.0,"1001_64_4":128.0,"1001_64_6":168.0,"1000_36_4":58.0,"1004_28_4":148.0,"1004_64_4":238.0,"1004_28_6":178.0,"1004_20_4":128.0,"1005_48_6":188.0,"1004_20_6":148.0,"1002_1_4":3.6,"1006_1_4":250.0,"1005_36_6":168.0,"1002_30_4":108.0,"1005_56_6":208.0,"1001_32_6":108.0,"1001_48_4":98.0,"1001_48_6":128.0,"1000_36_6":78.0,"1004_48_4":198.0,"1004_48_6":238.0,"1004_56_6":268.0,"1005_80_4":208.0,"1004_56_4":218.0,"1005_80_6":248.0,"1005_96_6":298.0,"1006_26_6":68.0,"1005_48_4":148.0,"1005_96_4":228.0};
    </script>
<link href="<%=path%>/styles/css/edit/upload.css" rel="stylesheet" type="text/css">
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
<input id="sessionUserId" type="hidden" value="${sessionUserName.id}">
<!-- ======================================================== -->
	<div style="display: none" id="browser_tips" class="compatable">
    <p>
        !!!您的浏览器版本太古老，无法正常使用网站的全部功能。您需要
		<a target="_blank" href="http://windows.microsoft.com/zh-CN/internet-explorer/products/ie/home">升级您的 IE 浏览器</a>
		        或使用
		<a target="_blank" href="http://membookstatic.b0.upaiyun.com/download/chrome_mimoprint.exe">谷歌浏览器</a>
		        等更棒的浏览器
		    </p>
	</div>
	<!-- ======================================================== -->
	<div id="toptoolbar-wrapper">
    <div id="toptoolbar">
        <div class="shopbox-toptoolbar">
            <div class="faq">
                <a href="<%=path%>/login/loginOut.html">注销</a>
            </div>

        </div>
        <!-- end of top toolbar -->
        <div class="nickname-toptoolbar">
            <a href="###">欢迎你：${sessionUserName.userName}</a>
        </div>
    </div>
	</div>
	<!-- ======================================================== -->
	<div id="header-wrapper">
    <div id="header-pattern">
        <div id="header">
            <a title="logo" href="/" id="headerlogo"></a>
            <div id="main-menu">
                <div class="menu-header">
                    <ul id="navig">
                        <li class="home"><a href="/" title="首页" class="current">首页</a></li>
                        <li class="product"><a href="/product" title="印刷介绍">印品介绍</a></li>
                        <li class="stage"><a href="/stage" title="stage">作品展厅</a></li>
                        <li class="usercenter"><a href="/usercenter" title="立即创作">我的印品</a></li>
                    </ul>
                </div>
                <div class="day">
                    <span>今天下单</span>
                    <p id="header_receive_date">10月29日</p>
                    <span>预计出货</span>
                </div>
                <!-- end of main menu -->
            </div>
            <!-- end of header -->
        </div>
    </div>
    <script src="<%=path%>/styles/js/edit/calculatePayTime.js?v=20130925"></script>
    <script type="text/javascript">
        $(function () {
            CalculatPayTime.ReceiveDate("usercenterheader");
        });
    </script>
    <!-- end of header wrapper -->
	</div>
	<!-- ======================================================== -->
	<div id="outwrap">
        <!--begin 顶部logo和工具栏 -->
        <div id="logo_tools_bar">
            <a href="/"><span id="logo"></span></a>
            <span class="works_title" id="works_title"></span>
            <div id="tools_bar">

                &nbsp;&nbsp;<a title="预览" class="btn" id="btn_preview" href="#">预览</a>
                <a onclick="addToShoppingCart(${product.productId})" title="保存&加入购物车" class="btn" id="btn_save" href="#">保存</a>
                <a title="书本设置" class="btn btn4" id="btn_setting" href="#">页数设置</a>
                <a title="印前检查" class="btn" id="btn_check" href="#">检查</a>
                <a title="印刷" class="btn btn_reg_green" id="btn_print" href="#">印刷</a>
            </div>
        </div>
        <!--end -->
        <div id="inwrap">
            <!--顶部边框 -->
            <div id="inwrap_pre"></div>
            <!--begin 编辑区域 -->
            <div class="sections" style="padding: 30px 0px;">
                <!--begin 上传和图像缩略图 -->
                <div class="section" id="section_upload_thumnail">
                    <a title="上传照片" class="btn" id="btn_upload"></a>
                    <div class="pic_theme_list" id="mod_thumbnail">
                        <a class="arrow_lf btn_arrow btn lf" id="mod_thumbnail_btn_prev"></a>
                        <div class="thumbnail_warp customer_scrollbar">
                            <ul class="thumbnail lf" id="mod_thumbnail_list" style="left: 0px; width: 430px;">            
                            	<li class="">                
	                            	<img used_num="0" data-url="/imagedata/691/91/103691/169391/103691_20131025092029678" 
	                            		src="<%=path%>/styles/images/edit/imagedata/103691_20131025092029678_thumb.jpg" data-original_width="230" data-original_height="335" data-path="imagedata/691/91/103691/169391/103691_20131025092029678" data-imageid="2375559" id="imageid_2375559" title="点击查看大图" class="j_thumbnail ui-draggable">                
	                            	<span title="图像被使用次数" id="counter_2375559" class="counter">0</span>
	                            	<span class="thumbnail_operats">
	                            	<a data-imageid="2375559" class="btn_rotate_left" href="javascript:;" title="旋转"></a>
	                            	<a data-imageid="2375559" class="btn_rotate_right" href="javascript:;" title="旋转"></a>
	                            	<a data-imageid="2375559" class="btn_delete" href="javascript:;" title="删除"></a>
	                            	</span>            
                            	</li>
                            	<li class="">                
                            		<img used_num="0" data-url="/imagedata/691/91/103691/169391/103691_20131025092028875" 
                            			src="<%=path%>/styles/images/edit/imagedata/103691_20131025092028875_thumb.jpg" data-original_width="230" data-original_height="257" data-path="imagedata/691/91/103691/169391/103691_20131025092028875" data-imageid="2375558" id="imageid_2375558" title="点击查看大图" class="j_thumbnail ui-draggable">                
                            		<span title="图像被使用次数" id="counter_2375558" class="counter">0</span>
                            		<span class="thumbnail_operats">
                            		<a data-imageid="2375558" class="btn_rotate_left" href="javascript:;" title="旋转"></a>
                            		<a data-imageid="2375558" class="btn_rotate_right" href="javascript:;" title="旋转"></a>
                            		<a data-imageid="2375558" class="btn_delete" href="javascript:;" title="删除"></a>
                            		</span>            
                            	</li>
                            	<li class="">                
                            		<img used_num="0" data-url="<%=path%>/styles/images/edit/imagedata/103691_20131025092028027" 
                            			src="<%=path%>/styles/images/edit/imagedata/103691_20131025092028027_thumb.jpg" data-original_width="287" data-original_height="287" data-path="images/imagedata/103691_20131025092028027" data-imageid="2375557" id="imageid_2375557" title="点击查看大图" class="j_thumbnail ui-draggable">                
                            		<span title="图像被使用次数" id="counter_2375557" class="counter">0</span>
                            		<span class="thumbnail_operats"><a data-imageid="2375557" class="btn_rotate_left" href="javascript:;" title="旋转"></a>
                            		<a data-imageid="2375557" class="btn_rotate_right" href="javascript:;" title="旋转"></a>
                            		<a data-imageid="2375557" class="btn_delete" href="javascript:;" title="删除"></a>
                            		</span>            
                            	</li>
                            	<li class="">                
                            		<img used_num="0" data-url="/imagedata/691/91/103691/169391/103691_20131025092026465" 
                            			src="<%=path%>/styles/images/edit/imagedata/103691_20131025092026465_thumb.jpg" data-original_width="230" data-original_height="211" data-path="imagedata/691/91/103691/169391/103691_20131025092026465" data-imageid="2375556" id="imageid_2375556" title="点击查看大图" class="j_thumbnail ui-draggable">                
                            		<span title="图像被使用次数" id="counter_2375556" class="counter">0</span>
                            		<span class="thumbnail_operats"><a data-imageid="2375556" class="btn_rotate_left" href="javascript:;" title="旋转"></a>
                            		<a data-imageid="2375556" class="btn_rotate_right" href="javascript:;" title="旋转"></a>
                            		<a data-imageid="2375556" class="btn_delete" href="javascript:;" title="删除"></a>
                            		</span>            
                            	</li>
                            	<li class="">                
                            		<img used_num="0" data-url="/imagedata/691/91/103691/169391/103691_20131025092025685" 
                            			src="<%=path%>/styles/images/edit/imagedata/103691_20131025092025685_thumb.jpg" data-original_width="230" data-original_height="306" data-path="imagedata/691/91/103691/169391/103691_20131025092025685" data-imageid="2375555" id="imageid_2375555" title="点击查看大图" class="j_thumbnail ui-draggable">                
                            		<span title="图像被使用次数" id="counter_2375555" class="counter">0</span>
                            		<span class="thumbnail_operats">
                            		<a data-imageid="2375555" class="btn_rotate_left" href="javascript:;" title="旋转"></a>
                            		<a data-imageid="2375555" class="btn_rotate_right" href="javascript:;" title="旋转"></a>
                            		<a data-imageid="2375555" class="btn_delete" href="javascript:;" title="删除"></a>
                            		</span>            
                            	</li>
                            </ul>
                        </div>
                        <a class="arrow_rt btn btn_arrow lf" id="mod_thumbnail_btn_next"></a>
                    </div>
                </div>
                <!--end -->

                <div class="section section_thumnail_info" id="section_thumnail_info">
                    <span style="display: none" id="upload_bar_holder" class="upload_bar_holder">
                        <span class="name">已上传<em id="upload_totalPage" class="img_page">5</em>张  进度(<em id="bar_percent">100</em>%)：</span>
                        <span id="bar_outer" class="bar_outer">
                            <span id="upload_curr_bar" class="bar" style="width: 200px;"></span>
                        </span>
                    </span>
                    <span>共 <b id="thumbnail_count">0</b> 张，已使用 <b id="thumbnail_used_count">0</b> 张&nbsp;&nbsp;<label><input type="checkbox" id="chk_hide_used">隐藏已使用的照片</label>
                    </span><span class="thumbnail_order">排序方式：<a action="filename" class="cur" href="#">按文件名</a><a action="phototime" href="#">按拍照时间</a><a action="uploadtime" href="#">按上传时间</a></span>
                </div>

                <!--begin 版式自定义编辑 -->
                <div class="edit_spine" id="section_layout_edit">
                    <div class="edit_area_warp edit_area_warp_right" id="edit_area_warp">
                        <div num="spine" class="spine" id="spine">
                            <div contenteditable="true" align="left" tips_info="在此输入作品主标题" style="left: 8px; top: 10px; width: 10px; height: 204px; font-size: 7px; letter-spacing: 4px;" direction="vertical" px="6" pt="8" max_length="25" max_line="1" leading="9.6" space="0" height="180" width="4" y="18" x="79" name="txt1" id="spine_txt1" class="text_box txt1">在此输入作品主标题</div>
                            <div contenteditable="true" align="left" tips_info="在此输入作者信息" style="left: 8px; top: 227px; width: 10px; height: 112px; font-size: 7px; letter-spacing: 4px;" direction="vertical" px="6" pt="8" max_length="14" max_line="1" leading="9.6" space="0" height="180" width="4" y="18" x="79" name="txt1" id="spine_txt2" class="text_box txt2">在此输入作者信息</div>
                        </div>
                        <div num="author_info" class="author_info" id="author_info" has_edited="true" name="AUTHORINFO2" width="60" height="256" page_type="P" product_type="MPAD" space_type="B" margin_type="A" side_type="M" cross_type="O" background_color="#ffffff" color="#000000" style="background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); width: 146px; height: 624px;"><div class="image_box img1 ui-droppable" id="img1" name="img1" x="3.375" y="19" width="50" height="37.5" style="left: 8px; top: 46px; width: 122px; height: 91px;"><div class="drag_here"></div><div class="dpi_info">492x369</div></div><div align="left" class="text_box text_box_background txt1" id="txt1" name="txt1" x="3.375" y="62.5" width="50" height="120" space="0" leading="12" max_line="28" max_length="467" pt="8" px="6" direction="horizontal" style="left: 8px; top: 152px; width: 122px; height: 293px; font-size: 9px;">在此输入文字~</div><div class="trim_line_top"></div><div class="trim_line_bottom"></div><div class="trim_line_right"></div></div>
                        <div num="style_info" class="style_info" id="style_info">
                            <div class="trim_line_top"></div>
                            <div class="trim_line_left"></div>
                            <div class="trim_line_bottom"></div>
                        </div>
                        <div class="backbone_bg"></div>
                        <div class="pagelayout_left_side_warp">
                            <div class="pagelayout_edit" id="pagelayout_left_side_edit" style="background-color: rgb(255, 255, 255);"><div class="trim_line_top"></div><div class="trim_line_left"></div><div class="trim_line_bottom"></div><div class="trim_line_right"></div><div style="left: 181px; top: 309px; width: 93px; height: 21px;position: absolute;" height="9.5" width="42" y="113" x="15.5" name="img1" class="img1 "><img width="110" class="ui-draggable" style="position: relative; left: 0px; top: 0px;" src="<%=path%>/styles/images/edit/m_logo.png" id="bottom_img1"></div></div>
                        </div>
                        <div class="pagelayout_right_side_warp">
                            <div class="pagelayout_edit pageedit_cover" id="pagelayout_right_side_edit" has_edited="true" num="cover" name="C1" width="197" height="256" page_type="C" product_type="MPAD" space_type="B" margin_type="A" side_type="M" cross_type="O" background_color="#ffffff" color="#000000" style="background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); width: 480px; height: 624px;"><div class="trim_line_top"></div><div class="trim_line_left"></div><div class="trim_line_bottom"></div><div class="trim_line_right"></div><div class="image_box img1 ui-droppable" id="img1" name="img1" x="3" y="0" width="191" height="256" style="left: 7px; top: 0px; width: 466px; height: 624px;">
                            	<img width="466" height="678" src="<%=path%>/styles/images/edit/103691_20131025092029678_edit.jpg" imageid="2375559" path="imagedata/691/91/103691/169391/103691_20131025092029678" owidth="600" oheight="874" style="left: 0px; top: -27px; position: relative;" class="ui-draggable"><a href="javascript:;" class="warning"></a><div style="display: none;" class="warning_tips"><p>该相片可能会导致印刷效果不够清晰，请更换更高像素的相片或者切换为小版式。<br><br>该版式建议相片精度大于:<br>1880*2520px</p></div></div><div align="left" class="text_box text_box_background txt1" id="txt1" name="txt1" x="21" y="18" width="160" height="8.467" space="28.8" leading="0" max_line="1" max_length="15" pt="24" px="18" direction="horizontal" style="left: 51px; top: 44px; width: 390px; height: 21px; font-size: 18px;">在此输入文字~</div><div align="left" class="text_box text_box_background txt2" id="txt2" name="txt2" x="21" y="33" width="160" height="6" space="12" leading="0" max_line="1" max_length="34" pt="12" px="8" direction="horizontal" style="left: 51px; top: 80px; width: 390px; height: 15px; font-size: 9px;">在此输入文字~</div><div align="left" class="text_box text_box_background txt3" id="txt3" name="txt3" x="21" y="39" width="50" height="6" space="0" leading="0" max_line="1" max_length="10" pt="12" px="8" direction="horizontal" style="left: 51px; top: 95px; width: 122px; height: 15px; font-size: 9px;">在此输入文字~</div></div>
                        </div>
                        <div class="layout_tools">
                            <ul class="tool_bot">
                                <li class="lf left_btn">
                                    <a class="editor_bg" id="background_color_picker_btn" href="javascript:;"><span>底色</span><i></i></a>
                                    <a class="editor_color" id="text_color_picker_btn" href="#"><span>文字颜色</span><i></i></a>
                                </li>
                                <li class="rt right_btn">
                                    <a class="editor_format" id="pagelayout_picker_btn" href="#"><span>&nbsp;</span><i></i></a>
                                </li>
                            </ul>
                            <ul style="display: none;" class="color_bar" id="background_color_bar">
                                <li title="白色" data-color="#ffffff" class="white_bg color_page"></li>
                                <li title="黑色" data-color="#000000" class="black_bg color_page"></li>
                                <li title="洋红" data-color="#EF006B" class="yanghong_bg"></li>
                                <li title="青色" data-color="#009FE0" class="qing_bg"></li>
                                <li title="柠檬" data-color="#FFC400" class="ningmeng_bg"></li>
                                <li title="橘子" data-color="#F98C00" class="juzi_bg"></li>
                                <li title="大红" data-color="#DF0000" class="dahong_bg"></li>
                                <li title="草地" data-color="#93BC00" class="caodi_bg"></li>
                                <li title="奶茶" data-color="#C2891B" class="naicha_bg"></li>
                                <li title="咖啡" data-color="#77420D" class="kafei_bg"></li>
                                <li title="樱桃" data-color="#B90000" class="yingtao_bg"></li>
                                <li title="森林" data-color="#175724" class="senlin_bg"></li>
                                <li title="暖灰" data-color="#CABCAB" class="nuanhui_bg"></li>
                                <li title="冷灰" data-color="#A8BCC2" class="lenghui_bg"></li>
                                <li title="胭脂" data-color="#FABBAB" class="yanzhi_bg"></li>
                                <li title="午夜" data-color="#6688A4" class="wuye_bg"></li>
                                <li title="象牙" data-color="#F8F2E5" class="xiangya_bg"></li>
                                <li title="米色" data-color="#E4DED6" class="mise_bg"></li>
                                <li title="粉红" data-color="#F9DBDA" class="fenhong_bg"></li>
                                <li title="粉蓝" data-color="#D6E9F2" class="fenlan_bg"></li>
                                <li title="奶黄" data-color="#FFEA9D" class="naihuang_bg"></li>
                                <li title="柚子" data-color="#FCDBAA" class="youzi_bg"></li>
                                <li title="桃红" data-color="#FBE6D4" class="taohong_bg"></li>
                                <li title="酸橙" data-color="#D2DCA0" class="suancheng_bg"></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--end版式自定义编辑 -->
            </div>
            <!--end 编辑区域 -->

            <div class="sections mod_tools" id="mod_tools">
                <div class="section">
                    <span class="btn_area">工具栏：
                        <a title="管理页面顺序" class="btn_round_mid btn" id="btn_page_manager">页面管理</a>                    
                    </span>

                    <div style="display: none;" class="page_controll" id="page_count">
                        <a class="add" id="btn_add_page" href="#">&nbsp;
                        </a>
                        <a class="minus" id="btn_minus_page" href="#">&nbsp;
                        </a>
                        &nbsp;&nbsp;<span>加减页数</span>
                    </div>
                    <span class="page_info">已完成&nbsp;<span id="complete_count">0</span>P，可编辑&nbsp;<span id="edit_count">33</span>P，总共&nbsp;<span id="total_count">36</span>P&nbsp;</span>
                </div>
            </div>

            <!-- begin 页面预览 -->
            <div class="inwrap_aft gray_wrap_aft" id="mod_preview_thumnail">
                <div id="layout_theme">
                    <a class="arrow_retangle_lf btn lf" id="mod_preview_thumnail_btn_pre"></a>
                    <div class="preview_thumbnail">
                        <ul class="blk" id="mod_preview_thumnail_list">        
	                        <li index="0">            
		                        <a page_type="none" page_side="left" num="bottom" href="javascript:;" id="page_bottom" class="pagelayout_bg blank"></a>            
		                        <em class="img_page">封底</em>            
		                        <a template_name="C1" page_type="COVER" page_side="right" num="cover" href="javascript:;" id="page_cover" class="pagelayout_bg pc1_r"></a>            
		                        <em class="img_page_right">封面</em>        
	                        </li>        
	                        <li index="1">            
	                        	<a _template_name="AUTHORINFO" page_side="left" num="0left" href="javascript:;" id="page_0left" class="pagelayout_bg blank"></a>            
	                        	<em class="img_page">封面折页</em>            
	                        	<a template_name="T1" page_side="right" num="0" href="javascript:;" id="page_0" class="pagelayout_bg pt1_r"></a>            
	                        	<em class="img_page_right">扉页</em>        
	                        </li>        
	                        <li index="2">            
	                        	<a page_side="left" num="1_left" href="javascript:;" id="page_1_left" class="pagelayout_bg blank"></a>            
	                        	<em class="img_page">扉页对页</em>            
	                        	<a template_name="T8" page_side="right" num="1" href="javascript:;" id="page_1" class="pagelayout_bg pt8_r"></a>            
	                        	<em class="img_page_right">1</em>        
	                       	</li>                
	                       	<li index="3">                    
		                       	<a template_name="T8" page_side="left" num="2" href="javascript:;" id="page_2" class="pagelayout_bg pt8_l"></a>                    
		                       	<em class="img_page">2</em>                    
		                       	<a template_name="T11" page_side="right" num="3" href="javascript:;" id="page_3" class="pagelayout_bg pt11_r"></a>                    
		                       	<em class="img_page_right">3</em>                
	                       	</li>                
	                       	<li index="4">                    
	                       		<a template_name="T5" page_side="left" num="4" href="javascript:;" id="page_4" class="pagelayout_bg pt5_l"></a>                    
	                       		<em class="img_page">4</em>
	                       		<a template_name="T5" page_side="right" num="5" href="javascript:;" id="page_5" class="pagelayout_bg pt5_r"></a>                    
	                       		<em class="img_page_right">5</em>                
	                       	</li>                
	                       	<li index="5">                    
	                       		<a template_name="T17" page_side="left" num="6" href="javascript:;" id="page_6" class="pagelayout_bg pt17_l"></a>                    
	                       		<em class="img_page">6</em>                    
	                       		<a template_name="T20" page_side="right" num="7" href="javascript:;" id="page_7" class="pagelayout_bg pt20_r"></a>                    
	                       		<em class="img_page_right">7</em>                
	                       	</li>                
	                       	<li index="6">
		                       	<a template_name="T20" page_side="left" num="8" href="javascript:;" id="page_8" class="pagelayout_bg pt20_l"></a>                    
		                       	<em class="img_page">8</em>                    
		                       	<a template_name="T13" page_side="right" num="9" href="javascript:;" id="page_9" class="pagelayout_bg pt13_r"></a>                   
								<em class="img_page_right">9</em>                
							</li>                
							<li index="7">
								<a template_name="T6" page_side="left" num="10" href="javascript:;" id="page_10" class="pagelayout_bg pt6_l"></a>
								<em class="img_page">10</em>
								<a template_name="T9" page_side="right" num="11" href="javascript:;" id="page_11" class="pagelayout_bg pt9_r"></a>
								<em class="img_page_right">11</em>                
							</li>                
							<li index="8">                    
								<a template_name="T9" page_side="left" num="12" href="javascript:;" id="page_12" class="pagelayout_bg pt9_l"></a>                    
								<em class="img_page">12</em>                    
								<a template_name="T3" page_side="right" num="13" href="javascript:;" id="page_13" class="pagelayout_bg pt3_r"></a>                    
								<em class="img_page_right">13</em>                
							</li>                
							<li index="9">                    
								<a template_name="T6" page_side="left" num="14" href="javascript:;" id="page_14" class="pagelayout_bg pt6_l"></a>
								<em class="img_page">14</em>                    
								<a template_name="T6" page_side="right" num="15" href="javascript:;" id="page_15" class="pagelayout_bg pt6_r"></a>
								<em class="img_page_right">15</em>                
							</li>                
							<li index="10">                    
								<a template_name="T18" page_side="left" num="16" href="javascript:;" id="page_16" class="pagelayout_bg pt18_l"></a>
								<em class="img_page">16</em>                    
								<a template_name="T11" page_side="right" num="17" href="javascript:;" id="page_17" class="pagelayout_bg pt11_r"></a>
								<em class="img_page_right">17</em>                
							</li>                
							<li index="11">                    
								<a template_name="T11" page_side="left" num="18" href="javascript:;" id="page_18" class="pagelayout_bg pt11_l"></a>
								<em class="img_page">18</em>                    
								<a template_name="T14" page_side="right" num="19" href="javascript:;" id="page_19" class="pagelayout_bg pt14_r"></a>
								<em class="img_page_right">19</em>                
							</li>                
							<li index="12">                    
								<a template_name="T7" page_side="left" num="20" href="javascript:;" id="page_20" class="pagelayout_bg pt7_l"></a>
								<em class="img_page">20</em>                    
								<a template_name="T7" page_side="right" num="21" href="javascript:;" id="page_21" class="pagelayout_bg pt7_r"></a>
								<em class="img_page_right">21</em>                
							</li>                
							<li index="13">                    <a template_name="T20" page_side="left" num="22" href="javascript:;" id="page_22" class="pagelayout_bg pt20_l">                                            </a>                    <em class="img_page">22</em>                    <a template_name="T4" page_side="right" num="23" href="javascript:;" id="page_23" class="pagelayout_bg pt4_r">                                            </a>                    <em class="img_page_right">23</em>                </li>                <li index="14">                    <a template_name="T4" page_side="left" num="24" href="javascript:;" id="page_24" class="pagelayout_bg pt4_l">                                            </a>                    <em class="img_page">24</em>                    <a template_name="T16" page_side="right" num="25" href="javascript:;" id="page_25" class="pagelayout_bg pt16_r">                                            </a>                    <em class="img_page_right">25</em>                </li>                <li index="15">                    <a template_name="T19" page_side="left" num="26" href="javascript:;" id="page_26" class="pagelayout_bg pt19_l">                                            </a>                    <em class="img_page">26</em>                    <a template_name="T12" page_side="right" num="27" href="javascript:;" id="page_27" class="pagelayout_bg pt12_r">                                            </a>                    <em class="img_page_right">27</em>                </li>                <li index="16">                    <a template_name="T12" page_side="left" num="28" href="javascript:;" id="page_28" class="pagelayout_bg pt12_l">                                            </a>                    <em class="img_page">28</em>                    <a template_name="T5" page_side="right" num="29" href="javascript:;" id="page_29" class="pagelayout_bg pt5_r">                                            </a>                    <em class="img_page_right">29</em>                </li>                <li index="17">                    <a template_name="T8" page_side="left" num="30" href="javascript:;" id="page_30" class="pagelayout_bg pt8_l">                                            </a>                    <em class="img_page">30</em>                    <a template_name="T8" page_side="right" num="31" href="javascript:;" id="page_31" class="pagelayout_bg pt8_r">                                            </a>                    <em class="img_page_right">31</em>                </li>                <li index="18">                    <a template_name="T2" page_side="left" num="32" href="javascript:;" id="page_32" class="pagelayout_bg pt2_l">                                            </a>                    <em class="img_page">32</em>                    <a data-side="right" num="last" href="javascript:;" id="page_blank" class="pagelayout_bg blank">                    </a>                    <em class="img_page_right"></em>                </li>                <li index="19">                    <a template_name="COPYRIGHT" page_side="left" num="copyright" href="javascript:;" id="page_copyright" class="pagelayout_bg pcopyright">                                            </a>                    <em class="img_page">版权</em>                    <a data-side="right" num="last_bottom" href="javascript:;" id="page_blank" class="pagelayout_bg blank">                    </a>                    <em class="img_page_right">封底</em>                </li></ul>
                    </div>
                    <a class="arrow_retangle_rt btn_arrow btn lf" id="mod_preview_thumnail_btn_next"></a>
                </div>
            </div>
            <!-- end -->
        </div>
        <div id="bot"></div>
        <!--缩略图预览-->
        <div style="display: none;" class="thumbnail_big" id="thumbnail_big">
            <div class="thumbnail_big_bd">
                <a href="#" class="close"></a>
                <img>
                <div class="block"></div>
                <div class="info">ddd.jpg 1800*900px</div>
            </div>
        </div>
        <!--文本编辑-->
        <div style="display: none;" class="text_editor" id="text_editor">
            <h2>您最多可以输入<span id="text_count">30</span>个字符</h2>
            <ul>
                <li>
                    <button id="text_align_left_btn">左对齐</button></li>
                <li>
                    <button id="text_align_center_btn">居中</button></li>
                <li>
                    <button id="text_align_right_btn">右对齐</button></li>
            </ul>
            <textarea cols="1" rows="1" id="text_area"></textarea>
            <ul>
                <li>
                    <button class="confirm">确定</button></li>
                <li>
                    <button class="cancel">取消</button></li>
            </ul>
        </div>
    </div>
    <!-- ======================================================== -->
    <div style="display: none;" class="preview_dialog" id="preview_dialog">
        <div class="box">
            <div class="backbone"></div>
            <div class="page left_page"></div>
            <div class="page right_page"></div>
        </div>
        <div class="tools">
            <div><a class="big big_left"></a><a class="edit edit_left"></a><a class="big big_right"></a><a class="edit edit_right"></a></div>
            <div class="close_bar">
                <a class="prev"></a>
                <a class="close"></a>
                <a class="next"></a>
            </div>
        </div>
    </div>
    <!-- ======================================================== -->
    <div style="display: none;" class="preview_2x" id="preview_2x">
        <img title="点击关闭">
    </div>
    <!-- ======================================================== -->
    <div style="width: 555px; display: none;" class="popup_dialog" id="check_step1">
        <div class="title">
            <h2>交付印刷前最终检查</h2>
            <a href="#" class="close"></a>
        </div>
        <div class="content">
            <div style="padding: 30px; background-color: #ffffff;">
                <h2 style="font-size: 16px; color: #227f04; margin-bottom: 15px;">恭喜您,您的作品终于要出版了!</h2>
                <p style="line-height: 35px; font-size: 16px;">别着急,为确保印刷质量,建议您一定要完成以下两件事情</p>
                <p style="line-height: 30px; font-size: 14px;">1.浏览"印前检查清单",解决其中的错误与警告 <a href="#" class="btn_primary mr5" id="step1_check">立即检查</a></p>
                <p style="line-height: 30px; font-size: 14px;">2.利用"预览"功能,从头到尾完整预览一遍 <a href="#" class="btn_second mr5" id="step1_preview">立即预览</a></p>
                <div style="margin-top: 30px;"><a href="#" class="btn_primary mr5" id="step1_go">我知道了,继续出版</a><a href="#" class="btn_second mr5" id="step1_edit">返回编辑</a></div>
            </div>
        </div>
    </div>
    <!-- ======================================================== -->
    <div style="position: absolute; top: 0px; left: 0px; margin-left: 0px; margin-top: 0px; background-color: rgb(0, 0, 0); height: 1126px; opacity: 0.1; overflow: hidden; width: 1349px; z-index: 1000; display: none;" class="mask_layout"></div>
    <!-- ======================================================== -->
    <div style="width: 915px; position: absolute; z-index: 9999; top: 505.5px; margin-left: -457.5px; display: none;" class="popup_dialog" id="pop_page_manager">
        <div class="title">
            <h2>页面管理</h2>
            <a href="#" class="close"></a>
        </div>
        <div class="content">
            <div style="padding: 30px 0px 30px 0px; background-color: #D9D9D9; background: #f9f9f9 url(<%=path%>/styles/images/edit/bg.png);" class="page_manager">
                <div class="tips">您可以按住鼠标左键,拖动页面进行排序</div>
                <div class="page_manager_tab">
                    <b>排序方式:</b>
                    <label>
                        <input type="radio" value="2" name="page_sort_type" id="page_sort_cross" checked="checked">跨页排序</label>
                    
                </div>
                <ul id="page_manager_list" class="page_manager_list cross ui-sortable" style="height: 338px;">        <li index="0" style="cursor:not-allowed;" class="ui_disable_sortable">            <a page_type="none" page_side="left" _num="bottom" href="javascript:;" id="page_bottom" style="cursor:not-allowed;" class="pagelayout_bg blank">                <em class="img_page">封底</em>            </a>            <a template_name="C1" page_type="COVER" page_side="right" num="cover" href="javascript:;" id="page_cover" class="pagelayout_bg c1_r" style="cursor:not-allowed;">                                <em class="img_page_right">封面</em>            </a>        </li>        <li index="1" style="cursor:not-allowed;" class="ui_disable_sortable">            <a page_side="left" _num="0left" href="javascript:;" id="page_0left" style="cursor:not-allowed;" class="pagelayout_bg blank">                <em class="img_page">封面折页</em>            </a>            <a template_name="T1" page_side="right" num="0" href="javascript:;" id="page_0" class="pagelayout_bg t1_r" style="cursor:not-allowed;">                                <em class="img_page_right">扉页</em>            </a>        </li>        <li index="2" style="cursor:not-allowed;" class="ui_disable_sortable">            <a page_side="left" _num="1_left" href="javascript:;" id="page_1_left" style="cursor:not-allowed;">                <em class="img_page">扉页对页</em>            </a>            <a template_name="T8" page_side="right" num="1" href="javascript:;" id="page_1" class="pagelayout_bg t8_r" style="cursor:not-allowed;">                                <em class="img_page_right">1</em>            </a>        </li>                <li index="3">                    <a template_name="T8" page_side="left" num="2" href="javascript:;" id="page_2" class="pagelayout_bg t8_l">                                                <em class="img_page">2</em>                    </a>                    <a template_name="T11" page_side="right" num="3" href="javascript:;" id="page_3" class="pagelayout_bg t11_r">                                                <em class="img_page_right">3</em>                    </a>                </li>                <li index="4">                    <a template_name="T5" page_side="left" num="4" href="javascript:;" id="page_4" class="pagelayout_bg t5_l">                                                <em class="img_page">4</em>                    </a>                    <a template_name="T5" page_side="right" num="5" href="javascript:;" id="page_5" class="pagelayout_bg t5_r">                                                <em class="img_page_right">5</em>                    </a>                </li>                <li index="5">                    <a template_name="T17" page_side="left" num="6" href="javascript:;" id="page_6" class="pagelayout_bg t17_l">                                                <em class="img_page">6</em>                    </a>                    <a template_name="T20" page_side="right" num="7" href="javascript:;" id="page_7" class="pagelayout_bg t20_r">                                                <em class="img_page_right">7</em>                    </a>                </li>                <li index="6">                    <a template_name="T20" page_side="left" num="8" href="javascript:;" id="page_8" class="pagelayout_bg t20_l">                                                <em class="img_page">8</em>                    </a>                    <a template_name="T13" page_side="right" num="9" href="javascript:;" id="page_9" class="pagelayout_bg t13_r">                                                <em class="img_page_right">9</em>                    </a>                </li>                <li index="7">                    <a template_name="T6" page_side="left" num="10" href="javascript:;" id="page_10" class="pagelayout_bg t6_l">                                                <em class="img_page">10</em>                    </a>                    <a template_name="T9" page_side="right" num="11" href="javascript:;" id="page_11" class="pagelayout_bg t9_r">                                                <em class="img_page_right">11</em>                    </a>                </li>                <li index="8">                    <a template_name="T9" page_side="left" num="12" href="javascript:;" id="page_12" class="pagelayout_bg t9_l">                                                <em class="img_page">12</em>                    </a>                    <a template_name="T3" page_side="right" num="13" href="javascript:;" id="page_13" class="pagelayout_bg t3_r">                                                <em class="img_page_right">13</em>                    </a>                </li>                <li index="9">                    <a template_name="T6" page_side="left" num="14" href="javascript:;" id="page_14" class="pagelayout_bg t6_l">                                                <em class="img_page">14</em>                    </a>                    <a template_name="T6" page_side="right" num="15" href="javascript:;" id="page_15" class="pagelayout_bg t6_r">                                                <em class="img_page_right">15</em>                    </a>                </li>                <li index="10">                    <a template_name="T18" page_side="left" num="16" href="javascript:;" id="page_16" class="pagelayout_bg t18_l">                                                <em class="img_page">16</em>                    </a>                    <a template_name="T11" page_side="right" num="17" href="javascript:;" id="page_17" class="pagelayout_bg t11_r">                                                <em class="img_page_right">17</em>                    </a>                </li>                <li index="11">                    <a template_name="T11" page_side="left" num="18" href="javascript:;" id="page_18" class="pagelayout_bg t11_l">                                                <em class="img_page">18</em>                    </a>                    <a template_name="T14" page_side="right" num="19" href="javascript:;" id="page_19" class="pagelayout_bg t14_r">                                                <em class="img_page_right">19</em>                    </a>                </li>                <li index="12">                    <a template_name="T7" page_side="left" num="20" href="javascript:;" id="page_20" class="pagelayout_bg t7_l">                                                <em class="img_page">20</em>                    </a>                    <a template_name="T7" page_side="right" num="21" href="javascript:;" id="page_21" class="pagelayout_bg t7_r">                                                <em class="img_page_right">21</em>                    </a>                </li>                <li index="13">                    <a template_name="T20" page_side="left" num="22" href="javascript:;" id="page_22" class="pagelayout_bg t20_l">                                                <em class="img_page">22</em>                    </a>                    <a template_name="T4" page_side="right" num="23" href="javascript:;" id="page_23" class="pagelayout_bg t4_r">                                                <em class="img_page_right">23</em>                    </a>                </li>                <li index="14">                    <a template_name="T4" page_side="left" num="24" href="javascript:;" id="page_24" class="pagelayout_bg t4_l">                                                <em class="img_page">24</em>                    </a>                    <a template_name="T16" page_side="right" num="25" href="javascript:;" id="page_25" class="pagelayout_bg t16_r">                                                <em class="img_page_right">25</em>                    </a>                </li><li index="15" style="" class="">                    <a template_name="T19" page_side="left" num="26" href="javascript:;" id="page_26" class="pagelayout_bg t19_l">                                                <em class="img_page">26</em>                    </a>                    <a template_name="T12" page_side="right" num="27" href="javascript:;" id="page_27" class="pagelayout_bg t12_r">                                                <em class="img_page_right">27</em>                    </a>                </li>                                <li index="16">                    <a template_name="T12" page_side="left" num="28" href="javascript:;" id="page_28" class="pagelayout_bg t12_l">                                                <em class="img_page">28</em>                    </a>                    <a template_name="T5" page_side="right" num="29" href="javascript:;" id="page_29" class="pagelayout_bg t5_r">                                                <em class="img_page_right">29</em>                    </a>                </li>                <li index="17">                    <a template_name="T8" page_side="left" num="30" href="javascript:;" id="page_30" class="pagelayout_bg t8_l">                                                <em class="img_page">30</em>                    </a>                    <a template_name="T8" page_side="right" num="31" href="javascript:;" id="page_31" class="pagelayout_bg t8_r">                                                <em class="img_page_right">31</em>                    </a>                </li>                <li index="18" style="cursor:not-allowed;" class="ui_disable_sortable">                    <a template_name="T2" page_side="left" num="32" href="javascript:;" id="page_32" class="pagelayout_bg t2_l" style="cursor:not-allowed;">                                                <em class="img_page">32</em>                    </a>                    <a data-side="right" _num="last" href="javascript:;" class="right" id="page_32_last" style="cursor:not-allowed;">                        <em class="img_page_right"></em>                    </a>                </li>                <li index="19" style="cursor:not-allowed;" class="ui_disable_sortable">                    <a template_name="copyright" page_side="left" _num="copyright" href="javascript:;" id="page_copyright" style="cursor:not-allowed;" class="pagelayout_bg {layout_class}copyright">                                                <em class="img_page">版权</em>                    </a>                    <a data-side="right" _num="last_bottom" href="javascript:;" id="page_last_bottom" style="cursor:not-allowed;" class="pagelayout_bg blank">                        <em class="img_page_right">封底</em>                    </a>                </li></ul>
                <div style="clear: both; margin-top: 30px; margin-left: 24px;"><a href="#" class="confirm btn_primary mr5">确定</a><a href="#" class="cancel btn_second mr5">取消</a><span style="display: none;" id="page_manager_doing"><img src="<%=path%>/styles/images/edit/loading_bar.gif">正在努力的调整页面顺序,该操作任务有点繁重,请耐心的等待哦~</span></div>
            </div>

        </div>
    </div>
    <!-- ======================================================== -->
    <div id="action_success" style="display: none; position: absolute; top: 190px; left: 50%; z-index: 500; margin-left: -90px;" class="succeed">保存成功</div>
    <!-- ======================================================== -->
    <div style="left: 664.5px; top: 335.5px; display: none;" class="pop_texteditor" id="pop_texteditor">
        <div class="pop-inner">
            <span class="pop-arrow-right" id="arrow_out"></span><span class="pop-arrow-right-in" id="arrow_in"></span><a class="close j-close" href="javascript:void(0);"><i class="icon i-pop-close"></i></a>
            <div class="pop-bd">
                <div class="text_edit">
                    <div class="tools_bar">
                        <h2 id="pop_texteditor_tips">您最多可以输入28行文字</h2>
                        <a href="#" class="right"></a>
                        <a href="#" class="center"></a>
                        <a href="#" class="left active"></a>
                    </div>
                    <div class="edit_area">
                        <input type="text" style="display: none;">
                        <textarea style="height: 400px; text-align: left;"></textarea>
                    </div>
                    <div class="bottom_bar"><a style="width: 46px; text-align: center;" href="#" class="confirm btn_primary mr5">&nbsp;确定&nbsp;</a><a href="#" class="cancel btn_second">&nbsp;取消&nbsp;</a><span class="text_tips">文字排版有偏差，请以预览图为准，特殊符号无法印刷</span> </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ======================================================== -->
    <div style="position: absolute; z-index: 9999; display: none;" class="pop_setting" id="pop_setting">
        <div class="pop-inner">
            <span class="pop-arrow-up"></span><span class="pop-arrow-up-in"></span><a class="close j-close" href="javascript:void(0);"><i class="icon i-pop-close"></i></a>
            <div class="pop-bd">
                <div style="background-color: #ffffff; padding: 10px">
                    <table>
                        <tbody><tr style="display: none;">
                            <td>是否印页码:</td>
                            <td>
                                <label>
                                    <input type="radio" name="print_num">是</label>
                                <label>
                                    <input type="radio" name="print_num">否</label>
                            </td>
                        </tr>
                        <tr>
                            <td>页数设置:</td>
                            <td>
                                <select id="select_page_p">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">共<span id="total_p_count">48</span>P,可编辑<span id="edit_p_count">45</span>P <a href="#" style="color: #712030;">【其它细节见P数说明】</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><span style="color: red;">!!注:减少P数,被减少的部分内容会被丢弃,请谨慎操作</span>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td>全书字体设置:</td>
                            <td></td>
                        </tr>
                        <tr style="display: none;">
                            <td>全书页面底色:</td>
                            <td></td>
                        </tr>
                    </tbody></table>
                </div>
                <div class="bottom_bar"><a href="#" class="confirm btn_primary mr5">&nbsp;确定&nbsp;</a><a href="#" class="cancel btn_second">&nbsp;取消&nbsp;</a></div>
            </div>
        </div>
    </div>
    <!-- ======================================================== -->
    <div style="position: absolute; display: none; z-index: 9999" class="pop_layout" id="pop_layout">
        <div class="pop-inner">
            <span class="pop-arrow-down" id="layout_arrow_out"></span><span class="pop-arrow-down-in" id="layout_arrow_in"></span><a class="close j-close" href="javascript:void(0);"><i class="icon i-pop-close"></i></a>
            <div class="pop-bd">
                <div style="background-color: #fff;" id="pop_layout_bd">
                    <ul style="display: none;" class="blk layout_list bg_cont pagelayout_minibook">
                        <li class="pagelayout_C C1">
                            <a type="COVER" name="C1" href="#" class="pagelayout_bg c1_r"></a>
                        </li>

                        <li class="pagelayout_C C2">
                            <a type="COVER" name="C2" href="#" class="pagelayout_bg c2_r"></a>
                        </li>

                        <li class="pagelayout_P T1">
                            <a type="PAGE" name="T1" href="#" class="pagelayout_bg t1_r"></a>
                        </li>
                        <li class="pagelayout_P T2">
                            <a type="PAGE" name="T2" href="#" class="pagelayout_bg t2_r"></a>
                        </li>
                        <li class="pagelayout_P T3">
                            <a type="PAGE" name="T3" href="#" class="pagelayout_bg t3_r"></a>
                        </li>
                        <li class="pagelayout_P T4">
                            <a type="PAGE" name="T4" href="#" class="pagelayout_bg t4_r"></a>
                        </li>
                        <li class="pagelayout_P T5">
                            <a type="PAGE" name="T5" href="#" class="pagelayout_bg t5_r"></a>
                        </li>
                        <li class="pagelayout_P T6">
                            <a type="PAGE" name="T6" href="#" class="pagelayout_bg t6_r"></a>
                        </li>
                        <li class="pagelayout_P T7">
                            <a type="PAGE" name="T7" href="#" class="pagelayout_bg t7_r"></a>
                        </li>
                        <li class="pagelayout_P T8">
                            <a type="PAGE" name="T8" href="#" class="pagelayout_bg t8_r"></a>
                        </li>
                        <li class="pagelayout_P T9">
                            <a type="PAGE" name="T9" href="#" class="pagelayout_bg t9_r"></a>
                        </li>
                        <li class="pagelayout_P T10">
                            <a type="PAGE" name="T10" href="#" class="pagelayout_bg t10_r"></a>
                        </li>
                        <li class="pagelayout_P T11">
                            <a type="PAGE" name="T11" href="#" class="pagelayout_bg t11_r"></a>
                        </li>
                        <li class="pagelayout_P T12">
                            <a type="PAGE" name="T12" href="#" class="pagelayout_bg t12_r"></a>
                        </li>
                    </ul>
                    <ul style="display: none;" class="blk layout_list bg_cont pagelayout_viewbook">
                        <li class="pagelayout_C C1">
                            <a type="COVER" name="C1" href="#" class="pagelayout_bg c1_r"></a>
                        </li>
                        <li class="pagelayout_C C2">
                            <a type="COVER" name="C2" href="#" class="pagelayout_bg c2_r"></a>
                        </li>
                        <li class="pagelayout_C C3">
                            <a type="COVER" name="C3" href="#" class="pagelayout_bg c3_r"></a>
                        </li>
                        <li class="pagelayout_P T1">
                            <a type="PAGE" name="T1" href="#" class="pagelayout_bg t1_r"></a>
                        </li>
                        <li class="pagelayout_P T2">
                            <a type="PAGE" name="T2" href="#" class="pagelayout_bg t2_r"></a>
                        </li>
                        <li class="pagelayout_P T3">
                            <a type="PAGE" name="T3" href="#" class="pagelayout_bg t3_r"></a>
                        </li>
                        <li class="pagelayout_P T4">
                            <a type="PAGE" name="T4" href="#" class="pagelayout_bg t4_r"></a>
                        </li>
                        <li class="pagelayout_P T5">
                            <a type="PAGE" name="T5" href="#" class="pagelayout_bg t5_r"></a>
                        </li>
                        <li class="pagelayout_P T6">
                            <a type="PAGE" name="T6" href="#" class="pagelayout_bg t6_r"></a>
                        </li>
                        <li class="pagelayout_P T7">
                            <a type="PAGE" name="T7" href="#" class="pagelayout_bg t7_r"></a>
                        </li>
                        <li class="pagelayout_P T8">
                            <a type="PAGE" name="T8" href="#" class="pagelayout_bg t8_r"></a>
                        </li>
                        <li class="pagelayout_P T9">
                            <a type="PAGE" name="T9" href="#" class="pagelayout_bg t9_r"></a>
                        </li>
                        <li class="pagelayout_P T10">
                            <a type="PAGE" name="T10" href="#" class="pagelayout_bg t10_r"></a>
                        </li>
                        <li class="pagelayout_P T11">
                            <a type="PAGE" name="T11" href="#" class="pagelayout_bg t11_r"></a>
                        </li>
                        <li class="pagelayout_P T12">
                            <a type="PAGE" name="T12" href="#" class="pagelayout_bg t12_r"></a>
                        </li>
                        <li class="pagelayout_P T13">
                            <a type="PAGE" name="T13" href="#" class="pagelayout_bg t13_r"></a>
                        </li>
                        <li class="pagelayout_P T14">
                            <a type="PAGE" name="T14" href="#" class="pagelayout_bg t14_r"></a>
                        </li>
                        <li class="pagelayout_P T15">
                            <a type="PAGE" name="T15" href="#" class="pagelayout_bg t15_r"></a>
                        </li>
                    </ul>
                    <ul style="display: none;" class="blk layout_list bg_cont pagelayout_widebook">
                        <li class="pagelayout_C C1">
                            <a type="COVER" name="C1" href="#" class="pagelayout_bg t2_r"></a>
                        </li>
                        <li class="pagelayout_C C2">
                            <a type="COVER" name="C2" href="#" class="pagelayout_bg t3_r"></a>
                        </li>
                        <li class="pagelayout_P T1">
                            <a type="PAGE" name="T1" href="#" class="pagelayout_bg t1_r"></a>
                        </li>
                        <li class="pagelayout_P T31">
                            <a type="PAGE" name="T31" href="#" class="pagelayout_bg t31_r"></a>
                        </li>
                        <li class="pagelayout_P T32">
                            <a type="PAGE" name="T32" href="#" class="pagelayout_bg t32_r"></a>
                        </li>
                        <li class="pagelayout_P T4">
                            <a type="PAGE" name="T4" href="#" class="pagelayout_bg t4_r"></a>
                        </li>
                        <li class="pagelayout_P T5">
                            <a type="PAGE" name="T5" href="#" class="pagelayout_bg t5_r"></a>
                        </li>
                        <li class="pagelayout_P T6">
                            <a type="PAGE" name="T6" href="#" class="pagelayout_bg t6_r"></a>
                        </li>
                        <li class="pagelayout_P T7">
                            <a type="PAGE" name="T7" href="#" class="pagelayout_bg t7_r"></a>
                        </li>
                        <li class="pagelayout_P T8">
                            <a type="PAGE" name="T8" href="#" class="pagelayout_bg t8_r"></a>
                        </li>
                        <li class="pagelayout_P T9">
                            <a type="PAGE" name="T9" href="#" class="pagelayout_bg t9_r"></a>
                        </li>
                        <li class="pagelayout_P T10">
                            <a type="PAGE" name="T10" href="#" class="pagelayout_bg t10_r"></a>
                        </li>
                        <li class="pagelayout_P T11">
                            <a type="PAGE" name="T11" href="#" class="pagelayout_bg t11_r"></a>
                        </li>
                        <li class="pagelayout_P T12">
                            <a type="PAGE" name="T12" href="#" class="pagelayout_bg t12_r"></a>
                        </li>
                        <li class="pagelayout_P T13">
                            <a type="PAGE" name="T13" href="#" class="pagelayout_bg t13_r"></a>
                        </li>
                        <li class="pagelayout_P T14">
                            <a type="PAGE" name="T14" href="#" class="pagelayout_bg t14_r"></a>
                        </li>
                        <li class="pagelayout_P T15">
                            <a type="PAGE" name="T15" href="#" class="pagelayout_bg t15_r"></a>
                        </li>
                        <li class="pagelayout_P T16">
                            <a type="PAGE" name="T16" href="#" class="pagelayout_bg t16_r"></a>
                        </li>
                        <li class="pagelayout_P T17">
                            <a type="PAGE" name="T17" href="#" class="pagelayout_bg t17_r"></a>
                        </li>
                        <li class="pagelayout_P T18">
                            <a type="PAGE" name="T18" href="#" class="pagelayout_bg t18_r"></a>
                        </li>
                        <li class="pagelayout_P T19">
                            <a type="PAGE" name="T19" href="#" class="pagelayout_bg t19_r"></a>
                        </li>
                        <li class="pagelayout_P T20">
                            <a type="PAGE" name="T20" href="#" class="pagelayout_bg t20_r"></a>
                        </li>
                        <li class="pagelayout_P T21">
                            <a type="PAGE" name="T21" href="#" class="pagelayout_bg t21_r"></a>
                        </li>
                        <li class="pagelayout_P T22">
                            <a type="PAGE" name="T22" href="#" class="pagelayout_bg t22_r"></a>
                        </li>
                        <li class="pagelayout_P T23">
                            <a type="PAGE" name="T23" href="#" class="pagelayout_bg t23_r"></a>
                        </li>
                        <li class="pagelayout_P T24">
                            <a type="PAGE" name="T24" href="#" class="pagelayout_bg t24_r"></a>
                        </li>
                        <li class="pagelayout_P T25">
                            <a type="PAGE" name="T25" href="#" class="pagelayout_bg t25_r"></a>
                        </li>
                        <li class="pagelayout_P T26">
                            <a type="PAGE" name="T26" href="#" class="pagelayout_bg t26_r"></a>
                        </li>
                        <li class="pagelayout_P T27">
                            <a type="PAGE" name="T27" href="#" class="pagelayout_bg t27_r"></a>
                        </li>
                        <li class="pagelayout_P T28">
                            <a type="PAGE" name="T28" href="#" class="pagelayout_bg t28_r"></a>
                        </li>
                        <li class="pagelayout_P T29">
                            <a type="PAGE" name="T29" href="#" class="pagelayout_bg t29_r"></a>
                        </li>
                        <li class="pagelayout_P T30">
                            <a type="PAGE" name="T30" href="#" class="pagelayout_bg t30_r"></a>
                        </li>
                        <li class="pagelayout_P T201">
                            <a type="PAGE" name="T201" href="#" class="pagelayout_bg t201 cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T202">
                            <a type="PAGE" name="T202" href="#" class="pagelayout_bg t202 cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T203">
                            <a type="PAGE" name="T203" href="#" class="pagelayout_bg t203 cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T204">
                            <a type="PAGE" name="T204" href="#" class="pagelayout_bg t204 cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T205">
                            <a type="PAGE" name="T205" href="#" class="pagelayout_bg t205 cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T206">
                            <a type="PAGE" name="T206" href="#" class="pagelayout_bg t206 cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T207">
                            <a type="PAGE" name="T207" href="#" class="pagelayout_bg t207 cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T208">
                            <a type="PAGE" name="T208" href="#" class="pagelayout_bg t208 cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T209">
                            <a type="PAGE" name="T209" href="#" class="pagelayout_bg t209 cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T210">
                            <a type="PAGE" name="T210" href="#" class="pagelayout_bg t210 cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T211">
                            <a type="PAGE" name="T211" href="#" class="pagelayout_bg t211 cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T212">
                            <a type="PAGE" name="T212" href="#" class="pagelayout_bg t212 cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T213">
                            <a type="PAGE" name="T213" href="#" class="pagelayout_bg t213 cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T214">
                            <a type="PAGE" name="T214" href="#" class="pagelayout_bg t214 cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T215">
                            <a type="PAGE" name="T215" href="#" class="pagelayout_bg t215 cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T216">
                            <a type="PAGE" name="T216" href="#" class="pagelayout_bg t216 cross_layout"></a>
                        </li>
                    </ul>
                    <ul style="" class="blk layout_list bg_cont pagelayout_mpadbook">
                        <li class="pagelayout_C C1">
                            <a type="COVER" name="C1" href="#" class="pagelayout_bg c1_r"></a>
                        </li>
                        <li class="pagelayout_C C2">
                            <a type="COVER" name="C2" href="#" class="pagelayout_bg c2_r"></a>
                        </li>
                        <li class="pagelayout_C C3">
                            <a type="COVER" name="C3" href="#" class="pagelayout_bg c3_r"></a>
                        </li>
                        <li class="pagelayout_C C4">
                            <a type="COVER" name="C4" href="#" class="pagelayout_bg c4_r"></a>
                        </li>
                        <li class="pagelayout_C C5">
                            <a type="COVER" name="C5" href="#" class="pagelayout_bg c5_r"></a>
                        </li>
                        <li class="pagelayout_C C6">
                            <a type="COVER" name="C6" href="#" class="pagelayout_bg c6_r"></a>
                        </li>
                        <li class="pagelayout_P T1">
                            <a type="PAGE" name="T1" href="#" class="pagelayout_bg t1_r"></a>
                        </li>
                        <li class="pagelayout_P T1">
                            <a type="PAGE" name="T2" href="#" class="pagelayout_bg t2_r"></a>
                        </li>
                        <li class="pagelayout_P T1">
                            <a type="PAGE" name="T3" href="#" class="pagelayout_bg t3_r"></a>
                        </li>
                        <li class="pagelayout_P T4">
                            <a type="PAGE" name="T4" href="#" class="pagelayout_bg t4_r"></a>
                        </li>
                        <li class="pagelayout_P T5">
                            <a type="PAGE" name="T5" href="#" class="pagelayout_bg t5_r"></a>
                        </li>
                        <li class="pagelayout_P T6">
                            <a type="PAGE" name="T6" href="#" class="pagelayout_bg t6_r"></a>
                        </li>
                        <li class="pagelayout_P T7">
                            <a type="PAGE" name="T7" href="#" class="pagelayout_bg t7_r"></a>
                        </li>
                        <li class="pagelayout_P T8">
                            <a type="PAGE" name="T8" href="#" class="pagelayout_bg t8_r"></a>
                        </li>
                        <li class="pagelayout_P T9">
                            <a type="PAGE" name="T9" href="#" class="pagelayout_bg t9_r"></a>
                        </li>
                        <li class="pagelayout_P T10">
                            <a type="PAGE" name="T10" href="#" class="pagelayout_bg t10_r"></a>
                        </li>
                        <li class="pagelayout_P T11">
                            <a type="PAGE" name="T11" href="#" class="pagelayout_bg t11_r"></a>
                        </li>
                        <li class="pagelayout_P T12">
                            <a type="PAGE" name="T12" href="#" class="pagelayout_bg t12_r"></a>
                        </li>
                        <li class="pagelayout_P T13">
                            <a type="PAGE" name="T13" href="#" class="pagelayout_bg t13_r"></a>
                        </li>
                        <li class="pagelayout_P T14">
                            <a type="PAGE" name="T14" href="#" class="pagelayout_bg t14_r"></a>
                        </li>
                        <li class="pagelayout_P T15">
                            <a type="PAGE" name="T15" href="#" class="pagelayout_bg t15_r"></a>
                        </li>
                        <li class="pagelayout_P T16">
                            <a type="PAGE" name="T16" href="#" class="pagelayout_bg t16_r"></a>
                        </li>
                        <li class="pagelayout_P T17">
                            <a type="PAGE" name="T17" href="#" class="pagelayout_bg t17_r"></a>
                        </li>
                        <li class="pagelayout_P T18">
                            <a type="PAGE" name="T18" href="#" class="pagelayout_bg t18_r"></a>
                        </li>
                        <li class="pagelayout_P T19">
                            <a type="PAGE" name="T19" href="#" class="pagelayout_bg t19_r"></a>
                        </li>
                        <li class="pagelayout_P T20">
                            <a type="PAGE" name="T20" href="#" class="pagelayout_bg t20_r"></a>
                        </li>
                        <li class="pagelayout_P T21">
                            <a type="PAGE" name="T21" href="#" class="pagelayout_bg t21_r"></a>
                        </li>
                        <li class="pagelayout_P T200">
                            <a type="PAGE" name="T200" href="#" class="pagelayout_bg t200_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T201">
                            <a type="PAGE" name="T201" href="#" class="pagelayout_bg t201_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T202">
                            <a type="PAGE" name="T202" href="#" class="pagelayout_bg t202_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T203">
                            <a type="PAGE" name="T203" href="#" class="pagelayout_bg t203_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T204">
                            <a type="PAGE" name="T204" href="#" class="pagelayout_bg t204_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T205">
                            <a type="PAGE" name="T205" href="#" class="pagelayout_bg t205_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T206">
                            <a type="PAGE" name="T206" href="#" class="pagelayout_bg t206_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T207">
                            <a type="PAGE" name="T207" href="#" class="pagelayout_bg t207_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T208">
                            <a type="PAGE" name="T208" href="#" class="pagelayout_bg t208_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T209">
                            <a type="PAGE" name="T209" href="#" class="pagelayout_bg t209_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T210">
                            <a type="PAGE" name="T210" href="#" class="pagelayout_bg t210_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T211">
                            <a type="PAGE" name="T211" href="#" class="pagelayout_bg t211_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T212">
                            <a type="PAGE" name="T212" href="#" class="pagelayout_bg t212_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T213">
                            <a type="PAGE" name="T213" href="#" class="pagelayout_bg t213_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T214">
                            <a type="PAGE" name="T214" href="#" class="pagelayout_bg t214_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T215">
                            <a type="PAGE" name="T215" href="#" class="pagelayout_bg t215_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T216">
                            <a type="PAGE" name="T216" href="#" class="pagelayout_bg t216_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T217">
                            <a type="PAGE" name="T217" href="#" class="pagelayout_bg t217_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T218">
                            <a type="PAGE" name="T218" href="#" class="pagelayout_bg t218_r cross_layout"></a>
                        </li>
                        <li class="pagelayout_P T219">
                            <a type="PAGE" name="T219" href="#" class="pagelayout_bg t219_r cross_layout"></a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- ======================================================== -->
    <div style="position: absolute; left: 766px; top: 928px; display: block;" class="image_tools ui-draggable" id="image_tools">
        <div class="content">
            <h2 id="image_tools_tips">图像工具</h2>
            <a href="#" class="btn_close"></a>
            <ul>
                <li><a href="#" class="zoom_out" tips="放大"></a></li>
                <li><a href="#" class="zoom_in" tips="缩小"></a></li>
                <li><a href="#" class="ajust_frame" tips="填满" action="ajustFrame"></a></li>
                <li><a href="#" class="ajust_image" tips="适应" action="ajustImage"></a></li>
                <li><a href="#" class="roate_left" tips="向左旋转" action="roateLeft" style="display: none;"></a></li>
                <li><a href="#" class="roate_right" tips="向右旋转" action="roateRight" style="display: none;"></a></li>
                <li><a href="#" class="delete" tips="移除图片" action="deleteImage"></a></li>
                <li><a href="#" class="find" tips="查找图片" action="findImage"></a></li>
            </ul>
        </div>
    </div>
    <!-- ======================================================== -->
    <div style="border-radius: 10px 10px 10px 10px; position: absolute; left: 50%; margin-left: -250px; top: 260px; text-align: center; background-color: rgb(255, 229, 153); border: 1px solid rgb(255, 147, 38); width: 500px; height: 30px; line-height: 30px; z-index: 9999; display: none;" id="end_date">您的作品的截稿日期已经延长到 <b>2013/11/24</b>, 请抓紧时间完成作品出版哦!</div>
    <span style="z-index: 9999; left: 925px; top: 887px; opacity: 0;" id="upload_tips" class="upload-tips"></span>
    <!-- ======================================================== -->
    <script type="text/javascript">
        $(function() {
            Uploader.extend.event(1,0,16939197918537);           
        });
    </script>
    <!-- ======================================================== -->
    <div style="position: absolute; left: 50%; top: 89px; margin-left: -242.5px; display: none;" class="dialog_selector" id="dialog_selector">    
    	<div class="title">        
    		<h2>开始创作</h2>    
    	</div>    
    	<div class="content">        
    		<div id="tab1" class="tab_view">            
    		<div class="bookdetail">                
	    		<div class="product">                    
	    		<h2 class="product_name">| mPad照片书</h2>                    
	    		<div class="detail">                        
	    			<img width="272" height="198" src="<%=path%>/styles/images/edit/1005.jpg" class="c_img">                    
	    		</div>                
	    		</div>                
	    		<div class="pagecount">                    
	    			<h2>选择页数:</h2>                    
	    			<ul class="j_page_count">
	    				<li><a class="j_page_count_36 cur" page_count="36" href="#">36P</a></li>
	    				<li><a class="j_page_count_48" page_count="48" href="#">48P</a></li>
	    				<li><a class="j_page_count_56" page_count="56" href="#">56P</a></li>
	    				<li><a class="j_page_count_64" page_count="64" href="#">64P</a></li>
	    				<li><a class="j_page_count_72" page_count="72" href="#">72P</a></li>
	    				<li><a class="j_page_count_80" page_count="80" href="#">80P</a></li>
	    				<li><a class="j_page_count_96" page_count="96" href="#">96P</a></li>
	    			</ul>                
	    		</div>                
	    		<div class="info">                    
	    			<h2 class="info_title">您选择的是:36P（可编辑33P） 四色<span>128</span>元 / 六色<span>168</span>元</h2>                    
	    			<h2 class="info_tips" style="display: none;">推荐！厚度、翻阅手感好，性价比高！</h2>                
	    		</div>            
    		</div>            
    		<div class="operator_bar">                
    			<h2>如果您有兑换券，请 <a href="#" class="btn_to_exchange">点击这里</a></h2>                
    			<a href="#" class="btn_go">开始创作</a>            
    		</div>        
    		</div>        
    		<div style="display:none;" id="tab2" class="tab_view">            
    		<div class="exchange">                
    		<h2>请输入兑换券编码：</h2>                
    		<div class="exchange_input">                    
    		<a href="#" class="btn_exchange"></a>                    
    		<input>                
    		</div>            
    		</div>            
    		<div class="exchange_bar">                
    			<a href="#" class="btn_second btn_back">返回</a>            
    		</div>        
    		</div>    
    		</div>
    </div>
    <!-- ======================================================== -->
    <div style="left: 341.5px; top: 213px; z-index: 9999; position: absolute; width: 531px; height: 363px; background-image: url(&quot;<%=path%>/styles/images/edit/guide_step_upload.png&quot;); display: none;"
		id="guide_step_upload" class="j_guide">
		<a href="#" style="top: 72px; right: 0px; position: absolute; width: 45px; height: 35px; display: block;"
			class="j_guide_close"></a> 
		<a href="#"	style="bottom: 33px; right: 32px; position: absolute; width: 95px; height: 35px; display: block;"
			next="color" class="j_guide_next"></a>
	</div>		
	<!-- ======================================================== -->
	<div style="left: -5px; top: -365px; z-index: 9999; position: absolute; width: 531px; height: 370px; background-image: url(&quot;<%=path%>/styles/images/edit/guide/guide_step_color.png&quot;);"
		id="guide_step_color" class="j_guide">
		<a href="#"	style="top: 0px; right: 0px; position: absolute; width: 45px; height: 35px; display: block;"
			class="j_guide_close"></a> 
		<a href="#" style="bottom: 110px; right: 32px; position: absolute; width: 95px; height: 35px; display: block;"
			next="textcolor" class="j_guide_next">
		</a>
	</div>	
	<!-- ======================================================== -->
	<div style="display: none; left: 0px; top: 0px; z-index: 9999; position: absolute; width: 531px; height: 370px; background-image: url(<%=path%>/styles/images/edit/guide_step_textcolor.png);"
		id="guide_step_textcolor" class="j_guide">
		<a href="#" style="top: 0px; right: 0px; position: absolute; width: 45px; height: 35px; display: block;"
			class="j_guide_close"></a> 
		<a href="#" style="bottom: 110px; right: 32px; position: absolute; width: 95px; height: 35px; display: block;"
			next="style" class="j_guide_next"></a>
	</div>
	<!-- ======================================================== -->
	<div style="display: none; left: 0px; top: 0px; z-index: 9999; position: absolute; width: 617px; height: 290px; background-image: url(<%=path%>/styles/images/edit/guide_step_style.png);"
		id="guide_step_style" class="j_guide">
		<a href="#" style="top: 0px; right: 81px; position: absolute; width: 45px; height: 35px; display: block;"
			class="j_guide_close"></a> 
		<a href="#" style="bottom: 34px; right: 118px; position: absolute; width: 95px; height: 35px; display: block;"
			next="pagemanger" class="j_guide_next"></a>
	</div>
	<!-- ======================================================== -->
	<div style="display: none; left: 0px; top: 0px; z-index: 9999; position: absolute; width: 531px; height: 374px; background-image: url(<%=path%>/styles/images/edit/guide_step_pagemanager.png);"
		id="guide_step_pagemanager" class="j_guide">
		<a href="#" style="top: 0px; right: 0px; position: absolute; width: 45px; height: 35px; display: block;"
			class="j_guide_close"></a> 
		<a href="#" style="bottom: 118px; right: 32px; position: absolute; width: 95px; height: 35px; display: block;"
			next="pagecount" class="j_guide_next"></a>
	</div>
	<!-- ======================================================== -->
	<div style="display: none; left: 0px; top: 0px; z-index: 9999; position: absolute; width: 531px; height: 354px; background-image: url(<%=path%>/styles/images/edit/guide_step_pagecount.png);"
		id="guide_step_pagecount" class="j_guide">
		<a href="#"	style="top: 65px; right: 0px; position: absolute; width: 45px; height: 35px; display: block;"
			class="j_guide_close"></a> 
		<a href="#"	style="bottom: 32px; right: 32px; position: absolute; width: 95px; height: 35px; display: block;"
			next="thumbnail" class="j_guide_next"></a>
	</div>
	<!-- ======================================================== -->
	<div style="display: none; left: 0px; top: 0px; z-index: 9999; position: absolute; width: 531px; height: 374px; background-image: url(<%=path%>/styles/images/edit/guide_step_thumbnail.png);"
		id="guide_step_thumbnail" class="j_guide">
		<a href="#"	style="top: 0px; right: 0px; position: absolute; width: 45px; height: 35px; display: block;"
			class="j_guide_color"></a> 
		<a href="#"	style="bottom: 110px; right: 32px; position: absolute; width: 95px; height: 35px; display: block;"
			class="j_guide_next"></a>
	</div>
	<!-- ======================================================== -->
	<div id="lightboxOverlay" style="display: none;"></div>
	<!-- 
	<div id="lightbox" style="display: none;">
		<div class="lb-outerContainer">
			<div class="lb-container">
				<img class="lb-image">
				<div class="lb-nav">
					<a class="lb-prev"></a><a class="lb-next"></a>
				</div>
				<div class="lb-loader">
					<a class="lb-cancel">
					<img src="<%=path%>/styles/images/edit/loading.gif">
					</a>
				</div>
			</div>
		</div>
		<div class="lb-dataContainer">
			<div class="lb-data">
				<div class="lb-details">
					<span class="lb-caption"></span><span class="lb-number"></span>
				</div>
				<div class="lb-closeContainer">
					<a class="lb-close">
					<img src="<%=path%>/styles/images/edit/close.png">
					</a>
				</div>
			</div>
		</div>
	</div>
	 -->
	<!-- ======================================================== -->
	<div style="position: absolute; top: 36px; margin-top: -10000px;"
		class="uploader_dialog ui-draggable" id="uploader_dialog"
		is_init="true">
		<div class="uploader_dialog_title">
			<a href="javascript:;" class="uploader_close"></a>
			<h2 style="width: 500px;">1.您正在制作的是照片书产品，最多可上传500张相片。2.单次最多可选择80张相片</h2>
		</div>
		<div style="position: relative; height: 528px;"
			class="uploader_dialog_content">
			<p
				style="position: absolute; left: 217px; top: 20px; font-size: 12px;">
				如果您普通上传看不到东西,可能是由于Flash插件太旧或者没安装导致,请点击<a targer="_blank"
					href="http://www.adobe.com/go/getflash" style="color: blue;">这里</a>安装或升级，安装完成后重新打开本页面即可。
			</p>
			<div class="upload_type_list">
				<div title="flash 上传" ref="#upload_flash" class="nav on">普通上传</div>
				<div title="QQ传送" id="qqupload" ref="#upload_qq" class="nav">QQ传送</div>
			</div>
			<div class="upload_item_list">
				<div id="upload_flash" class="upload_item_show">
					<div class="zip_uploader">
						<object width="900" height="536" align="middle"
							type="application/x-shockwave-flash" id="zip_uploader"
							name="zip_uploader"
							data="<%=path%>/styles/flash/swf/uploader_file.swf?ver=20130524"
							style="visibility: visible;">
							<param name="quality" value="high">
							<param name="bgcolor" value="#ffffff">
							<param name="allowfullscreen" value="true">
							<param name="allowScriptAccess" value="always">
							<param name="wmode" value="transparent">
							<param name="hasPriority" value="true">
							<!-- value="uploadUrl=http://upload.mimoprint.com/userimage/uploadfile&amp;userId=103691&amp;worksId=169391&amp;bookId=153296&amp;maxCount=200" -->
							<param name="flashvars" 
							value="uploadUrl=<%=path%>/user/${sessionUserName.id}/uploadFile.html&amp;userId=103691&amp;worksId=169391&amp;bookId=153296&amp;maxCount=200">
							<!--
							value="uploadUrl=http://upload.mimoprint.com/userimage/uploadfile&amp;userId=103691&amp;worksId=169391&amp;bookId=153296&amp;maxCount=200">
							-->
								
						</object>
					</div>
				</div>
				<div id="upload_qq"
					style="top: -523px; display: none; overflow-y: scroll;"
					class="upload_item_show">
					<div class="upload_item_content">
						<ul class="upload_qq_tab">
							<li><a href="#" class="cur" id="zip">以压缩文件方式</a></li>
							<li><a href="#" id="floder">以文件夹方式</a></li>
						</ul>
						<div style="display: none;" class="upload_item_tips tab_floder">
							<h2>文件夹方式:</h2>
							<p>
								实时看到上传的图片,传送一张系统自动拉取一张,支持<b>边编辑边上传</b>。<br>
								开始传送后，可以关闭本弹出框。每当一张图片传送成功后，在编辑器顶部可以看到成功上传的图片。<br>
								【PS:推荐着急编辑的用户使用】
							</p>
						</div>
						<div class="upload_item_tips tab_zip">
							<h2></h2>
							<p>
								推荐加QQ：1204055612 为好友，用离线文件方式传送，压缩包最大不能超过2G。过大请分批传送。 <br>【PS:必须加QQ好友，才能发送离线文件哦。】
							</p>
						</div>
						<div class="upload_item_filename">
							<span class="action_name">压缩包名称：</span><input
								style="font-size: 24px; letter-spacing: 2px;"><a
								class="btn_copy" href="#"></a><a class="btn_send"
								href="tencent://message?uin=1204055612"></a><span>(上传的文件或者文件夹名称必须和左边的数字一样才可以!!)</span>
						</div>
						<div class="upload_item_guide tab_zip">
							<h2>以下是"以压缩文件方式传送"示例</h2>
							<div class="upload_item_section">
								<h2>
									<i class="upload_item_section_step1"></i><b>新建文件夹</b>,并以上面提供的名称命名
								</h2>
								<img src="<%=path%>/styles/images/edit/upload_qq_zip_1.jpg">
							</div>
							<div class="upload_item_section">
								<h2>
									<i class="upload_item_section_step2"></i>将要上传的图片，<b>复制到</b>刚才创建的文件夹内
								</h2>
								<img src="<%=path%>/styles/images/edit/upload_qq_zip_2.jpg">
							</div>
							<div class="upload_item_section">
								<h2>
									<i class="upload_item_section_step3"></i>在文件夹点击鼠标右边，选择添加到“xxx.rar”，<b>压缩文件夹</b>（支持rar、zip等格式）。
								</h2>
								<img src="<%=path%>/styles/images/edit/upload_qq_zip_3.jpg">
							</div>
							<div class="upload_item_section">
								<h2>
									<i class="upload_item_section_step4"></i><b>发送到QQ号码</b>：1204055612
									<a href="tencent://message?uin=1204055612">[点击发送]</a>
								</h2>
								<img src="<%=path%>/styles/images/edit/upload_qq_zip_4_2.jpg">
							</div>
						</div>
						<div style="display: none;" class="upload_item_guide tab_floder">
							<h2>以下是"以文件夹方式传送"示例</h2>
							<div class="upload_item_section">
								<h2>
									<i class="upload_item_section_step1"></i><b>新建文件夹</b>,并以上面提供的名称命名
								</h2>
								<img src="<%=path%>/styles/images/edit/upload_qq_zip_1.jpg">
							</div>
							<div class="upload_item_section">
								<h2>
									<i class="upload_item_section_step2"></i>将要上传的图片，<b>复制到</b>刚才创建的文件夹内
								</h2>
								<img src="<%=path%>/styles/images/edit/upload_qq_zip_2.jpg">
							</div>
							<div class="upload_item_section">
								<h2>
									<i class="upload_item_section_step3"></i><b>发送到QQ号码</b>：1204055612
									<a href="tencent://message?uin=1204055612">[点击发送]</a>
								</h2>
								<img src="<%=path%>/styles/images/edit/upload_qq_floder_3_2.jpg">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ======================================================== -->
	<div style="display: none;" class="uploader_dialog_min"><span>上传图像中...<span id="uploader_dialog_min_progress">30</span>%</span></div>
</body>
</html>