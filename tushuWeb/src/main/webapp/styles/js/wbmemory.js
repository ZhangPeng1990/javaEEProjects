var WbMemory = function(){}
var currentSelectweiboData = null;
var currentUsername = '';
var sample_preview_id = '';

WbMemory.prototype.getMyWbInfo = function(containerId, cPage){
    isStartGettingFriends = 1;
    $.get('/choose/get_friend?perpage=100&page='+cPage, function(data){
        data = eval('(' + data + ')');
        ///e.preventDefault();
        if (typeof(data)=='object' && data.status==200){

            currentPage++;
            if (data.data.error && data.data.error=='invalid_access_token')
            {
              adialog('获取微博好友信息时出现问题，请重新登录','获取微博好友信息时出现问题，请重新登录',1, function(){window.location.href='/sinalogin/loginsina';});

              $(".loadFirends").hide();
              return false;
            }
            if (data.data && data.data.error!='' && data.data.error=='expired_token')
            {
               adialog('获取微博好友信息时出现问题，请重新登录','获取微博好友信息时出现问题，请重新登录',1, function(){window.location.href='/sinalogin/loginsina';});
                $(".loadFirends").hide();
                return false;
            }

            if (!data || !data.data || !data.data.users || !data.data.users.length)
            {
              $(".loadFirends").hide();
              return;
            }
            //$('#' + containerId + ' li').remove();
            var startIndex = 0;
            var container = null;

            if ($('#' + containerId + ' ul') && $('#' + containerId + ' ul').length)
            {
              container = $('#' + containerId + ' ul');
            }
            else
            {
              setTimeout('for(var i=0;i<5;i++){$("#ul_my_friends ul li").eq(i).show();$("#loadSwf2").hide()}',2000);
              container = $('<ul></ul>');
              $('#' + containerId).append(container);
            }
            $.each(data.data.users, function(k,v){

              if (startIndex%5==0)
              {
                //container = $('<ul></ul>');
                //if (currentPage <= 1 && startIndex==0)
                //{
                  //$(container).show();
                //}
                //else
                //{
                  //$(container).hide();
                //}
                //$('#' + containerId).append(container);
              }

              startIndex++;

              WbMemory.prototype.addOne(v, container);
            });

            $(".loadFirends").hide();
            isGotNewFriend = 1;
            $('#' + containerId).append(container);

            //frindList();
            $('#my_original').click(function(){
                $("#ul_my_friends").find("li").removeClass("hover");
              $('#div_wb_info img').attr('src', $(this).attr('avatar_large'));
                var nickname = $(this).attr('nickname');
                var userid = $(this).attr('uid');
                $('#wb_info_nickname').text(nickname);
                $('#whosweibo').html( nickname + ' 的原创微博');
                $('#href_to_create').attr('nickname', nickname);
                $('#href_to_create').attr('uid', userid);
                $('#input_weibo_id').val($(this).attr('uid'));
                $(this).addClass("hover").siblings().removeClass("hover");

            });
            $("#" + containerId + " li").click(function(){
                $('#div_wb_info img').attr('src', $(this).attr('avatar_large'));
                var nickname = $(this).find('span').attr('nickname');
                var userid = $(this).find('span').attr('uid');
                $('#wb_info_nickname').text(nickname);
                $('#href_to_create').attr('nickname', nickname);
                $('#href_to_create').attr('uid', userid);
                $('#whosweibo').html( nickname + ' 的原创微博');
                $('#input_weibo_id').val($(this).attr('uid'));
                $(this).addClass("hover").siblings().removeClass("hover");
            });
            $('#select_template_status').val(1)
            gotFriends = $('#select_template_status').val();
            isStartGettingFriends= 0;
        }

    });
}

