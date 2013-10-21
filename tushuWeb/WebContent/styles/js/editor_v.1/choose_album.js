window.onbeforeunload=function(){
//    var FlexUploader = thisMovie2("FlexUploader");
//    return '如果现在关闭窗口，请确定该涂书已经保存。';
};

var sz = {
    obj : $(window),
    getW : function(e){
        if(e == undefined){
            return this.obj.width();
        }else{
            return eval('$("'+e+'")').width();
        }
    },
    getH : function(e){
        if(e == undefined){
            return this.obj.height();
        }else{
            return eval('$("'+e+'")').height();
        }
    }
};
var pageNum = 0,a_num = 0,page_url = "";

var shade = {
    elmt:"shade",
    open:function(){
        if($("."+this.elmt).length > 0){
            return;
        }else{
            $("<div></div>").addClass(this.elmt).appendTo("body").css({opacity:0,width:sz.getW(),height:sz.getH("html,body")}).animate({opacity:.5},200);
        }
    },
    close:function(){
        $("."+this.elmt).animate({opacity:0},300,function(){$(this).remove()});
    }
};

//清除value
var inputValueClear = function($this,per,val){
    if(document.all){
        $this.attr("value",per).css({color:"#777"});
        $this.focus(function(){
            if($this.attr("value") == per){
                $this.attr("value","").css({color:"#000"});
            }
        }).blur(function(){
            if($this.attr("value") == ""){
                $this.attr("value",per).css({color:"#777"});
            }
        });
    }
};


//返回按钮
var backFun = function($this,$back){
    $back.bind("click",function(){
        pageNum = 0;
        $this.animate({marginLeft:$(".openWin").width()},300,function(){$(this).remove()});
    });
}
//小范围loading
var chooseLoad = {
    show:function(){
        if(document.all){
            $("<div class='chooseLoad'></div>").appendTo("#ow");
        }else{
            $("<div class='chooseLoad'></div>").appendTo("#ow").css({opacity:0}).animate({opacity:0.4},200);
        }
    },
    hide:function(){
        $(".chooseLoad").remove();
    }
};

//获取flash对象
function thisMovie(movieName) {
    //return document[movieName];
    if (navigator.appName.indexOf("Microsoft") != -1) {
        return window[movieName];
    }
    else {
        return document[movieName];
    }
}
//连续请求 Promise
var Promise = function () {
    this.thens = [];
};
Promise.prototype = {
    resolve: function () {
        var t = this.thens.shift(), n;
        t && (n = t.apply(null, arguments), n instanceof Promise && (n.thens = this.thens));
    },
    then: function (n) {
        return this.thens.push(n), this;
    }
}

