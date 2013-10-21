var over_del = false;
$(function() {

	// 计算价格

	// compute_carts();
	cart_caculate_price();

	// 触发全选事件
	$(".keys_all").bind('click', function(e) {
		var select = true;
		if ($(this).attr('checked') == 'checked') {
			select = true;
		} else {
			select = false;
		}
		$('.keys').each(function() {
			$(this).attr('checked', select);
		});
		$(".keys_all").attr('checked', select);
		// compute_carts();
		cart_caculate_price();
	});

	// 计算下单的书的总价格
	function compute_carts() {
		var money = 0;
		$('.keys').each(function() {
			if ($(this).attr('checked') == 'checked') {
				var id = $(this).val();
				var price = $("#price_real_" + id).text();
				if (price == 'undefined') {
					price = 0;
				}
				money += parseFloat(price);
			}
		});
		money = parseFloat(money.toFixed(2));
		$("#price_all_cart").html(money.toLocaleString());
	}

	// 触发选择事件
	$(".keys").bind('click', function(e) {
		var select = true;
		$('.keys').each(function() {
			if ($(this).attr('checked') != 'checked') {
				select = false;
			}
		});
		$(".keys_all").attr("checked", select);
		// compute_carts();
		cart_caculate_price();
	});

	// 从购物车下订单
	$(".js_goto_pay")
			.bind(
					'click',
					function() {
						var id = new Array();
						var i = 0;
						$('.keys').each(function() {
							if ($(this).attr('checked') == 'checked') {
								id[i] = $(this).val();
								i++;
							}
						});
						if (id.length > 0) {
							// 去检查商品价格是否有变动
							$.ajax({type : "GET",url : "/flow/ch_price",data : {'id' : id.join(',')},dataType : "json",success : function(msg) {
											if (msg.status == '200') {
												if (msg.msg != '') {
													adialog('消息确认',msg.msg,2,function() {window.location.href = '/order.html?id='+ id.join(',');},function() {window.location.reload();});
												} else {
													window.location.href = '/order.html?id='+ id.join(',');
												}
											}
										}
									});
						} else {
							adialog('提示信息', "请至少选中一件商品！", 1);
						}
					});
	// 取消使用优惠券

	$("#cancle_promo").hover(function() {
		over_del = true;
	}, function() {
		over_del = false;
	});
	$("#cancle_promo").bind("click", function() {
		// 重新计算价格
		$(this).hide();
		$("#money_code").val('');
		caculate_price();
		// 清空优惠券输入框
		// 清除优惠券单选框选中
		$("#promotable tr").find("input[type='radio']").each(function(i, v) {
			v.checked = false;
		});

	});

	$("#promotable tr").find("input[type='radio']").each(function(i, v) {
		$(v).bind('click', function() {
			var code = this.value;
			$("#money_code").val(code);
			$("#cancle_promo").show();
			ck_code();

		});

	});

	/*$("#money_code").keyup(function() {
		var v = $(this).val();
		if (v == "" || v == null) {
			$("#cancle_promo").hide();
		} else {
			$("#cancle_promo").show();
		}
	});*/
	
	/*---------------------------------------代金券相关js------------------------*/
	/*$("#money_code2").keyup(function() {
		var v = $(this).val();
		if (v == "" || v == null) {
			$("#cancle_promo2").hide();
		} else {
			$("#cancle_promo2").show();
		}
	});*/
	$("#cancle_promo2").bind("click", function() {
		// 重新计算价格
		$(this).hide();
		$("#money_code2").val('');
		$("#vstr").val('');
		ck_code();
		//caculate_price();
	});
	/*---------------------------------------代金券相关js------------------------*/
});

// 修改价格显示
function price_change() {
	var p = 0;
	$(".price_real").each(function() {
		p += parseFloat($(this).html());
	});
	p = parseFloat(p.toFixed(2));
	$("#price_all_cart").html(p.toLocaleString());
}

