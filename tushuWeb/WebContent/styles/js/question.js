jQuery.fn.textlimit=function(counter_el, thelimit, speed) {
	var charDelSpeed = speed || 15;
	var toggleCharDel = speed != -1;
	var toggleTrim = true;
	
	var that = this[0];
	updateCounter();
	
	function updateCounter(){
		jQuery(counter_el).text(thelimit - that.value.length);
	};
	
	this.keypress (function(e){ if( this.value.length >= thelimit && e.charCode != '0' ) e.preventDefault() })
	.keyup (function(e){
		updateCounter();
		if( this.value.length >= thelimit && toggleTrim ){
			if(toggleCharDel){
				that.value = that.value.substr(0,thelimit+100);
				var init = setInterval
					( 
						function(){ 
							if( that.value.length <= thelimit){ init = clearInterval(init); updateCounter() }
							else{ that.value = that.value.substring(0,that.value.length-1); jQuery(counter_el).text('trimming...  '+(thelimit - that.value.length)); };
						} ,charDelSpeed 
					);
			}
			else this.value = that.value.substr(0,thelimit);
		}
	});
};

/**
 * 反馈内容，字数
 * @author: 刘海鹏（修改） <liuhaipeng@printall.cn>
 * @create: 2012-03-29 10:10
 */
$(document).ready(function(){
	$('.textarea').textlimit('b#counter', 400, 10);
});

/**
 * 意见反馈，验证
 * @author: 刘海鹏（修改） <liuhaipeng@printall.cn>
 * @create: 2012-03-29 10:10
 */
function checkall() {
	if($("input:[name=question]:radio:checked").length == 0) {
		$("#back").html('请选择反馈类型');
		return false;
	}

	if($("input:[name=fuwu]:radio:checked").length == 0) {
		$("#for").html('请选择服务信息');
		return false;
	}

	String.prototype.trim=function() {
		return this.replace(/(^\s*)|(\s*$)/g, "");
	}

	var a = $("#Contentarea").val();
	if($("#Contentarea").val() == '请输入内容' || a.trim() == '') {
		$("#conten").html('请填写反馈信息');
		return false;
	}

	if($("#searchinput2").val() != '请输入电话' && $("#searchinput2").val().match(/^\d{8,11}$/) == null) {
		$("#ltel").html('电话号码输入有误');
		return false;
	}

	if($("#searchinput3").val() != '请输入QQ' && $("#searchinput3").val().match(/^[1-9][0-9]{4,12}$/) == null) {
		$("#lqq").html('QQ号码输入有误');
		return false;
	}

	if($("#searchinput4").val() != '请输入E-mail' && $("#searchinput4").val().match(/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/) == null) {
		$("#lema").html('E-mail输入有误');
		return false;
	}
	return true;
}