WbMemory.prototype.showSinaLogin = function(){
    //e.preventDefault();
    var page = 'https://api.weibo.com/oauth2/authorize?client_id=3308374317&redirect_uri=http%3A%2F%2Fwww.tushu.com%2Fsinalogin%2FsinaBack%26is_relate%3D1&response_type=code&forcelogin=true';
    var pagetitle = '新浪微博登录';
    var $dialog = $('<div></div>').html('<iframe style="border: 0px; " src="' + page + '" width="100%" height="100%"></iframe>').dialog({
        autoOpen: false,
        modal: true,
        height: 625,
        width: 500,
        title: pagetitle
    });
    $dialog.dialog('open');
}

WbMemory.prototype.addOne = function(user, containerId){
    /**
        var img = $('<img />');
        img.attr('src', user.profile_image_url);
        img.attr('width', '100px');
        img.attr('height', '100px');
        $('#' + containerId).append(img);
        var nickname = $('<span></span>');
        nickname.attr('uid', user.uid);
        nickname.text('nickname:' + user.nickname);
    **/
    var li = $('<li></li>').addClass('l').append($('<img />').attr('src', user.profile_image_url)).attr('avatar_large', user.avatar_large).attr('uid', user.uid);
    li.append($('<span></span>').attr('class', 'block mt5').text(user.nickname).attr('uid', user.uid).attr('nickname', user.nickname));
    //$('#' + containerId).append(li);
    $(containerId).append(li);
}

WbMemory.prototype.getTpmessages = function(tag, key){
    $.post('/product/get_tpmessages', {tag: tag, key: key}, function(data){
        //
    });
}

