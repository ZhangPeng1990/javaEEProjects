///�ϴ�����˶�����ͼƬ
var upload_num = 0;
//Flash�����ϴ��ؼ�
Uploader = {
    id: 'zip_uploader',
    userId: 0,
    bookId: 0,
    uploading: false,
    swfUrl: '/static/swf/uploader_file.swf?ver=20130524',
    uploadUrl: '/userimage/uploadfile',
    needRerfesh: false,
    contentHeight:528,
    fixMacSafari: function () {
        if ((window.navigator.userAgent.indexOf("Macintosh") > -1 && window.navigator.userAgent.indexOf("Safari") > -1)) {
            Uploader.swfUrl = '/static/swf/uploadimage_unzip.swf?ver=20130524';
            Uploader.contentHeight = 602;
            Uploader.uploadUrl = '/userimage/upload';
        }
    },
    show: function (userId, bookId, worksId) {
        Uploader.uploadingBar.hide();
        Uploader.needRerfesh = false;
        $("#uploader_dialog").show();
        window.onCompeled = function (objStr) {
            if (!objStr) {
                var obj = $.parseJSON(objStr.replace(/\\/g, "\\\\"));
                Uploader.onUploaded(obj);
            }
            Uploader.uploadingBar.hide(3000);
            Uploader.uploading = false;
        }
        window.onUploaded = function (objStr)
        {
            //alert(objStr);
            var obj = $.parseJSON(objStr.replace(/\\/g, "\\\\"));
            Uploader.onUploaded(obj);
        }
        window.onStartEdit = function () {
            Uploader.close();
            Uploader.min();
        }
        window.goEdit = function () {
            Uploader.close();
        }
        window.onStartUpload = function () {
            Uploader.uploading = true;
        }
        window.onProgress = function (p) {
            Uploader.onProgress(p);
        };
        Uploader.userId = userId || window.UserId;
        Uploader.bookId = bookId || window.BookId;
        Uploader.worksId = worksId || window.WorksId;
        Uploader.createContent();
        Uploader.addEvent();
    },
    onUploaded: function (obj) {
        upload_num++;
        //if (window.IsFirst == 1 && upload_num == 1) {
        //    EditorTips.firstUploaded.show();
        //}
        
        if (mimo.Editor && mimo.Editor.ThumbnailList) {
            mimo.Editor.ThumbnailList.addThumbnail(obj);
            Uploader.uploadingBar.updatePage();
        }

        if (window.FL_addThumbnail) {
            FL_addThumbnail(obj);
            Uploader.uploadingBar.updatePage();
        }
    },
    close: function () {
        Uploader.refreshImage();
        $("#uploader_dialog").css("margin-top", "-10000px");
        if (Uploader.uploading == true) {
            Uploader.uploadingBar.show();
        }
    },
    //�ϴ�������
    uploadingBar: {
        show: function () {
            $("#upload_bar_holder").fadeIn();
        },
        hide: function (time) {
            if (time) {
                setTimeout(function () {
                    $("#upload_bar_holder").fadeOut();
                }, time);
            }
            else {
                $("#upload_bar_holder").fadeOut();
            }
        },
        updatePage: function () {
            var p = parseInt($("#upload_totalPage").text()) + 1;
            $("#upload_totalPage").text(p);
        }
    },
    min: function () {
        $(".uploader_dialog_min").show();
        Uploader.close();
    },
    //�����ϴ������ص�ǰ���Ȱٷֱȣ�
    onProgress: function (p) {
        $("#bar_percent").text(p);
        $("#upload_curr_bar").css("width", (p * 2) + "px");
        if (p == 100) { Uploader.uploading = false; $("#upload_curr_bar").css("width", "200px"); Uploader.uploadingBar.hide(5000); }
    },
    refreshImage: function () {
        if (!Uploader.needRerfesh) {
            return;
        }
        if (window.loadPhotoList) {
            loadPhotoList();
            return;
        }
        if (window.Editor && Editor.Tool.imageViewPanel) {
            Editor.Tool.imageViewPanel.emptyPanel();
            Editor.Tool.imageViewPanel.getPhotoView();
        }
    },
    createContent: function () {
        //����λ��
        var item = $("#uploader_dialog");
        var topPx = ($(window).height() / 2 - item.height() / 2) + $(document).scrollTop();
        if (topPx < 10) {
            topPx = 10;
        }
        item.css({
            "top": topPx + "px"
        });
        var isInit = item.attr("is_init");
        item.css("margin-top", "");
        if (!isInit) {
            Uploader.insertFlash();
            item.attr("is_init", "true");
        }
    },
    addEvent: function () {
        $("#uploader_dialog .uploader_close").click(function (e) {
            e.preventDefault();
            Uploader.close();
        });

        $("#uploader_dialog .uploader_min, #uploader_dialog .go_edit").click(function (e) {
            e.preventDefault();
            Uploader.min();
        });

        $(".uploader_dialog_min,#bar_outer").click(function (e) {
            e.preventDefault();
            $(".uploader_dialog_min").hide();
            Uploader.show();
        });
    },
    insertFlash: function () {
        // For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. 
        var swfVersionStr = "10.2.0";
        // To use express install, set to playerProductInstall.swf, otherwise the empty string. 
        var xiSwfUrlStr = "playerProductInstall.swf";

        var flashvars = {};
        if (window.location.host.indexOf("mimoprint.com") > -1) {
            flashvars.uploadUrl = "http://upload.mimoprint.com" + Uploader.uploadUrl;
        } else {
            flashvars.uploadUrl = "http://" + window.location.host + Uploader.uploadUrl;
        }
        flashvars.userId = Uploader.userId;
        flashvars.worksId = Uploader.worksId;
        flashvars.bookId = Uploader.bookId;
        flashvars.maxCount = 200;

        var params = {};
        params.quality = "high";
        params.bgcolor = "#ffffff";
        params.allowfullscreen = "true";
        params.allowScriptAccess = 'always';
        params.wmode = "transparent";
        params.movie = Uploader.swfUrl;
        params.hasPriority = "true";

        var attributes = {};
        attributes.id = Uploader.id;
        attributes.name = Uploader.id;
        attributes.align = "middle";

        swfobject.embedSWF(
            Uploader.swfUrl, Uploader.id,
            "900", "536",
            swfVersionStr, xiSwfUrlStr,
            flashvars, params, attributes);
        // JavaScript enabled so display the flashContent div in case it is not replaced with a swf object.
        //swfobject.createCSS("#flashContent", "display:block;text-align:left;");   
    },
    extend: {
        data: {
            uploader_dialog_Id: '#uploader_dialog', //�ϴ�������
            uploader_dialog_nav: 'div.upload_type_list .nav', //�����򶥲������ǩ
            nav_qq_Id: '#qqupload',   //QQ�ϴ�nav
            tip_pos_Id: '#mod_thumbnail_btn_prev', //�ϴ���ɵ�����ʾλ��
            tip_Id: '#upload_tips',  //������ʾid
            IS_UPLOADING: false //�Ƿ������ϴ�
        },
        initDialog: function (role, opentype, filename) {
            Uploader.fixMacSafari();
            mimo.Loader.importStyle("/static/css/upload.css", "");
            //�ϴ�������html
            var uploader_dialog_html = '<!--ͼ���ϴ�-->'
            + '<div id="uploader_dialog" class="uploader_dialog" style="margin-top: -10000px;display: none; position:absolute;">'
                + '<div class="uploader_dialog_title">'
                       + '<a class="uploader_close" href="javascript:;"></a>'
                    + '<h2 style="width: 500px;">1.����������������Ƭ���Ʒ�������ϴ�500����Ƭ��2.��������ѡ��80����Ƭ</h2>'
                + '</div>'
                + '<div class="uploader_dialog_content" style="position:relative;height:' + Uploader.contentHeight + 'px;">'
                    + '<p style="position:absolute;left:217px;top:20px; font-size:12px;">�������ͨ�ϴ�����������,����������Flash���̫�ɻ���û��װ����,����<a style="color:blue;" href="http://www.adobe.com/go/getflash" targer="_blank">����</a>��װ����������װ��ɺ����´򿪱�ҳ�漴�ɡ�</p>'
                    + '<div class="upload_type_list">'
                        + ''
                     + '</div>'
                     + '<div class="upload_item_list">'
                    + '<div class="upload_item_show" id="upload_flash">'
                        + '<div class="zip_uploader">'
                            + '<div id="zip_uploader"><h1 style="font-size:20px;">����û�а�װFlash������,����<a style="color:blue;" href="http://www.adobe.com/go/getflash" targer="_blank">����</a>��װ����װ��ɺ����´򿪱�ҳ�漴�ɡ�</h1></div>'
                        + '</div>'
                    + '</div>'
                   + '</div>'
             + '</div>'
        + '</div>'
        + '<!--ͼ���ϴ���С��-->'
        + '<div class="uploader_dialog_min" style="display: none;">'
            + '<span>�ϴ�ͼ����...<span id="uploader_dialog_min_progress">30</span>%</span>'
        + '</div>';

            //QQ�ϴ�ͷ������
            var nav_qq = '<div class="nav" ref="#upload_qq" id="qqupload" title="QQ����">QQ����</div>';
            var nav_qq_content = '\
                <div class="upload_item_show" style="top: -523px; display: none;overflow-y:scroll;" id="upload_qq">\
                    <div class="upload_item_content">\
                        <ul class="upload_qq_tab">\
                            <li><a id="zip" class="cur" href="#">��ѹ���ļ���ʽ</a></li>\
                            <li><a id="floder" href="#">���ļ��з�ʽ</a></li>\
                        </ul>\
                        <div class="upload_item_tips tab_floder" style="display:none;">\
                            <h2>�ļ��з�ʽ:</h2>\
                            <p>ʵʱ�����ϴ���ͼƬ,����һ��ϵͳ�Զ���ȡһ��,֧��<b>�߱༭���ϴ�</b>��<br />\
                               ��ʼ���ͺ󣬿��Թرձ�������ÿ��һ��ͼƬ���ͳɹ����ڱ༭���������Կ����ɹ��ϴ���ͼƬ��<br />\
                              ��PS:�Ƽ��ż��༭���û�ʹ�á�\
                            </p>\
                        </div>\
                        <div class="upload_item_tips tab_zip">\
                            <h2></h2>\
                            <p>�Ƽ���QQ��1204055612 Ϊ���ѣ��������ļ���ʽ���ͣ�ѹ��������ܳ���2G��������������͡�\
                                <br />��PS:�����QQ���ѣ����ܷ��������ļ�Ŷ����\
                            </p>\
                        </div>\
                        <div class="upload_item_filename">\
                            <span class="action_name">ѹ�������ƣ�</span><input style="font-size:24px;letter-spacing:2px;" /><a href="#" class="btn_copy"></a><a href="tencent://message?uin=1204055612" class="btn_send"></a><span>(�ϴ����ļ������ļ������Ʊ������ߵ�����һ���ſ���!!)</span>\
                        </div>\
                        <div class="upload_item_guide tab_zip">\
                            <h2>������"��ѹ���ļ���ʽ����"ʾ��</h2>\
                            <div class="upload_item_section">\
                                <h2><i class="upload_item_section_step1"></i><b>�½��ļ���</b>,���������ṩ����������</h2>\
                                <img  src="/static/images/upload/upload_qq_zip_1.jpg"/>\
                            </div>\
                            <div class="upload_item_section">\
                                <h2><i class="upload_item_section_step2"></i>��Ҫ�ϴ���ͼƬ��<b>���Ƶ�</b>�ղŴ������ļ�����</h2>\
                                <img  src="/static/images/upload/upload_qq_zip_2.jpg"/>\
                            </div>\
                            <div class="upload_item_section">\
                                <h2><i class="upload_item_section_step3"></i>���ļ��е������ұߣ�ѡ����ӵ���xxx.rar����<b>ѹ���ļ���</b>��֧��rar��zip�ȸ�ʽ����</h2>\
                                <img  src="/static/images/upload/upload_qq_zip_3.jpg"/>\
                            </div>\
                            <div class="upload_item_section">\
                                <h2><i class="upload_item_section_step4"></i><b>���͵�QQ����</b>��1204055612 <a href="tencent://message?uin=1204055612">[�������]</a></h2>\
                                <img  src="/static/images/upload/upload_qq_zip_4_2.jpg"/>\
                            </div>\
                        </div>\
                        <div class="upload_item_guide tab_floder" style="display:none;">\
                            <h2>������"���ļ��з�ʽ����"ʾ��</h2>\
                            <div class="upload_item_section">\
                                <h2><i class="upload_item_section_step1"></i><b>�½��ļ���</b>,���������ṩ����������</h2>\
                                <img  src="/static/images/upload/upload_qq_zip_1.jpg"/>\
                            </div>\
                            <div class="upload_item_section">\
                                <h2><i class="upload_item_section_step2"></i>��Ҫ�ϴ���ͼƬ��<b>���Ƶ�</b>�ղŴ������ļ�����</h2>\
                                <img  src="/static/images/upload/upload_qq_zip_2.jpg"/>\
                            </div>\
                            <div class="upload_item_section">\
                                <h2><i class="upload_item_section_step3"></i><b>���͵�QQ����</b>��1204055612 <a href="tencent://message?uin=1204055612">[�������]</a></h2>\
                                <img  src="/static/images/upload/upload_qq_floder_3_2.jpg"/>\
                            </div>\
                        </div>\
                    </div>\
                </div>';

            //email�ϴ�ͷ������
            var nav_email = '<div class="nav" ref="#upload_email" id="emailupload" title="�ʼ�����">�ʼ�����</div>';
            var nav_email_content = '\
                <div class="upload_item_show" style="top: -523px; display: none;overflow-y:scroll;" id="upload_email">\
                    <div class="upload_item_content">\
                        <div class="upload_item_tips">\
                            <h2>�ʼ�����:</h2>\
                            <p>����QQ����󸽼��ȶ����ٶȿ���ŵ㣬���԰�����ʡ�ϴ�ʱ�䣬�����ϴ�������ʣ��Ƽ���ƷͼƬ�࣬��ͨ�ϴ����ȶ����û�ʹ�á�<br />\
            ����ÿ�춨ʱ10:00, 15:00, 18:00, 21:00, 23:00�ᶨʱ�����ʼ��ϴ�<br />\
            ��������ʼ�֪ͨ�������Ϳ��Կ�ʼ�༭��Ʒ��\
                             </p>\
                         </div>\
                         <div class="upload_item_filename">\
                             <span>ѹ�������ƣ�</span><input style="font-size:24px;letter-spacing:2px;" /><a href="#" class="btn_copy"></a><a target="_blank" href="http://mail.qq.com" class="btn_send"></a><span>�������</span>\
                         </div>\
                         <div class="upload_item_emailtitle">\
                            <span class="tips1">��ܰ���ѣ��ʼ��������ã�</span><span class="tips2" id="file_name">��ĪӡƷ-�ʼ�����-2222</span>\
                        </div>\
                         <div class="upload_item_guide">\
                             <h2>������"���ʼ�����"ʾ��</h2>\
                             <div class="upload_item_section">\
                                 <h2><i class="upload_item_section_step1"></i><b>�½��ļ���</b>,���������ṩ����������</h2>\
                                 <img  src="/static/images/upload/upload_qq_zip_1.jpg"/>\
                             </div>\
                             <div class="upload_item_section">\
                                 <h2><i class="upload_item_section_step2"></i>��Ҫ�ϴ���ͼƬ��<b>���Ƶ�</b>�ղŴ������ļ�����</h2>\
                                <img  src="/static/images/upload/upload_qq_zip_2.jpg"/>\
                            </div>\
                            <div class="upload_item_section">\
                                <h2><i class="upload_item_section_step3"></i>���ļ��е������ұߣ�ѡ����ӵ���xxx.rar����<b>ѹ���ļ���</b>��֧��rar��zip�ȸ�ʽ����</h2>\
                                <img  src="/static/images/upload/upload_qq_zip_3.jpg"/>\
                            </div>\
                            <div class="upload_item_section">\
                                <h2><i class="upload_item_section_step4"></i><b>���͵�QQ����</b>��<a target="_blank" href="http://mail.qq.com">1204055612@qq.com</a> <a target="_blank" href="http://mail.qq.com">[�����ת��QQ����]</a></h2>\
                                <img  src="/static/images/upload/upload_qq_mail_3.jpg"/>\
                            </div>\
                        </div>\
                    </div>\
                </div>';

            var nav_flash = '<div class="nav on" ref="#upload_flash" title="flash �ϴ�">��ͨ�ϴ�</div>';

            var $dialog = $(uploader_dialog_html);
            $dialog.find(".upload_type_list").append(nav_flash);
            $dialog.find(".upload_type_list").append(nav_qq);
            $dialog.find(".upload_item_list").append(nav_qq_content);
            //$dialog.find(".upload_type_list").append(nav_email);
            //$dialog.find(".upload_item_list").append(nav_email_content);

            if ($("body").find(this.data.uploader_dialog_Id).length == 0) {
                $("body").append($dialog);
            }

            $(".upload_item_filename input").val(filename);
            $("#file_name").text("��ĪӡƷ-�ʼ�����-" + filename);
            //���¼�
            //QQ�ϴ�
            $("#zip, #floder").click(function (e) {
                e.preventDefault();
                $("#zip, #floder").removeClass("cur");
                var btn = $(this);
                btn.addClass("cur");
                if (btn.attr("id") == "zip") {
                    $("#upload_qq .tab_floder").hide();
                    $("#upload_qq .tab_zip").show();
                    $("#upload_qq .upload_item_filename span.action_name").text("ѹ�������ƣ�");
                } else {
                    $("#upload_qq .tab_floder").show();
                    $("#upload_qq .tab_zip").hide();
                    $("#upload_qq .upload_item_filename span.action_name").text("�ļ������ƣ�");
                }
            });

            //�������ư�ť
            $(".upload_item_filename .btn_copy").click(function (e) {
                e.preventDefault();
                prompt("�밴 Ctrl+C �����ı�", filename);
            });
            
        },
        //�ϴ���ɵ�����ʾ
        tip: function (num) {
            var that = this;
            var pos = $(that.data.tip_pos_Id).offset();
            $(that.data.tip_Id).text("+" + num + "��").show()
                                .css('z-index', 9999)
                                .css('left', pos.left + 40)
                                .css('top', pos.top)
                                .css('opacity', 0)
                                .animate({ opacity: 1, top: pos.top - 50 }, 1000)
                                .animate({ opacity: 0, top: pos.top - 100 }, 1000);
        },
        //ʵʱ��ȡ�����ϴ�����
        getNewUpload: function (timer) {

            //ʵʱ�����ֱ�
            var handler = null;
            var that = this;
            var works_Id = window.WorksId;
            if (works_Id <= 0 || that.data.IS_UPLOADING == true) return false;

            clearInterval(handler);

            that.data.IS_UPLOADING = true;
            var data = {};
            var num = 0;
            data.works_Id = works_Id;
            data.time = (new Date()).valueOf();
            handler = setInterval(function () {
                $.ajax({
                    url: '/works/getupload',
                    type: 'GET',
                    dataType: 'json',
                    data: data,
                    success: function (Json) {
                        if (Json.ret == 1) {
                            num = Json.data.length;
                            that.tip(num);
                            $.each(Json.data, function (i, item) {
                                mimo.Editor.ThumbnailList.addThumbnail({ "ret": "1", "msg": "�ϴ��ɹ�", "data": item });
                                Uploader.uploadingBar.updatePage();
                            });
                        }
                        if (Json.ret < 0) {
                            clearInterval(handler);
                            that.data.IS_UPLOADING = false;
                        }
                    },
                    error: function () {
                        that.data.IS_UPLOADING = false;
                    }
                });
            }, timer);
        },
        //�ϴ���ʾ
        uploadItemShow: function () {
            $("#upload_flash").css("top", "-10000px");
            $("#upload_qq,#upload_email").hide();
        },
        //�����¼�
        event: function (role, opentype, filename) {
            var that = this;
            //��ʼ���ϴ���
            that.initDialog(role, opentype, filename);
            // �ϴ�������϶�
            $(that.data.uploader_dialog_Id).draggable({ handle: "div.uploader_dialog_title" });

            //������Ŀ����л�
            $(that.data.uploader_dialog_nav).click(function () {
                $(that.data.uploader_dialog_nav).removeClass("on");
                $(this).addClass("on");
                var id = $(this).attr("ref");
                that.uploadItemShow();
                if (id == "#upload_flash") {
                    $(id).css("top", "0px");
                } else {
                    $(id).css("top", "-472px").show();
                }
            });

            //QQ�ϴ���Ŀʵʱ���������ϴ�ͼƬ
            $(that.data.nav_qq_Id).click(function () {
                that.getNewUpload(30000);
            });

            //Ĭ����ʾQQ��Ŀ
           // $("#qqupload").click();
        }
    }
}