// 数目变化
var setCount = {
	min : 1,
	max : 999,
	reg : function(x) {
		return new RegExp("^[1-9]\\d*$").test(x);
	},
	amount : function(obj, mode) {
		var x = $(obj).val();
		if (this.reg(x)) {
			if (mode) {
				x++;
			} else {
				x--;
			}
		} else {
			adialog('提示信息', "请输入正确的数量！", 1);

			$(obj).val(1);
			$(obj).focus();
		}
		return x;
	},
	reduce : function(id) {
		var obj = $('#count' + id);
		var x = this.amount(obj, false);
		if (x >= this.min) {
			this.update(id, x);
		} else {
			adialog('提示信息', "数量最少为" + this.min, 1);

			$(obj).val(1);
			$(obj).focus();
		}
	},
	add : function(id) {
		var obj = $('#count' + id);
		var x = this.amount(obj, true);
		if (x <= this.max) {
			this.update(id, x);
		} else {
			adialog('提示信息', "数量最多为" + this.max, 1);

			$(obj).val(999);
			$(obj).focus();
		}
	},
	update : function(id, num) {
		$("#keys_" + id).attr("checked", true);
		var old_price = $("#old_" + id).val();
		var rebate_price = $("#real_" + id).val();
		$.ajax({
			type : "GET",
			url : "/flow/update_cart/" + id + "/" + num,
			success : function(data) {
				if (data.error > 0) {
					adialog('提示信息', "数量修改失败，请稍后重试", 1);
					return;
				} else {
					$("#count" + id).val(num);
					$("#price_old_" + id).html((old_price * num).toFixed(2));
					// $("#price_real_"+id).html((rebate_price *
					// num).toFixed(2));
					// price_change();
					cart_caculate_price();
				}
			}
		});
	}
}

// 删除购物车内的涂书
function del_book(id) {
	if (id == null) {
		alert('Error!');
		return false;
	}
	var callback = function() {
		$.ajax({
			type : "GET",
			url : "/flow/drop_book/" + id,
			success : function(data) {
				if (data.error > 0) {
					adialog('提示信息', data.msg, 1);
					return;
				}
				$('#' + id).remove();
				if ($(".goods_num").length < 1) {
					window.location.reload();
				}
				$("#real_" + id).val(0);
				// price_change();
				cart_caculate_price();
			}
		});
	};
	adialog('提示信息', document.getElementById('dialog_5'), 2, callback);
}

// 用户点击批量删除事件
$("#delete_bat").bind('click', function(e) {
	clear_cart();
});

// 批量删除
function clear_cart() {
	var callback = function() {
		var id = new Array();
		var i = 0;
		$('.keys').each(function() {
			if ($(this).attr('checked') == 'checked') {
				id[i] = $(this).val();
				i++;
			}
		});
		if (id.length > 0) {
			var cart_id = id.join(',');
		} else {
			adialog('提示信息', "请至少选中一件商品！", 1);
			return;
		}
		$.ajax({
			type : "GET",
			url : "/flow/clear_cart",
			data : {
				'cart_id' : cart_id
			},
			success : function(data) {
				if (data.error > 0) {
					adialog('提示信息', data.msg, 1);
					return;
				} else {
					window.location.reload();
				}
			}
		})
	};
	adialog('提示信息', document.getElementById('dialog_5'), 2, callback);
}


$("#editAddr").toggle(function(){
	$(".dialogAddr").removeClass("hide");
	$(this).html("[返回]");
},function(){
	closeAddr();
	
});

// 隐藏地址编辑框
$("body").click(function() {
	closeAddr();
});
$('.dialogAddr').click(function() {
	return false;
});

function closeAddr() {
	// 隐藏地址层
	$(".dialogAddr").addClass("hide");
	$("#editAddr").html("[修改]")
	// window.location.reload();

}

