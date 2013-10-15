//我的涂书印制
function addtocart(id, type){
    $.ajax({
        type: "GET",
        url: "/user_center/add_book/?id="+id+"&type="+type,
        dataType:'json',
        success:function(result){
            if(result){
                location.href = "/cart.html";
            }else{
                return false;
            }
        }
    });
}

//年月日下拉菜单
function ymd(){
    var selYear = window.document.getElementById("selyear");
    var selMonth = window.document.getElementById("selmonth");
    var selDay = window.document.getElementById("selday");
    var year = $("#year").val();
    var month = $("#month").val();
    var day = $("#day").val();

    if(year == undefined && month == undefined && day == undefined){
        new DateSelector(selYear, selMonth ,selDay);
        $("#selyear").append("<option selected='selected' value='0'>----</option>");
        $("#selmonth").append("<option selected='selected' value='0'>--</option>");
        $("#selday").append("<option selected='selected' value='0'>--</option>");
    }else{
        new DateSelector(selYear, selMonth ,selDay, year, month, day);
    }
}

//实名验证
function check_realname(){
    $(".error_realname").hide();
    var e = $("#realname").val();
    
    if(e == ''){
        now(0);
    }
    else if(e.length < 2){
        $("#realname").val('');
        $("#error_realname_b").show();
        now(1);
    }else if(e.length > 15){
        $("#realname").val('');
        $("#error_realname_c").show();
        now(1);
    }else{
        $("#error_realname_a").show();
        now(0);
    }

}

//身份证号码验证
function check_card_number(){
    $(".error_idnum").hide();
    var e = $("#card_number").val();
    
    if(e == ''){
        now(0);
    }else if(e.length > 18 || e.length < 18){
        $("#card_number").val('');
        $("#error_idnum_b").show();
        now(1);
    }else{
        $.ajax({
            type: "get",
            url: "/user_center/check_card_number?card_number="+e,
            dataType:'json',
            success:function(result){
                if(result){
                    $("#error_idnum_a").show();
                    now(0);
                }else{
                    $("#card_number").val('');
                    $("#error_idnum_b").show();
                    now(1);
                }
            }
        });
    }
}

//超出字符限定，则不能输入数据
function check_user_description()
{
    $("#error_user_description").hide();
    var e = $("#user_description").val();

    if(e.length > 80){
        $("#error_user_description").show();
        now(1);
    }else{
        now(0);
    }
}

//邮箱验证
function check_email(){
    $(".error_email").hide();
    var e = $("#email").val();

    if( e == '' ){
        $("#error_email_d").show();
        now(1);
    }else{
        $.ajax({
            type: "post",
            url: "/user_center/check_email",
            data: {'value' : e},
            dataType:'json',
            success:function(result){
                if(result['status'] == 200){
                    $("#error_email_a").show();
                    now(0);
                }else if(result['status'] == 2){
                    $("#error_email_b").show();
                    now(1);
                }else if(result['status'] == 1){
                    $("#error_email_c").show();
                    now(1);
                }else{
                    $("#error_email_b").show();
                    now(1);
                }
            }
        });
    }
}

//密码验证
function check_password(){
    $(".error_password").hide();
    var e = $("#password").val();
    
    if( e == '' ){
        $("#error_password_d").show();
        now(1);
    }else{
        if(e.length > 20 || e.length < 6){
            $("#error_password_b").show();
            now(1);
        }else{
            $.ajax({
                type: "get",
                url: "/user_center/check_password",
                data: {'value' : e},
                dataType:'json',
                success:function(result){
                    if(result){
                        $("#error_password_a").show();
                        now(0);
                    }else{
                        $("#error_password_c").show();
                        now(1);
                    }
                }
            });
        }
    }
}

//昵称验证 update
function check_nickname_update(){
    $(".error_nickname").hide();
    var old_nickname = $("#nickname_h").val();
    var e = $("#nickname").val();
    
    if( e == '' )
    {
        $("#error_nickname_d").show();
        now(1);
    }
    else if(e == old_nickname)
    {
        $("#error_nickname_a").show();
        now(0);
    }
    else if(e.length > 30 || e.length < 4)
    {
        $("#error_nickname_b").show();
        now(1);
    }
    else
    {
        $.ajax({
            type: "post",
            url: "/user_center/check_nickname",
            data: {'value' : e},
            dataType:'json',
            success:function(result){
                if(result){
                    $("#error_nickname_a").show();
                    now(0);
                }else{
                    $("#error_nickname_c").show();
                    now(1);
                }
            }
        });
     }
}

//清空提示语句
function remove_val(){
    $("#user_description").val('');
}

