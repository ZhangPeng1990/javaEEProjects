window.onbeforeunload=function(){
  return '如果现在关闭窗口，请确定该涂书已经保存。';
};


//添加到购物车 操作
function addToShoppingCart(workId){
	$.ajax({
        type:"post",
        url:"addShoppingCart.html",
        data: {"workId":workId,
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


