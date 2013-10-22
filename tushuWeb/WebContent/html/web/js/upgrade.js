/**
 * �鱾����
 * @author masa
 * @namespace mimo.Upgrade
 * @description �鱾����
 */
mimo.Config = {
    //P��Ŀ
    book_page: {
        "1000": [36, 48],
        "1001": [32, 48, 64, 80, 96],
        "1004": [20, 28, 36, 48, 56, 64, 72, 96],
        "1005": [36, 48, 56,64,72,80,96]
    },
    //
    book_color: {
        "1000": [4, 6],
        "1001": [4, 6],
        "1004": [4, 6],
        "1005": [4, 6]
    }
};

/**
 * ���ѡ��
 * @author masa
 * @namespace mimo.Editor.Guider
 * @description ���ѡ��
 */
mimo.Editor.Guider = {

    //P��
    book_page: {
        "1000": [24, 36, 48],
        "1001": [24, 32, 48, 64, 80, 96],
        "1004": [20, 28, 36, 48, 56, 64, 72, 96],
        "1005": [36, 48, 56, 64, 72, 80, 96]
    },
    remm_page: {
        "1000": 36,
        "1001": 48,
        "1004": 36,
        "1005": 48
    },
    cur_page: null,
    cur_productId:null,

    bootstrap: function (productId) {

        var p = mimo.Editor.Guider;
        $("body").append(p.html);
        p.addEvent();
        p.show();
        p.init(productId);
    },

    init: function (productId) {
        var p = mimo.Editor.Guider;
        p.cur_productId = productId;
        p.setPageCount(productId);
        p.changePrice(productId);
        $('.dialog_selector .c_img').attr("src", '/static/images/upgrade/' + productId + '.jpg');

        var m = {
            '1000': 'MINI',
            '1001': 'VIEW',
            '1003': 'mCard',
            '1004': 'WIDE',
            '1005': 'mPad'
        };

        $('.dialog_selector .product_name').html("| "+m[productId] + '��Ƭ��');
    },

    setPageCount: function (productId) {
        if (productId == 1003) {
            $(".dialog_selector .pagecount").html("").hide();
            return;
        }
        var p = mimo.Editor.Guider;
        var t = p.book_page[productId];
        var h = [];
        for (var i = 0; i < t.length; i++) {
            h.push('<li><a href="#" page_count="' + t[i] + '" class="j_page_count_' + t[i] + '">' + t[i] + 'P</a></li>');
        }
        $(".dialog_selector ul.j_page_count").html(h.join(""));
        $(".dialog_selector ul.j_page_count a.j_page_count_" + p.remm_page[productId]).addClass("cur");
        p.cur_page = p.remm_page[productId];

        $(".dialog_selector ul.j_page_count li a").each(function (i, v) {
            $(this).click(function (e) {
                e.preventDefault();
                $(".dialog_selector ul.j_page_count li a").removeClass("cur");
                $(this).addClass("cur");
                p.cur_page = $(this).attr("page_count");
                p.changePrice(productId);
            });
        });
    },

    changePrice: function (productId) {
        var p = mimo.Editor.Guider;
        if (productId == 1003) {
            $(".dialog_selector .info .info_title").html("��ѡ�����mCard��Ʒ��8��/�ף��༭�п���������");
            $(".dialog_selector .info .info_tips").hide();
            return;
        }
        //��ѡ�����:60P(�ɱ༭57P) ��ɫ<span>128</span>Ԫ / ��ɫ<span>138</span>Ԫ
        var tpl = '��ѡ�����:{p}P���ɱ༭{r_p}P�� ��ɫ<span>{price_4}</span>Ԫ / ��ɫ<span>{price_6}</span>Ԫ';
        var t = window.JSONPrice;
        var obj = {
            "p": p.cur_page,
            "r_p": p.cur_page - 3,
            "price_4": t[p.cur_productId + "_" + p.cur_page + "_" + 4],
            "price_6": t[p.cur_productId + "_" + p.cur_page + "_" + 6]
        };

        $(".info_title").html(
            mimo.Template.format(tpl, obj)
            );

        //�Ƽ��ı�
        $('.info_tips').hide();
        if (p.cur_page == p.remm_page[p.cur_productId]) {
            $('.info_tips').fadeIn(500);
        }
    },

    show: function () {
        $("#dialog_selector").show();
        mimo.UI.setCenter($("#dialog_selector"));
        mimo.Editor.showMaskLayout();
    },
    hide: function () {
        $("#dialog_selector").hide();
        mimo.Editor.hideMaskLayout();
    },

    selectView: function (n) {
        $(".dialog_selector .tab_view").hide();
        $(".dialog_selector .tab_view").eq(n).fadeIn(200);
    },

    addEvent: function () {
        var p = mimo.Editor.Guider;
        //�һ�
        $(".dialog_selector .btn_to_exchange").click(function (e) {
            e.preventDefault();
            p.selectView(1);
        });

        //����
        $(".dialog_selector .btn_back").click(function (e) {
            e.preventDefault();
            p.selectView(0);
        });

        //��ʼ����
        $('.dialog_selector .btn_go').click(function (e) {
            e.preventDefault();
            if (window.ProductId == 1003) {
                p.hide();
                return;
            }
            var pc = p.cur_page;

            if ((window.isMini && pc == 36) || (window.isView && pc == 48) || (window.isWide && pc == 36)) {
                p.hide();
                return;
            }
            var data = {
                "count": 48 - 3,
                "works_id": window.WorksId,
                "book_id": window.BookId
            };
            data.count = pc - 3;

            $.ajax({
                type: "POST",
                url: "/editor/changepage",
                data: data,
                dataType: "json",
                success: function (response) {
                    if (response && response.ret == 1) {
                        p.hide();
                        window.BOOK_DATA.page = data.count;
                        mimo.Editor.ToolsBar.setCompleteCount();
                        mimo.Editor.PreviewList.rebuildBookInfo(response);
                    }
                }
            });
        });

        //�һ�
        $('.dialog_selector .btn_exchange').click(function (e) {
            e.preventDefault();

            var code = $(".exchange_input input").val();
            if (code.length == 0) {
                alert("�����˰�,�Թ�����һ�ȯ�����!");
                return;
            }

            var works_id = window.WorksId || 0;
            var user_id = window.UserId || 0;

            //��̨����
            $.ajax({
                type: "POST",
                url: "/editor/exchange",
                data: { "code": code, "works_id": works_id, "user_id":user_id, "product_id":window.ProductId },
                dataType: "json",
                success: function (response) {
                    //��֤ͨ��,�����Ƽ�ϵͳ
                    if (response.ret == 0) {
                        p.hide();
                        mimo.Upgrade.bootstrap(code, response.product_code);
                    } else {
                        alert(response.msg);
                    }
                },
                error: function () {
                    alert("�������ϵͳ�쳣");
                }
            });
            
        });
    }
};
mimo.Editor.Guider.html = '\
<div id="dialog_selector" class="dialog_selector" style="display: none;">\
    <div class="title">\
        <h2>��ʼ����</h2>\
    </div>\
    <div class="content">\
        <div class="tab_view" id="tab1">\
            <div class="bookdetail">\
                <div class="product">\
                    <h2 class="product_name">|MINI��Ƭ��</h2>\
                    <div class="detail">\
                        <img class="c_img" src="/static/images/widebook_mid_03.jpg" width="272" height="198" />\
                    </div>\
                </div>\
                <div class="pagecount">\
                    <h2>ѡ��ҳ��:</h2>\
                    <ul class="j_page_count">\
                        <li><a href="#">32P</a></li>\
                        <li><a href="#">48P</a></li>\
                        <li><a href="#">52P</a></li>\
                        <li><a href="#">60P</a></li>\
                        <li><a href="#">96P</a></li>\
                        <li><a href="#" class="cur">40P</a></li>\
                    </ul>\
                </div>\
                <div class="info">\
                    <h2 class="info_title">��ѡ�����:60P(�ɱ༭57P) ��ɫ<span>128</span>Ԫ / ��ɫ<span>138</span>Ԫ</h2>\
                    <h2 class="info_tips">�Ƽ�����ȡ������ָкã��Լ۱ȸߣ�</h2>\
                </div>\
            </div>\
            <div class="operator_bar">\
                <h2>������жһ�ȯ���� <a class="btn_to_exchange" href="#">�������</a></h2>\
                <a class="btn_go" href="#">��ʼ����</a>\
            </div>\
        </div>\
        <div class="tab_view" id="tab2" style="display:none;">\
            <div class="exchange">\
                <h2>������һ�ȯ���룺</h2>\
                <div class="exchange_input">\
                    <a class="btn_exchange" href="#"></a>\
                    <input />\
                </div>\
            </div>\
            <div class="exchange_bar">\
                <a class="btn_second btn_back" href="#">����</a>\
            </div>\
        </div>\
    </div>\
</div>\
';


