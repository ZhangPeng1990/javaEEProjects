String.prototype.replaceAll=function(os, ns){
	return this.replace(new RegExp(os,"gm"),ns);
};

var smallPic = '<img src="#smallUrl#" bigPath="#bigUrl#" style="position: absolute;">';

var showPic = '<img class="ui-draggable" src="#bigUrl#" height="#height#" width="#width#">';

//添加到购物车 操作
function addToShoppingCart(workId){
	var path = $("#addOrderRequestPath").val();
	$.ajax({
        type:"post",
        url:path,
        data: {"workId":workId,
        	   "type":"SHOPPING_CART"},
        success:function(newSize){
            $("#shopping_cart").html(newSize);
            $("#shopping_cart").css("display","inline-block");
            $("#page_mask_layer").css("display","block");
            $("#action_success").html('添加成功');
            $("#action_success").fadeIn('slow');
            setTimeout(function(){
            	$("#action_success").fadeOut('slow');
            	$("#page_mask_layer").css("display","none");
            },2000);
        },
		error:function(){
			//alert("error");
		}
});
}

$(function(){
	$("#btn_upload").click(function(){
		showUploader_dialog();
	});
	
	$("#uploader_close").click(function(){
		hideUploader_dialog();
	});
	
	$('div[class|="pop-inner"] ul[class|="blk layout_list bg_cont pagelayout_mpadbook"] li').each(function(key,value){
		$(this).click(function(){
			$(this).children("a").addClass("hl_border");
			$(this).siblings().children("a").removeClass("hl_border");
		});
	});
	
	$('img[class|="j_thumbnail ui-draggable"]').each(function(key,value){
		
		$(this).mousedown(function(e){
			$(this).mousemove(function(e){
				//每个缩略图生成一个对应的隐藏图片
				var newHtml = smallPic.replaceAll("#smallUrl#", $(this).attr('src')).replaceAll("#bigUrl#",$(this).attr('bigImageUrl'));
				$("#hideSamllPics").html(newHtml);
				$("#hideSamllPics").css("display","block");
				$("#hideSamllPics").css("left",e.pageX).css("top",e.pageY);
				$("#hideSamllPics").mousemove(function(e){
					$("#hideSamllPics").mousemove(function(e){
						$("#hideSamllPics").css("left",e.pageX).css("top",e.pageY);
					});
				});
			});
			
			$(this).mouseup(function(e){
				$("#hideSamllPics").unbind("mousemove");
				$("#hideSamllPics").css("display","none");
			});
		});
		
	});
	
	var savePageXmlDiv ='<div id="#hideId#" style="display: none;">\
		<div pageclass="pagelayout_left_side_warp"></div>\
		<div pageclass="pagelayout_right_side_warp"></div>\
	 </div>';
	
	var bookEditType = $("#bookEditType").val();
	//BigPage
	$('ul[id|="mod_preview_thumnail_list"] li').each(function(key,value){
		
		//在新建作品时生成储存页面信息的div，如果是编辑则跳过这步
		if(bookEditType == 'ADD_New'){
			var newHtml = $("#store_page_message").html() + savePageXmlDiv.replaceAll("#hideId#",$(this).attr('hideid'));
			$("#store_page_message").html(newHtml);
		}
		
		$(this).click(function(){
			$(this).addClass("active").siblings().removeClass("active");
			
			var hideId = $(".pagelayout_left_side_warp").attr("showid");
			$(".pagelayout_left_side_warp").attr("showid",$(this).attr("hideid"));
			$(".pagelayout_right_side_warp").attr("showid",$(this).attr("hideid"));
			var tempDiv = document.getElementById(hideId);
			var $div = $(tempDiv);
			var leftDiv = $div.children('[pageclass=pagelayout_left_side_warp]');
			var rightDiv = $div.children('[pageclass=pagelayout_right_side_warp]');
			
			var leftMess = $(".pagelayout_left_side_warp").html();
			var rightMess = $(".pagelayout_right_side_warp").html();
			$(".pagelayout_left_side_warp").html("");
			$(".pagelayout_right_side_warp").html("");
			
			leftDiv.html(leftMess);
			rightDiv.html(rightMess);
			
			var nowHideId = $(this).attr("hideid");
			var nowTempDiv = document.getElementById(nowHideId);
			var $nowDiv = $(nowTempDiv);
			var nowLeftDiv = $nowDiv.children('[pageclass=pagelayout_left_side_warp]');
			var nowRightDiv = $nowDiv.children('[pageclass=pagelayout_right_side_warp]');
			$(".pagelayout_left_side_warp").html(nowLeftDiv.html());
			$(".pagelayout_right_side_warp").html(nowRightDiv.html());
			
		});
	});
});