//打开主窗口
function openWindow(callback){

    shade.open();

    $("<div class='chooseAlbum'><i class='ow_close'></i><div id='ow' class='openWin'><div class='chooseTitle'>添加照片</div></div></div>").appendTo("body").css({opacity:0,top:((sz.getH()-sz.getH("#ow"))/2 > 0 ? (sz.getH()-sz.getH("#ow"))/2 : 0),left:(sz.getW()-sz.getW("#ow"))/2}).animate({opacity:1},200);
    $("head").append("<script type='text/javascript' src='/images/choose/leadIn/leadIn.js?ver="+Math.round(Math.random()*1000000)+"'><\/script>");

       // idnum = 1;

    //$(".liLogoBox img").not($(".liLogoBox img").eq(0)).bind("click",function(){
    $(".liLogoBox img").bind("click",function(){
        chooseLoad.show();
        var ut = $(this).attr("ut");
        getAlbum(ut,0,callback);
    });
/*
    $(".liLogoBox img:first").bind("click",function(){
        var FlexUploader = thisMovie("FlexUploader");
        FlexUploader.uploadFile();
        //ow_close();
    });
*/
    $(".clLogoBox").find("img").bind("click",function(){
        var $this = $(this);
        var $cl = {
            "name"  :   $this.attr("alt"),
            "id"    :   $this.attr("relname")
        };


        var clStr = '<div class="moreTitle">'+$cl.name+'</div>';
        clStr += '<div class="clMain"><input type="text" class="clText" placeholder="将您想要导入的'+$cl.name+'地址拷贝到这里" /><input type="button" value="'+$cl.id+'" name="'+$cl.name+'" class="clBtn" /></div>';
        clStr += '<em class="block">目前只能导入公开的相册</em></div>';
        $(".clBox").html(clStr);
        inputValueClear($(".clText[type='text']"),$(".clText[type='text']").attr("placeholder"),$(".clText[type='text']").attr("value"));
        if(!document.all){
            $this.parent().css({opacity:1}).attr("id","opa").siblings().css({opacity:.3,backgroundColor:"#fff"}).removeAttr("id");
            $(".clLogoBox span span").hover(function(){$(this).css({opacity:1})},function(){$(this).attr("id") == "opa" ? $(this).css({opacity:1}) : $(this).css({opacity:.3});});
        }
        $(".clText[type='text']").bind("keydown",function(e){
            if(e.keyCode == 13){
                chooseLoad.show();
                var urls = $(".clText[type='text']").val();
                if(urls == ""){
                    prompts(1,"此处不能为空！请重新输入！");
                        chooseLoad.hide();
                    return false;
                }
                var count = {
                    "url"   : "http://www.tushu.com/grab_v08",
                    "name"  : $(".clBtn[type='button']").attr("name"),
                    "type"  : $(".clBtn[type='button']").val(),
                    "urlVal": urls,
                    "callback" : callback

                }

                $.getJSON(count.url,{
                    "source" : count.type,
                    "urls"   : urls
                },function(data){
                    if(data.error_msg != "" || data.data.length <= 0){
                        prompts(1,data.error_msg == "" ? "很遗憾，相册相片为空！请重新选择！" : data.error_msg);
                        chooseLoad.hide();
                        $(".clText[type='text']").val("");
                    }else{
                        if(data.data[0].element == undefined){
                            openAlbum(data,count);
                        }else{
                            openPhoto(data,count.name,count);
                        }
                    }
                });
            }
        });

        $(".clBtn[type='button']").bind("click",function(){
            chooseLoad.show();
            var urls = $(".clText[type='text']").val();
            if(urls == ""){
                prompts(1,"此处不能为空！请重新输入！")
                chooseLoad.hide();
                return false;
            }
            var count = {
                "url"   : "http://www.tushu.com/grab_v08",
                "name"  : $(".clBtn[type='button']").attr("name"),
                "type"  : $(".clBtn[type='button']").val(),
                "urlVal": urls,
                "callback" : callback

            }

            $.getJSON(count.url,{
                "source" : count.type,
                "urls"   : urls
            },function(data){
                if(data.error_msg != "" || data.data.length <= 0){
                    prompts(1,data.error_msg == "" ? "很遗憾，相册相片为空！请重新选择！" : data.error_msg);
                    chooseLoad.hide();
                    $(".clText[type='text']").val("");
                }else{
                    if(data.data[0].element == undefined){
                        openAlbum(data,count);
                    }else{
                        openPhoto(data,count.name,count);
                    }
                }
            });
        });

    });


    $(".ow_close").bind("click",function(){
        var FlexUploader = thisMovie("FlexUploader");
        FlexUploader.closeAddTable();
        ow_close()
    });
}
//关闭全部
function ow_close(){
    shade.close();
    pageNum = 0;
    $(".chooseAlbum").animate({opacity:0},200,function(){$(this).remove();});
}
var goPlace;
//请求相册\用户页
function getAlbum(ut,mold,callback){
//console.log("一进来 = "+mold);
    $.getJSON("http://www.tushu.com/user/get_third_token",{
        "ut" : ut
    },function(data){

//console.log("一请求 = "+mold);
        var leadType = $(".liLogoBox img[ut="+ut+"]").attr("relname");
        var leadName = $(".liLogoBox img[ut="+ut+"]").attr("alt");
        var leadUrl = $(".liLogoBox img[ut="+ut+"]").attr("web_url");
        if(data.third_token == "" || data.third_account == ""){
            //alert(data.third_token+" , "+data.third_account)
            if(mold == 2){

//console.log("请求完 token为null = "+mold);
                goPlace = setTimeout("getAlbum("+ut+",2)",5000);
            }else if(mold == 1){
                clearTimeout(goPlace);
                $(".appInterLinkPage").find(".backBtn").click();
                prompts(1,"系统错误！");
            }else{
                appInter(leadType,leadName,ut,leadUrl);
            }
        }else{
            clearTimeout(goPlace);
			if (ut) {
				ut = ut.toString();
			}
			if (!callback) {
				callback = 'addTable';
			}
            switch (ut) {
                case "2" :
                    // 2 = 新浪微博
                    var lType = leadType.toLowerCase();
                    var count = {
                        "url"         : "http://www.tushu.com/grab_proxy",
                        "name"        : leadName,
                        "type"        : leadType,
                        "source"      : lType,
                        "ut"          : ut,
                        "wurl"        : leadUrl,
                        "api_user"    : "get"+lType+"_user",
                        "api_friends" : "get"+lType+"_follow",
                        "user"        : data.third_account,
                        "token"       : data.third_token,
                        "callback"    : callback
                    }
                    $.getJSON(count.url,{
                        "source": count.source,
                        "api"   : count.api_user,
                        "user"  : count.user
                    },function(udata){
                        $.getJSON(count.url,{
                            "source": count.source,
                            "api"   : count.api_friends,
                            "user"  : count.user,
                            "token" : count.token
                        },function(fdata){
                            $(".appInterLinkPage").find(".backBtn").click();
                            openUser(udata,fdata,count);
                        });
                    });
                    break;
                case "8" :
                    // 8 = 人人相册
                    var count = {
                        "url"   : "http://www.tushu.com/grab_v08",
                        "name"  : leadName,
                        "type"  : leadType,
                        "ut"    : ut,
                        "wurl"  : leadUrl,
                        "uids"  : data.third_account,
                        "access_token": data.third_token,
                        "callback"    : callback

                    }
//console.log("获得UT=8，"+count.url);
                    $.getJSON(count.url,{
                        "source"        : leadType+"_album",
                        "uids"          : count.uids,
                        "access_token"  : count.access_token
                    },function(data){
//console.log("返回相册数量 = "+data.data.length);
                        if(data.data.length == 0){
                            if(data.error_msg == ""){
                                prompts(1,"没有相册！");
                                chooseLoad.hide();
                            }else{
                                //prompts(1,data.error_msg);
                                appInter(count.type,count.name,count.ut,count.wurl);
                            }
                        }else{
                            $(".appInterLinkPage").find(".backBtn").click();
                            openAlbum(data,count);
                        }
                    });
                    break;
                default:
                    prompts(1,"系统错误！");
            }
        }
    });
}

//请求ing
//授权请求页
function appInter(type,name,ut,wurl){
    var iconUrl = "/images/choose/leadIn/"+type+"/";
    var linkUrl = wurl;
    var appStr = '<div class="appInterPage al-' + type + ' openWin"><div class="chooseTitle"><div class="backBtn">返回</div><div class="al-title"><img src="'+iconUrl+'s.png" />' + name + '</div></div><div class="appInterBox">';

    appStr += '<div class="appInterMain"><p>你需要授权涂书网访问您的'+name+'来添加其中的内容，</p><p>点击下面按钮开始授权</p></div><div class="appInterBtn"><a href="'+linkUrl+'" target="_blank" style="background-image:url('+iconUrl+'img/btn.png);color:#fff">前往'+name+'授权</a></div>';
    appStr += '</div></div>';

    $(appStr).appendTo("#ow").css({top:0,left:0,marginLeft:$(".openWin").width()}).animate({marginLeft:0},300,function(){
        chooseLoad.hide();
    });


    setC('is_related', 1, 1);
    var $this = $(".appInterPage");
    var $back = $this.find(".backBtn");
    backFun($this,$back);

    $this.find(".appInterBtn").find("a").bind("click",function(){
        chooseLoad.show();
        appInterLink(type,name,ut,wurl);
    });



}