/**
 * �Ƽ�ϵͳ
 * @author masa
 * @namespace mimo.Upgrade
 * @description �Ƽ�ϵͳ
 */
mimo.Upgrade = {
    //��Ʒ��Ϣ
    product_info: {
        "1000": {
            "id": 1000,
            "name": "MINI",
            "size": "14.2 �� 14.2cm",
            "spine_type": "��Ƥ��װ",
            "cover_type": "ͭ��ֽ����Ĥ",
            "page_type": "��ů�ָ�����ֽ ŷ�޽���ֽ",
            "advantage": "CD�ߴ��С�����С��",
            "link": "/product/minibook",
            "recom": [36, 4]
        },
        "1001": {
            "id": 1001,
            "name": "VIEW",
            "size": "20 �� 14.2cm",
            "spine_type": "��Ƥ��װ",
            "cover_type": "ͭ��ֽ����Ĥ",
            "page_type": "��ů�ָ�����ֽ ŷ�޽���ֽ",
            "advantage": "��������ƣ����õس�����Ƭ",
            "link": "/product/viewbook",
            "recom": [48, 4]
        },
        "1003": {
            "id": 1003,
            "name": "mCard",
            "size": "14.5cm �� 10.5cm",
            "spine_type": "��",
            "cover_type": "���ſ�Ƭ��˫���ɫӡˢ",
            "page_type": "��ů�ָ�����ֽ",
            "advantage": "�������� ��������",
            "link": "/product/mcard",
            "recom": [8, 4]
        },
        "1004": {
            "id": 1004,
            "name": "WIDE",
            "size": "28 �� 21cm��12 �� 8 Ӣ�磩",
            "spine_type": "Ӳ�Ǿ�װ",
            "cover_type": "ͭ��ֽ����Ĥ",
            "page_type": "����ȫ��ֽ ŷ�޽���ֽ",
            "advantage": "180��ƽ̯�����Ӿ�����",
            "link": "/product/widebook",
            "recom": [36, 4]
        },
        "1005": {
            "id": 1005,
            "name": "mPad",
            "size": "18 �� 25cm��7 �� 10Ӣ�磩",
            "spine_type": "��Ƥ�鼮��װ",
            "cover_type": "ͭ��ֽ����Ĥ",
            "page_type": "��������ֽ",
            "advantage": "�ᱡ�����¡�����",
            "link": "/product/mpadbook",
            "recom": [36, 4]
        }
    },

    //ԭ��Ʒ
    cur_origin: {
        id: null,
        page: null,
        color: null
    },

    //������Ʒ
    cur_new: {
        id: null,
        page: null,
        color: null
    },
    //��ǰ�һ�ȯ����
    cur_code: null,
    //��ǰ�һ���Ʒ����
    cur_product_code: null,
    offset_price: 0,

    bootstrap: function (code, product_code) {
        var p = mimo.Upgrade;
        $("body").append(p.html);
        p.cur_code = code;
        p.cur_product_code = product_code;
        p.parseProductCode(product_code);
        p.show();
        p.addEvent();
        p.initProduct();

    },
    // ������Ʒ����
    parseProductCode: function (product_code) {
        var p = mimo.Upgrade;
        var a = product_code.split("_");
        p.cur_origin.id = a[0];
        p.cur_origin.page = a[1];
        p.cur_origin.color = a[2];

    },

    initProduct: function () {
        var p = mimo.Upgrade;
        var c_id = window.ProductId == 1003 ? 1000 : window.ProductId;

        p.setProductDetail(p.cur_origin.id, "origin");
        p.setProductDetail(c_id, "new");
        p.setPageCount(c_id);
        p.setPageColor(c_id);
        p.cur_new.id = c_id;
        p.setOriginPrice();
        p.changePrice();
    },

    show: function () {
        $("#dialog_upgrade").show();
        mimo.UI.setCenter($("#dialog_upgrade"));
        mimo.Editor.showMaskLayout();
    },

    hide: function () {
        $("#dialog_upgrade").hide();
        mimo.Editor.hideMaskLayout();
    },

    setProductDetail: function (productId, type) {
        var t = mimo.Upgrade.product_info[productId];
        var a = type == "origin" ? ".upgrade_origin" : ".upgrade_new";
        $(a + " .c_img").attr("src", "/static/images/upgrade/" + t.id + ".jpg");
        $(a + " .c_size").html(t.size);
        $(a + " .c_spine_type").html(t.spine_type);
        $(a + " .c_cover_type").html(t.cover_type);
        $(a + " .c_page_type").html(t.page_type);
        $(a + " .c_advantage").html(t.advantage);
        $(a + " .c_link").attr("href", t.link);
    },


    setPageCount: function (productId) {
        var p = mimo.Upgrade;
        var t = mimo.Config.book_page[productId];
        var c = mimo.Upgrade.product_info[productId];
        var h = [];
        for (var i = 0; i < t.length; i++) {
            h.push('<li><a href="#" page_count="' + t[i] + '" class="j_page_count_' + t[i] + '">' + t[i] + 'P</a></li>');
        }
        $(".upgrade_pagecount ul.j_page_count").html(h.join(""));
        $(".upgrade_pagecount ul.j_page_count a.j_page_count_" + c.recom[0]).addClass("cur");
        p.cur_new.page = c.recom[0];

        $(".upgrade_pagecount ul.j_page_count li a").each(function (i, v) {
            $(this).click(function (e) {
                e.preventDefault();
                $(".upgrade_pagecount ul.j_page_count li a").removeClass("cur");
                $(this).addClass("cur");
                p.cur_new.page = $(this).attr("page_count");
                p.changePrice();
            });
        });
    },

    setPageColor: function (productId) {
        var p = mimo.Upgrade;
        var t = mimo.Config.book_color[productId];
        var c = mimo.Upgrade.product_info[productId];
        var h = [];
        for (var i = 0; i < t.length; i++) {
            h.push('<li><a href="#" color="' + t[i] + '" class="j_page_color_' + t[i] + '">' + (t[i] == "4" ? "��ɫ" : "��ɫ") + '</a></li>');
        }
        $(".upgrade_pagecount ul.j_page_color").html(h.join(""));
        $(".upgrade_pagecount ul.j_page_color a.j_page_color_" + c.recom[1]).addClass("cur");
        p.cur_new.color = c.recom[1]
        $(".upgrade_pagecount ul.j_page_color li a").each(function (
            i, v) {
            $(this).click(function (e) {
                e.preventDefault();
                $(".upgrade_pagecount ul.j_page_color li a").removeClass("cur");
                $(this).addClass("cur");
                p.cur_new.color = $(this).attr("color");
                p.changePrice();
            });
        });
    },
    setOriginPrice: function () {
        var p = mimo.Upgrade;
        var d = window.JSONPrice;
        var t = p.cur_product_code.split('_');
        var c = mimo.Upgrade.product_info[t[0]];
        var price = d[p.cur_product_code];
        p.cur_o_price = price;

        //��Ʒ����
        $(".upgrade_origin .c_detail").html(c.name + " " + (t[2] == 4 ? "��ɫ" : "��ɫ") + " " + t[1] + "P");
        $(".upgrade_origin .c_price").html(price + "Ԫ");

        p.cur_origin = {
            id: t[0],
            page: t[1],
            color: t[2]
        }
    },
    changePrice: function () {
        var t = window.JSONPrice;
        var p = mimo.Upgrade;
        var c = mimo.Upgrade.product_info[p.cur_new.id];
        var o_price = p.cur_o_price;

        var new_price = t[[p.cur_new.id, p.cur_new.page, p.cur_new.color].join("_")];
        var offset_price = new_price - o_price;
        p.offset_price = offset_price;
        //��ʾ�۸�

        //��Ʒ����
        $(".upgrade_new .c_detail").html(c.name + " " + (p.cur_new.color == 4 ? "��ɫ" : "��ɫ") + " " + p.cur_new.page + "P");
        $(".upgrade_new .c_price").html(new_price + "Ԫ");

        //�м�����
        $(".c_offset_money").html(offset_price);

        //�ײ�����
        $(".c_hl_price").html(new_price);
        $(".c_hl_offset_money").html(offset_price);



    },

    upgrade: function () {
        var p = mimo.Upgrade;

        if (p.offset_price < 0) {
            alert("��ѽ,���ǲ�֧�ֲ�Ʒ����Ŷ");
            return;
        }

        //�����ɲ�ͬ�Ĳ�Ʒ
        if (p.cur_origin.id != p.cur_new.id) {
            $.ajax({
                type: "POST",
                url: "/editor/upgrade",
                data: { product_id: p.cur_new.id, page: p.cur_new.page, code: p.cur_code },
                dataType: "json",
                success: function (response) {
                    if (response.ret == 0) {
                        alert("�����ɹ�,�������ת");
                        window.location.href = '/editor/exchangeredirect?product_id=' + p.cur_new.id + '&page=' + p.cur_new.page + '&code=' + p.cur_code;
                    } else {
                        alert("һ���������������");
                    }
                }
            });


        } else if (p.cur_origin.id == p.cur_new.id) {//������ͬ���Ʒ
            //ҳ����ͬ
            if (p.cur_origin.page != p.cur_new.page) {
                mimo.Editor.PreviewList.changePage(p.cur_new.page);
                p.hide();
            } else {
                p.hide();
            }
        }

    },
    // ��ʱ������
    unUpgrade: function () {
        var p = mimo.Upgrade;
        if (p.cur_origin.page != p.cur_new.page) {
            mimo.Editor.PreviewList.changePage(p.cur_origin.page);
        }
    },

    addEvent: function () {

        var p = mimo.Upgrade;
        $(".dialog_upgrade .upgrade_selector ul li a").click(function (e) {
            e.preventDefault();
            var n = $(this).attr("product_id");
            p.cur_new.id = n - 0;
            p.setProductDetail(n, "new");
            p.setPageCount(n);
            p.setPageColor(n);
            p.changePrice();
        });

        $(".upgrade_oprator .btn_upgrade").click(function (e) {
            e.preventDefault();
            p.upgrade();
        });

        $(".upgrade_oprator .btn_go_on").click(function (e) {
            e.preventDefault();
            p.unUpgrade();
            p.hide();
            
        });
    }
};

