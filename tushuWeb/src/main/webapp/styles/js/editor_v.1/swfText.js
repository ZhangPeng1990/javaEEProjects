/*  @wangpan
 * 2012-10-17
 * weiboBook-swfText
 */

document.domain="tushu.com"
var bt;
var alreadycolors = {};
var tagcolors = {};

  function getRandomColor(tag) {
    var r = Math.floor(Math.random()*128) + 128;
    var g = Math.floor(Math.random()*128) + 128;
    var b = Math.floor(Math.random()*128) + 128;
    /**
    if (r.length != 6)
    {
      return getRandomColor(tag);
    }
    **/
    var color = 'rgb(' + r + ',' + g + ',' + b + ')';
    if (tagcolors[color])
    {
      return getRandomColor();
    }
    else
    {
      alreadycolors[color] = 1;
      return tagcolors[tag] = color;
    }
  }
    //获取tag的color
    function getTagColor(tag)
    {
      if (tagcolors[tag])
      {
        return tagcolors[tag];
      }
      else
      {
        return getRandomColor(tag);
      }
    }

    function thisMovie2(movieName) {
        if (navigator.appName.indexOf("Microsoft") != -1) {
            return document[movieName];
        } else {
            return document[movieName];
        }
    }
    //swf传值测试
    var asCalljsStr,strFs,strTxt;
    var xx,yy,ww,hh;
	var callback;

    function textSwfBg(bl){
        if(bl){
            $("body").append("<div id='pageSwfBg' style='background-color:#fff;opacity:0.01;filter:alpha(opacity=1);width:"+$(document).width()+"px;height:"+$(document).height()+"px;left:0;top:0;position:absolute;z-index:100010;'></div>");
        }else{
            $("#pageSwfBg").remove();
        }

        return false
    }


    function ShowPopupText(multi_line, callback_fn, x,y,w,h,fs,mulNum,str){

		callback = callback_fn;
        //ww = w;
        //hh = h;
        w += 2;
        h += 2;
        x -= 1;
        y -= 1;

        if(fs < 12){
            fs = 12;
        }else if(fs > 15){
            fs = 15;
        }

        asCalljsStr = str;
        strFs = fs;

        var num = Math.random()*100;

        textSwfBg(true);

        //x = x - 21;
        //y = y - 48;

        var strDiv,textLine,cw,ch;
        if(!multi_line){
               //w = w* 1.5;
               textLine = '<input id="ta_scroll" type="text" style="height:24px;padding:2px;" value="" />';



        }else{
            textLine = '<textarea id="ta_scroll" maxlength="1024"></textarea>';
        }

        strDiv = '<div id="tbg_main">'+textLine+'</div>';
        strDiv += '<div id="tbg_btnBox"><b onclick="docList('+x+','+(y + h)+')">美文搜索</b><i onclick="btnFirst()">确定</i><i onclick="btnLast()">取消</i></div>';
                //cw = w + 64;
                //ch = h + 64;

                //x - 21;
                //y - 43;


        $("#areaBox").html(strDiv);
        $("#pageSwfBg").bind("click",btnFirst);

        $("#ta_scroll").bind("keyup",formatTxt).bind("change",formatTxt);



        $("#areaBox").css({position:"absolute",zIndex:100011,outline:"none",marginLeft:x,marginTop:y}).show();
        var mw,mh,mfs;
        //if(mulNum < 1.5 && mulNum >= 1){
            mw = w * mulNum - 10;
            mh = h * mulNum - 8;
            mfs = fs;// * mulNum;
        /*}else if(mulNum < 1){
            mw = w * 1;
            mh = h * 1;
            mfs = fs * 1;
        }else{
            mw = w *1.5;
            mh = h *1.5;
            mfs = fs *1.5;
        }
*/
        if(!multi_line){
            mw += 10;
            mh += 10;
        }else{
        }
        $("#ta_scroll").css({width:mw,height:mh,fontSize:mfs}).val(str).focus();

        //$("#areaBox b").css({width:w,height:h,border:0,display:"block"});

        //$("#areaBox").animate({width:cw,height:ch,left:_xl-(w/5),top:y-(h/5)},500);
        /*$("#ta_scroll").animate({width:w,height:h},500,function(){
            $(this).animate({opacity:1},200);
        })*/
        //$("#areaBox b").animate({width:w*1.5,height:h*1.5},500)

        $("#swfB").attr("width",w*2).attr("height",h*2);
    }

    $("input#ta_scroll").live("keydown",function(e){
        if(e.keyCode == 13){
            btnFirst();
        }
    });

    /**
     * 获取美文数据
     */
    function getMessages(key, tag) {
        var ret = null;
        $.ajax({
          url: '/product/get_tpmessages',
          data: {key: key, tag: tag},
          type: 'POST',
          async: false,
          success: function(data){
            if (data && typeof(data)!='object') {
              ret = eval('(' + data + ')');
            } else {
              ret = data;
            };
          }
        });
        return ret;
    }

    function renderData(txt, bt) {
        if ($('#docListBox') && $('#docListBox').length) {
          $('#docListBox').remove();
        }
        var docStr = "";
        docStr += '<div id="docListBox" style="top:'+bt+'px"><div class="docTop"><label>搜索美文</label><input class="docText" type="text" ';
        if (txt.key)
        {
          docStr += ' value="' + txt.key + '" ';
        }
        docStr += ' /><input type="button" class="docSearch" value="搜索" /><input type="button" class="docSearch" value="全部" rel="all" /><span class="docClose" onclick="docClose()"></span></div><div class="docList">';

        var st = txt.tag;

        //回车查询
        $('input.docText').live('keydown',KeyDown);

        $.each(txt.messages, function(i,v){
            var ct = v.content;

            if ($.trim(txt.key)){
              ct = ct.replace(txt.key, '<em class="search_key_value">' + txt.key + '</em>');
            }
            docStr += '<div class="docListLi"><p title="'+v.content+'">'+ct+'</p><div>';
                if (v.tags && v.tags.length>0) {
                  var taglen = v.tags.length;
                  var showtags = [];
                  var tn = 4;

                  if (taglen <=4)
                  {
                    showtags = v.tags;
                  }
                  else
                  {
                    var satags = {};
                    if (st)
                    {
                      showtags.push(st);
                      satags[st] = 1;
                      tn = 3;
                    }

                    while (showtags.length<4) {
                      var m = Math.ceil(Math.random()*taglen);
                      if (v.tags[m]==st || satags[v.tags[m]] )
                      {
                        continue;
                      }
                      showtags.push(v.tags[m]);
                      satags[v.tags[m]] = 1;
                    }
                  }
                  $.each(showtags, function(ii, vv){
                    if ($.trim(vv))
                    {
                      var tagColor = getTagColor(vv);
                      //console.log('OOOOOOOOOOOOOOOOOOOOOOO');
                      //console.log(tagColor);
                      docStr += '<span class="docTag_'+ii+'" style="background-color:'+tagColor+';">';

                      docStr += vv +'</span>';
                    }
                  });
                }
            docStr += '</div></div>';
        });
        //-美文条目--<


        //-热门标签-->
        var tag = txt.tags;
        var emptyMessage = '<div class="docNull">未找到相关结果<br />请<a href="javascript:void(0);" id="hrefReturn" rel="all">返回</a> 重新搜索<br />建议点击热门标签搜索</div>  ';
        $.each(tag, function(i, v){
            var tagColor = getTagColor(v.tag);
            //console.log('PPPPPPPPPPPPPP');
            //console.log(tagColor);
            emptyMessage += '<span class="docTag_'+i+'" style="background-color:'+tagColor+';">'+ v.tag + '</span>';
        });
        if (txt.messages && txt.messages.length==0)
        {
          docStr += emptyMessage;
        }

        docStr += '</div><div class="docBottom"><label>热门标签</label><span class="docBottomList">';
        //-热门标签--<

        $.each(tag, function(i, v){
            var tagColor = getTagColor(v.tag);
            docStr += '<span class="docTag_'+i+'" style="background-color:'+tagColor+';">'+ v.tag + '</span>';
        });

        docStr += '</span></div></div>';
        $("#tbg_btnBox").prepend(docStr);

        $('span[class^=docTag_]').click(function(){
          var tag = $.trim($(this).text());
          var key = '';
          var txt = getMessages(key, tag);
          renderData(txt, bt);
        });
        $('input[class=docSearch]').click(function(){
          var sv = $.trim($('input[class=docText]').val());
          if (!sv)
          {
            //adialog('请输入搜索内容', '请输入搜索内容。', 1);
            //return ;
          }
          var tag = '';
          if ($.trim($(this).attr('rel'))=='all') {
            sv = '';
          }
          var txt = getMessages(sv, tag);
          renderData(txt, bt);
        });
        $('#hrefReturn').click(function(){
          var tag = '';
          var sv = '';
          var txt = getMessages(sv, tag);
          renderData(txt, bt);
        });
    }

    /**
     * 搜索美文
     */
    function searchTp(key, tag){
      var txt = getMessages(key, tag);
      renderData(txt);
    }

    function docList(x,y){

        var bh = y - 303;

        if(bh < 0){
            bt = 38;
        }else{
            bt = -303;
        }

        //美文搜索
        var txt = getMessages();
        renderData(txt, bt);

        $(".docListLi p").live("click",function(){
            $("#ta_scroll").val($(this).attr("title"));
            docClose();
        });
        $(".docBottomList span").click(function(){
            //
                var txt = $(this).html();

            //
        });
    }
    function docClose(){
        $("#docListBox").remove();
    }

    function btnFirst(){

        var SwfBg = thisMovie2("FlexUploader");
        var strTxt = $("#ta_scroll").val();
		eval("SwfBg."+callback+"(strTxt);");
        $("#areaBox").hide();$(".tbgt_content").remove()
        textSwfBg(false);
        $("#pageSwfBg").unbind();
    }
    function btnLast(){
        $("#areaBox").hide();$(".tbgt_content").remove()
        textSwfBg(false);
        $("#pageSwfBg").unbind();
    }
    $(window).resize(function(){
        btnLast();
    });
    function SetJsText(){
        $("#swfTextID").focus();
        var SwfTxt = thisMovie2("swfTextID");
        SwfTxt.SetTextPopup(strFs,asCalljsStr);
        //alert(str)
    }
    //点击底部文本框，调用
    //ExternalInterface.call("ShowPopupTextArea",point.x,point.y,textField.width,textField.height,textField.text);



    //当弹出框输入时，更新下面文本框
    //ExternalInterface.addCallback("SetText",SetText);

    //弹出flash接口：
    //ExternalInterface.addCallback("SetTextPopup",SetTextPopup);
    //设置弹出框文本内容

    function TextChange(str){
        strTxt = str;
    }
    //文本改变时，调用JS函数通知
    //ExternalInterface.call("TextChange",tlfTextField.text);