WbMemory.prototype.getWbMessages = function(username){
    /*
    var url = '/product/get_wbmessages';
    $('#input_weibo_nickname').val(username);
    var jqxhr = $.post(url, {username: username}, function(data){
        if(data && typeof(data)!='object'){
            data = eval('(' + data + ')');
        }
        if (data && data.dataId==0)
        {
          adialog('错误', '请求数据时超时或发生错误,是否重试?', 2, function(){ WbMemory.prototype.getWbMessages(username); }, function(){
              $('#loadSwf').hide();
              $(".wb_m_titleS").eq(1).trigger('click');
          });
          return false;
        }
        if (data && data.code==-1)
        {
          adialog('错误', '请求数据时超时或发生错误,是否重试?', 2, function(){ WbMemory.prototype.getWbMessages(username); }, function(){$('#loadSwf').hide();$(".wb_m_titleS").trigger('click');});
          return false;
        }
        if(data){
            $('#data_id').val(data.dataId);
        }
        currentSelectWeiboData = data;
        currentUsername = username;
        $('#start_year').val(data.startdate[0]);
        $('#start_month').val(data.startdate[1]);
        $('#end_year').val(data.enddate[0]);
        $('#end_month').val(data.enddate[1]);
        setWeiboDate(data.startdate[0], data.startdate[1], data.enddate[0], data.enddate[1]);

        if(data && data.source.length > 0){
            if(WbMemory.prototype.prepareData(data, username)==1){
                return false;
            }
        }
        $('#select_weibo_status').val(1);
        gotSelectedWbMessages = $('#select_weibo_status').val();
        //gotSelectedWbMessages = true;
        //$('#href_all').trigger('click');
    })
    .error(function(e){if (e.statusText=='error'){return;}adialog('错误', '请求数据时超时或发生错误,是否重试?', 2, function(){ WbMemory.prototype.getWbMessages(username); }, function(){$(".wb_m_titleS").eq(1).trigger('click');$('#loadSwf').hide()});});
    */
}
/*
WbMemory.prototype.prepareData = function(data, username, startYear, startMonth, endYear, endMonth){
  if (!data){
    data = currentSelectWeiboData;
  }
  if (!username){
    username = currentUsername;
  }
  $('.wbm_list li').remove();
  var total = 0;
  var filteredArray = new Array();
  var tmpArr = new Array();

    $.each(data.datas, function(k, v){

        if (startYear && startMonth){
          if (v[0][0]<startYear || (v[0][0]==startYear && v[0][1]<startMonth)){
            return;
          }
        }
        if (endYear && endMonth){
            if (v[0][0]>endYear || (v[0][0]==endYear && v[0][1]>endMonth))
            {
              return;
            }
        }

        if (v[1] && v[1].length>0){
            $.each(v[1], function(n,m){
                if(!tmpArr[m.source]){
                    tmpArr[m.source] = m.count;
                }else{
                    tmpArr[m.source] += m.count;
                }
            });
        }
    });

    var total_count = 0;
    $.each(data.source, function(k, v){
        if (tmpArr[v[0]]){
            var t = new Array();
            t.push(v[0]);
            t.push(tmpArr[v[0]]);
            total_count += parseInt(tmpArr[v[0]]);
            filteredArray.push(t);
        }
    });
    if (total_count < 200){
        //adialog('微博条数信息', '选择的微博原创条数太少，请重新选择', 1);
        setTimeNum();
        $('#loadSwf').hide();
        return 1;
    }

    $.each(filteredArray, function(k, v){
        total += v[1];
        var liStr="";
        liStr += '<li><span class="l"><input type="checkbox" checked="checked" title="'+v[0]+'" />'+v[0]+'</span><span class="r">'+v[1]+'</span></li>';
        $('.wbm_list').append(liStr);
    });
    $('.wbm_list input[type=checkbox]').click(function(){
        WbMemory.prototype.checkboxClick();
    });
    //if (!currentBookTypeId) {
    currentBookTypeId = $('.wb_m_format ul li.on a[booktype]').attr('booktype');
    //}
    var price_info = bps[currentBookTypeId];
    var totalnum = total ? (price_info['base'] + (total-price_info['basepage']) * price_info['addpage']) : 0;
    totalnum = totalnum.toFixed(2);
    if(total < 200){
        $('.wb_number .mt15').text(total).css({color:"#c00"}).attr("title","选择的微博原创条数太少，请重新选择");
    }else{
        $('.wb_number .mt15').text(total).css({color:"#000"}).attr("title","");
    }

    $('.wb_money .mt15').text(totalnum);

    var title = '“' + username + '” 的微博记忆 ';/*共计 ' + total + ' 条内容 <span class="fc_red2">￥' + totalnum + '</span> 元
    //$('#make_title').html(title);
    //$('#make_title').show();
}
*/
WbMemory.prototype.checkboxClick = function(){
    var totalnum = 0;
    $('.wbm_list input[type=checkbox]:checked').parent().parent().find('span.r').each(function(){
        totalnum += parseInt($(this).text());
    });
    //if (!currentBookTypeId) {
    currentBookTypeId = $('.wb_m_format ul li.on a[booktype]').attr('booktype');
    //}
    var price_info = bps[currentBookTypeId];
    var totalpay = totalnum ? (price_info['base'] + (totalnum-price_info['basepage']) * price_info['addpage']) : 0;

    //var totalpay = totalnum ? (69 + (totalnum-200) * 0.2) : 0;
    totalpay = totalpay.toFixed(2);
    if(totalnum < 200){
        $('.wb_number .mt15').text(totalnum).css({color:"#c00"}).attr("title","选择的微博原创条数太少，请重新选择");
    }else{
        $('.wb_number .mt15').text(totalnum).css({color:"#000"}).attr("title","");
    }
    $('.wb_money .mt15').text(totalpay);

}

WbMemory.prototype.allClick = function(){
  $('.wbm_list input[type=checkbox]').each(function(){
    this.checked = true;
  });
  WbMemory.prototype.checkboxClick();
}