/*
* ��ʾ��
* @author yaobo
* @description ��ʾ��
*/
var EditorTips = {
    tpl: {
        firstUploaded_tpl: '<div style="width: 535px; height: 290px; z-index: 10002; background: url(\'/static/images/pop_tips/editor_tip_03.png\')  no-repeat; position: absolute; ">'
                      + '<a href="javascript:;" title="�ر�" id="colse" style="position: absolute; width: 34px; height: 34px;  right: 0px;"></a>'
                      + '<a href="javascript:;" title="��һ��" id="btn_next" style="position: absolute; width: 93px; height: 34px;  right: 41px; bottom: 50px;"></a>'
                    + '</div>',
        maskLayer_tpl: '<div id="J_mask_layer" class="ui-mask-layer"></div>'
    },
    /*
* ��λ
* @author yaobo
* @description ��λ
*/
    setPosition: function (object, position, reference) {
        var refer = reference || document,
                isGlobal = (refer == document || refer == window) ? 1 : 0;
        var objWidth = object.outerWidth(),
                objHeight = object.outerHeight();
        var pos = position.split(","),
                xPos = pos[0],
                yPos = pos[1] || pos[0],
                x = isGlobal ? 0 : $(refer).offset().left,
                y = isGlobal ? 0 : $(refer).offset().top;
        switch (xPos) {
            case "center":
                object.css({
                    left: ($(refer).width() - objWidth) / 2 + x,
                    right: "auto"
                });
                break;
            case "left":
                object.css({
                    left: x,
                    right: "auto"
                });
                break;
            case "right":
                if (isGlobal) {
                    object.css({
                        left: "auto",
                        right: 0
                    });
                } else {
                    object.css({
                        left: x + $(refer).outerWidth() - objWidth,
                        right: "auto"
                    });
                }
                break;
            default:
                break;
        }
        switch (yPos) {
            case "center":
                var n = isGlobal ? 2.5 : 2;
                var top = refer == document ? (($(window).height() - objHeight) / n + $(document).scrollTop()) : (($(refer).height() - objHeight) / n + y);
                top = (refer == document && top < 0) ? 0 : top;
                object.css({
                    top: top,
                    bottom: "auto"
                });
                break;
            case "top":
                object.css({
                    top: y - objHeight,
                    bottom: "auto"
                });
                break;
            case "bottom":
                if (isGlobal) {
                    object.css({
                        top: "auto",
                        bottom: 0
                    });
                } else {
                    object.css({
                        top: y + $(refer).outerHeight(),
                        bottom: "auto"
                    });
                }
                break;
            default:
                break;
        }

        if (refer == window) {
            object.css({
                position: "fixed"
            });
        } else {
            object.css({
                position: "absolute"
            });
        }
    },
    /*
* ��ʾЧ��
* @author yaobo
* @description  ��ʾЧ��
*/
    showEffect: function (panel, effect) {
        //���õ�����ʽ
        var speed = 300;
        switch (effect) {
            case "fade":
                panel.hide().fadeIn(speed);
                break;
            case "fadeDown":
                var top = parseInt(panel.css("top"));
                panel.css({
                    opacity: 0.5,
                    top: top - 20
                });
                panel.stop().show().animate({
                    opacity: 1,
                    top: top
                }, speed);
                break;
            case "slide":
                var height = panel.height();
                var top = parseInt(panel.css("top"));
                var over = panel.css("overflow");
                panel.css({
                    display: "none",
                    height: 0,
                    overflow: "hidden",
                    top: top + height
                });
                panel.stop().show().animate({
                    height: height,
                    top: top
                }, speed, function () {
                    panel.css({
                        overflow: over
                    });
                });
                break;
            case "sacle":
                var percent = 0.8;
                var height = panel.height();
                var width = panel.width();
                var top = parseInt(panel.css("top"));
                var left = parseInt(panel.css("left"));
                var over = panel.css("overflow");
                panel.css({
                    display: "none",
                    height: height * percent,
                    width: width * percent,
                    opacity: 0,
                    overflow: "hidden",
                    top: top + height * (1 - percent) / 2,
                    left: left + width * (1 - percent) / 2
                });
                panel.show().animate({
                    opacity: 1,
                    height: height,
                    left: left,
                    top: top,
                    width: width
                }, speed, function () {
                    panel.css({
                        overflow: over
                    });
                });
                break;
            default:
                panel.css({
                    opacity: 1
                }).show();
                break;
        }
    },
    /*
* ����Ч��
* @author yaobo
* @description  ����Ч��
*/
    hideEffect: function (panel, effect) {
        //���õ�����ʽ
        var speed = 300;
        switch (effect) {
            case "fade":
                panel.fadeOut(speed);
                break;
            case "fadeDown":
                var top = parseInt(panel.css("top"));
                panel.stop().animate({
                    opacity: 0.5,
                    top: top + 20
                }, speed, function () {
                    panel.hide();
                });
                break;
            case "slide":
                var height = panel.height();
                var top = parseInt(panel.css("top"));
                panel.stop().animate({
                    height: 0,
                    top: top + height
                }, speed, function () {
                    panel.hide();
                    panel.css({
                        height: height,
                        top: top
                    })
                });
                break;
            default:
                panel.hide();
                break;
        }
    },
    /*
    * ��ȡ���ֲ�
* @author yaobo
* @description  ��ȡ���ֲ�
*/
    showMask: function () {
        $("#J_mask_layer").remove();
        var height = Math.max($(document).height(), $(window).height());
        var $mask = $(EditorTips.tpl.maskLayer_tpl).css({
            position: 'absolute',
            left: 0,
            top: 0,
            display: 'none',
            height: height,
            background: '#000000',
            opacity: 0.5,
            zIndex: 10001,
            width: '100%'
        });
        $("body").append($mask);
        $mask.fadeIn();
    },
    /*
  * �������ֲ�
  * @author yaobo
  * @description  �������ֲ�
  */
    hideMask: function () {
        $("#J_mask_layer").remove();
    },
    /*
    * ��ȡ����
    * @author yaobo
    * @description  ��ȡ���ֲ�
    */
    getPopup: function (html, id) {
        if (id) {
            if ($("#" + id).length > 0) {
                return $("#" + id).eq(0);
            }
        }
        var $Popup = $(html).attr("id", id).hide();
        $("body").append($Popup);
        return $Popup;
    },

    //��һ���ϴ��ɹ�
    firstUploaded: {
        show: function () {
            Uploader.close();
            var $pop = EditorTips.getPopup(EditorTips.tpl.firstUploaded_tpl, "firstUploaded");
            EditorTips.setPosition($pop, "center,center");
            EditorTips.showMask();
            EditorTips.showEffect($pop, "fade");
        },
        hide: function () {
            var $pop = $("#firstUploaded");
            EditorTips.hideMask();
            EditorTips.hideEffect($pop, "fade");
        },
        event: function () {
            var that = this;
            $("#firstUploaded").find("#colse").live("click", function () {
                that.hide();
            });
            $("#firstUploaded").find("#btn_next").live("click", function () {
                that.hide();
                Uploader.close();
            });
        }
    },
    event: function () {
        this.firstUploaded.event();
    }
};
//������ʾע���¼�
EditorTips.event();