//授权完成页
function appInterLink(type,name,ut,wurl){
    var iurl = "/images/choose/leadIn/"+type+"/";
    var lurl = wurl;



    var applStr = '<div class="appInterLinkPage al-' + type + ' openWin"><div class="chooseTitle"><div class="backBtn">返回</div><div class="al-title"><img src="'+iurl+'s.png" />' + name + '</div></div><div class="appInterBox">';

    applStr += '<div class="appInterMain"><p class="pt32">您需要授权涂书网访问您的'+name+'来添加其中的内容</p></div><div class="appInterBtn"><span class="appGetBtn" style="background-image:url('+iurl+'img/btn.png);color:#fff">我已授权</span><span class="backBtn" onclick="clearTimeout(goPlace);">重试</span></div>';
    applStr += '</div></div>';

    $(applStr).appendTo("#ow").css({top:0,left:0,marginLeft:$(".openWin").width()}).animate({marginLeft:0},300,function(){
        chooseLoad.hide();
    });

    getAlbum(ut,2);

    var $this = $(".appInterLinkPage");
    var $back = $(".appInterLinkPage").find(".backBtn");
    backFun($this,$back);

    $(".appGetBtn").bind("click",function(){
		deleteCookie('is_related');
        chooseLoad.show();
        getAlbum(ut,1);
    });
}



//打开相册页
function openAlbum(albumJSON,count){
    //alert(JSON.stringify(albumJSON))
        /*if(albumJSON.error_msg != ""){
            prompts(1,albumJSON.error_msg);
            return false;
        }*/
        var albumStr = '<div class="AlbumList al-' + count.type + ' openWin"><div class="chooseTitle"><div class="backBtn">返回</div><div class="al-title"><img src="/images/choose/leadIn/'+count.type+'/s.png" />' + count.name + '</div></div><div><ul class="albumListBox">';

        for(var i=0;i<albumJSON.data.length;i++){
            albumStr += '<li><b class="block"><img id="_aiImg_'+i+'" src="'+albumJSON.data[i].smallphoto+'" alt="'+albumJSON.data[i].title+'" photo_count="'+albumJSON.data[i].photo_count+'" aid="'+albumJSON.data[i].aid+'"  /></b><strong class="block">['+albumJSON.data[i].title+']</strong><span class="block">'+albumJSON.data[i].count+'张照片</span></li>';
        }

        albumStr += '</ul></div></div>';
        $(albumStr).appendTo("#ow").css({top:0,left:0,marginLeft:$(".openWin").width()}).animate({marginLeft:0},300,function(){
            chooseLoad.hide();
        });

        var vl = $(".albumListBox li").length;
        for(var i=0;i<vl;i++){
            document.getElementById("_aiImg_"+i).onload = function(){
            //var $t = this;
                var ai_w = this.offsetWidth;
                var ai_h = this.offsetHeight;
                if(ai_w > ai_h){
                    var lv = ai_w/165;
                    this.style.width = 165 + "px";
                    this.style.marginTop = ((117 - (ai_h/lv))/2) + "px";
                }else{
                    this.style.height = 117 + "px";
                }
            }
        }

        var $this = $(".AlbumList");
        var $back = $(".AlbumList").find(".backBtn");
        backFun($this,$back);

        //绑定相册事件
        $(".albumListBox li").bind("click",function(){
            chooseLoad.show();
            var nn = $(this).index();
            //alert(nn)
            var photoCound = $(this).find("img").attr("photo_count");
            var photoAid = $(this).find("img").attr("aid");
            var photoTitle = $(this).find("img").attr("alt");
            var photoSrc = $(this).find("img").attr("src");//albumJSON.data[$(this).find("b.block").find("img").index()].smallphoto;

            var ctType;
            if(count.type == "renren"){
                 $.getJSON("http://www.tushu.com/grab_v08",{
                    "source"        : count.type+"_photo",
                    "uids"          : count.uids,
                    "access_token"  : count.access_token,
                    "aid"           : photoAid
                },function(data){

                    openPhoto(data,photoTitle,count,photoSrc,photoAid);
                });
            }else{

                    //alert("http://www.tushu.com/grab_v08?source="+count.type+"&uids="+albumJSON.data[nn].href+" , "+nn);
                 $.getJSON("http://www.tushu.com/grab_v08",{
                    "source"    : count.type,
                    "urls"      : albumJSON.data[nn].href
                },function(data){
                    pageNum = 0;
                    //alert(JSON.stringify(albumJSON));
					count['urlVal'] = albumJSON.data[nn].href;
                    page_url = data.next_url;
                    openPhoto(data,photoTitle,count,photoSrc,photoAid);
                });
            }

        });


}


//打开相片页
function openPhoto(photoJSON,title,count,src,aid){
    //alert(src)

    if(photoJSON.error_msg != ""){
        prompts(1,photoJSON.error_msg);
        chooseLoad.hide();
        return false;
    }
    if(pageNum == 0){


        var plStr = '<div class="PhotoList al-' + count.type + ' openWin"><div class="chooseTitle"><div class="backBtn">'+count.name+'</div><div class="al-title"><img src="/images/choose/leadIn/'+count.type+'/s.png" />' + count.name + ' - ' + title + '</div></div><div><ul class="photoListBox" id="photoList"></ul></div><div class="photoBtn tc"><span>添加到边栏相册</span></div></div>';


        $(plStr).appendTo("#ow").css({top:0,left:0,marginLeft:$(".openWin").width()}).animate({marginLeft:0},300,function(){
            chooseLoad.hide();
        });
        for(var i=0;i<photoJSON.data.length;i++){
            $('<li><img id="_phImg_'+i+'" src="'+photoJSON.data[i].showimage+'" alt="'+count.name+'"  pid="'+photoJSON.data[i].id+'"   /></li>').appendTo(".photoListBox");
            document.getElementById("_phImg_"+i).onload = function(){

                var ph_w = this.offsetWidth;
                var ph_h = this.offsetHeight;
                if(ph_w > ph_h){
                    var lv = ph_w/140;
                    this.style.width = 140 + "px";
                    this.style.marginTop = ((140 - (ph_h/lv))/2) + "px";
                }else{
                    this.style.height = 140 + "px";
                }

            }
            a_num += i;
        }
        pageNum += 1;



        $(".photoBtn span").bind("click",function(){

            if(aid == undefined){

                getUrlFlash(count,'http://www.tushu.com/images/choose/leadIn/'+count.type+'/s.png');

            }else{
                if(count.type != "renren"){
                    getUrlFlash(count,src);
                }else{
                    getAlbumFlash(count,title,src,aid);
                }
            }
        });

        var $this = $(".PhotoList");
        var $back = $(".PhotoList").find(".backBtn");
        backFun($this,$back);


    }else{
        //alert(pageNum)
        for(var i=0;i<photoJSON.data.length;i++){
            a_num += i;
            $('<li><img id="_phImg_'+a_num+'" src="'+photoJSON.data[i].showimage+'" alt="'+count.name+'"  pid="'+photoJSON.data[i].id+'"   /></li>').appendTo(".photoListBox");
            document.getElementById("_phImg_"+a_num).onload = function(){

                var ph_w = this.offsetWidth;
                var ph_h = this.offsetHeight;
                if(ph_w > ph_h){
                    var lv = ph_w/140;
                    this.style.width = 140 + "px";
                    this.style.marginTop = ((140 - (ph_h/lv))/2) + "px";
                }else{
                    this.style.height = 140 + "px";
                }

            }
            chooseLoad.hide();
        }
    }

    if(photoJSON.next_url != null){
        $("<li class='more_photo'>浏览更多</li>").appendTo(".photoListBox");
    }




    //alert(JSON.stringify(photoJSON.next_url)+" ---- "+JSON.stringify(photoJSON))





    if(page_url != null){
        pageNum += 1;
        $(".more_photo").bind("click",function(){
            chooseLoad.show();
            $.getJSON(photoJSON.next_url,function(data){
                $(".more_photo").remove();

                page_url = data.next_url;
                openPhoto(data,title,count,src,aid);
            });

        });
    }



}



