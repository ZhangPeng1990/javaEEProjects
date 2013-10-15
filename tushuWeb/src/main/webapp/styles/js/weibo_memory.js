var tsDialog = {
    skin : ['<div class="tsDBg"></div><div class="tsDialog hide"><div class="tsDMain"><i class="tsClose">close</i>', '</div></div>'],
    init : function(){

    },
    open : function(e){
        var _e = e,tsD;
        if(typeof e === "string"){
            tsD = this.skin[0] + _e + this.skin[1];
        }else if(typeof e === "object"){
            tsD = this.skin[0] + "<div id='load-data' class='tc'><img src='/images/loading_circle-200x200.gif' /></div>" + this.skin[1];
        }
        $("body").append(tsD);
        $(".tsDialog").css({marginLeft:-($(".tsDialog").width()/2),marginTop:-($(".tsDialog").height()/2)}).removeClass("hide");
        $(".tsClose").add(".tsDBg").bind("click",this.close);
    },
    close : function(){
        $(".tsDBg").add(".tsDialog").remove();
    }
};


var sina_login_url_pre = 'https://api.weibo.com/oauth2/authorize?client_id=3308374317&redirect_uri=http%3A%2F%2Fwww.tushu.com%2Fsinalogin%2FsinaBack%3Fbind_type%3Dpopup';
var sina_login_url_mid = '%26is_relate%3D1';
var sina_login_url_aft = '&response_type=code&forcelogin=true';
var html = {
    sina  : '<div class="w740"><div class="tc pb20 pt20"><a href="javascript:void(0);" class="sina_login">新浪微博登录</a></div><div class="pb30"><div class="m w300 ff_yahei fs14 lh28">您还没有绑定微博或长时间没有微博登陆，点击上面按钮立即绑定或登陆!</div></div></div>',
        login :  '<div class="w540"><h4 class="tsD_title">第三平台账号登录：</h4><div class="tc pb20"><a href="javascript:void(0);" class="sina_login">新浪微博登录</a></div><div class="tsD_gray pb30"><h4 class="tsD_title">涂书网账号登录：</h4><div class="tsD_form"><input type="text" class="tsD_text" placeholder="邮箱" name="username" /><p class="err" style="margin-left:0;"></p></div><div class="tsD_form"><input type="password" class="tsD_text" placeholder="密码" name="password" /><p class="err" style="margin-left:0"></p></div><div class="clearfix tsD_form"><a href="/user/forget_passwd" class="l fc_orange fs14 mt30">忘记密码？</a><a href="javascript:void(0);" class="tsD_btn r" id="login_submit">登 录</a></div></div></div>',
        reg   : '<div class="w540"><h4 class="tsD_title">快速注册：</h4><div class="tc pb20"><a href="javascript:void(0);" class="sina_login">新浪微博登录</a></div><div class="tsD_gray pb30"><h4 class="tsD_title">涂书网账号注册：</h4><div class="tsD_form"><input type="text" class="tsD_text" placeholder="昵称" name="username" /><p class="err"></p></div><div class="tsD_form"><input type="text" class="tsD_text" placeholder="邮箱" name="email" /><p class="err"></p></div><div class="tsD_form"><input type="password" class="tsD_text" placeholder="密码" name="password" /><p class="err"></p></div><div class="clearfix tsD_form"><a href="javascript:void(0);" name="submitBtn" class="tsD_btn r">注 册</a></div></div></div>',
        tag   : '<div class="w540"><div class="tsD_tag_title"><span class="on ttt_1">创建涂书网账号</span><span class="ttt_2">已有涂书网账号</span></div><div class="tsD_tag_body pb30"><div class="pt20"><div class="tsD_form"><input type="text" class="tsD_text" placeholder="邮箱" name="bind_email" /><p class="err"></p></div><div class="tsD_form"><input type="password" class="tsD_text" placeholder="密码" name="bind_password" /><p class="err"></p></div><div class="tsD_form"><input type="password" class="tsD_text" placeholder="确认密码" name="bind_confirm_password" /><p class="err"></p></div><div class="clearfix tsD_form"><a href="javascript:void(0);" class="tsD_btn r" id="register_bind">注 册</a></div></div><div class="pt20 hide"><div class="tsD_form"><input type="text" class="tsD_text" placeholder="邮箱" name="login_email" /><p class="err"></p></div><div class="tsD_form"><input type="password" class="tsD_text" placeholder="密码" name="login_password" /><p class="err"></p></div><div class="clearfix tsD_form"><a href="#" class="l fc_orange fs14 mt30">忘记密码？</a><a href="javascript:void(0);" class="tsD_btn r" id="login_bind">登 录</a></div></div></div></div>',
        bookName : '<div class="w540 pb30"><div class="bookIcon">书名不能为空哦~请输入您的书名并点击保存！</div><div class="tsD_form"><input type="text" class="tsD_text" id="bookname_text" placeholder="输入书名" /><p class="fc_orange">书名在8个汉字以内或16个英文字符以内</p></div><div class="tc"><a href="#" class="tsD_btn" id="save_bookname">保 存</a></div></div>'
}

