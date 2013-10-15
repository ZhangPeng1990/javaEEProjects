// 删除一条收货人地址
function del_address(id)
{
    if(id == null || id == '')
    {
        adialog('提示信息','参数非法', 1);
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
                    adialog('提示信息', result.msg, 1);
                    return false;
                }
                $('#consignee'+id).remove();
            }
        })
    };

    adialog('提示信息','您确定删除这条收货人信息？',2, callback);
}

// 获取一条收货人地址
function get_address(id)
{
    $.ajax({
        type: "GET",
        url: "/flow/get_consignee/" + id,
        dataType: "json",
        success: function(msg){
            $("#uname").val(msg.data.name);
            $("#address").val(msg.data.address);
            $("#mobiel").val(msg.data.telphone);
            $("#tel").val(msg.data.phone);
            $("#email").val(msg.data.email);
            $("#code").val(msg.data.code);
            $("#provin_"+msg.data.province_id).attr("selected","selected");
            $("#city_id").html("<option id='city_"+msg.data.city_id+"' value='"+msg.data.city_id+"'>"+msg.data.city_name+"</option>");
            $("#county_id").html("<option id = 'county_"+msg.data.county_id+"' value='"+msg.data.county_id+"'>"+msg.data.county_name+"</option>");
            $("#consignee_id").val(id);
        }
    });
}

// 修改和保存收货地址
function save_consignee(type)
{
//    var consignee_id = (type == 1) ? $('#consignee_id').val() : 0;
	var consignee_id = type;
    var uname = $('#uname').val();
    var province_id = $('#s_province').val();
    var city_id = $('#s_city').val();
    var county_id = $('#s_county').val();
    var address = $('#address').val();
    var mobiel = $('#mobiel').val();
    var tel = $('#tel').val();
    var email = $('#email').val();
    var code = $('#code').val();
    var province_name = $('#provin_'+province_id).html();
    var city_name = $('#city_'+city_id).html();
    var county_name = $('#county_'+county_id).html();

    $('#uname').focus().blur();
    $('#address').focus().blur();
    $('#mobiel').focus().blur();
    $('#tel').focus().blur();

    if($('#uname').next().html() != '&nbsp;' || province_id == 0 || city_id == 0 || county_id == 0 || $('#address').next().html() != '&nbsp;' || $('#tel').next().html() != '&nbsp;' || $('#email').next().attr("class") == 'l txt_err' || $('#code').next().attr("class") == 'l txt_err')
    {
        adialog('提示信息', '请完整填写收货地址信息', 1);
        return false;
    }
    var args = 'consignee_id='+consignee_id+'&name='+uname+'&province_id='+province_id+'&city_id='+city_id+'&county_id='+county_id+'&address='+address+'&mobiel='+mobiel+'&tel='+tel+'&email='+email+'&code='+code;
    $.ajax({
        type: "POST",
        url: consignee_id + "/addAddress.html",
        data: args,
        dataType:'json',
        success:function(state){
        	if(state == '200'){
        		var url = $("#forwardUrl").val() + '/user/address/' + consignee_id + '.html';
            	alert("添加成功!");
            	window.location = url;
        	}
        	
//            if(msg.error > 0)
//            {
//                adialog('提示信息', msg.msg, 1);
//                return false;
//            }
//            else
//            {
//                var _address_id = msg.data;
//                if(type == 0)
//                {//加一条
//                    adialog('提示信息', '添加成功', 1);
//                    $('input[name="show-address"]').attr("checked", false);
//                    $('#consignee_id').val(_address_id);
//                    var _address = '<tr id="consignee'+_address_id+'"><td><input type="radio" name="show-address" onclick="get_address('+_address_id+')" checked="checked" /></td><td>'+uname+'</td><td>'+province_name+'</td><td class="tl">'+province_name+city_name+county_name+address+'</td><td>'+code+'</td><td>'+mobiel+'</td><td><a href="javascript:;" onclick="del_address('+_address_id+')" class="fc_orange">删除</a></td></tr>';
//                    $('#address_list').append(_address);
//                }
//                else
//                {//更改
//                    adialog('提示信息', '修改成功', 1);
//                    var _address = '';
//                    _address += '<td><input type="radio" name="show-address" onclick="get_address('+_address_id+')" checked="checked" /></td><td>'+uname+'</td><td>'+province_name+'</td>';
//                    _address += '<td class="tl">'+province_name+city_name+county_name+address+'</td><td>'+code+'</td><td>'+mobiel+'</td>';
//                    _address += '<td><a href="javascript:;" onclick="del_address('+_address_id+')" class="fc_orange">删除</a></td>';
//                    $('#consignee'+consignee_id).html(_address);
//                }
//            }
        }
    });
}

$(document).ready(function(){
    // 省的change事件
    $("#province_id").live('change', function(){
        $("#city_id").html("<option value='0'>请选择--市</option>");
        $("#county_id").html("<option value='0'>请选择--区</option>");
        var code = $(this).val();
        $.ajax({
            type: "GET",
            url: "/flow/get_options/"+code+"/get_city/province_id",
            dataType:'json',
            success:function(result) {
                $("#city_id").html("<option value='0'>请选择--市</option>" + result.data);
            }
        });
    });

    // 市 change
    $("#city_id").live('change', function(){
        $("#county_id").html("<option value='0'>请选择--区</option>");
        var code = $(this).val();
        $.ajax({
            type: "GET",
            url: "/flow/get_options/"+code+"/get_county/city_id",
            dataType:'json',
            success:function(result) {
                $("#county_id").html("<option value='0'>请选择--区</option>" + result.data);
            }
        });
    });
});