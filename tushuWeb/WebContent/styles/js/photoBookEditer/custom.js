window.onbeforeunload=function(){
  return '如果现在关闭窗口，请确定该涂书已经保存。';
};

//添加到购物车 操作
function addToShoppingCart(productId){
	$.ajax({
        type:"post",
        url:"addShoppingCart.html",
        data: {"productId":productId,
        	   "type":"SHOPPING_CART"},
        success:function(newSize){
            $("#shopping_cart").html(newSize);
            alert("已成功加入到购物车");
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
				$(this).next().css("display","block");
				$(this).next().css("left",e.pageX).css("top",e.pageY);
			});
			
			$(this).mouseup(function(e){
				$(this).unbind("mousemove");
				$(this).next().css("display","none");
			});
		});
	});
});

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

//加载模板
function leftLoadXML(name){
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
        	$('div[class|="pagelayout_left_side_warp"]').html(xml);
        }
    });
}

function rightLoadXML(name){
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
        	$('div[class|="pagelayout_right_side_warp"]').html(xml);
        }
    });
}