mimo.Upgrade.html = '\
    <div id="dialog_upgrade" class="dialog_upgrade" style="display: none;">\
        <div class="upgrade_title">\
            <h2>����ۣ�������������������Ʒ</h2>\
        </div>\
        <div class="upgrade_content">\
            <div class="upgrade_bookdetail">\
                <div class="upgrade_product upgrade_origin">\
                    <h2>| �һ�ȯԭ��Ʒ</h2>\
                    <div class="upgrade_detail">\
                        <img class="c_img" src="/static/images/widebook_mid_03.jpg" width="210" height="150" />\
                        <div class="price_info"><span class="price c_price">48Ԫ</span><span class="detail c_detail">mini ��ɫ 24P</span></div>\
                    </div>\
                    <p>\
                        ��Ʒ�ߴ磺 <span class="c_size">343</span><br />\
                        װ����ʽ�� <span class="c_spine_type">Ӳ�ǽ�װ</span><br />\
                        �����Ʋģ� <span class="c_cover_type">ͬ��</span><br />\
                        ��ҳ�Ʋģ� <span class="c_page_type">�Ŵ� �����</span><br />\
                        �ء����㣺 <span class="c_advantage">�򷢴򷢴����</span><br />\
                        <a class="c_link" href="#" target="_blank">�鿴������ϸ��Ϣ>></a>\
                    </p>\
                </div>\
                <div class="upgrade_up">\
                    <img src="/static/images/upgrade/upgrade_up.png" />\
                    <p><span>��ֻ���<span class="c_offset_money">10</span>Ԫ</span></p>\
                </div>\
                <div class="upgrade_product upgrade_new">\
                    <h2>|������Ʒ</h2>\
                    <div class="upgrade_detail">\
                        <img class="c_img" src="/static/images/widebook_mid_03.jpg" width="210" height="150" />\
                        <div class="price_info"><span class="price c_price">48Ԫ</span><span class="detail c_detail">mini ��ɫ 24P</span></div>\
                    </div>\
                    <p>\
                        ��Ʒ�ߴ磺 <span class="c_size">343</span><br />\
                        װ����ʽ�� <span class="c_spine_type">Ӳ�ǽ�װ</span><br />\
                        �����Ʋģ� <span class="c_cover_type">ͬ��</span><br />\
                        ��ҳ�Ʋģ� <span class="c_page_type">�Ŵ� �����</span><br />\
                        �ء����㣺 <span class="c_advantage">�򷢴򷢴����</span><br />\
                        <a class="c_link" href="#" target="_blank">�鿴������ϸ��Ϣ>></a>\
                    </p>\
                </div>\
                <div class="upgrade_pagecount">\
                    <h2>ѡ��ҳ����</h2>\
                    <ul class="j_page_count">\
                        <li><a href="#">32P</a></li>\
                        <li><a href="#">48P</a></li>\
                        <li><a href="#">52P</a></li>\
                        <li><a href="#">60P</a></li>\
                        <li><a href="#">96P</a></li>\
                        <li><a href="#" class="cur">40P</a></li>\
                    </ul>\
                    <h2>ӡˢɫ�ʣ�</h2>\
                    <ul class="j_page_color">\
                        <li><a href="#">��ɫ</a></li>\
                        <li><a href="#">��ɫ</a></li>\
                    </ul>\
                </div>\
            </div>\
            <div class="upgrade_selector">\
                <div class="upgrade_selector_title">\
                    <h2>��������ѡ������������������Ʒ��</h2>\
                </div>\
                <ul>\
                    <li><a href="#" product_id="1000">\
                        <img src="/static/images/upgrade/upgrade_mini.png" /></a></li>\
                    <li><a href="#" product_id="1001">\
                        <img src="/static/images/upgrade/upgrade_view.png" /></a></li>\
                    <li><a href="#" product_id="1004">\
                        <img src="/static/images/upgrade/upgrade_wide.png" /></a></li>\
                    <li><a href="#" product_id="1005">\
                        <img src="/static/images/upgrade/upgrade_mpad.png" /></a></li>\
                </ul>\
                <div class="upgrade_oprator">\
                    <a class="btn_upgrade" href="#">��������</a><a href="#" class="btn_go_on">��ʱ������,��������</a>\
                    <p><span>ԭ��<span class="hl_price c_hl_price">58</span>Ԫ����ֻҪ<span class="hl_price c_hl_offset_money">10</span>Ԫ������ӵ�У�</span></p>\
                </div>\
            </div>\
        </div>\
    </div>\
';