// 选择快递的时候触发事件
$(".posts").bind('click',function(e) {
					if (($("#free_post").val() != '0' || $("#order_discount").val() != 0) && $("#pm").val() == '0') {
						caculate_price();
					} else {
						var $e = $(e.target);
						var money = parseInt($e.attr('money'));
						var $price_box = $("#price_all");
						var total = $("#pay_for_price").val();
						var posts = $price_box.attr("posts");
						var discount = $price_box.attr("discount");
						var i = parseInt(total);
						if($("#money_code").val()!=''){
						 i = i - parseInt(discount);
						}
						//var i = parseInt(total) - parseInt(discount);

						var book_nums = $price_box.attr('book_nums');
						// 如果免快递费只对中通有效 id =12
						var posts_id = $('input[name="posts"]:checked').val();
						if (typeof (posts_id) == 'undefined') {
							posts_id = 0;
						}
						posts_id = parseInt(posts_id);

						if (posts == 0 || (posts == 1 && posts_id != 12)) {
							i = parseInt(i) + parseInt(money) * 100;
							$("#compute").html(" + 运费 "+ money+ "元 - 优惠券 "+ parseFloat(discount / 100).toFixed(2) + "元");
						} else {
							$("#compute").html(" + 运费 0元 - 优惠券 "+ parseFloat(discount / 100).toFixed(2) + "元");
						}
						$("#price_all").attr('data-total',i);
						i = parseFloat(i / 100).toFixed(2);
						$price_box.html(i);
						ck_code2();
					}
				});

// 提交信息，回调信息来判断成功（带数据跳转）或者弹窗出错信息
function goto_pay() {
	alert();
	var code = $("#money_code").val();
	var voucher_code = $("#money_code2").val();
	var text = $("#order_text").val();
	var ads_id = $("#consignee_id").val();
	var pay_use = $('input[name="pay_use"]:checked').val();
	var posts = $('input[name="posts"]:checked').val();
	// var pmethod = $("input[name='pmethod']:checked").val();
	var pmethod = $("#pm").val();
	var cart_id = $("#goto_pay").attr('cart_id');
	var isspecial = $("#price_all").attr('isspecial');//added by gzhl at 2013-04-10
	if (ads_id == 0) {
		adialog('提示信息', "您的地址不正确，请确认！", 1);
		return;
	} else if (pay_use == undefined && $("#price_hide").val() != 0) {
		adialog('提示信息', "请选择支付方式！", 1);
		return;
	} else if (posts == undefined || posts * 1 < 1) {
		adialog('提示信息', "请选择配送方式！", 1);
		return;
	} else {
		$.ajax({
					type : "POST",
					url : "/flow/goto_order_done",
					data : {
						code : code,
						voucher_code:voucher_code,
						text : text,
						ads_id : ads_id,
						pay_use : pay_use,
						posts : posts,
						cart_id : cart_id,
						pmethod : pmethod,
						isspecial:isspecial//added by gzhl at 2013-04-10
					},
					dataType : "json",
					success : function(msg) {
						if (msg.error == 200) {
							if(msg.isspecial==1){
								window.location.href = "/flow/order_done_special/"
									+ msg.msg.sn;
								
							//}else if ($("#price_hide").val() == 0 && posts==12) {
							}else if ($("#price_hide").val() == 0) {
								adialog('提示信息', "支付成功！", 1, function() {
									window.location.href = "/my/order.html";
								});
								return;
							} else {
								window.location.href = "/flow/order_done/"
										+ msg.msg.sn;
							}

						} else {
							adialog('提示信息', msg.msg, 1);
							return;
						}

					}
				});
	}

}

