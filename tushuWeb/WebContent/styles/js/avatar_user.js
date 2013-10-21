/**
 * 初始化，绑定一些事件
 */

if(avatar_config.action_type == "avatar"){
    $(".reg_photoBox .weibo_photo").hide();
}
function init_avatar(func){
    //触发上传图片事件
	$("#upload-file").bind('change' , function(e){
		if($(e.target).val() !=''){
			$("#avatar-loading").show();
			$('<input />' , {
				type : 'hidden',
				val : avatar_config.action_type,
				name : 'action_type'
			}).appendTo('form');

			//提交生成头像开关
            avatar_config.save_type = 'upload';
			$("#btn-submit").click();
		}
	});
	$("#save-avatar").bind('click' , function(e){
        save_avatar(func);
        $('#photo').imgAreaSelect({hide:true});
        $('.aui_close').click();
        $("#username").val("输入微博昵称");
        if(avatar_config.action_type == 'book' ){
            showLoading();
            setTimeout("hideLoading()",3000);
        }
    });

    $(".iFile em").mouseover(function(we){
       var t = $(".aui_focus").position().top;
       var l = $(".aui_focus").position().left;

       $(this).next().show().css({"top":(we.pageY - t) + "px","left":(we.pageX - l) + "px"});
       $(this).mousemove(function(we2){
           $(this).next().show().css({"top":(we2.pageY - t) + "px","left":(we2.pageX -l) + "px"});
       });

    });

    //flash做书的时候，换头像
    if(avatar_config.action_type == 'book' ){//'avatar'
        $("#username").bind('blur' , function(e){
            var username = $(e.target).val();
            if(username == ''){
                $(e.target).val('输入微博昵称');
            }
        });

        $("#username").bind('click' , function(e){
            var username = $(e.target).val();
            if(username == '输入微博昵称'){
                $(e.target).val('');
            }
        });

        //获取新浪微博头像
        avatar_config.save_type = 'weibo';
        get_sina_weibo_avatar();
    }

}


/**
 * 获取sina微博头像显示
 */

function get_sina_weibo_avatar(){
    //根据用户昵称获取头像
	$("#btn-search-weibo").bind('click' , function(e){
        avatar_config.save_type = 'weibo';
		$("#avatar-loading").show();
        //$("#avatar").attr("src","");
		var username = $("#username").val();
		if(username.length > 0 && username != ''){
			var callback = function(result){
				if(typeof(result.avatar) !='undefined' && result.avatar !='null'){
					$("#avatar").attr('src' , result.avatar).css({width:180,height:180,marginLeft:0,marginTop:0});
					$("#photo").attr('src' , result.avatar);
                    $("#photo").css({"width": 220 + 'px' , 'height': 220 + 'px',marginTop:0,marginLeft:0});


			    $("#avatar-loading").hide();
				}
			};
			$.getJSON('/user/search_friend' , {user_name: username} ,function(result){
				callback(result);
                $('#photo').imgAreaSelect({ instance: true,disable:true,hide:true})//.cancelSelection();
			});
		}
	});
}

/**
 * 图片上传以后，初始化预览区域
 */

function init_image(res){
	if(typeof(res.image) !='undefined'){
		$.each(res , function(i ,v){
			eval('avatar_config.' + i +'=v;');
		});
		image ='/upload/avatar/'+ res.image + '?timstamp=' +new Date().getTime();

        $("#photo").attr('src' , image);
		$("#avatar").attr('src' , image);

        photoSquare();
	}
}

/**
 * 用户点击保存头像
 */
function save_avatar(func){
    if(avatar_config.action_type == 'book' ){
        var callback = function(data){
			if(data.status == 200){
				var img = data.data.user_face;
				eval('FlexUploader.'+ func + '("'+ img +'");');
                //$('#photo').imgAreaSelect({hide:true});
			}
		}
    }else{
        //用户中心换头像
        var callback = function(res){
            var img = res.data.user_face;
            $("#user_face").attr('src', img);
            $("#avatar_s").attr('src', img);
        };
    }
    //$('#photo').imgAreaSelect({hide:true});
	switch(avatar_config.save_type){
		case 'weibo':
          //flash做书的时候，换头像

          var img = $("#avatar").attr('src');
          var opts = {
              'url' : img
          };
          var api_url = avatar_config.save_weibo_image_api;
          break;

        case 'upload':
          var opts = cutimg();
          var api_url = avatar_config.save_avatar_api;
          break;
    }

    opts.action_type = avatar_config.action_type;
    $.getJSON(api_url , opts , function(data){
        callback(data);
    });
    $("#photo").attr("src","/img/ad/ad_hyheader.jpg").css({marginTop:0});
    $("#avatar-loading").hide();
}

