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
<link rel="stylesheet" type="text/css" href="<%=path%>/styles/css/edit/reset.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/styles/css/edit/editor_base.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/styles/css/edit/upgrade.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/styles/css/edit/lightbox.css">
<link href="<%=path%>/styles/css/edit/header.css" rel="stylesheet">
<link href="<%=path%>/styles/css/edit/upload.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/styles/css/edit/base.css" rel="stylesheet" type="text/css">

<script src="<%=path%>/styles/js/photoBookEditer/jquery-1.10.2.js" type="text/javascript"></script>
<script src="<%=path%>/styles/js/photoBookEditer/custom.js" type="text/javascript"></script>
</head>
<body class="mpadbook">
	<!-- ========================================================== -->
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
	<!-- ========================================================== -->
	<div id="outwrap">
        <!--begin 顶部logo和工具栏 -->
        <div id="logo_tools_bar">
            <a href="###"><span id="logo"></span></a>
            <span id="works_title" class="works_title"></span>
            <div id="tools_bar">

                &nbsp;&nbsp;<a href="#" id="btn_preview" class="btn" title="预览">预览</a>
                <a href="#" id="btn_save" class="btn" title="保存&amp;加入购物车" onclick="addToShoppingCart(1)">保存</a>
                <a href="#" id="btn_setting" class="btn btn4" title="书本设置">页数设置</a>
                <a href="#" id="btn_print" class="btn btn_reg_green" title="印刷">印刷</a>
            </div>
        </div>
        <!--end -->
        <div id="inwrap">
            <!--顶部边框 -->
            <div id="inwrap_pre"></div>
            <!--begin 编辑区域 -->
            <div style="padding: 30px 0px;" class="sections">
                <!--begin 上传和图像缩略图 -->
                <div id="section_upload_thumnail" class="section">
                    <a id="btn_upload" class="btn" title="上传照片"></a>
                    <div id="mod_thumbnail" class="pic_theme_list">
                        <a id="mod_thumbnail_btn_prev" class="arrow_lf btn_arrow btn lf"></a>
                        <div class="thumbnail_warp customer_scrollbar">
                            <ul style="left: 0px; id="mod_thumbnail_list" class="thumbnail lf">
                            <c:forEach var="smallPic" items="${smallImages}">
                            	<li class="">                
	                            	<img class="j_thumbnail ui-draggable" title="点击查看大图" 
	                            		src="${smallPic.url}" bigImageUrl="${smallPic.fatherUrl}" onclick="showBigImage('${smallPic.fatherUrl}')">                
	                            	<span class="counter" title="图像被使用次数">0</span>
	                            	<span class="thumbnail_operats">
	                            	<a title="旋转" href="javascript:;" class="btn_rotate_left"></a>
	                            	<a title="旋转" href="javascript:;" class="btn_rotate_right"></a>
	                            	<a title="删除" href="javascript:;" class="btn_delete"></a>
	                            	</span>            
                            	</li>
                            </c:forEach>         
                            </ul>
                        </div>
                        <a id="mod_thumbnail_btn_next" class="arrow_rt btn btn_arrow lf"></a>
                    </div>
                </div>
                <!--end -->

                <div id="section_thumnail_info" class="section section_thumnail_info">
                    <span class="upload_bar_holder" id="upload_bar_holder" style="display: none">
                        <span class="name">已上传<em class="img_page" id="upload_totalPage">5</em>张  进度(<em id="bar_percent">100</em>%)：</span>
                        <span class="bar_outer" id="bar_outer">
                            <span style="width: 200px;" class="bar" id="upload_curr_bar"></span>
                        </span>
                    </span>
                    <span>共 <b id="thumbnail_count">${fn:length(smallImages)}</b> 张，已使用 <b id="thumbnail_used_count">0</b> 张&nbsp;&nbsp;<label><input type="checkbox" id="chk_hide_used">隐藏已使用的照片</label>
                    </span><span class="thumbnail_order">排序方式：<a href="#" class="cur" action="filename">按文件名</a><a href="#" action="phototime">按拍照时间</a><a href="#" action="uploadtime">按上传时间</a></span>
                </div>

                <!--begin 版式自定义编辑 -->
                <div id="section_layout_edit" class="edit_spine">
                    <div id="edit_area_warp" class="edit_area_warp edit_area_warp_right">
                        <div id="spine" class="spine" num="spine">
                            <div align="left" contenteditable="true" class="text_box txt1" id="spine_txt1" name="txt1" x="79" y="18" width="4" height="180" space="0" leading="9.6" max_line="1" max_length="25" pt="8" px="6" direction="vertical" style="left: 8px; top: 10px; width: 10px; height: 204px; font-size: 7px; letter-spacing: 4px;" tips_info="在此输入作品主标题">在此输入作品主标题</div>
                            <div align="left" contenteditable="true" class="text_box txt2" id="spine_txt2" name="txt1" x="79" y="18" width="4" height="180" space="0" leading="9.6" max_line="1" max_length="14" pt="8" px="6" direction="vertical" style="left: 8px; top: 227px; width: 10px; height: 112px; font-size: 7px; letter-spacing: 4px;" tips_info="在此输入作者信息">在此输入作者信息</div>
                        </div>
                        <div class="backbone_bg"></div>
                        <div class="pagelayout_left_side_warp">
                            <div id="pagelayout_left_side_edit" class="pagelayout_edit" background_color="#ffffff" color="#000000" style="background-color: rgb(255, 255, 255);"><div class="trim_line_top"></div><div class="trim_line_left"></div><div class="trim_line_bottom"></div><div class="trim_line_right"></div><div style="left: 181px; top: 309px; width: 93px; height: 21px;position: absolute;" height="9.5" width="42" y="113" x="15.5" name="img1" class="img1 "><img width="110" class="ui-draggable" style="position: relative; left: 0px; top: 0px;" src="<%=path%>/styles/images/edit/m_logo_b.png" id="bottom_img1"></div></div>
                        </div>
                        <div class="pagelayout_right_side_warp" style="display: block;">
                            <div color="#000000" background_color="#ffffff" id="pagelayout_right_side_edit" class="pagelayout_edit pageedit_cover" style="background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); width: 480px; height: 624px;" has_edited="false" num="cover" name="C1" width="197" height="256" page_type="C" product_type="MPAD" space_type="B" margin_type="A" side_type="M" cross_type="O"><div class="trim_line_top"></div><div class="trim_line_left"></div><div class="trim_line_bottom"></div><div class="trim_line_right"></div><div class="image_box img1 ui-droppable" id="img1" name="img1" x="3" y="0" width="191" height="256" style="left: 7px; top: 0px; width: 466px; height: 624px;"><div class="drag_here"></div><div class="dpi_info">1880x2520</div></div><div align="left" class="text_box text_box_background txt1" id="txt1" name="txt1" x="21" y="18" width="160" height="8.467" space="28.8" leading="0" max_line="1" max_length="15" pt="24" px="18" direction="horizontal" style="left: 51px; top: 44px; width: 390px; height: 21px; font-size: 18px;">在此输入文字~</div><div align="left" class="text_box text_box_background txt2" id="txt2" name="txt2" x="21" y="33" width="160" height="6" space="12" leading="0" max_line="1" max_length="34" pt="12" px="8" direction="horizontal" style="left: 51px; top: 80px; width: 390px; height: 15px; font-size: 9px;">在此输入文字~</div><div align="left" class="text_box text_box_background txt3" id="txt3" name="txt3" x="21" y="39" width="50" height="6" space="0" leading="0" max_line="1" max_length="10" pt="12" px="8" direction="horizontal" style="left: 51px; top: 95px; width: 122px; height: 15px; font-size: 9px;">在此输入文字~</div></div>
                        </div>
                        <div class="layout_tools">
                            <ul class="tool_bot">
                                <li class="lf left_btn">
                                    <a href="javascript:;" id="background_color_picker_btn" class="editor_bg"><span>底色</span><i></i></a>
                                    <a href="#" id="text_color_picker_btn" class="editor_color"><span>文字颜色</span><i></i></a>
                                </li>
                                <li class="rt right_btn">
                                    <a id="pagelayout_picker_btn" class="editor_format" onclick="controllPagelayout();">
                                    	<span>&nbsp;</span><i></i>
                                    </a>
                                </li>
                            </ul>
                            <ul id="background_color_bar" class="color_bar" style="display: none;">
                                <li class="white_bg color_page" data-color="#ffffff" title="白色"></li>
                                <li class="black_bg color_page" data-color="#000000" title="黑色"></li>
                                <li class="yanghong_bg" data-color="#EF006B" title="洋红"></li>
                                <li class="qing_bg" data-color="#009FE0" title="青色"></li>
                                <li class="ningmeng_bg" data-color="#FFC400" title="柠檬"></li>
                                <li class="juzi_bg" data-color="#F98C00" title="橘子"></li>
                                <li class="dahong_bg" data-color="#DF0000" title="大红"></li>
                                <li class="caodi_bg" data-color="#93BC00" title="草地"></li>
                                <li class="naicha_bg" data-color="#C2891B" title="奶茶"></li>
                                <li class="kafei_bg" data-color="#77420D" title="咖啡"></li>
                                <li class="yingtao_bg" data-color="#B90000" title="樱桃"></li>
                                <li class="senlin_bg" data-color="#175724" title="森林"></li>
                                <li class="nuanhui_bg" data-color="#CABCAB" title="暖灰"></li>
                                <li class="lenghui_bg" data-color="#A8BCC2" title="冷灰"></li>
                                <li class="yanzhi_bg" data-color="#FABBAB" title="胭脂"></li>
                                <li class="wuye_bg" data-color="#6688A4" title="午夜"></li>
                                <li class="xiangya_bg" data-color="#F8F2E5" title="象牙"></li>
                                <li class="mise_bg" data-color="#E4DED6" title="米色"></li>
                                <li class="fenhong_bg" data-color="#F9DBDA" title="粉红"></li>
                                <li class="fenlan_bg" data-color="#D6E9F2" title="粉蓝"></li>
                                <li class="naihuang_bg" data-color="#FFEA9D" title="奶黄"></li>
                                <li class="youzi_bg" data-color="#FCDBAA" title="柚子"></li>
                                <li class="taohong_bg" data-color="#FBE6D4" title="桃红"></li>
                                <li class="suancheng_bg" data-color="#D2DCA0" title="酸橙"></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--end版式自定义编辑 -->
            </div>
            <!--end 编辑区域 -->

            <div id="mod_tools" class="sections mod_tools">
                <div class="section">
                    <span class="btn_area">工具栏：
                        <a id="btn_page_manager" class="btn_round_mid btn" title="管理页面顺序">页面管理</a>                    
                    </span>

                    <div id="page_count" class="page_controll" style="display: none;">
                        <a href="#" id="btn_add_page" class="add">&nbsp;
                        </a>
                        <a href="#" id="btn_minus_page" class="minus">&nbsp;
                        </a>
                        &nbsp;&nbsp;<span>加减页数</span>
                    </div>
                    <span class="page_info">已完成&nbsp;<span id="complete_count">0</span>P，可编辑&nbsp;<span id="edit_count">33</span>P，总共&nbsp;<span id="total_count">36</span>P&nbsp;</span>
                </div>
            </div>

            <!-- begin 页面预览 -->
            <div id="mod_preview_thumnail" class="inwrap_aft gray_wrap_aft">
                <div id="layout_theme">
                    <a id="mod_preview_thumnail_btn_pre" class="arrow_retangle_lf btn lf"></a>
                    <div class="preview_thumbnail">
                        <ul id="mod_preview_thumnail_list" class="blk" style="left: 0px;">  
                              
                        	<li index="0" class="active">            
                        		<a page_type="none" page_side="left" num="bottom" href="javascript:;" id="page_bottom" class="pagelayout_bg blank" style="background-color: rgb(255, 255, 255);"></a>             
                        		<em class="img_page">封底</em>
								<a template_name="C1" page_type="COVER" page_side="right" num="cover" href="javascript:;" id="page_cover" class="pagelayout_bg pc1_r"></a>            
								<em class="img_page_right">封面</em>        
							</li>
							
							<li index="1" class="">            
								<a _template_name="AUTHORINFO" page_side="left" num="0left" href="javascript:;" id="page_0left" class="pagelayout_bg blank"></a>            
								<em class="img_page">封面折页</em>            
								<a template_name="T1" page_side="right" num="0" href="javascript:;" id="page_0" class="pagelayout_bg pt1_r"></a>
								<em class="img_page_right">扉页</em>        
							</li>        
							
							<li index="2" class="">            
								<a page_side="left" num="1_left" href="javascript:;" id="page_1_left" class="pagelayout_bg blank"></a>
								<em class="img_page">扉页对页</em>            
								<a template_name="T8" page_side="right" num="1" href="javascript:;" id="page_1" class="pagelayout_bg pt8_r"></a>
								<em class="img_page_right">1</em>        
							</li>                
							
							<li index="3" class="cross_li">                    
								<a template_name="T215" page_side="left" num="2" href="javascript:;" id="page_2" class="pagelayout_bg pt8_l"></a>
								<em class="img_page">2</em>                    
								<a template_name="T11" page_side="right" num="3" href="javascript:;" id="page_3" class="pagelayout_bg pt11_r" style="display: none;"></a>
								<em class="img_page_right">3</em>                
							</li>                
							
							<li index="4" class="">                    
								<a template_name="T5" page_side="left" num="4" href="javascript:;" id="page_4" class="pagelayout_bg pt5_l"></a>
								<em class="img_page">4</em>                    
								<a template_name="T5" page_side="right" num="5" href="javascript:;" id="page_5" class="pagelayout_bg pt5_r"></a> 
							    <em class="img_page_right">5</em>                
							</li>
							                
							<li index="5" class="">                    
								<a template_name="T17" page_side="left" num="6" href="javascript:;" id="page_6" class="pagelayout_bg pt17_l"></a>
								<em class="img_page">6</em>                    
								<a template_name="T20" page_side="right" num="7" href="javascript:;" id="page_7" class="pagelayout_bg pt20_r"></a>
								<em class="img_page_right">7</em>                
							</li>               
							
							<li index="6" class="">                    
								<a template_name="T20" page_side="left" num="8" href="javascript:;" id="page_8" class="pagelayout_bg pt20_l"></a>
								<em class="img_page">8</em>
								<a template_name="T13" page_side="right" num="9" href="javascript:;" id="page_9" class="pagelayout_bg pt13_r"></a>
								<em class="img_page_right">9</em>                
							</li>                <li index="7" class="">                    <a template_name="T6" page_side="left" num="10" href="javascript:;" id="page_10" class="pagelayout_bg pt6_l">                                            </a>                    <em class="img_page">10</em>                    <a template_name="T9" page_side="right" num="11" href="javascript:;" id="page_11" class="pagelayout_bg pt9_r">                                            </a>                    <em class="img_page_right">11</em>                </li>                <li index="8" class="">                    <a template_name="T9" page_side="left" num="12" href="javascript:;" id="page_12" class="pagelayout_bg pt9_l">                                            </a>                    <em class="img_page">12</em>                    <a template_name="T3" page_side="right" num="13" href="javascript:;" id="page_13" class="pagelayout_bg pt3_r">                                            </a>                    <em class="img_page_right">13</em>                </li>                <li index="9" class="">                    <a template_name="T6" page_side="left" num="14" href="javascript:;" id="page_14" class="pagelayout_bg pt6_l">                                            </a>                    <em class="img_page">14</em>                    <a template_name="T6" page_side="right" num="15" href="javascript:;" id="page_15" class="pagelayout_bg pt6_r">                                            </a>                    <em class="img_page_right">15</em>                </li>                <li index="10" class="">                    <a template_name="T18" page_side="left" num="16" href="javascript:;" id="page_16" class="pagelayout_bg pt18_l">                                            </a>                    <em class="img_page">16</em>                    <a template_name="T11" page_side="right" num="17" href="javascript:;" id="page_17" class="pagelayout_bg pt11_r">                                            </a>                    <em class="img_page_right">17</em>                </li>                <li index="11" class="">                    <a template_name="T11" page_side="left" num="18" href="javascript:;" id="page_18" class="pagelayout_bg pt11_l">                                            </a>                    <em class="img_page">18</em>                    <a template_name="T14" page_side="right" num="19" href="javascript:;" id="page_19" class="pagelayout_bg pt14_r">                                            </a>                    <em class="img_page_right">19</em>                </li>                <li index="12" class="">                    <a template_name="T7" page_side="left" num="20" href="javascript:;" id="page_20" class="pagelayout_bg pt7_l">                                            </a>                    <em class="img_page">20</em>                    <a template_name="T7" page_side="right" num="21" href="javascript:;" id="page_21" class="pagelayout_bg pt7_r">                                            </a>                    <em class="img_page_right">21</em>                </li>                <li index="13" class="">                    <a template_name="T20" page_side="left" num="22" href="javascript:;" id="page_22" class="pagelayout_bg pt20_l">                                            </a>                    <em class="img_page">22</em>                    <a template_name="T4" page_side="right" num="23" href="javascript:;" id="page_23" class="pagelayout_bg pt4_r">                                            </a>                    <em class="img_page_right">23</em>                </li>                <li index="14" class="">                    <a template_name="T4" page_side="left" num="24" href="javascript:;" id="page_24" class="pagelayout_bg pt4_l">                                            </a>                    <em class="img_page">24</em>                    <a template_name="T16" page_side="right" num="25" href="javascript:;" id="page_25" class="pagelayout_bg pt16_r">                                            </a>                    <em class="img_page_right">25</em>                </li>                <li index="15" class="">                    <a template_name="T19" page_side="left" num="26" href="javascript:;" id="page_26" class="pagelayout_bg pt19_l">                                            </a>                    <em class="img_page">26</em>                    <a template_name="T12" page_side="right" num="27" href="javascript:;" id="page_27" class="pagelayout_bg pt12_r">                                            </a>                    <em class="img_page_right">27</em>                </li>                <li index="16" class="">                    <a template_name="T12" page_side="left" num="28" href="javascript:;" id="page_28" class="pagelayout_bg pt12_l">                                            </a>                    <em class="img_page">28</em>                    <a template_name="T5" page_side="right" num="29" href="javascript:;" id="page_29" class="pagelayout_bg pt5_r">                                            </a>                    <em class="img_page_right">29</em>                </li>                <li index="17" class="">                    <a template_name="T8" page_side="left" num="30" href="javascript:;" id="page_30" class="pagelayout_bg pt8_l">                                            </a>                    <em class="img_page">30</em>                    <a template_name="T8" page_side="right" num="31" href="javascript:;" id="page_31" class="pagelayout_bg pt8_r">                                            </a>                    <em class="img_page_right">31</em>                </li>                <li index="18" class="">                    <a template_name="T2" page_side="left" num="32" href="javascript:;" id="page_32" class="pagelayout_bg pt2_l">                                            </a>                    <em class="img_page">32</em>                    <a data-side="right" num="last" href="javascript:;" id="page_blank" class="pagelayout_bg blank">                    </a>                    <em class="img_page_right"></em>                </li>                <li index="19">                    <a template_name="COPYRIGHT" page_side="left" num="copyright" href="javascript:;" id="page_copyright" class="pagelayout_bg pcopyright">                                            </a>                    <em class="img_page">版权</em>                    <a data-side="right" num="last_bottom" href="javascript:;" id="page_blank" class="pagelayout_bg blank">                    </a>                    <em class="img_page_right">封底</em>                </li></ul>
                    </div>
                    <a id="mod_preview_thumnail_btn_next" class="arrow_retangle_rt btn_arrow btn lf"></a>
                </div>
            </div>
            <!-- end -->
        </div>
        <div id="bot"></div>
        
        <!--缩略图预览-->
        <div id="thumbnail_big" class="thumbnail_big" style="left: 506.5px; top: 222.467px; display: none;">
            <div class="thumbnail_big_bd">
                <a class="close" href="#" onclick="closeBigImage();"></a>
                <img>
                <div class="block"></div>
                <div class="info">ddd.jpg 1800*900px</div>
            </div>
        </div>
        
        <!--文本编辑-->
        <div id="text_editor" class="text_editor" style="display: none;">
            <h2>您最多可以输入<span id="text_count">30</span>个字符</h2>
            <ul>
                <li>
                    <button id="text_align_left_btn">左对齐</button></li>
                <li>
                    <button id="text_align_center_btn">居中</button></li>
                <li>
                    <button id="text_align_right_btn">右对齐</button></li>
            </ul>
            <textarea id="text_area" rows="1" cols="1"></textarea>
            <ul>
                <li>
                    <button class="confirm">确定</button></li>
                <li>
                    <button class="cancel">取消</button></li>
            </ul>
        </div>
    </div>
    <!-- =========================上传图片对话框================================= -->
    <div id="uploader_dialog" class="uploader_dialog ui-draggable" style="position: absolute; top: 36px; display: none;">
		<div class="uploader_dialog_title">
			<a id="uploader_close" class="uploader_close" href="javascript:;"></a>
			<h2 style="width: 800px;">1.您正在制作的是照片书产品，最多可上传500张相片。2.单次最多可选择80张相片。
				3.<font color="red">上传完成请点击保存，然后刷新页面</font></h2>
		</div>
		<div class="uploader_dialog_content" style="position: relative; height: 528px;">
			<p style="position: absolute; left: 217px; top: 20px; font-size: 12px;">
				如果您普通上传看不到东西,可能是由于Flash插件太旧或者没安装导致,请点击<a style="color: blue;" href="http://www.adobe.com/go/getflash" targer="_blank">这里</a>安装或升级，安装完成后重新打开本页面即可。
			</p>
			<div class="upload_type_list">
				<div class="nav on" ref="#upload_flash" title="flash 上传">普通上传</div>
			</div>
			<div class="upload_item_list">
				<div class="upload_item_show" id="upload_flash">
					<div class="zip_uploader">
						<object id="zip_uploader" width="900" align="middle" height="536" style="visibility: visible;" data="<%=path%>/styles/flash/swf/uploader_file.swf?ver=20130524" name="zip_uploader" id="zip_uploader" type="application/x-shockwave-flash">
							<param value="high" name="quality">
							<param value="#ffffff" name="bgcolor">
							<param value="true" name="allowfullscreen">
							<param value="always" name="allowScriptAccess">
							<param value="transparent" name="wmode">
							<param value="true" name="hasPriority">
							<param value="uploadUrl=<%=path%>/user/${sessionUserName.id}/uploadFile.html" name="flashvars">
						</object>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- =========================模板上缩略图================================= -->
	<div style="position: absolute; z-index: 9999; left: 194.5px; top: 711px; display: none;" class="pop_layout" id="pop_layout">
    <div class="pop-inner">
        <span class="pop-arrow-down" id="layout_arrow_out"></span><span class="pop-arrow-down-in" id="layout_arrow_in"></span><a class="close j-close" href="javascript:void(0);"><i class="icon i-pop-close"></i></a>
        <div class="pop-bd">
            <div style="background-color: #fff;" id="pop_layout_bd">
                <ul style="" class="blk layout_list bg_cont pagelayout_mpadbook">
                <c:forEach var="item" items="${templates}">
                	<li class="${item.li_Class}">
                        <a type="COVER" name="${item.name}" href="#" class="${item.a_Class}"></a>
                    </li>
                </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>