WbMemory.prototype.getSuggestion = function(nickname, containerId)
{
  var url = '/choose/suggestion_once_request';
  if (!$.trim(nickname) || nickname=='在这里输入想搜索的互粉好友昵称')
  {
    return ;
  }

                $("#ul_my_friends").find("li").removeClass("hover");
  $.post(url, {key: nickname}, function(data){

        if (data && typeof(data)!='object'){
          data = eval( '(' + data + ')');
          if (typeof(data.data)=='object' && data.data.searched && data.data.searched.length)
          {
            $('#' + containerId + ' li').remove();
           $.each(data.data.searched, function(k, v){
            var li = $('<li></li>');
            li.append($('<img/>').attr('src', v.profile_image_url).attr('avatar_large', v.avatar_large).attr('uid', v.uid ? v.uid : v.id));
            li.append($('<span></span>').text(v.screen_name));
            $('#' + containerId).append(li);
           });
           $('#' + containerId + ' li').click(function()
             {
                $('#div_wb_info img').attr('src', $(this).find('img').attr('avatar_large'));
                var nickname = $(this).find('span').text();
                $('#whosweibo').html( nickname + ' 的原创微博');
                $('#wb_info_nickname').text(nickname);
                $('#href_to_create').attr('nickname', nickname);
                $('#href_to_create').attr('uid', $(this).find('img').attr('uid'));
                $('#input_weibo_id').val($(this).find('img').attr('uid'));
                $('#' + containerId + ' li').remove();
                $('#' + containerId).css('display', 'none');
                $('#search_value').val(nickname);
             });
           $('#' + containerId).css('display', 'block');
          }
          else {
            //adialog('好友昵称错误', '好友昵称错误', 1);
            $('#' + containerId + ' li').remove();
            $('#' + containerId).hide();
            return;
          }
        }
        $("#ul_search_dropdown").slideDown('fast');
      });
}

WbMemory.prototype.getBookType = function()
{
  if (!WbMemory.prototype.checkBeforeAdd())
  {
    $("#loadSwf3").hide();
    return false;
  }
  var sources = '';
  $('.wbm_list span.l input:checked').parent().parent().find('span.l').each(function(){
    sources += !sources ? $(this).text() : ',' + $(this).text();
  });

  var currentBookTypeId = $('.select_face li.on img').attr('booktype');
  $.post('/product/get_wbm_book_id', {title: $('#input_book_title').val(), book_type: $('.select_face li.on img').attr('booktype'),weibo_id: $('#input_weibo_id').val(), start_year: data_area['start_date'][0], start_month: data_area['start_date'][1], end_year: data_area['end_date'][0], end_month:data_area['end_date'][1],blacklist: data_area['black_list'], data_id: $('#data_id').val(), bookclass: $('.select_face li.on img').attr('bookclass')}, function(data){
    if (data){
      $.post('/choose/add_cart', {book_id: data,start_year: data_area['start_date'][0], start_month: data_area['start_date'][1], end_year: data_area['end_date'][0], end_month:data_area['end_date'][1],blacklist: data_area['black_list'], weibo_nickname: $('#input_weibo_nickname').val(), book_type: currentBookTypeId}, function(d){
        if (d && typeof(d)!='object')
        {
          d = eval('(' + d + ')');
        };
        if (d.status == 200 && d.data)
        {
          window.location.href='/cart.html?s=editer';
        }else{
            $("#loadSwf3").hide();
        }
      }, 'json');
    }}, 'json');}

//预览loading

WbMemory.prototype.preview = function(is_sample_preview, booktype)
{
  if (is_sample_preview)
  {
    $('#add_to_cart_pre').hide();
  }
  else
  {
    $('#add_to_cart_pre').show();
  }
  if (!is_sample_preview)
  {
    if (!WbMemory.prototype.checkBeforeAdd())
    {
      return false;
    }
  }
  if (!booktype) {
    booktype = $('#input_template_id').val();
  }



  if(!is_sample_preview){
      $("body").append("<div class='tsDBg'></div>");
        var swfStr = '<div id="flashView"><div class="wb_load"><div class="wb_loadPng"><span></span></div><div>努力生成预览中...</div></div></div>';

  }else{

        var swfStr = '<div id="flashView"></div>';
  }

  $("#swfView").html("").append(swfStr);

  $("#yulan").removeClass("hide").css({left:($("body").width()-980)/2,top:0});
 // $("html,body").animate({scrollTop:$("#yulan").offset().top},400);

  var sources = '';
  $('.wbm_list span.l input:checked').parent().parent().find('span.l').each(function(){
    sources += !sources ? $(this).text() : ',' + $(this).text();
  });
  $(".wb_loadPng span").css({width:10});
  if (!is_sample_preview)
  {
      booktype =is_sample_preview ? bookktype : $('.select_face li.on img').attr('booktype');
      $.post('/product/wbm_preview_submit', {title: $('#input_book_title').val(), book_type:booktype,weibo_id: $('#input_weibo_id').val(), start_year: data_area['start_date'][0], start_month:data_area['start_date'][1], end_year: data_area['end_date'][0], end_month: data_area['end_date'][1], blacklist: data_area['black_list'], data_id: $('#data_id').val(), bookclass: $('.select_face li.on img').attr('bookclass')}, function(data){
      if ( data)
      {
          WbMemory.prototype.previewPercent(data);
      }
    }, 'json');
  }
  else
  {
    WbMemory.prototype.previewPercent('', 1, booktype);
  }
}