var dataObj,jsonObj;
var ftypeVal;
var initVal = [];

//过滤特殊字符
var formatTxt = {
    _val : "",
    _fun : function($this,tt){
        if(this._val != tt){
            var pattern = /([\u007F-\u00A0]|[\u00AD]|[\u0000-\u0009]|[\u000B-\u000C]|[\u000E-\u001F])+/ig;

            $this.val(tt.replace(pattern,""));
            this._val = tt;
        }
    }
};

    function callFunctionForJs(obj,callback){
        dataObj = obj;
        var initKey = 0;


        $.getJSON("http://www.tushu.com/product/art_form?art=" + dataObj.style, function(data){

            if(data.status == 200){
                var strHtml = "";
                jsonObj = data;

                strHtml += '<div class="titleTextCheck" id="titleText">';

                $.each(jsonObj.data , function(i,v){

                    $.each(dataObj.contents , function(j,b){

                        if(i == j){
                            if(v['type'] == 'hidden'){
                                strHtml += ' <input class="js_args" type="'+ v['type'] +'" name="'+ i +'" value="'+ b +'" />';
                            }else if(v['type'] == 'textarea'){
                                strHtml += ' <fieldset><label>'+ v['title'] +'</label><textarea class="js_args" rows=2 name="'+ i +'">'+ b +'</textarea></fieldset><p></p>';
                            }else{
                                strHtml += ' <fieldset><label>'+ v['title'] +'</label><input class="js_args" type="'+ v['type'] +'" name="'+ i +'" value="'+ b +'" /></fieldset><p></p>';
                            }
                            initVal[initKey] = b;
                            initKey++;
                        }


                    });
                    //alert(v["value"])

                });

                strHtml += ' <div class="centerBtn"><i onclick="checkJson()">确 定</i><i onclick="closeDialog(\'id\',\'nineTab2\')">取 消</i></div></div>';
                strHtml += '</div>';



                //$("body").append(strHtml);
                $("#nineTab2 .tbg_content").html(strHtml);
                showDialog("#nineTab2");
                //$(".titleTextCheck fieldset input").bind("blur",checkJson);

                $(".titleTextCheck fieldset input").focus(function(){
                    formatTxt._val = $(".titleTextCheck fieldset input").val();
                    //console.log(formatTxt._val)
                });
                $(".titleTextCheck fieldset input").bind("change",function(){formatTxt._fun($(this),$(this).val())});

            }


        });

    }