$(function(){
    //WbMemory.prototype.allClick();
    $(".onoffJs a").live("click",function(){
        var c = $(this).index();
        $(this).attr("class","on").siblings().removeClass("on");

        if(c == 0){

            data_area.black_list = [];
            for(var i in wb_datas.whole.d_json){
                delete wb_datas.whole.d_json[i].checked;
            }
            //console.log(wb_datas.whole.d_json)
            countMoney();

        }else{
            check = "whole";
           // console.log("open!fuck (onoffJS) button! --- >");

            var wdl_data_str = '<div class="datas_box"><ul class="datas_tag"><li class="on" rel="whole">全部</li><li rel="selected">已选择</li><li rel="notselect">未选择</li><li rel="source">筛选发送源</li></ul><div id="datas_main"></div><div id="page_box"></div><div class="tr pb10 pr5 tip_text_img"><a href="javascript:void(0)" class="tsD_btn" id="black_data_area">确 定</a></div></div>';
            tsDialog.open(wdl_data_str);

           // console.log("open fuck data! |--->")
            setJsonData();
        }

        /*var a = 0;
        $(".wb_open").mouseover(function(){a = 1});
        $(".wb_open").mouseout(function(){a = 0});
        $("body").click(function(){
            if(a == 0){
                $(".wb_open").stop(true,true).fadeOut("fast");
            }
        });
        */
    });
    /*$(".offon").live("mouseover",function(){
        $(".wb_open").stop(true,true).fadeIn("fast");
    })*/
    //setWeiboDate(2009,1,2013,1);
});