var currentPreviewPercent = 0;
//预览swf
WbMemory.prototype.previewPercent = function(data, is_sample_preview, booktype)
{
      var tmpDpNum = $(".wb_loadPng span").width();
      var virtualPreviewPercent = function(){
        if (tmpDpNum + 1 < 95) {
          tmpDpNum += 1;
          $(".wb_loadPng span").css({width:tmpDpNum});
          if (tmpDpNum+1 < 95) {
            setTimeout(virtualPreviewPercent, 300);
          }
        }
      };
      virtualPreviewPercent();
      var percentUrl = !is_sample_preview ? ('/product/wbm_preview_percent?view_id='+data) : ('/product/wbm_sam_preview_percent?view_id=' + booktype);

      $.get(percentUrl, function(d){
        if (!d) {
          //adialog('获取预览数据时出现问题？请重试', '提示', 1);
          return false;
        }
        if (d && typeof(d)!='object')
        {
          d = eval('(' + d + ')');
        };
        if (!is_sample_preview)
        {
          /**
          if (d && typeof(d)!='object')
          {
            d = eval('(' + d + ')');
          };
          **/
          if (d && d.status == 'wait')
          {
            if (d.percent < 1)
            {
              var dpNum = Math.round(d.percent*100);
              currentPreviewPercent = dpNum;

              if (dpNum >= tmpDpNum) {
                $(".wb_loadPng span").css({width:dpNum});
              }
              setTimeout('WbMemory.prototype.previewPercent("' + data + '")', 2000); //data 为String， 当作为参数时需要用引号引起来
              return;
            }
          }
            if(d && d.status != 'finish')
            {
                adialog('提示信息',d.message,1);
                return;
            }
        }

          var bookdata = d;
          var bookWidth=bookdata.width - 8,bookHeight=bookdata.height - 4,urls=bookdata.urls;
          var booktype =bookdata.BookType;
          var swfname = '';
          if(bookdata.viewclass == 1){
              swfname = '/js/bookView/FocusView.swf';
          }else{
              swfname = '/js/bookView/BookPreview.swf';
          }
          var duplex=bookdata.duplex;
          if (!bookdata.bindingPosition) {
            bookdata.bindingPosition = 'left';
          }
          show_book_prewiew_wb(bookWidth,bookHeight,urls,booktype,swfname,duplex,bookdata.miniUrls,bookdata.bindingPosition, true);
          $(".js_book_preview_div").css({zIndex:2,top:(document.documentElement.scrollTop+document.body.scrollTop+30),left:(($(window).width()-$(".js_book_preview_div").width())/2)}).show().after("<div id='js_book_bg' class='hide'></div>").prepend("<span id='js_book_btn'>×</span>");

          $("#js_book_btn").css({color:"#fff",backgroundColor:"#666",display:"block",position:"absolute",textAlign:"center",width:25,height:25,marginTop:10,marginLeft:945,lineHeight:"22px",cursor:"pointer",borderRadius:15,fontSize:18}).click(function(){
            $("#js_book_bg").remove();



            $('#swfView').html('<div id="flashView"></div>');
            //$('#swfView').children().remove();
          //$(this).parent().html("<div id='flashView'></div>");
        });
        $("#js_book_bg").css({backgroundColor:"#000",opacity:.5,width:"100%",height:($("body").height()),position:"absolute",top:0}).removeClass("hide");
        return;
      }, 'json');

}
WbMemory.prototype.selectTemplate = function(inputName, obj)
{
  var templateId = obj.attr('booktype');
  $('#' + inputName).val(templateId);
  $("a[booktype="+templateId+"]").parent().addClass("on").siblings().removeClass("on");
}