function submitSwf(){
    var cbObj = dataObj.contents;
	$.each(cbObj,function(k,v){
			vv = $('[name='+k+']').val();
			vv = vv.replace('&',encodeURIComponent('&'));
			//vv = encodeURIComponent(vv);
			cbObj[k] = vv == '' ? v : vv;
			
	});

    //cbObj.title = $('input[name=title]').val();
    //cbObj.sub_title = $('input[name=sub_title]').val();
	
    var SwfBgww = thisMovie2("FlexUploader");
    SwfBgww.callBackFunctionForAs(cbObj);
            //callback
            //alert(checkObj)
    closeDialog('id','nineTab2')
}



function checkJson(){
    //var initLen = $(".titleTextCheck fieldset input").length;
    var initLen = $(".titleTextCheck fieldset .js_args").length;
    var laterVal = [];
    for(var i=0;i<initLen;i++){
        //laterVal[i] = $(".titleTextCheck fieldset input").eq(i).val();
        laterVal[i] = $(".titleTextCheck fieldset .js_args").eq(i).val();
    }

    var initBl = (encodeURIComponent(initVal) == encodeURIComponent(laterVal));
    if(initBl){
        closeDialog('id','nineTab2')
        return;
    }
    //$(".titleTextCheck fieldset input[name="+this.name+"]")

    //var checkText = "http://www.tushu.com/product/art_check?art="+dataObj.style+"&width="+dataObj.width+"&height="+dataObj.height+"&title="+encodeURIComponent($('input[name=title]').val())+"&sub_title="+encodeURIComponent($('input[name=sub_title]').val())+"&ftype="+jsonObj.data.ftype.value;
	var checkText = "http://www.tushu.com/product/art_check";
	var n = 0;
	$.each(jsonObj.data , function(i,v){
			vv = $('[name='+i+']').val();
			if (vv == '' || vv == undefined)
			{
				vv = dataObj[i];
				if (i == 'art')
				{
					vv = dataObj['style'];
				}
				if (i == 'ftype')
				{
					vv = 'png';
				}
			}
			if (vv != '' && vv != undefined)
			{
				if(n == 0){
					checkText = checkText + '?' + i + '=' +encodeURIComponent(vv);
				}else{
					checkText = checkText + '&' + i + '=' +encodeURIComponent(vv);
				}
				n = n+1;
			}
	});
    //$("body").html(checkText)
    $.getJSON(checkText, function(data){

        if(data.status == 200){

            var checkObj = data;
            var is_ok = true;
            $.each(checkObj.data,function(i,v){
                $('input[name='+i+']').next("span").remove();
                if(!v[0]){
                    //alert(v[1] + "+" + v[0] + "+" + i);
                    $('input[name='+i+']').parent().append("<span class="+v[0]+"></span>").next().html(v[1]).slideDown();

                    is_ok = false;
                }else{
                    $('input[name='+i+']').parent().append("<span class="+v[0]+"></span>").next().slideUp();
                }
            });
            if(!is_ok){
                return;
            }
            var cbObj = dataObj.contents;
			$.each(cbObj,function(k,v){
					vv =$('[name='+k+']').val();
					cbObj[k] = vv == '' || vv == undefined ? v : $('[name='+k+']').val();
					
			});

            //cbObj.title = $('input[name=title]').val();
            //cbObj.sub_title = $('input[name=sub_title]').val();
			
            var SwfBgww = thisMovie2("FlexUploader");
            SwfBgww.callBackFunctionForAs(cbObj);
                    //callback
                    //alert(checkObj)
            closeDialog('id','nineTab2')
        }
    });

}

function KeyDown()
{
  　　if (event.keyCode == 13)
  　　{
  　　　　event.returnValue=false;
  　　　　event.cancel = true;
          $('input[class=docSearch]').trigger('click');
  　　}
}