//表单提交
function check_info_update(){
    var ck = $("#ck").val();
    var ck_email = $("#email_ck").val();
    var email = $("#email").val();
    var pass_word = $("#password").val();
    if((ck_email == '') && (email == '' || pass_word == ''))
    {
        return false;
    }
    var js_email = $("#js_email").val();
    var js_pwd = $("#js_pwd").val();
    var js_repwd = $("#js_repwd").val();
    if(js_email == '1' || js_pwd == '1' || js_repwd == '1'){
        return false;
    }
    if(ck == '0'){
        var nickname = $("#nickname").val();//昵称
        var realname = $("#realname").val();//真实姓名
        var user_gender = $("[name='user_gender']:checked").val();//性别
        var selyear = $("#selyear").val();//生日 年
        var selmonth = $("#selmonth").val();//生日 月
        var selday = $("#selday").val();//生日 日
        var card_number = $("#card_number").val();//身份证号码
        var marriage = $("[name='marriage']:checked").val();//婚否
        var user_description = $("#user_description").val();//描述
        var user_province = $("#user_province").val();//省
        var user_city = $("#user_city").val();//市
        
        if(nickname != ''){

            $.ajax({
                type: "post",
                url: "/user_center/check_info",
                data: { 
                        'email' : email,
                        'pass_word' : pass_word,
                        'nickname' : nickname,
                        'realname' : realname,
                        'user_gender' : user_gender,
                        'selyear' : selyear,
                        'selmonth' : selmonth,
                        'selday' : selday,
                        'card_number' : card_number,
                        'user_province' : user_province,    
                        'user_city' : user_city,
                        'marriage' : marriage,
                        'user_description' : user_description
                        },
                dataType:'json',
                success:function(msg){
                        if(msg.status == 200){
                            $(".ts_hysuccess").show();
                            window.location.reload();
                        }else{
                            var dialog = new Dialog();
                            dialog.show({message:'修改失败，请稍后再次尝试', btn_cancel:'hide'});
                        }
                    }
            });
        }else{
            return false;
        }
    }else{
        return false;
    }
}

//表单提交
function check_info_add(){
    var ck = $("#ck").val();
    if( ck == '0'){
        var email = $("#email").val();//邮箱
        var nickname = $("#nickname").val();//昵称
        var password = $("#password").val();//密码
        var user_gender = $("[name='user_gender']:checked").val();//性别
        var selyear = $("#selyear").val();//生日 年
        var selmonth = $("#selmonth").val();//生日 月
        var selday = $("#selday").val();//生日 日
        var user_description = $("#user_description").val();//描述
        if(nickname.length > 30 || nickname.length < 4)
        {
            return false;
        }
        if(nickname != '' || password != '' || email != ''){
            $.ajax({
                type: "post",
                url: "/user_center/check_info",
                data: { 'nickname' : nickname,
                        'email' : email,
                        'pass_word' : password,
                        'user_gender' : user_gender,
                        'selyear' : selyear,
                        'selmonth' : selmonth,
                        'selday' : selday,
                        'user_description' : user_description
                        },
                dataType:'json',
                success:function(msg){
                        if(msg.status == 200){
                            var dialog = new Dialog();
                            var callback = function(){
                                window.location.reload();
                            }
                            dialog.show({message:'创建成功', btn_cancel:'hide', callback: callback});
                        }else{
                            var dialog = new Dialog();
                            dialog.show({message:'创建失败，请稍后再次尝试', btn_cancel:'hide'});
                        }
                    }
            });
        }else{
            return false;
        }
    }else{
        return false;
    }   
}

//绑定已有本地账户
function addmsg(){
    var email = $("#add_email").val();
    var pass_word = $("#add_pwd").val();
    if(email == '' || pass_word == ''){
        return false;
    }else{
        $.ajax({
            type: "get",
            url: "/user/bind_user",
            data: { 'email' : email,
                    'pass_word' : pass_word
                    },
            dataType:'json',
            success:function(msg){
                    if(msg.status == 200){
                        var dialog = new Dialog();
                        var callback = function(){
                            window.location.reload();
                        }
                        dialog.show({message:msg.message, btn_cancel:'hide', callback: callback});
                    }else{
                        var dialog = new Dialog();
                        dialog.show({message:msg.message, btn_cancel:'hide'});
                        return false;
                    }
                }
        });
    }
}

//** 显示已有
function show_add(){
    $(".addmsg").show();
    $(".createmsg").hide();
}

//** 显示创建
function show_create(){
    $(".addmsg").hide();
    $(".createmsg").show();
}

/*20120709*/
function check_s_email(type, email){
    $(".error_email").hide();

    if(email == ''){
        $(".error_email_d").show();
        $("#js_email").val('1');
    }else{
        $.ajax({
            type: "post",
            url: "/user_center/check_email/ajax/"+type,
            data: {'value' : email},
            dataType:'json',
            success:function(result){
                if(result['status'] == 200){
                    $("#js_email").val('0');
                    $(".error_email_a").show();
                }else if(result['status'] == 2){
                    $("#js_email").val('1');
                    $(".error_email_b").show();
                }else if(result['status'] == 1){
                    $("#js_email").val('1');
                    $(".error_email_c").show();
                }else{
                    $("#js_email").val('1');
                    $(".error_email_b").show();
                }
            }
        });
    }
}

function check_s_password(pwd){

    $(".error_password").hide();
    if( pwd == '' ){
        $(".error_password_d").show();
        $("#js_pwd").val('1');
    }else{
        if(pwd.length > 20 || pwd.length < 6){
            $(".error_password_b").show();
            $("#js_pwd").val('1');
        }else{
            $.ajax({
                type: "get",
                url: "/user_center/check_password",
                data: {'value' : pwd},
                dataType:'json',
                success:function(result){
                    if(result){
                        $(".error_password_a").show();
                        $("#js_pwd").val('0');
                    }else{
                        $(".error_password_c").show();
                        $("#js_pwd").val('1');
                    }
                }
            });
        }
    }
}

function re_pwd_s(repwd){
    $(".error_re_pwd").hide();
    var pwd = $("#password").val();

    if(repwd == ''){
        $("#js_repwd").val('1');
        $("#error_re_pwd_d").show();
    }else{
        if(pwd == repwd){
            $("#js_repwd").val('0');
            $("#error_re_pwd_a").show();
        }else{
            $("#js_repwd").val('1');
            $("#error_re_pwd_b").show();
        }
    }
}

function now(x){
    var ck = $("#ck").val();
    var s = '1';
    if(x == 0 && ck == '1'){
        s = '1';
    }else{
        s = '0';
    }
    $("#ck").val(s);
}