var suffix = ['zip','rar','jpg','gif','png','doc','docx','pptx','xls','xlsx','pdf','xml','txt','java',
              'ai','bmp','cdr','ico','jpeg','psd','ape','avi','flv','mkv','mov','mp3','mp4','mpeg','mpg','rm',
              'rmvb','swf','wav','webm','wma','wmv','7z','cab','iso','c','cpp','cs','fla','htm','html','log',
              'mht','php','url','apk','bt','bookfolder','documentfolder','fromchromefolder','mix','musicfolder',
              'picturefolder','videofolder'
              ];

$(function(){
	//左部菜单操作
	$('div[id|="leftPanel"] ul[class|="folders"] li').click(function(){
		var path = $(this).attr("value");
		if(!$(this).hasClass("current")){
			$(this).addClass("current")
			.siblings().removeClass("current");
			moreButtonsHide();
		}
		
			var uri = $(this).attr("value");
			$("#loadingMask").css("display","block").css("opacity",1);//此处调用函数出现loading蒙层
			showAllData(uri,{
				success:function(json){
					updatePageShow(json);
					showPath(path);
				}
			});
	});
	
	//文件显示主面板操作
	$("#sortSelected").hover(function(){
		$("#sortSelectedUl").css("display","block");
	},function(){
		$("#sortSelectedUl").css("display","none");
	});
	
	$("#sortSelectedUl").hover(function(){
		$("#sortSelectedUl").css("display","block");
	},function(){
		$("#sortSelectedUl").css("display","none");
	});
	
	$('ul[id|="sortSelectedUl"] li a').click(function(){
		var selectVal = $(this).html();
		$("#sortSelected").html(selectVal);
		$("#sortSelectedUl").css("display","none");
	});
	
	$("#tbNew").click(function(){
		createNewFolder();
	});
	
	$("#tbUpload").click(function(){
		uploadManage();
	});
	
});

function showAllData(path,obj){
	$("#loadingMask").css("display","block").css("opacity",1);
	showPath(path);
	$.ajax({
		type:  "POST",
		url:   "/webFile-webroot/index/listPathFiles",//?path=" + escape(path),
		data: {"path":path},
		cache: false,
		success: function( json ) {
			obj.success(json);
		},
		error: function (xhr, ajaxOptions, thrownError){
			alert("Http status: " + xhr.status + " " + xhr.statusText + "\najaxOptions: " + ajaxOptions + "\nthrownError:"+thrownError + "\n" +xhr.responseText);
		},
		complete :function(){ 
//			alert("The progream is complete!!!"); 
			},
	});
}

String.prototype.replaceAll=function(os, ns){
	return this.replace(new RegExp(os,"gm"),ns);
};

function updatePageShow(json){
	//每次重新加载显示内容需要隐藏和显示的按钮等可加在这里操作
	moreButtonsHide();
	$("#loadingMask").css("display","block").css("opacity",1);//此处调用函数出现loading蒙层
	
	if(json != ''){
		var _fileListHtml = '<li class="row filelist-item clearfix " data-path="#path#" data-date="2013-07-06 19:29" data-type="#dataType#" data-url="" data-link="" data-title="#name#" data-nid="13731101662587125" f-index="0" style="left: 0px; top: 0px;">\
		   	<div class="column column-checkbox">\
		    <label></label>\
		    </div>\
			    <div class="column column-name" title="#title#">\
		    <span class="ico ico-#suffix#"></span>\
		    <span class="text">#name#</span>\
		    </div>\
		    <div class="column column-size"> </div>\
		    <div class="column column-time">2013-07-06 19:29</div>\
		   	</li>';
		
		var files = JSON.parse(json);//JSON.parse()将json字符串转换成js对象，JSON.stringify()将js对象转换成json字符串
		
		$("#list").empty();
		var _html = '';
		var targetHtml = '';
		var dataType = '';
		$.each(files,function(key,value){
			
			if(files[key].suffix != undefined){//用于修改显示图标，还有问题，(files[key].suffix判断，replaceAll) 问题//undefined
				var nowSuffix = files[key].suffix;
				$.each(suffix,function(key,value){
					if(nowSuffix == value || nowSuffix == value.toUpperCase()){
						targetHtml = value;
						dataType = 'file';
						return false;
					}else{
						dataType = 'file';
						targetHtml = 'file';
					}
				});
				
			}else{
				dataType = 'folder';
				targetHtml = 'folder';
			}
			
			_html += $("#list").html() + (_fileListHtml.replaceAll("#name#",files[key].name)
											.replaceAll("#path#",files[key].uri)
											.replaceAll("#title#",files[key].name)
											.replaceAll("#suffix#",targetHtml)
											.replaceAll("#dataType#",dataType));
			
		});
		$("#list").html(_html);
		
		addEvent();//为拼接出来的dom元素添加事件
	}else{
		var _fileListHtml = '<div id="emptyTips">\
							<h1>您的这个文件夹还是空的哦~</h1>\
							<p class="upload">\
							立刻点击上传按钮添加文件吧！\
							</p>\
							</div>';
		$("#list").html(_fileListHtml);
	}
	
	$("#loadingMask").css("display","none").css("opacity",0);//此处调用函数结束loading蒙层
}