//保存作品到数据库 saveToDB-->start
function saveToDB(){
	
	$("#page_mask_layer").css("display","block");
	var requestPath = $("#requestSavePath").val();
	var productId = $("#productId").val();
	var contentHtml = $("#store_page_message").html();
	var type = $("#bookEditType").val();
	var workId = $("#workId").val();
	
	$.ajax({
        type:"post",
        url:requestPath,
        data: {"productId":productId,
        	   "htmlContent":contentHtml,
        	   "type":type,
        	   "workId":workId},
        success:function(newSize){
        	$("#action_success").html('保存成功');
            $("#action_success").fadeIn('slow');
            $("#action_success").fadeOut('slow');
            setTimeout(function(){
            	var requestPath = $("#saveSuccessRequestPath").val();
                location.href = requestPath;
            },2000);
        },
		error:function(){
			$("#action_success").html('出错了');
            $("#action_success").fadeIn('slow');
            $("#action_success").fadeOut(5000);
            $("#page_mask_layer").css("display","none");
		}
});
}
//保存作品到数据库 saveToDB-->end

//控制上传对话框
function showUploader_dialog(){//显示
	$("#uploader_dialog").css("display","block");
	
	$("#uploader_dialog").mousedown(function(e){
		var offsetX = 0;//按下鼠标时，鼠标的X坐标
		var offsetY = 0;//按下鼠标时，鼠标的Y坐标
		var moveX = 0;//鼠标X坐标上移动的距离
		var moveY = 0;//鼠标Y坐标上移动的距离
		
		var divCurrentX = 0;//要进行拖拽的dom元素的原X坐标
		var divCurrentY = 0;//要进行拖拽的dom元素的原Y坐标
		var moveDiv = $("#uploader_dialog");//要进行拖拽的dom元素
		divCurrentX = Number(moveDiv.css("left").replace("px",""));
		divCurrentY = Number(moveDiv.css("top").replace("px",""));
		
		var divNewX = 0;//要进行拖拽的dom元素拖拽后的X坐标
		var divNewY = 0;//要进行拖拽的dom元素拖拽后的Y坐标
		
		offsetX = e.pageX;
		offsetY = e.pageY;
		
		$("#uploader_dialog").mousemove(function(e){
			moveX = e.pageX - offsetX;
			moveY = e.pageY - offsetY;
			
			divNewX = divCurrentX + moveX;
			divNewY = divCurrentY + moveY;
			moveDiv.css("left",divNewX).css("top",divNewY);
		});
		
		$("#uploader_dialog").mouseup(function(e){
			moveDiv.unbind("mousemove");
		});
	});
}

function hideUploader_dialog(){//隐藏
	$("#uploader_dialog").css("display","none");
}
//控制上传对话框

//点击缩略图显示大图
function showBigImage(path){
	$("#thumbnail_big").css("display","block");
	$('div[id|="thumbnail_big"] div[class|="thumbnail_big_bd"] img').attr("src",path);
}
//关闭大图预览
function closeBigImage(){
	$("#thumbnail_big").css("display","none");
}
//控制模板缩略图
function controllPagelayout(){
	var status = $("#pop_layout").css('display');
	
	if(status == "" || status == "none"){
		$("#pop_layout").css("display","block");
    }else if(status == "block"){
    	$("#pop_layout").css("display","none");
    }
}