WbMemory.prototype.strlen = function(s) {
  var l = 0;
  var a = s.split("");
  for (var i=0;i<a.length;i++) {
     if (a[i].charCodeAt(0)<299) {
         l++;
          } else {
              l+=2;
               }
  }
  return l;
}

WbMemory.prototype.checkBeforeAdd = function()
{
  if ($.trim($('#input_template_id').val())=='')
  {
    adialog('请选择版式', '请选择版式.', 1);
    return false;
  }
  if ($.trim($('#input_book_title').val())=='')
  {
    tsDialog.open(html.bookName);
    $("#save_bookname").bind("click",function(){
        $("#input_book_title").val($("#bookname_text").val());
        tsDialog.close();
        return false;
    });
    return false;
  }

  if (WbMemory.prototype.strlen($.trim($('#input_book_title').val()))>16)
  {
    adialog('书名太长', '书名长度太长', 1);
    return false;
  }
  var sources = '';
  $('.wbm_list span.l input:checked').parent().parent().find('span.l').each(function(){
    sources += !sources ? $(this).text() : ',' + $(this).text();
  });
  /**
  if ($.trim(sources)=='')
  {
    adialog('请选择微博发送源', '请选择微博发送源.', 1);
    return false;
  }
  **/
  return true;
}

WbMemory.prototype.getCurrentBookType = function(t, ind)
{
  var bookType = t ? t : $(this).attr('booktype');
  //var bookType = $(this).attr('booktype');
  $.post('/choose/get_book_type', {book_type: bookType}, function(data){
    if (data)
    {
      if (data && data.format)
      {
        $('#container_product_type_name').text(data.book_type_name);
        $('#span_template_title').text(data.book_type_name);
        if (data.format)
        {
          var format = eval('(' + data.format + ')');
          $('#container_product_format').text(format['产品规格']);
          $('#contaier_product_materials').text(format['产品材质']);
          $('#container_product_price').text(format['加页价格']);
          $('#container_book_type_name').text(data.book_type_name);
          $('div.wb_jiaoji span.wb_make_tip').html('提示：' + format['加页价格'] ? format['加页价格'] : '');
        }
        if (data.frontCovers) {
            $('.select_face ul li').remove();
            var index = 0;
            var selectBookClass = weibo_memory_selected[bookType]['bookclass'];
			var isChoose = 0;
          $.each(data.frontCovers, function(i, v) {
            var litmp = $('<li><img src="' + v.icon + '" title="' + v.name + '" bookclass="' + v.bookclass + '" booktype="' + v.booktype + '" /></li>');
              if ((!ind && weibo_memory_selected && weibo_memory_selected[bookType] && v.bookclass==weibo_memory_selected[bookType]['bookclass']) || (ind && v.booktype==bookType && v.bookclass==ind)) {
                if (!isChoose) {
				  isChoose = 1;
                  $(litmp).addClass('on');
                }
              }
              if (!index) {
                //$(litmp).addClass('on');
              }
              $('.select_face ul').append(litmp);
              index++;
          });
        }
        $('#container_product_thumbs li').remove();
        for (var i=1; i<=6; i++)
        {
          $('#container_product_thumbs').append($('<li class="l por"><b></b><img  org="/upload/admin/adminPic/booktype/' + bookType + '/' + i + '.jpg" src="/upload/admin/adminPic/booktype/' + bookType + '/thumb_' + i + '.jpg" alt="" /></li>'));
        }
        if (typeof(pop_preview)!='undefined') {
          $("#container_product_thumbs li").bind('click',pop_preview);
        }
      }
    }
  }, 'json');
}