function addEvent(){
	
	$('ul[id|="list"] li').hover(function(){
		$(this).addClass("hover").siblings().removeClass("hover");
	},function(){
		$(this).removeClass("hover");
	}).click(function(){
		$(this).addClass("active").siblings().removeClass("active");
		moreButtonsShow();
	}).dblclick(function(){
		moreButtonsHide();
		var uri = $(this).attr("data-path");
		showAllData(uri,{
			success:function(json){
				updatePageShow(json);
			}
		});
		showPath(uri);
	});
}


/**
 * 通过打开按钮打开文件夹
 */
function openFolder(){
	var uri = getSelectedPath();
	showAllData(uri,{
		success:function(json){
			updatePageShow(json);
		}
	});
}
/**
 * 新建文件夹
 */
function createNewFolder(){
	$('ul[id|="list"] li').removeClass("active");
	var _newFolderHtml = '<li class="row filelist-item clearfix active renaming" f-index="0" style="left: 0px; top: 0px;">\
	   	<div class="column column-checkbox">\
	    <label></label>\
	    </div>\
		    <div class="column column-name" title="">\
	    <span class="ico ico-folder"></span>\
		<textarea id="rename-text" style="height: 32px;" onBlur="addNewFolder()">新建文件夹</textarea>\
	    </div>\
	    <div class="column column-size"> </div>\
	    <div class="column column-time">2013-07-06 19:29</div>\
	   	</li>';
	
	var newHtml = _newFolderHtml + $('ul[id|="list"]').html();
	$('ul[id|="list"]').html(newHtml);
	addEvent();
}

/**
 * 删除文件
 */
function deleteFile(){
	var path = getSelectedPath();
	var showPath = getCurrentDirectory();
	$.ajax({
		type:  "POST",
		url:   "/webFile-webroot/index/deleteFile",
		data: {"path":path},
		cache: false,
		success: function( json ) {
			showSuccessMes('删除成功!');
			showAllData(showPath,{
				success:function(json){
					updatePageShow(json);
				}
			});
		},
		error: function (xhr, ajaxOptions, thrownError){
			alert("Http status: " + xhr.status + "," + xhr.statusText + "," + "删除失败，请稍后重试!");
		},
		complete :function(){ 
//			alert("The progream is complete!!!"); 
			$("#makeSureDelete1").css("display","none");
			$("#makeSureDelete2").css("display","none");
			},
	});
}

function makeSureDelete(){
	$("#makeSureDelete1").css("display","block");
	$("#makeSureDelete2").css("display","block");
	$("#makeSureDeleteButton").one("click",function(){
		deleteFile();
	});
	$("#cancelDeleteButton").click(function(){
		$("#makeSureDelete1").css("display","none");
		$("#makeSureDelete2").css("display","none");
	});
}

function addNewFolder(){
	$("#loadingMask").css("display","block").css("opacity",1);//此处调用函数出现loading蒙层
	var folderName = $("#rename-text").val();
	var path = getCurrentDirectory();
	$.ajax({
		type:  "POST",
		url:   "/webFile-webroot/index/createFolder",
		data: {"path":path,"name":folderName},
		cache: false,
		success: function( json ) {
			showSuccessMes('创建成功!');
			showAllData(path,{
				success:function(json){
					updatePageShow(json);
				}
			});
		},
		error: function (xhr, ajaxOptions, thrownError){
//			alert("Http status: " + xhr.status + " " + xhr.statusText + "\najaxOptions: " + ajaxOptions + "\nthrownError:"+thrownError + "\n" +xhr.responseText);
			alert("Http status: " + xhr.status + "," + xhr.statusText + "," + "创建失败，请修改文件夹名称后重试!");
		},
		complete :function(){ 
//			alert("The progream is complete!!!"); 
			},
	});
	
	$("#loadingMask").css("display","none").css("opacity",0);//此处调用函数结束loading蒙层
}