/**
 * flash 回调，显示换头像dialog
 * 备注：function名称不能修改，flash内部已经初始化
 */
function show_change_avatar(flashfun){
  //flash api
  old_adialog(0,0,'tsArt_photo');
  init_avatar(flashfun);
}


function cutimg_old(){

    var x = Math.abs(parseInt($("#preview100 img").css("marginLeft")));
    var y = Math.abs(parseInt($("#preview100 img").css("marginTop")));

    var ciW = $("#preview100 img").width();
    var ciH = $("#preview100 img").height();

    var opts = {'width' : ciW, "height": ciH, "x" : x, "y": y};
    return opts;
}
function cutimg(){
 	var pw = document.getElementById("photo").offsetWidth;
 	var ph = document.getElementById("photo").offsetHeight;
    var x0 = Math.abs(parseInt($("#preview100 img").css("marginLeft")));
    var y0 = Math.abs(parseInt($("#preview100 img").css("marginTop")));

    var ciW0 = $("#preview100 img").width();
    var ciH0 = $("#preview100 img").height();
    
    
    var ciW = parseInt(pw);
    var ciH =parseInt(ph);
    var x =parseInt(parseInt(pw)*parseInt(x0)/parseInt(ciW0));
    var y =parseInt(parseInt(pw)*parseInt(y0)/parseInt(ciW0));
    var sw=parseInt(100*parseInt(pw)/parseInt(ciW0));
    var opts = {'swidth' : sw,'width' : ciW, "height": ciH, "x" : x, "y": y};
    return opts;
}

/**
 * 显示dialog
 */
function old_adialog(w,h,urlID){
    art.dialog({
        title: "修改头像",
        width: w,
        height: h,
     //   fixed: true,
        lock: true,
        background: "#fff",
        opacity: 0.2,
     //   time:2,
        drag: false,
    //    resize: true,
        esc: true,
        content: document.getElementById(urlID),
        id: 'ID001',
       zIndex: 999,
   //     follow: document.getElementById('followOk'),
        initFn: function(){

        },
        closeFn: function(){
            $('#photo').imgAreaSelect({hide:true}).attr("src","/img/ad/ad_hyheader.jpg").css({marginTop:0});
            $("#avatar-loading").hide();
        }/* ,
       yesFn: function(){
            this.close();
        },
        noFn: function(){
            this.close();
        }*/
    });
}

function preview(img, selection) {
    var photoUrl = $("#photo").attr("src");
    if (!selection.width || !selection.height)
         return;

    var scaleX = 100 / selection.width;
    var scaleY = 100 / selection.height;
    var pw = document.getElementById("photo").offsetWidth;

    $('#preview100 img').attr("src",photoUrl).css({
         width: Math.round(scaleX * pw * 1),
         marginLeft: -Math.round(scaleX * selection.x1*1),
         marginTop: -Math.round(scaleY * selection.y1*1)
    });
}

function photoSquare(){

    $("#photo").css({"max-width":235,"max-height":235});
    setTimeout(function(){
        $("#avatar-loading").hide();
        $("#photo").css({width:"auto",height:"auto"});
        $("#avatar").css({width:"auto",height:"auto",marginLeft:"auto",marginTop:"auto"});
        var photo = document.getElementById("photo");
        var pw = photo.offsetWidth;
        var ph = photo.offsetHeight;

        if(pw*1 > ph*1){
            //photo.style.width = 235+"px";
            //$("#photo").css({"*width":235});
        }else{
            //photo.style.height = 235+"px";
            //$("#photo").css({"*height":235});
        }

        $("#photo").css({"max-width":235,"max-height":235});

        var bh = $("#photo").parent().height() - $("#photo").height();
        if(bh > 0){
            $("#photo").css("marginTop",bh/2);
        }else{
            $("#photo").css("marginTop",0);
        }

        $("#photo").imgAreaSelect({aspectRatio: '1:1',enable:true, handles: true,show: true,keys:true,movable:true,resizable:true, x1: 10,y1: 10,x2: 80,y2: 80,fadeSpeed: 200, onSelectChange: preview ,onInit:preview,zIndex:999999});

        $('#preview100 img').css({
            width: Math.round(pw * 0.85 * 1),
            marginLeft: Math.round(0),
            marginTop: Math.round(0)
        });
    },500);
}