// 优惠码的校对
function ck_code() {
	if (over_del == false) {
		var code = $("#money_code").val();
		var cart_id = $("#goto_pay").attr('cart_id');
		var free_post = $("#free_post").val();
		if (code != '') {
			if (($("#order_discount").val() != '0' || free_post == 1)
					&& $("#pm").val() == '0') {

				/*
				 * r=confirm("优惠券和网站的优惠策略不能同时使用，确定要使用优惠券吗？") if (r==true) {
				 * 
				 * go_to_check(cart_id,code); $("#pm").val(1); }else{
				 * $("#pm").val(0); $("#money_code").val(''); caculate_price(); }
				 */
				adialog('确认消息', "优惠券和网站的优惠策略不能同时使用，确定要使用优惠券吗？", 2, function() {
					go_to_check(cart_id, code);
					$("#pm").val(1);
				}, function() {
					$("#pm").val(0);
					$("#money_code").val('');
					caculate_price();
					$("#promotable tr").find("input[type='radio']").each(
							function(i, v) {
								v.checked = false;
							});
					$("#cancle_promo").hide();
				});

			} else {
				go_to_check(cart_id, code);
				$("#pm").val(1);
				$("#order_discount").val(0);
			}
		} else {
			$("#cancle_promo").hide();
			if ($("#order_discount").val() && $("#pm").val()) {
				caculate_price();

			} else {
				$("#pm").val(0);
				var i = parseFloat($("#pay_for_price").val()) / 100;
				i = parseFloat(i).toFixed(2);
				$("#price_all").attr('posts', 0);
				$("#price_all").attr("discount", 0);

				// 已经选择的快递费
				var posts = $('input[name="posts"]:checked').attr("money");
				if (typeof (posts) == 'undefined') {
					posts = 0;
				}
				posts = parseFloat(posts).toFixed(2);
				i = i * 1 + posts * 1;
				i = parseFloat(i).toFixed(2);
				$("#price_hide").val(i);
				$("#price_all").html(i);
				$("#compute").html(" + 运费 " + posts + "元 - 优惠券 0元");
				$("#cancle_promo").show();
				ck_code2();//added by gzhl at 2013-08-30
			}
		}
		
	}
}
function go_to_check(cart_id, code) {
	$.ajax({
		type : "GET",
		url : "/flow/ck_code",
		data : {
			'code' : code,
			'cart_id' : cart_id
		},
		dataType : "json",
		success : function(msg) {
			if (msg.status != 200) {
				adialog('提示信息', msg.msg, 1);
				$("#money_code").val('').focus();
				$("#cancle_promo").hide();

				return;
			}
			var $price_box = $("#price_all");
			var discount = msg.error1;
			$price_box.attr("discount", discount * 100);
			var dtotal = $("#price_all").attr('data-total');//added by gzhl at 2013-08-30
			
			var i = $("#pay_for_price").val() / 100 - msg.error1;
			i = parseFloat(i).toFixed(2);
			var book_nums = $price_box.attr('book_nums');

			// 如果免快递费只对中通有效 id =12
			var posts_id = $('input[name="posts"]:checked').val();
			if (typeof (posts_id) == 'undefined') {
				posts_id = 0;
			}
			posts_id = parseInt(posts_id, 10);
			$price_box.attr('posts', msg.posts);
			$price_box.attr('isspecial', msg.isspecial);//added by gzhl at 2013-04-10
			// if(msg.posts == 0 || (msg.posts == 1 && (parseInt(book_nums , 10)
			// > 1 || posts_id != 12))){
			if (msg.posts == 0 || (msg.posts == 1 && posts_id != 12)) {
				// 如果优惠码免快递费并且书大于1本的时候也加快递费
				// 不是平邮加快递费
				var posts = $('input[name="posts"]:checked').attr("money");
				if (typeof (posts) == 'undefined') {
					posts = 0;
				}
				posts = parseFloat(posts).toFixed(2);
				i = i * 1 + posts * 1;
				// 计算过程
				$("#compute").html(
						" + 运费 " + posts + "元 - 优惠券 " + discount + "元");
			} else {
				// 计算过程
				$("#compute").html(" + 运费 0元 - 优惠券 " + discount + "元");
			}

			i = parseFloat(i).toFixed(2);
			if (msg.error1 != 0) {
				// 记录优惠码
				if (i <= 0) {
					i = 0;
					$("#price_hide").val(0);
					$price_box.html('0');
				}
			}
			$price_box.html(i);
			$("#price_all").attr('data-total',parseInt(i*100));//added by gzhl at 2013-08-30
			$("#promo_container").append(
					"<div data-discount='"
							+ (discount > 0 ? discount * 100 : 0)
							+ "' data-posts='" + (posts > 0 ? posts * 100 : 0)
							+ "' onclick='cancle_done(this)'>" + code
							+ "</div>");// 记录优惠码历史，方便使用多个时单个取消使用added by gzhl at
			// 2012-11-28
			$("#cancle_promo").show();
			// $("#money_code").val('');
			ck_code2();//added by gzhl at 2013-09-01
			
		}
	});

}