//改变文件路径显示
function showPath(path){
	$('div[id|="crumb"] div[class|="crumb-path"] span').html(path);
	isCanClick(path);
}

function showSuccessMes(message){
	$('div[id|="topTips"] span[class|="msg"]').html(message);
	$("#topTips").fadeIn();
	setTimeout("$('#topTips').fadeOut()",3000);
}

//操作返回按钮，可用和不可用
function canClick(fatherPath){
	var buttion = $('span[id|="tbBack"]');
	if(buttion.hasClass('y-btn-back-disable')){
		buttion.removeClass("y-btn-back-disable");
	}
	buttion.attr("title","返回上级目录");
	buttion.attr("onclick","returnFatherPath(" + "'" + fatherPath + "'" + ");");
}

function cannotClcik(){
	var buttion = $('span[id|="tbBack"]');
	if(!buttion.hasClass('y-btn-back-disable')){
		buttion.addClass('y-btn-back-disable');
	}
	buttion.attr("title","");
}

//控制显示或不显示返回按钮
function isCanClick(path){
	var fatherPath;
	var pathArray = path.split('\\');
	if(pathArray.length == 2){
		if(pathArray[1] == ""){
			cannotClcik();
		}else{
			fatherPath = pathArray[0] + "\\\\";
			canClick(fatherPath);
		}
	}else{
		fatherPath = "";
		for(var i=0; i<pathArray.length-1; i++){
			if(i == pathArray.length-2){
				fatherPath += pathArray[i];
			}else{
				fatherPath += pathArray[i] + "\\\\";
			}
		}
		canClick(fatherPath);
	}
}

//返回上级目录操作
function returnFatherPath(fatherpath){
	showAllData(fatherpath,{
		success:function(json){
			updatePageShow(json);
		}
	});
}

/*
 *下载文件， 如果是文件直接下载，文件夹打包后下载
 */
function downloadFile(){
	var path = getSelectedPath();
	
	var url = 'downloadFile?path=' + encodeURI(encodeURI(path));//escape(path);
	window.open().location.href = url;
}

//获取主面板被选择到的文件路径
function getSelectedPath(){
	var selectedPath = $('ul[id|="list"] li').filter(".active").attr("data-path");
	return selectedPath;
}

/*
 * 获取当前目录地址
 */
function getCurrentDirectory(){
	var path = $('div[id|="crumb"] div[class|="crumb-path"] span').html();
	return path;
}

//获取主面板被选择到的文件的文件类型：文件夹 或 文件
function getSelectedType(){
	var type = $('ul[id|="list"] li').filter(".active").attr("data-Type");
	return type;
}

/*
 * 选择文件或文件件后显示更多的操作按钮
 */
function moreButtonsShow(){
	$("#moreMovement").css("display","block");
	var dataType = getSelectedType();
	if(dataType == 'file'){
		$("#tbDownLoad").html("下载");
	}else{
		$("#tbDownLoad").html("打包下载");
	}
}

function moreButtonsHide(){
	$("#moreMovement").css("display","none");
}

/*
 * 上传文件对话框操作
 */