//打开用户及好友列表
function openUser(userJSON,friendJSON,count){

    var flen = friendJSON.users.length;
    var fjson = [];

    function getFriend(data){
        var len = data.users.length;
        var str = "";
        for(var i=0;i<len;i++){
            fjson[i] = data.users[i];
            str += '<div class="fBox"><img src="'+data.users[i].profile_image_url+'" /><span class="block">'+data.users[i].screen_name+'</span></div>';
        }
        return str;
    }

    var userStr = '<div class="chooseUser al-' + count.source + ' openWin"><div class="chooseTitle"><div class="backBtn">返回</div><div class="al-title"><img src="/images/choose/leadIn/'+count.type+'/s.png" />' + count.name + '</div></div><div class="userBox tc">';

    userStr += '<span class="block">我的微博</span><img src="'+userJSON.avatar_large+'" alt="'+userJSON.screen_name+'" uid="'+userJSON.id+'" /><span class="block userName">'+userJSON.screen_name+'</span>'
    userStr += '</div><div class="friendBox">';

    userStr += '<div class="friendTitle">我的朋友</div>';
    userStr += '<div class="friendMain"><b class="leftFriend"></b><div class="fmainBox"><div id="fmain">';

    userStr += getFriend(friendJSON);

    userStr += '</div></div><b class="rightFriend"></b></div>';
    userStr += '<div class="searchBox clearfix"><label>昵称导入</label><div class="searchInp"><input type="text" placeholder="在这里输入想要添加的'+name+'昵称"  /></div><input class="searchBtn" value="导 入" type="button" /></div>';

    userStr += '</div></div>';
    $(userStr).appendTo("#ow").css({top:0,left:0,marginLeft:$(".openWin").width()}).animate({marginLeft:0},300,function(){
        chooseLoad.hide();
    });

    inputValueClear($(".searchInp").find("input[type='text']"),$(".searchInp").find("input[type='text']").attr("placeholder"),$(".searchInp").find("input[type='text']").attr("value"));


    var $this = $(".chooseUser");
    var $back = $(".chooseUser").find(".backBtn");
    backFun($this,$back);


    var fWidth = {
        width       :   $(".fBox").width()*$(".fBox").length,
        line_length :   9,
        box         :   $(".fBox").width(),
        line_box    :   function(){return this.box * this.line_length},
        setWidth    :   function(){
            $("#fmain").width(this.width);
            if(this.width < this.line_box){
                $(".friendMain b").css({visibility:"hidden"});
            }
        }
    }
    fWidth.setWidth();

    var page_num = 1;


    //左右按钮
    var marginL = 0;
    $(".leftFriend").bind("click",function(){
        $(".rightFriend").css({backgroundPosition:"top right",cursor:"pointer"});
        if(marginL - fWidth.line_box() >= fWidth.line_box()){
            $("#fmain").stop(false,false).animate({marginLeft:-(marginL-fWidth.line_box())},300,function(){
                marginL -= fWidth.line_box();
            });
        }else{
            $("#fmain").stop(false,false).animate({marginLeft:0},300,function(){
                $(".leftFriend").css({backgroundPosition:"bottom left",cursor:"default"});
            });
            marginL = 0;
        }
    });
    $(".rightFriend").bind("click",function(){
        $(".leftFriend").css({backgroundPosition:"top left",cursor:"pointer"});
        if(fWidth.width - marginL > fWidth.line_box()){

            var run = fWidth.width - marginL - fWidth.line_box() > fWidth.line_box() ? fWidth.line_box() : fWidth.width - marginL - fWidth.line_box();

            $("#fmain").stop(false,false).animate({marginLeft:-(run+marginL)},300,function(){

                marginL += fWidth.line_box();

                if(fWidth.width - Math.abs(marginL) < fWidth.line_box()){
                    page_num += 1;
                    $.getJSON(count.url,{
                        "source": count.source,
                        "api"   : count.api_friends,
                        "user"  : count.user,
                        "page"  : page_num,
                        "token" : count.token
                    },function(data){
                        if(data.next_cursor > fWidth.line_length){
                            $("#fmain").append(getFriend(data)).width($(".fBox").width()*$(".fBox").length);
                            fWidth.width = $(".fBox").width()*$(".fBox").length;
                        }else{
                            $("#fmain").stop(false,false).animate({marginLeft:-(fWidth.width - fWidth.line_box())},300,function(){
                                $(".rightFriend").css({backgroundPosition:"bottom right",cursor:"default"});
                            });
                        }

                    });
                }else{

                }
            });
        }else{
        }
    });

    $(".userBox img").live("click",function(){
        getUserFlash(userJSON,count);
    });

    $("#fmain").find("img").bind("click",function(){
        var ind = $(this).parent().index();
        getUserFlash(fjson[ind],count);
    });

    $(".searchBtn").bind("click",function(){

        var jjn = {
            "id"  :   encodeURI($(".searchInp input").val()),
            "screen_name" : $(".searchInp input").val()
        };
        if(jjn.id == ""){
            prompts(1,"微博昵称不能为空！请重新输入！");
            chooseLoad.hide();
            return false;
        }


        $.getJSON("http://www.tushu.com/grab_proxy",{
            "source":"weibo",
            "api":"getweibo_user",
            "user" : encodeURI($(".searchInp input").val())
        },function(data){
             if(data.error_msg != undefined){
                    prompts(1,data.error_msg);
                    return false;
                }else{
                    getUserFlash(jjn,count);
             }
        });




    });
    $(".searchInp input").bind('input', function(e){
        var friendListBox = "";
		var jjn = {
                "id"  :   encodeURIComponent($(".searchInp input").val()),
                "screen_name" : $(".searchInp input").val()
            };
        if(e.keyCode == 13){

            if(jjn.id == ""){
                prompts(1,"微博昵称不能为空！请重新输入！");
                chooseLoad.hide();
                return false;
            }
            $.getJSON("http://www.tushu.com/grab_proxy",{
                "source":"weibo",
                "api":"getweibo_user",
                "user" : encodeURIComponent($(".searchInp input").val())
            },function(data){
                if(data.error_msg != undefined){
                    prompts(1,data.error_msg);
                    return false;
                }else{
                    getUserFlash(jjn,count);
                }
            });
        }else{
			if (window.friends && window.friends.length>0){
				$(".searchInp .friendList").remove();
				if (!jjn.id || !$.trim(jjn.id)) {
					$(".searchInp .friendList").remove();
				}
				else {
					//var reg = new RegExp(jjn.id, 'gi');
					var flObj = [];
					$.each(window.friends, function(i, v) {
							var name = v.name;
							var tid = decodeURIComponent(jjn.id);
							if (name.indexOf(tid)>=0 || name.indexOf(jjn.id)>=0) {
								v.imgUrl = v.profile_image_url;
								flObj.push(v);
							}
					});
					if (!flObj || flObj.length<=0){
						$(".searchInp .friendList").remove();
					}
					var friendList = '';
					for(var i=0;i<flObj.length;i++){
						friendList += '<li><img src="' + flObj[i].imgUrl + '" /><span>' + flObj[i].name + '</span></li>';
					}
					friendListBox = '<div class="friendList"><ul>' + friendList + '</ul></div>';

					$(".searchInp .friendList").remove();
					$(".searchInp").prepend(friendListBox);

					$(".friendList").find("li").bind("click",function(){
						var n = $(this).index();
						var jjn = {
							"id"  :   encodeURIComponent(flObj[n].name),
							"screen_name" : flObj[n].name
						};
						getUserFlash(jjn,count);

					});
					return;
					if (flObj.length>0) {
						return;
					}
				}
			}
            //keydown function
		  var url = '/choose/suggestion_once_request';
		  $.post(url, {key: jjn.id}, function(da){
			var flObj = [
				//{"name" : "测试名称", "imgUrl" : "http://tp3.sinaimg.cn/1659574154/50/5617887723/1"},
				//{"name" : "测试名称", "imgUrl" : "http://tp2.sinaimg.cn/3306553825/50/5658094559/0"},
				//{"name" : "测试名称", "imgUrl" : "http://tp4.sinaimg.cn/2372143687/50/40002063116/0"},
				//{"name" : "测试名称", "imgUrl" : "http://tp2.sinaimg.cn/3306553825/50/5658094559/0"},
				//{"name" : "测试名称", "imgUrl" : "http://tp4.sinaimg.cn/2372143687/50/40002063116/0"},
				//{"name" : "测试名称", "imgUrl" : "http://tp2.sinaimg.cn/3306553825/50/5658094559/0"},
				//{"name" : "测试名称", "imgUrl" : "http://tp4.sinaimg.cn/2372143687/50/40002063116/0"},
				//{"name" : "测试名称", "imgUrl" : "http://tp2.sinaimg.cn/3306553825/50/5658094559/0"},
				//{"name" : "测试名称", "imgUrl" : "http://tp4.sinaimg.cn/2372143687/50/40002063116/0"},
				//{"name" : "测试名称", "imgUrl" : "http://tp2.sinaimg.cn/3306553825/50/5658094559/0"},
				//{"name" : "测试名称", "imgUrl" : "http://tp4.sinaimg.cn/2372143687/50/40002063116/0"}
			];
			if (typeof(da) == 'string') {
				da = eval('(' + da + ')');
			}

			if (da.status == 200 && da.data && da.data.friends && da.data.friends.length > 0) {
				window.friends = da.data.friends;
			}
			if (da.status == 200 && da.data.searched && da.data.searched.length>0){
				$.each(da.data.searched, function(i,v) {
						flObj.push({name: v.screen_name, imgUrl: v.profile_image_url});
					});
			}
			else {
				$(".searchInp .friendList").remove();
				return;
			}

			var friendList = '';
			for(var i=0;i<flObj.length;i++){
				friendList += '<li><img src="' + flObj[i].imgUrl + '" /><span>' + flObj[i].name + '</span></li>';
			}
			friendListBox = '<div class="friendList"><ul>' + friendList + '</ul></div>';

			$(".searchInp .friendList").remove();
			$(".searchInp").prepend(friendListBox);

			$(".friendList").find("li").bind("click",function(){
				var n = $(this).index();
				var jjn = {
					"id"  :   encodeURIComponent(flObj[n].name),
					"screen_name" : flObj[n].name
				};
				getUserFlash(jjn,count);

			});
		  });
        }

    });

}