// 收货地址的修改和保存
function save_consignee(type) {
	var consignee_id = (type == 1) ? $('#consignee_id').val() : 0;
	var uname = $('#uname').val();
	var province_id = $('.province_id').val();
	var city_id = $('.city_id').val();
	var county_id = $('.county_id').val();
	var address = $('#address').val();
	var mobiel = $('#mobiel').val();
	var tel = $('#tel').val();
	var email = $('#email').val();
	var code = $('#code').val();

	// 保存收货人信息
	if (uname == '' || province_id == 0 || city_id == 0 || county_id == 0
			|| address == '' || (mobiel == '' && tel == '')) {
		adialog('提示信息', "请完整填写收货地址信息", 1);
		return;
	}

	var no = $('.tr_ads').length;
	if (no > 4) {
		adialog('提示信息', "您的常用地址过多，请删除一条再添加", 1);
		return;
	}
	var args = 'consignee_id=' + consignee_id + '&name=' + uname
			+ '&province_id=' + province_id + '&city_id=' + city_id
			+ '&county_id=' + county_id + '&address=' + address + '&mobiel='
			+ mobiel + '&tel=' + tel + '&email=' + email + '&code=' + code;

	$.ajax({
		type : "POST",
		url : "/flow/edit_consignee/" + consignee_id,
		data : args,
		dataType : 'json',
		success : function(msg) {
			if (msg.error > 0) {
				adialog('提示信息', msg.msg, 1);
				return;
			} else {
				window.location.reload();
			}
		}
	});
}

function cancle_done(obj) {
	var discount = $(obj).attr('data-discount');// 获取当前优惠码优惠钱数
	var posts = $(obj).attr('data-posts');// 获取当前优惠码优惠是否是免运费
	var totalcontain = $("#price_all");
	var total_discount = totalcontain.attr('discount');
	// 调整价格
	totalcontain
			.attr('discount', parseInt(total_discount) - parseInt(discount));
	totalcontain.html(parseFloat(
			(parseFloat(totalcontain.html()) * 100 + parseInt(discount)) / 100)
			.toFixed(2));
	// 如果是免运费，重新加运费
	// totalcontain.html(parseFloat(totalcontain.html()).toFixed(2)+parseFloat(discount).toFixed(2));
	// 删除当前项
	$(obj).remove();
}

function caculate_price() {
	var cart_id = $("#goto_pay").attr('cart_id');
	if (cart_id !== '') {
		$
				.ajax({
					type : "GET",
					url : "/flow/calculate_price",
					data : {
						cart_id : cart_id
					},
					dataType : "json",
					success : function(msg) {

						var posts_id = $('input[name="posts"]:checked').val();
						if (typeof (posts_id) == 'undefined') {
							posts_id = 0;
						}
						posts_id = parseInt(posts_id, 10);
						// 获取当前选择的物流费用
						var posts = $('input[name="posts"]:checked').attr(
								"money");
						if (typeof (posts) == 'undefined') {
							posts = 0;
						}
						var total = msg.total;
						if (msg.status == 1) {
							// 获取当前选择的物流id

							// posts = parseFloat(posts).toFixed(2);

							if (posts_id == '12' && msg.free_logistics == 1) {
								// 如果是中通，并且优惠策略中有包邮
								$("#compute").html(" + 运费 0元 - 优惠"+ parseFloat(parseInt(msg.order_discount) / 100).toFixed(2)+ "元");
								$("#free_post").val(msg.free_logistics);

							} else {
								// 计算过程
								if (msg.order_discount > 0) {
									$("#compute").html(" + 运费 "+ posts+ "元 -  优惠"+ parseFloat(msg.order_discount / 100).toFixed(2)+ "元");
								} else {
									$("#compute").html(" + 运费 " + posts + "元");
								}
								total = parseInt(total) + parseInt(posts) * 100;
							}

							
							// 写优惠策略优惠总额
							$("#order_discount").val(msg.order_discount);

						} else {
							$("#compute").html(" + 运费 " + posts + "元");
							total = parseInt(total) + parseInt(posts) * 100;
						}
						$("#price_all").attr('data-total',total);//added by gzhl at 2013-08-30
					$("#price_all").html(parseFloat(total / 100).toFixed(2));


					},
					error : function() {
					}
				});
		ck_code2();//added by gzhl at 2013-08-30
		$("#pm").val(0);
	}

}