function uploadManage(){
	$("#uploadBasePanel0").css("display","block");
	$("#uploadBasePanel1").css("display","block");
	
	var path = getCurrentDirectory();
	$("#uploadCurUploadPath").html(path);
	
	$("#uploadCloseLink").click(function(){
		$("#uploadBasePanel0").css("display","none");
		$("#uploadBasePanel1").css("display","none");
	});
	
	$('div[id|="uploadBasePanel1"] div[class|="panel-content"] div[class|="hd"]').mousedown(function(e){
		var offsetX = 0;//按下鼠标时，鼠标的X坐标
		var offsetY = 0;//按下鼠标时，鼠标的Y坐标
		var moveX = 0;//鼠标X坐标上移动的距离
		var moveY = 0;//鼠标Y坐标上移动的距离
		
		var divCurrentX = 0;//要进行拖拽的dom元素的原X坐标
		var divCurrentY = 0;//要进行拖拽的dom元素的原Y坐标
		var moveDiv = $("#uploadBasePanel1");//要进行拖拽的dom元素
		divCurrentX = Number(moveDiv.css("left").replace("px",""));
		divCurrentY = Number(moveDiv.css("top").replace("px",""));
		
		var divNewX = 0;//要进行拖拽的dom元素拖拽后的X坐标
		var divNewY = 0;//要进行拖拽的dom元素拖拽后的Y坐标
		
		offsetX = e.pageX;
		offsetY = e.pageY;
		
		$("#uploadBasePanel1").mousemove(function(e){
			moveX = e.pageX - offsetX;
			moveY = e.pageY - offsetY;
			
			divNewX = divCurrentX + moveX;
			divNewY = divCurrentY + moveY;
			moveDiv.css("left",divNewX).css("top",divNewY);
		});
		
		$("#uploadBasePanel1").mouseup(function(e){
			moveDiv.unbind("mousemove");
		});
	});
	
	var uploadPath = getCurrentDirectory();
	startUpload(uploadPath);
}

function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht = curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPaht+projectName);
};

function startUpload(uploadPath){
	$("#uploadify").uploadify({
        //开启调试
        'debug' : false,
        //是否自动上传
        'auto':false,
        //超时时间
        'successTimeout':99999,
        //附带值
        'formData':{
            'userid':'用户id',
            'username':'testname',
        	'uploadPath':uploadPath
        },
        'swf': "../styles/images/uploadify.swf",
        'queueID':'fileQueue',
        'fileObjName':'"uploadify"',
        'uploader':'uploadFile',
        'width':'100',
        'height':'32',
        'fileTypeDesc':'*.doc; *.jpg; *.rar *.zip',
        'fileSizeLimit':'1000MB',
        'buttonText' : '',//浏览按钮文字
        'queueSizeLimit' : 5,
        //每次更新上载的文件的进展
        'onUploadProgress' : function(file, bytesUploaded, bytesTotal, totalBytesUploaded, totalBytesTotal) {
             //有时候上传进度什么想自己个性化控制，可以利用这个方法
             //使用方法见官方说明
        },
        //选择上传文件后调用
        'onSelect' : function(file) {
        	 this.addPostParam("file_name",encodeURI(encodeURI(file.name)));//改变文件名的编码
        },
        'onUploadStart': function (file) {  
            $("#file_upload").uploadify("settings", "formData", { 'uploadPath':uploadPath});  
            //在onUploadStart事件中，也就是上传之前，把参数写好传递到后台。  
        },
        //返回一个错误，选择文件的时候触发
        'onSelectError':function(file, errorCode, errorMsg){
            switch(errorCode) {
                case -100:
                    alert("上传的文件数量已经超出系统限制的"+$('#uploadify').uploadify('settings','queueSizeLimit')+"个文件！");
                    break;
                case -110:
                    alert("文件 ["+file.name+"] 大小超出系统限制的"+$('#uploadify').uploadify('settings','fileSizeLimit')+"大小！");
                    break;
                case -120:
                    alert("文件 ["+file.name+"] 大小异常！");
                    break;
                case -130:
                    alert("文件 ["+file.name+"] 类型不正确！");
                    break;
            }
        },
        //检测FLASH失败调用
        'onFallback':function(){
            alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
        },
        //上传到服务器，服务器返回相应信息到data里
        'onUploadSuccess':function(file, data, response){
        	console.log('id: ' + file.id
                    + ' - 索引: ' + file.index
				    + ' - 文件名: ' + file.name
				    + ' - 文件大小: ' + file.size
				    + ' - 类型: ' + file.type
				    + ' - 创建日期: ' + file.creationdate
				    + ' - 修改日期: ' + file.modificationdate
				    + ' - 文件状态: ' + file.filestatus
				    + ' - 服务器端消息: ' + data
				    + ' - 是否上传成功: ' + response);
        	setTimeout(function(){
        		$("#uploadBasePanel0").css("display","none");
        		$("#uploadBasePanel1").css("display","none");
        		showAllData(uploadPath,{
        			success:function(json){
        				updatePageShow(json);
        			}
        		});
        	},3000);
        }
    });
}