function getUserFlash(jsons,count){
     var fstr = {
        "iconUrl"   :   "http://platform.tushu.com/grab_redirect?source=weibo&api=getweibo_user&key=profile_image_url&user="+jsons.id,
        "name"      :   "来自："+jsons.screen_name+"的微博",
        "url"       :   "http://platform.tushu.com/grab_v08?source=weibo&user="+jsons.id,
        "type"      :   "Weibo",
        "iconID"    :   ["WeiBoDefault","WeiboMouseOver","WeiboMouseDown"],
        "selected"  :   false,
        "click"     :   "",
        "removedable":  true,
        "sortable"  :   {"time":"时间"}
    };
    //alert(fstr.type);
    var FlexUploader = thisMovie("FlexUploader");

    var jsonText = JSON.stringify(fstr);
    //alert(jsonText);
    eval("FlexUploader."+count.callback+"(jsonText)");
    ow_close();
}

function getAlbumFlash(count,title,src,aid){
     var fstr = {
        "iconUrl"   :   src,
        "name"      :   "来自："+title+"的相册",
        "url"       :   "http://platform.tushu.com/grab_v08?source="+count.type+"_photo&uids="+count.uids+"&access_token="+count.access_token+"&aid="+aid,
        "type"      :   count.type,
        "iconID"    :   [count.type+"Default",count.type+"MouseOver",count.type+"MouseDown"],
        "selected"  :   false,
        "click"     :   "",
        "removedable":  true,
        "sortable"  :   {"time":"时间"}
    };

    //alert(JSON.stringify(fstr));

    var FlexUploader = thisMovie("FlexUploader");
    var jsonText = JSON.stringify(fstr);
    //alert(jsonText);
    eval("FlexUploader."+count.callback+"(jsonText)");
    ow_close();
}