function setWeiboDate(startYearVal,startMonthVal,endYearVal,endMonthVal){

  //  console.log("go in setWeiboDate ->");

    document.onselectstart=new Function("event.returnValue=false;");
    var sinaTime_year = startYearVal;
    var sinaTime_month = startMonthVal - 1;
    var tm_cc = 12 - sinaTime_month;
    var nowTime_year = endYearVal;
    var nowTime_month = endMonthVal;

    var tm_length = (nowTime_year - sinaTime_year)*12 + nowTime_month - sinaTime_month;
    var time_width = 780;
    var tm_w = parseInt((time_width - tm_length) / tm_length);
    var time_widthNew = (tm_w + 1) * tm_length;
    var tm_str = '',tm_strs = '';
    var tmy_length = 0;
    var show_year = sinaTime_year+1;

    var timeTime = '<b class="timeL"></b><b class="timeR"></b><div class="time-box"></div><div class="t-select-box"><div></div></div><span class="tsb-left"><input type="hidden" name="start_year" value="" /><input type="hidden" name="start_month" value="" /></span><span class="tsb-right"><input type="hidden" name="end_year" value="" /><input type="hidden" name="end_month" value="" /></span>';

    $(".time-select").html(timeTime);

    function countYM(lenth,w,pos){
        var s_y = sinaTime_year;
        var s_m = sinaTime_month;
        var m = Math.round(lenth / (tm_w+1));
        var len = Math.round((w+1) / (tm_w+1));

        if(pos == "left"){
            var sum_m = s_m + m +1;
            if(sum_m >= 12){
                var sum_y = parseInt(sum_m / 12);
                s_y += sum_y;
                s_m = sum_m % 12;
                if(s_m == 0){
                    s_m = 12;
                    s_y -= 1;
                }
            }else{
                s_m += m +1;
            }
            //$("#start_year").val(s_y);
            //$("#start_month").val(s_m);

            data_area.start_date = [s_y, s_m ];
            //修改价格
            countMoney();
            return s_y + "年" + s_m + "月";

        }else{

            var sum_m = s_m + len + m;
            if(sum_m >= 12){
                var sum_y = parseInt(sum_m / 12);
                s_y += sum_y;
                s_m = sum_m % 12;
                if(s_m == 0){
                    s_m = 12;
                    s_y -= 1;
                }
            }else{
                s_m = sum_m % 12;
            }
            //$("#end_year").val(s_y);
            //$("#end_month").val(s_m);
            data_area.end_date = [ s_y, s_m ];
            //修改价格
            countMoney();
            return s_y + "年" + s_m + "月";
        }
    }

    for(var i=1;i<tm_length+1;i++){
            //if()
        if(i == tm_length){
            tm_strs += '<div class="time-month" style="width:'+ (tm_w + 1) +'px;border:0;" timeMonth="'+i+'"></div>';
        }else{
            if(i == tm_cc){
                tm_strs += '<div class="time-month" style="width:'+tm_w+'px;height:29px;"><span style="margin-left:'+(tm_w - 25)+'px;">'+show_year+'年</span></div>';
            }else if((i-tm_cc)%12 == 0){
                tmy_length ++ ;
                tm_strs += '<div class="time-month" style="width:'+tm_w+'px;height:29px;"><span style="margin-left:'+(tm_w - 25)+'px;">'+(show_year+tmy_length)+'年</span></div>';
            }else{
                tm_strs += '<div class="time-month" style="width:'+tm_w+'px"></div>';
            }
        }

    }

    $(".tsb-left").append("<em>"+sinaTime_year+"年"+(sinaTime_month + 1) +"月</em>")
    $(".tsb-right").append("<em>"+nowTime_year+"年"+nowTime_month+"月</em>")

    //$(".time-")
    $(".t-select-box").css({width:time_widthNew,marginLeft:0});
    $(".time-box").css({width:time_widthNew - 2}).append(tm_strs);
    $(".time-select").css({width:time_widthNew})

    var a = 0;
    var tsb_l_l,tsb_l_r;


   var funL = 0 ,funR = 0; var wwww = $(".t-select-box").width();

    var kn = true;

    $(".tsb-left").bind("mousedown",function(){
        kn = false;
        /*if($(".wb_open").css("display")!="none"){
            $(".wb_open").fadeOut("fast");
        }*/
        a = 1;
        tsb_l_l = $(".time-box").offset().left;
        var $this = $(this);
        var move_fun = 0,width_fun;
        moveLeft($(this));
        $(".t-select-box").css({borderLeftColor:"#ffb738"}).children("div").css({backgroundColor:"#fb3"});
        $(this).css({backgroundPosition:"bottom right"});
        return false;

    });
    $(".tsb-right").bind("mousedown",function(){
        kn = false;
        /*if($(".wb_open").css("display")!="none"){
            $(".wb_open").fadeOut("fast");
        }*/
        a = 1;
        tsb_l_r = $(".time-box").offset().left + wwww;
        var $this = $(this);
        var move_fun2,width_fun;
        $("body").css({cursor:"w-resize"});
        moveRight($(this));
        $(".t-select-box").css({borderRightColor:"#ffb738"}).children("div").css({backgroundColor:"#fb3"});
        $(this).css({backgroundPosition:"bottom right"});
        return false;
    });
    function moveLeft($this){
        var w2 = $(".t-select-box").width();
        $("body").bind("mousemove",function(e){
            if(a == 1 && (e.pageX - tsb_l_l) >= 0 && (wwww - (e.pageX - tsb_l_l) - funR) >= (tm_w+1)){
                funL = Math.round((e.pageX - tsb_l_l) / (tm_w+1)) * (tm_w + 1);  //移动的模糊格总宽度
               if((wwww - funL - funR - 1) < 90){
                    $(".tsb-right em").css({top:-40});
                    $this.children("em").css({top:-70});
                }else{
                    $this.children("em").css({top:-40});
                }
               $(".t-select-box").css({left:funL+1.5,width:wwww - funL - funR - 1});
                $this.css({left:funL - 22}).children("em").html(countYM(funL + 1,(wwww - funL - funR),"left"));
            }
        });
        return false;
    }
    function moveRight($this,mouse_position){
        var w2 = $(".t-select-box").width();
        $("body").bind("mousemove",function(e){
            if(a == 1 && (tsb_l_r - e.pageX) >= 0 && (e.pageX - tsb_l_r + wwww - funL) > (tm_w+1)){// && w2 > tm_w){


                funR = Math.round((tsb_l_r - e.pageX) / (tm_w+1)) * (tm_w + 1);  //移动的模糊格总宽度

                if((wwww - funL - funR - 1) < 90){
                    $(".tsb-left em").css({top:-40});
                    $this.children("em").css({top:-70});
                }else{
                    $this.children("em").css({top:-40});
                }

                $(".t-select-box").css({left:funL + 1,width:wwww - funR - funL -1});
                $this.css({right:funR - 22}).children("em").html(countYM(funL,(wwww - funL - funR),"right"));
            }
        });

        return false;
    }
    $("body").bind("mouseup",function(){
        a = 0;
        $("body").unbind("mousemove");
        if(!kn){
            //wbMemory.prepareData(null, null, $('#start_year').val(), $('#start_month').val(),$('#end_year').val(), $('#end_month').val());
            kn = true;
        }

        $(".t-select-box").css({borderColor:"#c97e00"}).children("div").css({backgroundColor:"#fa0"}).each(function(){

        });
        $(".tsb-left").css({backgroundPosition:"bottom left"});
        $(".tsb-right").css({backgroundPosition:"bottom left"});
        $("body").css({cursor:"default"});
    });
   // console.log("ok oye setWeiboDate -->|");
    $("#make_layout").removeClass("hide");
    $("#loadSwf3").hide();
}
/*
$(function(){
    $("#weiboCheckFun a").click(function(){
        var il = $(this).index();
        $("#weiboCheckFun a").eq(il).addClass("on").siblings().removeClass("on");
        $(".wbm_list li").hide();
        switch (il) {
            case 0 :
                $(".wbm_list li").show();
                break;
            case 1 :
                $(".wbm_list li").find("input[type='checkbox']").each(function(){
                    if($(this).attr('checked') == "checked"){
                        $(this).parent().parent().show();
                    }
                });
                break;
            case 2 :
                $(".wbm_list li").find("input[type='checkbox']").each(function(){
                    if($(this).attr('checked') != "checked"){
                        $(this).parent().parent().show();
                    }
                });
                break;
        }

    });
});
function hrefCreateClick(){
    //$("html,body").scrollTop(470);

    gotSelectedWbMessages = $('#select_weibo_status').val();
    if (gotSelectedWbMessages!=1){
      setTimeout('hrefCreateClick()', 1000);
      return false;
    }
    $("#loadSwf").hide();
    return false;
}
*/
$(function(){


    $("#loadSwf2").show();
    /*第一步提交*/
    $(".wb_next_1").eq(0).click(function(){
      //setC('html_tag_showed', 0, 1);
      $.post("/user/is_sina_login", function(data){
        var template_id = $('.wb_m_format li.on a').attr('booktype')
          , cover_id = $('.select_face li.on img').attr('booktype')
          , cover_bookclass = $('.select_face li.on img').attr('bookclass');
        var selected_str = template_id + '__' + cover_id + '__' + cover_bookclass;
        setC('weibo_selected_template', selected_str, 1)
        if (data && data.err_code==-1) {
            popup_login();
            return;
        }
        else if (data && (data.err_code==-2 || data.err_code==-3)) {
          //tsDialog.open(html.sina);
			adialog('提示信息', '<div class="w450"><p class="tl poa" style="margin-top:-30px;">您需要授权涂书网访问您需要同步的新浪微博帐号。点击下方按钮快速授权，一键同步微博内容，生成微博书！</p><div class="pt60"><a href="javascript:void(0);" class="btn_orange fs15 sina_login_popup" style="font-size:24px;">前往新浪微博授权</a></div></div>');

          $('a.sina_login_popup').click(function(){
            setC('popup_sina_window', 1);
            window.open (sina_login_url_pre + sina_login_url_mid + sina_login_url_aft,'newwindow','height=600,width=600,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
          });
          return;
        }
        else {
          //alert(gotFriends)
          var $this = $(".wb_m_middle").eq(0);
          $this.children(".wb_m_top").next().slideUp("normal",function(){
              $this.children(".wb_m_top").children(".wb_m_iconTrue").fadeIn("fast",function(){$this.addClass("wb_m_titleS").addClass("wb_m_title")});
          });
          $(".wb_m_middle").eq(1).children(".wb_m_top").next().slideDown();
          $(".wb_m_middle").eq(1).removeClass("wb_m_title");
          if (gotFriends!=1){
            setTimeout('$(".wb_next_1").eq(0).trigger("click")', 1000);
            return false;
          }
          return false;
        }
      },'json');

    });

    /*第二步提交*/
    $("#href_to_create").click(function(){

          $("#loadSwf3").show();
            var uid = $(this).attr("uid");
            var $this = $(".wb_m_middle").eq(1);
            $this.children(".wb_m_top").next().slideUp("normal",function(){
                $this.children(".wb_m_top").children(".wb_m_iconTrue").fadeIn("fast",function(){$this.addClass("wb_m_titleS").addClass("wb_m_title")});
            });
            var browser=navigator.appName;
            if(browser == "Microsoft Internet Explorer"){
                var b_version=navigator.appVersion
                var version=b_version.split(";");
                var trim_Version=version[1].replace(/[ ]/g,"");
                //alert(trim_Version)
                if( trim_Version=="MSIE8.0" || trim_Version=="MSIE7.0" ||  trim_Version=="MSIE6.0"){
                    $(".wb_m_middle").eq(2).children(".wb_m_top").next().show();
                }else{
                    $(".wb_m_middle").eq(2).children(".wb_m_top").next().slideDown();
                }
            }else{
                //alert(trim_Version)
                $(".wb_m_middle").eq(2).children(".wb_m_top").next().slideDown();
            }
            $(".wb_m_middle").eq(2).removeClass("wb_m_title");
            //hrefCreateClick();
            getJsonData(uid);
    });

    /*返回上一步*/
    $(".wb_m_titleS").live("click",function(){
        var order = $(this).find('input[name=status]').attr('order');
        $('input[type=hidden][name=status]').each(function(){
          if ($(this).attr('order') >= order){
            $(this).val(0);
          }});
        var $this = $(this);
        var ix = $this.index();
        $this.removeClass("wb_m_titleS").removeClass("wb_m_title");
        $this.children(".wb_m_top").next().slideDown();
        $(".wb_m_middle").eq(ix+1).children(".wb_m_top").next().slideUp("fast",function(){
            $(".wb_m_middle").eq(ix+1).addClass("wb_m_title").removeClass("wb_m_titleS").find(".wb_m_iconTrue").hide();
        });
        if(ix == 0){
            $(".wb_m_middle").eq(1).addClass("wb_m_title").removeClass("wb_m_titleS").find(".wb_m_iconTrue").hide();
            $(".wb_m_middle").eq(2).addClass("wb_m_title").removeClass("wb_m_titleS").find(".wb_m_iconTrue").hide();
            $(".wb_m_middle").eq(2).addClass("wb_m_title").removeClass("wb_m_titleS").children(".wb_m_top").next().hide();
        }
    });

});


//好友切换
$(function(){

    var pageNum = 0;
    var t = 5;
    var downSb = true;
	$(".wb_m_leftBtn2 a").click(function(){
        pageNum = pageNum>0 ? (pageNum -1) : pageNum ;
        if(pageNum >= 0){
            $('#ul_my_friends ul li').hide();
            for(var i=0;i<5;i++){
                $('#ul_my_friends ul li').eq(pageNum*t+i).show();
            }
        }
	});
	$(".wb_m_rightBtn2 a").click(function(){
        var n = $('#ul_my_friends ul li').length;

        if(n - (pageNum*5) <= 20){
            //currentPage++;

            if (!isGotNewFriend && !isStartGettingFriends) {
                $(".loadFirends").show();
                wbMemory.getMyWbInfo('ul_my_friends', currentPage);
            }

            isGotNewFriend = 0;
            if (!isGotNewFriend || isStartGettingFriends)
            {
              //setTimeout('$(".wb_m_rightBtn2 a").trigger("click")', 1000);
              //return;
            }
            //alert(n,$('#ul_my_friends ul li').length)
                $('#ul_my_friends ul li').hide();
                for(var i=0;i<5;i++){
                    $('#ul_my_friends ul li').eq(pageNum*t+i).show();
                }

        }

        if(n/t - pageNum > 1){
            pageNum ++ ;
            $('#ul_my_friends ul li').hide();
            for(var i=0;i<5;i++){
                $('#ul_my_friends ul li').eq(pageNum*t+i).show();

            }
        }

	});
});

//container_product_thumbs--版式图片预览
$(function(){
    $("#container_product_thumbs li img").live({
        mouseenter : function(){
            var $this = $(this);
            $("#zoom_img").html("<img src='"+$(this).attr("org")+"' alt="+$(this).attr("org")+" />").stop(true,true).fadeIn("fast",function(){
                $this.parent().find("b").show();
            });
        },
        mouseleave : function(){
            $("#zoom_img").stop(true,true).fadeOut("fast");
            $(this).parent().find("b").hide();
        }
    });
});

function popup_login() {
          tsDialog.open(html.login);
          $(".bindBox a").click(function(){
              $(this).addClass("on").siblings().removeClass("on");
              $(".form_"+($(this).index()+1)).removeClass("hide").siblings().addClass("hide");
          });
          var txtVal = $(".loginText input[type=text]").val();
          if(txtVal != ""){
              $(".loginText input[type=text]").prev().hide();
          }
          $(".loginText label").click(function(){
              $(this).hide().next().focus();
          });
          $(".loginText input").focus(function(){
              $(this).prev().hide();
          });
          $(".loginText input").blur(function(){
              if($(this).val() == ""){
                  $(this).prev().show();
              }
          });
          $("input[name=password]").keydown(function(event){
              if(event.keyCode == 13){
                  //$("#login_submit").focus();
				  $('#login_submit').trigger('click');
              }
          })

          $("#login_submit").bind('click', function(){
              $("#login_submit").addClass("loadZhuan");
              checkloginform();
          });
          $('a.sina_login').click(function(){
            setC('popup_sina_window', 1);
            window.open (sina_login_url_pre + sina_login_url_aft,'newwindow','height=400,width=600,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
          });
}
var inpBl = [],inpVal = [];
  for(var i=0;i<$("fieldset").length;i++){
      inpBl[i] = false;
  }
  var errArr = [
      "该用户已被注册",                      //errArr[0]
      "用户名过短 6~18位",                   //errArr[1]
      "用户名过长 6~18位",                   //errArr[2]
      "用户名不能为空",                      //errArr[3]
      "只能中文 数字、英文大小写字母 和-_",   //errArr[4]

      "邮箱不能为空",                        //errArr[5]
      "邮箱格式不正确",                      //errArr[6]
      "邮箱已注册",                          //errArr[7]

      "密码不能为空",                        //errArr[8]
      "密码必须6~18位",                      //errArr[9]
  ];

  var tipText;
  var tipTexts = new Array();
  var $userName = /^[\u4e00-\u9fa5_a-zA-Z0-9/-]+$/               //匹配中文,英文字母和数字及
  var $email = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/  //email

function inpFocus(){
      var cName = $(this).parent().next().attr("class");

      if(cName == "pl130 errorText"){
          //tipText = $(this).parent().next().html();
          tipTexts[$(this).attr('name')] = $(this).parent().next().html();
      }else{
          //$(this).parent().next().removeClass("err").addClass("errorText").html(tipText);
          $(this).parent().next().removeClass("err").addClass("errorText").html( tipTexts[$(this).attr('name')]);
      }
  }

  function userAction(){
      var $this = $(this);
      var v = $this.val();
      if(v == ""){
          $this.parent().find('p.err').html(errArr[3]);
          inpBl[0] = false;
      }else if($userName.test(v) == false){
          $this.parent().find("p.err").html(errArr[4]);
          inpBl[0] = false;
      }else{
          $.ajax({
              type:"post",
              url:"/user/check_nickname",
              data:"nickname="+v,
              dataType:"json",
              success:function(msg){
                  if(msg.status != 200) {
                      $this.parent().find("p.err").html(msg.message);
                      inpBl[0] = false;
                  }else{
                      if (msg.data!='0'||msg.data!='')
                      {
                          $this.parent().find("p.err").html(msg.message);
                          inpBl[0] = false;
                      }
                      else
                      {
                          $this.parent().find('p.err').html('');
                          inpVal[0] = v;
                          inpBl[0] = true;
                      }
                  }
              }
          })
      }
  }

  function emailAction(){
      var $this = $(this);
      var v = $this.val();
      if(v == ""){
          $this.parent().find("p.err").html(errArr[5]);
          inpBl[1] = false;
      }else if($email.test(v) == false){
          $this.parent().find("p.err").html(errArr[6]);
          inpBl[1] = false;
      }else{
          $.ajax({
              type:"post",
              url:"/user/check_email",
              data:"email="+v,
              dataType:"json",
              success:function(msg){
                  if(msg.status != 200) {
                      $this.parent().find("p.err").html(msg.message);
                      inpBl[1] = false;
                  }else{
                      if (msg.data!='0' && msg.data!='')
                      {
                          $this.parent().find("p.err").html(msg.message);
                          inpBl[1] = false;
                      }
                      else
                      {
                          $this.parent().find("p.err").html('');
                          inpVal[1] = v;
                          inpBl[1] = true;
                      }
                  }
              }
          });
      }
  }

  function pwAction(){
      var v = $(this).val();
      if(v == ""){
          $(this).parent().find("p.err").html(errArr[8]);
          inpBl[2] = false;
      }else if(v.length < 6 || v.length > 18){
          $(this).parent().find("p.err").html(errArr[9]);
          inpBl[2] = false;
      }else{
          $(this).parent().find("p.err").html("");
          inpVal[2] = v;
          inpBl[2] = true;
      }
  }




  function submitAction(){
      if(inpBl == "true,true,true"){
          $.ajax({
              type:"post",
              url:"/user/register",
              data:"pass_word="+inpVal[2]+"&email="+inpVal[1]+"&nickname="+inpVal[0],
              dataType:'json',
              success:function(msg){
                  if(msg.status == 200){
                      if (typeof(msg.data)=='string' && msg.data!='0' && msg.data!='')
                      {
                          adialog(msg.message, msg.message, 1);
                          return false;
                      }
                       var rewrite_url = $("input[name=rewrite_url]").val();
                      if(rewrite_url == ''){
                          urls = '/';
                      }else {
                          if(rewrite_url == 'http://www.tushu.com/user/sign_in'){
                          urls = '/';
                          }else{
                          urls = rewrite_url;
                          }
                      }
                      //window.location = '/user/regok?return_url='+urls;
                      //会员书注册直接刷新
                      window.location.reload();
                  }else{
                      adialog('注册失败', '注册失败，请确认用户资料格式正确，如仍有问题，请联系客服人员或稍后重试', 1);
                  }
              }
          });
      }else{
          return false;
      }


  }
function popup_register() {
  tsDialog.open(html.reg);
  $('a.sina_login').click(function(){
            setC('popup_sina_window', 1);
            window.open (sina_login_url,'newwindow','height=400,width=600,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
          });

  /*
  http://www.tushu.com/user/check_email?email=25457788@qq.com
  http://www.tushu.com/user/check_nickname?nickname=kising
  */


  $("input[name=username]").live("focus",inpFocus).bind("blur",userAction);
  $("input[name=email]").live("focus",inpFocus).bind("blur",emailAction);
  $("input[name=password]").live("focus",inpFocus).bind("blur",pwAction).keydown(function(event){if(event.keyCode == 13){$("input[name=submitBtn]").focus()}});
  $("a[name=submitBtn]").live("click",submitAction);
}


/*
 *  从获取微博数据开始，直至返回 input#data_area 一个JSON串。 获取数据方法名：getJsonData();
 * @wangpan
 * 2013-05-29
 * start */

   // 初始化全局变量
    var whole_data = {},
        whole_data_length = 0,
        list_len = 0,
        selected_length = 0,
        click_on_num = 0,
        black_list = [],
        //new_black_list = [];
        check = "whole";

    // 编辑数据的数据格式
    var wb_datas = {
        whole : {
            d_json   : [],
            d_length : 0,
            d_page   : 0
        },
        selected : {
            d_json   : [],
            d_length : 0,
            d_page   : 0
        },
        notselect : {
            d_json   : [],
            d_length : 0,
            d_page   : 0
        },
        source    : [
            {
                name        : "",
                length      : 0,
                real_length : 0
            }
        ]
    };
    // 返回数据的数据格式
    var data_area = {
        start_date : [],
        end_date   : [],
        black_list : black_list
    };

    //提交数据
    $("#black_data_area").live("click",function(){
        data_area.black_list = [];
        for(var i in wb_datas.whole.d_json){
            if(wb_datas.whole.d_json[i].checked == false){
                data_area.black_list.push(wb_datas.whole.d_json[i].id)
            }
        }
        $("#data_area").val(JSON.stringify(data_area));

        //修改价格
        countMoney();

        tsDialog.close();
    });

    //价格计算
    function countMoney(){
        //获取当前版式
        var _book_type = $(".select_face ul li.on img").attr("booktype");

        //通过日期修改长度
        getDate_setWhole();

        selected_length = ((typeof wb_datas.whole.d_length != "number") ? whole_data_length : wb_datas.whole.d_length) - data_area.black_list.length;

        var price = bps[_book_type];

        var mt_num = (Math.max((selected_length - price.basepage) * price.addpage , 0) + price.base).toFixed(2);

        $("#weibo_amount").html(selected_length);
        $("#money_total").html(mt_num);


    }


    //拆分分页数值计算
    function splitPage(d_type){

       //console.log("splitPage.................ok |--->");
        var d_len = eval("wb_datas." + d_type + ".d_length");

        //每页数量
        this.list_num = 50;

        //分页后的余数
        this.lave = d_len % this.list_num;

        //分页后的页数
        if(this.lave != 0){
            this.page_len = parseInt(d_len / this.list_num) + 1;
        }else{
            this.page_len = parseInt(d_len / this.list_num);
        }

        //存储页数
        eval("wb_datas." + d_type + ".d_page = this.page_len");

        list_len = this.list_num;
        //插入分页方法
        viewPage(this.page_len);
        //插入第一页数据
        viewData(d_type,this.page_len,this.list_num,0);
    }

    //插入分页
    function viewPage(page_len){
       //console.log("viewPage.................ok |--->");
        $("#page_box").show();
        $("#datas_main").css({height:430});
        var page_str = '<a href="javascript:void(0)" onclick="click_num(0)">首页</a><a href="javascript:void(0)" onclick="click_num('+'\''+'-'+'\''+')">上一页</a><select onchange="click_num(Number(this.value))">';

        for(var i = 0; i < page_len; i++){
            page_str += '<option value="' + i + '">第' + (i+1) + '页</option>';
        }
        page_str += '</select><a href="javascript:void(0)" onclick="click_num('+'\''+'+'+'\''+')">下一页</a><a href="javascript:void(0)" onclick="click_num('+(page_len - 1)+')">尾页</a>';

        $("#page_box").html(page_str);
    }

    //插入数据
    function viewData(d_type,page_len,ln,num){
       //console.log("viewData.................ok |--->");
        var o_json = eval("wb_datas." + d_type + ".d_json");
        var o_length = eval("wb_datas." + d_type + ".d_length");

        var wdl = "";
        if(page_len - num > 1){
            for(var i = 0; i < ln; i++){
                var n = num * ln + i;
                    wdl += '<div class="clearfix datas_list" data-num="'+n+'"><div class="l"><input data-id="'+o_json[n].id+'" type="checkbox" '+ (o_json[n].checked === false ? '' : 'checked="checked"') +' /></div><div class="r datas_text"><div class="datas_title">' + o_json[n].text + '</div><div class="datas_img">' + (o_json[n].thumbnail_pic == undefined ? " " : '<img src="'+ o_json[n].thumbnail_pic +'" alt="' + o_json[n].id + '" />') +'</div><div class="clearfix"><span class="fc_orange">' + o_json[n].created_at_tuple[0] + '年' + o_json[n].created_at_tuple[1] + '月' + o_json[n].created_at_tuple[2] + '日&nbsp;' + o_json[n].created_at_tuple[3] + ':' + o_json[n].created_at_tuple[4] + '</span><span class="ml10">来自<span class="fc_orange">' + o_json[n].source_text + '</span></span></div></div></div>';
            }
        }else{
            for(var n=num * 50; n < o_length; n++){
                wdl += '<div class="clearfix datas_list" data-num="'+n+'"><div class="l"><input data-id="'+o_json[n].id+'" type="checkbox" '+ (o_json[n].checked === false ? '' : 'checked="checked"') +' /></div><div class="r datas_text"><div class="datas_title">' + o_json[n].text + '</div><div class="datas_img">' + (o_json[n].thumbnail_pic == undefined ? " " : '<img src="'+ o_json[n].thumbnail_pic +'" alt="' + o_json[n].id + '" />') +'</div><div class="clearfix"><span class="fc_orange">' + o_json[n].created_at_tuple[0] + '年' + o_json[n].created_at_tuple[1] + '月' + o_json[n].created_at_tuple[2] + '日&nbsp;' + o_json[n].created_at_tuple[3] + ':' + o_json[n].created_at_tuple[4] + '</span><span class="ml10">来自<span class="fc_orange">' + o_json[n].source_text + '</span></span></div></div></div>';
            }
        }

        $("#datas_main").html(wdl);
    }

    //插入发送源
    function viewSource(d_type){
       //console.log("viewSource.................ok |--->");
        $("#page_box").hide();
        $("#datas_main").css({height:474});
        var o_json = eval("wb_datas." + d_type);
        var wdl = "";
            wdl += '<ul id="source_list">';
            for(var i in o_json){
                var str = "",classname;
                //console.log(o_json)
                if(o_json[i].selected == 0){
                    str = "未选择";
                    classname = "sc_null";
                }else if(o_json[i].total == o_json[i].selected){
                    str = "已全选";
                    classname = "sc_all";
                }else{
                    str = "部分选择：共"+o_json[i].total+"条，已选择"+o_json[i].selected+"条";
                    classname = "sc_part";
                }
                wdl += '<li class="'+classname+'" rel="'+i+'"><strong>'+i+'</strong><span>'+ str +'</span></li>';
            }
            wdl += '</ul>';
        $("#datas_main").html(wdl);
        $("#source_list").find("li").bind("click",function(){
            var cname = $(this).attr("class");
            var source = $(this).attr("rel");
            if(cname != "sc_all"){
                for(var i in wb_datas.whole.d_json){
                    if(wb_datas.whole.d_json[i].source_text == source && wb_datas.whole.d_json[i].checked == false){
                        delete wb_datas.whole.d_json[i].checked;
                    }
                }
            }else{
                for(var i in wb_datas.whole.d_json){
                    if(wb_datas.whole.d_json[i].source_text == source){
                        wb_datas.whole.d_json[i].checked = false;
                    }
                }
            }
            searchSource();
        });
    }

    //getJSON抓取数据
    function getJsonData(uid){
        var dataid;

        getDataIdData();
        function getDataIdData(){
            //console.log("start");
            $.get("http://www.tushu.com/product/get_wbmessages",{username:uid,type:"dataid"},function(data){
                deleteCookie('weibo_selected_template');
                dataid = data;
                //console.log(dataid)
                if(!/^[a-zA-Z0-9]+$/.test(dataid)){
                    //console.log(typeof dataid + " =" +dataid);
                    //console.log($("#whosweibo").html()+'好大哦~正在努力加载中，请继续等待...');
                    tsDialog.open('<div><p class="load_img">'+$("#whosweibo").html()+'好大哦~正在努力加载中，请继续等待...</p><div class="tc pb10"><a id="retry_get_dataid" class="tsD_btn" href="javascript:void(0)">继 续</a></div></div>');
                    $("#retry_get_dataid").live("click",function(){
                        setTimeout(function(){
                        //console.log("close")
                        tsDialog.close();
                            getDataIdData();
                        },500);
                    });

                    $("i.tsClose").remove();
                }else{
                    setDataIdGetData(dataid);
                }
            });
        }

        function setDataIdGetData(diad){
            //console.log("getDataIdData"+ new Date());

            $("#data_id").val(diad);
            $.getJSON("http://www.tushu.com/grab_load?dataid="+diad,function(data){

                if(data == "" || data == undefined){
                    //console.log('还有一点点就完成数据加载了，请继续等待...');
                    tsDialog.open('<div><p class="load_img">还有一点点就完成数据加载了，请继续等待...</p><div class="tc pb10"><a id="retry_get_dataid" class="tsD_btn" href="javascript:void(0)">继 续</a></div></div>');
                    $("i.tsClose").remove();
                    $("#retry_get_dataid").live("click",function(){
                        tsDialog.close();
                        setDataIdGetData(diad);
                    });
                }else{
                    setDIdgetJaon(data);
                }

            });
        }
        function setDIdgetJaon(dataj){
            //console.log("<--------.end data ok")
            whole_data = dataj;
            whole_data_length = whole_data.length;
            setData_time(whole_data,whole_data_length);

            //初始化价格信息
            countMoney();
        }

    }

    //初始化时间
    function setData_time(data,length){
       //console.log("go in setData_time");
        data_area.start_date = [ data[length-1].created_at_tuple[0], data[length-1].created_at_tuple[1] ];
        data_area.end_date = [ data[0].created_at_tuple[0], data[0].created_at_tuple[1] ];
        //console.log( Number(data[length-1].created_at_tuple[0]) + " (=)  " + Number(data[length-1].created_at_tuple[1]) )
        $("#start_year").val(data_area.start_date[0]);
        $("#start_month").val(data_area.start_date[1]);
        $("#end_year").val(data_area.end_date[0]);
        $("#end_month").val(data_area.end_date[1]);


        //$("#data_area").val(JSON.stringify(data_area));

        setWeiboDate(data_area.start_date[0],data_area.start_date[1],data_area.end_date[0],data_area.end_date[1]);

    }

    //初始化可操作数据
    function setJsonData(){
       //console.log("setJsonData.................ok |--->");
        //获取新的日期，设置wb_datas.whole数据
        getDate_setWhole();

        //wb_datas.whole.d_json = whole_data;
        //wb_datas.whole.d_length = wb_datas.whole.d_json.length;

        //数据拆分主方法
        splitPage("whole");
    }

    //获取新的日期，设置wb_datas.whole数据
    function getDate_setWhole(){
        wb_datas.whole.d_json = [];
        wb_datas.whole.d_length = 0;

        data_area.black_list = [];
        //console.log("1-1.   getData_setWhole black_list.length : "+ data_area.black_list.length)
        //console.log("1-2.   getData_setWhole wb_datas.notselect.d_length : "+ wb_datas.notselect.d_length)

        //var d_dd =  ? data_area.black_list : wb_datas.notselect.d_length;

        for(var i in whole_data){
            if(
                (data_area.end_date[0] * 12 + data_area.end_date[1]) >= (whole_data[i].created_at_tuple[0] * 12 + whole_data[i].created_at_tuple[1]) &&

                (data_area.start_date[0] * 12 + data_area.start_date[1]) <= (whole_data[i].created_at_tuple[0] * 12 + whole_data[i].created_at_tuple[1])
            ){

                wb_datas.whole.d_json.push(whole_data[i]);
                wb_datas.whole.d_length++;
            }
        }
        if(wb_datas.whole.d_length > 0){
            for(var j in wb_datas.whole.d_json){
                if(wb_datas.whole.d_json[j].checked == false){
                    data_area.black_list.push(wb_datas.whole.d_json[j].id);
                }
            }
        }

        if(data_area.black_list.length > 0){
            $(".onoffJs a").eq(0).removeClass("on").siblings().attr("class","on");
        }else{
            $(".onoffJs a").eq(1).removeClass("on").siblings().attr("class","on")
        }

        //data_area.black_list = new_black_list;

        //console.log("2.    getData_setWhole new_black_list.length : "+ new_black_list.length)
    }


    //标签点击
    $(".datas_tag").find("li").live("click",function(){

        var d_type = $(this).attr("rel");
        check = d_type;
        switch (d_type) {
            case "selected" :
                var n = 0;
                wb_datas.selected.d_json = [];
                for(var i in wb_datas.whole.d_json){
                    if(wb_datas.whole.d_json[i].checked != false){

                        wb_datas.selected.d_json[n] = wb_datas.whole.d_json[i];

                        n++;
                    }
                }
                //check = "selected";
                wb_datas.selected.d_length = n;
                break;
            case "notselect" :
                var n = 0;
                wb_datas.notselect.d_json = [];
                for(var i in wb_datas.whole.d_json){
                    if(wb_datas.whole.d_json[i].checked == false){

                        wb_datas.notselect.d_json.push(wb_datas.whole.d_json[i]);

                        n++;
                    }
                }
                wb_datas.notselect.d_length = n;
                break;
            default :
                wb_datas.source = [];
                searchSource();

        }
        //console.log(eval("wb_datas."+d_type+".d_length"))
        if($(this).attr("class") != "on" && d_type != "source"){
            splitPage(d_type);
        }
        $(this).addClass("on").siblings().removeClass("on");
    });

    //筛选来源
    function searchSource(){
        wb_datas.source = [];
        for(var i in wb_datas.whole.d_json){

            var bb = {},n = 0;
            if (wb_datas.source[(wb_datas.whole.d_json[i].source_text)]) {
               bb = wb_datas.source[(wb_datas.whole.d_json[i].source_text)];
            }
            bb.selected = (bb.selected? bb.selected : 0) + (wb_datas.whole.d_json[i].checked === false ? 0 :1);
            bb.total = (bb.total ? bb.total : 0) + 1;
            bb.name = wb_datas.whole.d_json[i].source_text;
            //console.log(wb_datas.whole.d_json[i].checked);
            wb_datas.source[(wb_datas.whole.d_json[i].source_text)] = bb;

        }
        viewSource(check);
    }

    //复选框点击
    $("input[type='checkbox']").live("change",function(){
        var $this = $(this);
        var did = $this.attr("data-id");

        var n = $this.parent().parent(".datas_list").attr("data-num");


        if($this.attr("checked") == "checked"){
            for(var i in wb_datas.whole.d_json){
                if(wb_datas.whole.d_json[i].id == did){
                    delete wb_datas.whole.d_json[i].checked;
                    continue;
                }
            }
        }else{

            for(var i in wb_datas.whole.d_json){
                if(wb_datas.whole.d_json[i].id == did){
                    wb_datas.whole.d_json[i].checked = false;
                    continue;
                }
            }

        }


    });

    //翻页
    function click_num(e){
        var num = 0;
       //console.log("=====***    "+ check)
        var len = eval("wb_datas."+check+".d_page");
        if(typeof e === "string"){
            if(e == "+"){
                if(click_on_num < len - 1){
                    num = click_on_num + 1;
                }
            }else{
                if(click_on_num > 0){
                    num = click_on_num - 1;
                }
            }
        }else{
            num = e;
        }

        viewData(check,len,list_len,num);
       //console.log("TYPE = "+ check +" NUM = "+num+"\nVALUE = \n"+ list_len)
        click_on_num = num;
        $("#page_box").find("select").val(click_on_num);
       //console.log("sum num : "+len + ", page num : "+click_on_num+1)
    }

/* end */