function cart_caculate_price() {
	// 获取选中id
	var cart_id = '';
	$("input[id^='keys_']:checked").each(function(i, v) {
		cart_id += cart_id == '' ? $(v).val() : ',' + $(v).val();
	});
	if (cart_id !== '') {
		$.ajax({
					type : "GET",
					url : "/flow/calculate_price",
					data : {
						cart_id : cart_id
					},
					dataType : "json",
					success : function(msg) {
						var bookinfos = msg.book_discounts;
						for ( var i in bookinfos) {
							// alert(i);
							var v = bookinfos[i];
							$("#td_" + v.cart_id).html('');
							if (v.mapdiscount0 != '') {
								$("#tds_" + v.cart_id).html(v.mapdiscount0);
							} else {
								$("#tds_" + v.cart_id).html('暂无优惠');
							}
							/*
							 * if(v.mapdiscount1!=''){
							 * $("#pmethod34").html(v.mapdiscount1); }else{
							 * $("#pmethod34").html(''); }
							 */
							$("#price_real_" + v.cart_id).html(parseFloat((parseInt(v.btotal_price) - parseInt(v.free_discount)) / 100).toFixed(2));
							if (msg.status == 1 && v.free_discount != 0) {
								$("#td_" + v.cart_id).html('<img src="/images/jm.gif" alt="'+ v.desc+ '" title="'+ v.desc+ '"/>'+ parseFloat(v.free_discount / 100).toFixed(2) + "元");

							}
						}
						;
						if (msg.order_discount_desc != '') {
							$("#show_pm34").removeClass('hide');
							$("#show_pm34").show();
							$("#pmethod34").html(msg.order_discount_desc);
						} else {
							$("#show_pm34").addClass('hide');
							$("#show_pm34").hide();
							$("#pmethod34").html('');
						}

						$("#price_all_cart").html(parseFloat(msg.total / 100).toFixed(2));

					},
					error : function() {
					}
				});
	} else {
		$("#price_all_cart").html(parseFloat(0).toFixed(2));
	}
	

}
/*
 * 验证代价券
 */
function ck_code2(){
	var code = $("#money_code2").val();
	if(code!==''){
		code = code.replace(/-/g,'');
		var voucherstr = $("#vstr").val();
		var varr = [];
		var inset = 0;
		if(voucherstr!=''){
			varr = voucherstr.split(',');
			for(var i=0;i<varr.length;i++){
				if(code==varr[i]){
					inset = 1;
					break;
				}
			}
			
		}
		if(inset==0){
		$.ajax({
			type : "GET",
			url : "/flow/ck_code2",
			data : {
				'code' : code
			},
			dataType : "json",
			success : function(msg) {
				//alert($("voucher").html());
				if (msg.status != 200) {
					if(msg.msg!=''){
					adialog('提示信息', msg.msg, 1);
					}
					$("#money_code2").val('').focus();
					$("#cancle_promo2").hide();
					ck_code();
					return;
				}else{
					var cprice = msg.data.promo_price*100;
					var dtotal = $("#price_all").attr('data-total');
					if(cprice>dtotal){
						$("#price_all").html('0.0');
						 var voucher = parseFloat(dtotal/100).toFixed(2);
						 /*if($("#voucher").length){
							 $("#voucher").html(parseFloat((parseInt($("#voucher").html()*100)+dtotal)/100).toFixed(2));
						 }else{*/
							 var vstr = $("#compute").html()+'- 代金券抵消 <span id="voucher">'+voucher+'</span>元';
							 $("#compute").html(vstr);
						 //}
						$("#price_hide").val("0");
					}else{
						
						var rp = parseFloat((dtotal-cprice)/100).toFixed(2);
						$("#price_hide").val(rp);
						$("#price_all").html(rp);
						var voucher = parseFloat(cprice/100).toFixed(2);
						 /*if($("#voucher").length){
							 $("#voucher").html(parseFloat((parseInt($("#voucher").html()*100)+cprice)/100).toFixed(2));
						 }else{*/
							 var vstr = $("#compute").html()+'- 代金券抵消 <span id="voucher">'+voucher+'</span>元';
							 $("#compute").html(vstr);
						 //}
					}
					//voucherstr = voucherstr==''?code:voucherstr+','+code;
					$("#vstr").val(code);
					$("#cancle_promo2").show();
				}
			}
		});
		
		}
	}
	else{
		$("#cancle_promo2").hide();
	}
}