function getUrlFlash(count,src){
     var fstr = {
        "iconUrl"   :   src,
        "name"      :   "来自："+count.name+"的相册",
        "url"       :   "http://platform.tushu.com/grab_v08?source="+count.type+"&urls=" + encodeURIComponent(count.urlVal),
        "type"      :   count.type,
        "iconID"    :   [count.type+"Default",count.type+"MouseOver",count.type+"MouseDown"],
        "selected"  :   false,
        "click"     :   "",
        "removedable":  true,
        "sortable"  :   {"time":"时间"}
    };


    var FlexUploader = thisMovie("FlexUploader");
    var jsonText = JSON.stringify(fstr);
    //alert(jsonText);
    eval("FlexUploader."+count.callback+"(jsonText)");
    ow_close();

}



//模拟绑定编辑器“添加按钮”




function inportFriendFromSite(callback){

    openWindow(callback);
}



// *旧的choose.js中的代码，未整理过，等有时间的...


//公共方法
//宽度获取
function getW(obj){
    obj = typeof obj == "string" ? $(obj) : $(document);
    return parseInt(obj.width());
}
//高度获取
function getH(obj){
    obj = typeof obj == "string" ? $(obj) : $(document);
    return parseInt(obj.height());
}
//关闭浮层
function closeDialog(type,obj){
    var ty = "#";
    if(type == "class"){ty = ".";}
    $("#dialogBg").hide();
    $(ty+obj).hide();

    return false;
}

//关闭浮层
function hiddenDiv(){
    $("#dialogBg").hide();
    $(".dialog_add").hide();
    //var FlexUploader = thisMovie2("FlexUploader");
	//eval('FlexUploader.addTable("")');
    return false;
}

//打开浮层
function showDialog(obj){
    if($("#dialogBg").css("display") == "none"){
        $("#dialogBg").css({width:getW(),height:getH()}).show();
    }else{
        $("#loadDiv").remove();
    }
    if($(obj).css("display") == "none"){
        $(obj).show().css({left:(getW()-getW(obj))/2,top:($(window).height()-$(obj).height())/2});
    }
}

//load层
function loadDiv(bl,num){
    var bool,n,mt,imgW;
    if(num == undefined){
        bool = bl;
        n = "load";
        mt = -135;
        imgW = 380;
        if($("#dialogBg").css("display") == "none"){
            $("#dialogBg").css({width:getW(),height:getH()}).show();
        }
    }else{
        bool = bl;
        n = "load"+num;
        mt = -40;
        imgW = 140;
    }
    if(bool){
        $("body").append("<img src='/img/editor_v.1/"+n+".gif' id='loadDiv' />")
        $("#loadDiv").css({position:"absolute",zIndex:10000,left:"50%",marginLeft:-(imgW/2),top:"50%",marginTop:mt})
        $("#dialogBg").css({width:getW(),height:getH()}).show();

    }else{
        //alert(bl)
        $("#dialogBg").hide();
        $("#loadDiv").remove();
    }
}

//改变窗口大小
/*$(window).resize(function(){
    window.setTimeout(function(){
        if($("#dialogBg").css("display") != "none"){
            $("#dialogBg").css({width:"100%",height:getH()});
        }
        if($(".dialog_add").css("display") != "none"){
            $(".dialog_add").animate({left:(getW()-getW(obj))/2,top:(getH()-getH(obj))/2},200);
        }
    },100);
});
*/
/*
function inportFriendFromSite(callback){
    showDialog(".dialog_add");
    FlexUploader = thisMovie2("FlexUploader");
    choose.options.flashFunc = callback;
}
*/


//弹出警告
function prompts(iid,ptype){
    var icon;
    var txt;

    switch (iid) {
        case 1 :
            icon = "icon_E";
            txt = prompts.err;
            break;
        case 2 :
            icon = "icon_S";
            txt = prompts.warn;
            break;
        case 3 :
            icon = "icon_Q";
            txt = prompts.ques;
    }

    var htmlStr  = '<div class="tbg_box w500"><div class="' + icon + '"></div>';
        htmlStr += '<p class="tbg_p">' + ptype + '</p>';
        htmlStr += '<div class="centerBtn"><i onclick="closeDialog(\'id\',\'nineTab2\')" class="tbg_true">确定</i><!--a href="javascript:closeDialog(\'id\',\'nineTab2\')">取消</a--></div></div>';

    //return htmlStr;
    $("#nineTab2 .tbg_content").html("").append(htmlStr)
    showDialog("#nineTab2");
}


//购物车
function goto_shop(str){
    //alert("aa")
    //参数是 string
    //window.location="/choose/add_cart?book_id" + str;
    //http://www.tushu.com/choose/add_cart?book_id=220025

    loadDiv(true,2);
    $.getJSON("http://www.tushu.com/choose/add_cart?book_id=" + str, function(data){
        if(data.status == 200){
            window.onbeforeunload = function(){};
            window.location = '/cart.html?s=editer';
        }else{
            prompts(1,"添加购物车失败！")
        }
    });
}