//判断用户是否已经选择了要进行排版的页面
function canSelectTemplate(){
	var canSelect = false;
	$('ul[id|="mod_preview_thumnail_list"] li').each(function(key,value){
		if($(this).hasClass("active")){
			canSelect = true;
			return canSelect;
		}
	});
	return canSelect;		
}

//加载模板
function loadXML(name,type){
	
	//在加载模板之前判断用户是否已经选择了要进行排版的页面
	if(!canSelectTemplate()){
		alert("请先在页面下方选择要进行编辑的页面");
		return;
	}
	
	var url = '../../jsp/templateXmls/' + name + '.xml';
	$.ajax({  
        url: url,
        type: 'GET',  
        dataType: 'html',  
        timeout: 1000,  //设定超时  
        cache: false,   //禁用缓存  
        error: function(xml) {  
            alert("加载XML文档出错!");  
        },  
        success: function(xml) {
        	//判断页面选择的是左边还是右边
        	var $getDiv = $("#edit_area_warp");
        	if($getDiv.hasClass("edit_area_warp_left")){
        		if(type == 'WIDE'){
        			$('div[class|="pagelayout_right_side_warp"]').html("");
        		}
        		$('div[class|="pagelayout_left_side_warp"]').html(xml);
        	}
        	
        	if($getDiv.hasClass("edit_area_warp_right")){
        		if(type == 'WIDE'){
        			alert("右边页面不支持跨页版式哦,请选择左边页面");
        			return;
        		}
        		$('div[class|="pagelayout_right_side_warp"]').html(xml);
        	}
        	
        }
    });
}

function drag_here_Click(domDiv){
	var $div = $(domDiv);//被点击的 拖动图片到此 的div
	var status = $("#hideSamllPics").css('display');
	if(status == 'block'){
		var height = $div.parent().css("height");
		var width = $div.parent().css("width");
		var newHtml = showPic.replaceAll("#bigUrl#",$('div[id|="hideSamllPics"] img').attr("bigPath"))
				.replaceAll("#height#",height).replaceAll("#width#",width);
		$div.parent().html(newHtml);
		$div.next().css("display","none");
		$div.css("display","none");
		$("#hideSamllPics").css("display","none");
	}
}

//左右页切换，点击左边页则底部工具栏转到左边，点击右边则转到右边-->start
function skipToLeft(){
	var $getDiv = $("#edit_area_warp");
	if($getDiv.hasClass("edit_area_warp_right")){
		$getDiv.removeClass("edit_area_warp_right").addClass("edit_area_warp_left");
	}
}

function skipToRight(){
	var $getDiv = $("#edit_area_warp");
	if($getDiv.hasClass("edit_area_warp_left")){
		$getDiv.removeClass("edit_area_warp_left").addClass("edit_area_warp_right");
	}
}
//左右页切换，点击左边页则底部工具栏转到左边，点击右边则转到右边-->end

//控制文字输入框-->start
function showTextInput(textInput){
	var $textDiv = $(textInput);
	var top = $textDiv.offset().top;
	var left = $textDiv.offset().left;
	$("#pop_texteditor").css("left",left);
	$("#pop_texteditor").css("top",top);
	$("#page_mask_layer").css("display","block");
	$("#pop_texteditor").css("display","block");
	
	$("#makesure_text_input").one("click",function(){
		var inputText = $("#text_imput").val();
		$textDiv.html(inputText);
		$("#text_imput").val('');
		var postion = $("#text_imput").css("text-align");
		$textDiv.attr("align",postion);
		$("#page_mask_layer").css("display","none");
		$("#pop_texteditor").css("display","none");
	});
}

function cancel_text_input(){
	$("#page_mask_layer").css("display","none");
	$("#pop_texteditor").css("display","none");
	$("#text_imput").val('');
}

function changeTextInputPostion(postion){
	$("#text_imput").css("text-align",postion);
}

//控制文字输入框-->end