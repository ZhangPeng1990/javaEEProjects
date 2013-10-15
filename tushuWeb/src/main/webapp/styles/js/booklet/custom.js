window.onbeforeunload=function(){
  return '如果现在关闭窗口，请确定该涂书已经保存。';
};

$(function () {
    //$("#mybook").booklet();
    $("#mybook").booklet({
    	 //name: '${product.name}', // name of the booklet to display in the document title bar
    	 width:  '70%',
    	 height: 500,
    	 closed: true,//true设置书是合着的状态
    	 covers: true,//设置封面
    	 arrows: true,//设置左右翻页的箭头
    	 arrowsHide: true //true时鼠标移上去显示左右翻页的箭头，移开则隐藏，false时左右翻页的箭头总是显示
    	 //cursor: 'crosshair' //自定义光标样式
    });
    
    
    $('div[id^="canMoveDiv"]').each(function(key,value){
    	$.Move($(this));
    });
    
    
});

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


function showTextAdd(btnId, textId){
	var text = document.getElementById(textId);
	var $text = $(text); //jQuery对象
	$text.css("display","block");
}

function hideTextAdd(textId, pId){
	var textArea = document.getElementById(textId);
	var p = document.getElementById(pId);
	var $textArea = $(textArea);
	var $p = $(p);
	
	$p.html($textArea.val());
	$textArea.css("display","none");
}

function showImageAdd(btnId, imageId){
	var imageSelect = document.getElementById(imageId);
	var $imageSelect = $(imageSelect);
	$imageSelect.css("display","block");
}

function showImage(imageId, url){
	var showImage = document.getElementById(imageId);
	var $showImage = $(showImage);
	$showImage.attr("src", url);
}

function makeSure(addTextId, addPicId, makeSureId, imageSelectId, textAreaId, moveDivId){
	var addText = document.getElementById(addTextId);
	var addPic = document.getElementById(addPicId);
	var makeSure = document.getElementById(makeSureId);
	var imageSelect = document.getElementById(imageSelectId);
	var textArea = document.getElementById(textAreaId);
//	var moveDiv = document.getElementById(moveDivId);
		
	var $addText = $(addText);$addText.css("display","none");
	var $addPic = $(addPic);$addPic.css("display","none");
	var $makeSure = $(makeSure);$makeSure.css("display","none");
	var $imageSelect = $(imageSelect);$imageSelect.css("display","none");
	var $textArea = $(textArea);$textArea.css("display","none");
	
//	var $moveDiv = $(moveDiv);
//	$moveDiv.unbind("mousedown");
}

//随意拖拽dom元素插件
(function($){
    //拖拽插件,参数:id或object
    $.Move = function(_this){
        if(typeof(_this)=='object'){
           // _this=_this;
        }else{
            _this=$("#"+_this);
        }
        if(!_this){return false;}

        _this.css({'position':'absolute'}).hover(function(){$(this).css("cursor","move");},function(){$(this).css("cursor","default");});
        _this.mousedown(function(e){//e鼠标事件

            var offset = $(this).offset();
            var x = e.pageX - offset.left;
            var y = e.pageY - offset.top;
            _this.css({'opacity':'0.3'});
            $(document).bind("mousemove",function(ev){//绑定鼠标的移动事件，因为光标在DIV元素外面也要有效果，所以要用doucment的事件，而不用DIV元素的事件
                _this.bind('selectstart',function(){return false;});
                var _x = ev.pageX - x;//获得X轴方向移动的值
                var _y = ev.pageY - y;//获得Y轴方向移动的值
                _this.css({'left':_x+"px",'top':_y+"px"});
            });
        });

        $(document).mouseup(function(){
            $(this).unbind("mousemove");
            _this.css({'opacity':''});
        });
    };
})(jQuery);