/*
ExternalInterface.call("warnElidePrompt",checkEndData);
ExternalInterface.call("pricePromt",checkEndData);


ExternalInterface.addCallback("warnElidePromptCallback",warnElidePromptCallback);
ExternalInterface.addCallback("requestPriceCallback",requestPriceCallback);

ExternalInterface.addCallback("warnElidePromptCallback",warnElidePromptCallback);
ExternalInterface.addCallback("hulueCallback",hulueCallback);
ExternalInterface.addCallback("quedingCallback",quedingCallback);
*/

function pricePromt(ceData){
    //closeDialog('id','nineTab2');

    var FlexUploader = thisMovie2("FlexUploader");
    var strHtml = ""

    strHtml += '<div class="tbg_box w500">';
    strHtml += '    <p class="priceTxt">'+ ceData.price.title +'</p>';
    strHtml += '    <div class="priceBox">';
    strHtml += '        <h2 class="thBg">涂书网商品价格单</h2>';
    strHtml += '        <ul>';
    for(var i=0;i<ceData.price.detail.length;i++){
        strHtml += '            <li class="clearfix"><span class="l">' + ceData.price.detail[i][0] + '(' + ceData.price.detail[i][1] + '页)' + '</span><span class="r"> '+ ceData.price.detail[i][2] +' 元</span></li>';
    }
    strHtml += '        </ul>';
    strHtml += '        <div class="priceSum">合计金额：'+ ceData.price.total +'&nbsp;元<div style="font-size:12px;font-weight:normal;padding-top:5px;color:#666">具体优惠价格请下单后核实</div></div>';
    strHtml += '    </div>';
    strHtml += '    <div class="priceOther"><h3>活动优惠说明：</h3><ul>';
    for(var i=0;i<ceData.price.special.length;i++){
        strHtml += '        <li>'+ (i+1) + '、' + ceData.price.special[i] +'</li>';
    }
    strHtml += '    </ul></div>';
    //strHtml += "<div class='centerBtn'><i onclick='closeDialog(\"id\",\"nineTab2\")'>返回编辑</i><i onclick='shitClick(\"quedingCallback\")'>继续并下单</i></div></div>";
    strHtml += '<div class="centerBtn"><i onclick="closeDialog(\'id\', \'nineTab2\');">返回编辑</i><i onclick="shitClick(\'quedingCallback\',null);">继续并下单</i></div></div>';

    $("#nineTab2 .tbg_content").html("").append(strHtml);

    $("#nineTab2").css({display:"block",left:(getW()-getW("#nineTab2"))/2,top:(getH()-getH("#nineTab2"))/2})
        $("#dialogBg").show();

   // $(".centerBtn:visible a:first").click(function(){});

}


//报错json数据显示弹出框

function warnElidePrompt(jdata){


    var FlexUploader = thisMovie2("FlexUploader");
    var htmlStr  = '<div class="tbg_box w675"><p class="tbg_p">您的涂书已经创建完成，请检查下面表格中是否有需要重新调整的提示，修改后即可下单印制。</p><div class="tbg_other"><p class="iconBox icon_err">错误信息不可忽略，请继续编辑</p><p class="iconBox icon_warn">警告信息可忽略，但显示效果可能与印刷效果有误差</p></div><div class="tbg_table"><div>';
        htmlStr += '<table><tr><th width="100">页码</th><th>问题说明</th><th width="80">操作</th></tr><tr id="table_data"><td colspan="3"><i onclick="closeDialog(\'id\',\'nineTab2\')">刷新</i></td></tr>';
        htmlStr += '</table></div></div><div class="centerBtn"><i onclick="closeDialog(\'id\',\'nineTab2\')" class="tbg_true">返回编辑</i><i onclick="FlexUploader.hulueCallback(\'hl\')">忽略并继续</i></div></div>';
    $("#nineTab2 .tbg_content").html("").append(htmlStr);

    showDialog("#nineTab2");
    warnElideJson(jdata);
}


function shitClick(fun,v){
   $("#dialogBg").hide();
   var FlexUploader = thisMovie2("FlexUploader");
    if(v == null){
        eval("FlexUploader."+fun+"()");
        window.onbeforeunload=function(){return false;};
    }else{
        eval("FlexUploader."+fun+"("+v+")");
    }
    $("#nineTab2").hide();
}



function warnElideJson(jdata){
   // alert(jdata)
    var trStr = "";
    var err_bl = false;
    var report = jdata;

    //alert(report.ignore)
    //if(!report.ignore){
    //    alert(trStr)
        var reData = report.report;
        var reLength = reData.length;
        var arr = [];




        for (i = 0; i < reData.length; i++) {
            if(reData[i].object_type == "document"){
                var arrDocu = [];
                arrDocu.push(reData[i]);
                arr[0] = arrDocu;
            }else{
                if (arr[reData[i].page_index] == undefined) {
                    var _arr = [];
                    _arr.push(reData[i]);
                    arr[reData[i].page_index] = _arr;
                } else {
                    arr[reData[i].page_index].push(reData[i]);
                }
            }
        }

        var arrLength = arr.length;
        for(var i=0;i<arrLength;i++){
            var reportTxt = "";
            var numPage,indexNum;
            var backEdit;

            if(arr[i] != undefined){
                //alert(arr[i])
                trStr += "<tr class='dataTr'><td>";
                for(var j=0;j<arr[i].length;j++){
                    var arra = arr[i][j];
                    if(arra.error_type == "error"){err_bl = true;}
                    numPage = arra.pagenumber;
                    reportTxt += iconType(arra.errorno,arra.error_type);
                    indexNum = arra.page_index;
                    objIdStr = arra.object_type;

                }   // alert(reportTxt + "</td><td><a href='javascript:'>再次编辑</a></td>")//"++"
                if(objIdStr == "document"){
                    numPage = "";
                    backEdit = "";
                }else{
                    backEdit = "<i onclick='shitClick(\"warnElidePromptCallback\","+indexNum+")'>再次编辑</i>";

                }

                trStr += numPage +"</td><td>" + reportTxt + "</td><td>"+backEdit+"</td>";


            }
        }
        if(err_bl){$(".centerBtn:visible i:last").addClass("no").removeAttr("onclick")}

        $("#table_data").replaceWith(trStr);
        //$(".centerBtn:visible a:first").click(function(){ FlexUploader.warnElidePromptCallback($(".dataTr td").eq(0).html())});
   // }
    function iconType(err,errtype){
        switch (err) {
            case 30001 :
                return "<p class='iconBox icon_err' errtype='" + errtype + "'>页面中缺少图片</p>";
                break;
            case 30002 :
                return "<p class='iconBox icon_err' errtype='" + errtype + "'>系统错误30002</p>";
                break;
            case 30003 :
                return "<p class='iconBox icon_img' errtype='" + errtype + "'>图片传输中，请等待图片传输完成</p>";
                break;
            case 30004 :
                return "<p class='iconBox icon_img' errtype='" + errtype + "'>图片传输中，请等待图片传输完成</p>";
                break;
            case 30551 :
                return "<p class='iconBox icon_warn' errtype='" + errtype + "'>页面中的图片尺寸不足，可能导致印刷成品不够清晰</p>";
                break;
            case 40001 :
                return "<p class='iconBox icon_err' errtype='" + errtype + "'>页面中含有空白的文本框</p>";
                break;
            case 40002 :
                return "<p class='iconBox icon_err' errtype='" + errtype + "'>系统错误40002</p>";
                break;
            case 40003 :
                return "<p class='iconBox icon_err' errtype='" + errtype + "'>系统错误40003</p>";
                break;
            case 40551 :
                return "<p class='iconBox icon_warn' errtype='" + errtype + "'>页面中含有空白的文本框</p>";
                break;
            case 40552 :
                return "<p class='iconBox icon_warn' errtype='" + errtype + "'>页面中含有所选字体不支持的字符，请更换字体或修改文字</p>";
                break;
            case 40553 :
                return "<p class='iconBox icon_warn' errtype='" + errtype + "'>页面中的文字超出了文本框范围</p>";
                break;
            default:
                return "<p class='iconBox icon_err'>系统错误"+err+"</p>"
        }
    }

    $(".tbg_table").jscroll({
        W:"11px",
        div_h:getH(".tbg_table div"),
        BgUrl:"url(/img/editor_v.1/s_bg2.gif)",
        BgUrl2:"url(/img/editor_v.1/s_bg1.gif)",
        Bg:"right 0 repeat-y",
        Bar:{Bd:{Out:"#b1b1b1",Hover:"#999"},
            Bg:{Out:"-45px 0 repeat-y",Hover:"-45px 0 repeat-y",Focus:"-45px 0 repeat-y"}},
            Btn:{btn:true,
                uBg:{Out:"0 0",Hover:"0px 0",Focus:"0px 0"},
                dBg:{Out:"0 -15px",Hover:"0px -15px",Focus:"0px -15px"}}//,
        //Fn:function(){}
    });

    $(".dataTr").hover(function(){
        $(this).css("backgroundColor","#fafafa");
    },function(){

        $(this).css("backgroundColor","#fff");
    });
}



$(window).resize(function(){

    var browserWidth = $(window).width();
    var browserHeight = $(window).height();

    if(browserWidth < swfMinWidth && browserHeight < swfMinHeight){
        $("#FlexUploader").attr("width",swfMinWidth);
        $("#FlexUploader").attr("height",swfMinHeight);
        $("body").css("overflow","auto");
    }else if(browserWidth > swfMinWidth && browserHeight < swfMinHeight){
        $("#FlexUploader").attr("width",browserWidth);

        $("#FlexUploader").attr("height",swfMinHeight*(browserWidth/swfMinWidth));
        $("body").css({"overflow-x":"hidden","overflow-y":"auto"});
    }else if(browserWidth < swfMinWidth && browserHeight > swfMinHeight){
        $("#FlexUploader").attr("width",browserWidth*(browserHeight/swfMinHeight));

        $("#FlexUploader").attr("height",browserHeight);
        $("body").css({"overflow-x":"auto","overflow-y":"hidden"});
    }else if(browserWidth > swfMinWidth && browserHeight > swfMinHeight){
        $("#FlexUploader").attr("width","100%");
        $("#FlexUploader").attr("height","100%");

        $("html").add("body").css("overflow","hidden");
    }


});

function initializeSize(){

    var browserWidth = $(window).width();
    var browserHeight = $(window).height();
    //alert(browserWidth)
       if(browserWidth < swfMinWidth || browserHeight < swfMinHeight){
        $("#FlexUploader").attr("width",swfMinWidth);
        $("#FlexUploader").attr("height",swfMinHeight);
        $("body").css("overflow","auto");
    }else{
        $("#FlexUploader").attr("width","100%");
        $("#FlexUploader").attr("height","100%");

        $("html").add("body").css("overflow","hidden");
    }

    var FlexUploader = thisMovie2("FlexUploader");
    FlexUploader.initializeSize(browserWidth,browserHeight);
}


/*-新手引导-*/

function guideLoad(bl,num){

    if(bl){
        $("body").append('<div class="guideBg"></div>');
        $(".guideBg").css({width:getW(),height:getH()}).show();
        if(num == 0){
            var g = 1;

            $("body").append('<img src="/img/editor_v.1/load.gif" id="loadDiv" /><div class="guideBox"><span class="guide_load">跳过</span><div class="guide_1"></div><span class="guide_next" id="guideBtn">下一步</span></div>');
            $("#guideBtn").click(function(){
                if(g < 4){
                    g++;
                    if(g == 4){
                        $("#guideBtn").attr("class","guide_ok");
                    }
                    $(".guideBox div").attr("class","guide_"+g);
                }else{
                    closeGuide();
                }
            });
            $(".guide_ok").bind("click",closeGuide);
            $(".guide_load").bind("click",closeGuide);
        }else{
            $("body").append('<img src="/img/editor_v.1/load.gif" id="loadDiv" />');
        }
        $("#loadDiv").css({position:"absolute",zIndex:10003,marginTop:-135,marginLeft:-190,left:"50%",top:"50%"});
    }else{
        $(".guideBg").show();
        if($(".guideBox").css("display") == "block"){
            $("#loadDiv").remove();
            $(".guideBg").show();
        }else{
            $("#loadDiv").remove();
            $(".guideBg").hide();
        }
    }
}
function closeGuide(){
    $(".guideBox").remove();
    if($("#loadDiv").css("display") != "block"){
        $(".guideBg").hide();

    }

}
