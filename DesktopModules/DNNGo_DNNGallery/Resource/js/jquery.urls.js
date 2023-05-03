var UrlLibrary = function () {
    var BindPictureList = function (urls_name, urls_div, pageindex, pagesize) {

        var imghidden = $(urls_div).find("input[type='hidden']").val();

        if ($(urls_div).find("#Urls_Pictures_ol li").length == 0 && (imghidden == "" || imghidden == "0")) {
            $(urls_div).find(".Urls_Pictures").fadeIn("slow");
            $.getJSON(Module.ModulePath + "Resource_Service.aspx?Token=PictureList", { ModuleId: Module.ModuleId, TabId: Module.TabId, PortalId: Module.PortalId, PageIndex: pageindex, PageSize: pagesize }, function (data) {
                var Pages = 0;
                $.each(data, function (i, item) {
                    BindPictureItem(urls_name, urls_div, i, item);
                    Pages = item.Pages;
                });
                BindSelectedPicture(urls_name, urls_div);
                BindPaginator(urls_name, urls_div, pagesize, Pages);
            });
        }

        BindDefaultPictureItem(urls_name, urls_div);

    };
    var BindPaginator = function (urls_name, urls_div, pagesize, Pages) {
        $(urls_div).find("#Urls_Pictures_page").bootstrapPaginator({
            bootstrapMajorVersion: 3, currentPage: 1, totalPages: Pages,
            onPageChanged: function (e, oldPage, newPage) {
                $.getJSON(Module.ModulePath + "Resource_Service.aspx?Token=PictureList", { ModuleId: Module.ModuleId, TabId: Module.TabId, PortalId: Module.PortalId, PageIndex: newPage, PageSize: pagesize }, function (data) {
                    $(urls_div).find("#Urls_Pictures_ol li").detach();
                    $.each(data, function (i, item) {
                        BindPictureItem(urls_name, urls_div, i, item);
                    });
                    BindSelectedPicture(urls_name, urls_div);
                });
            }
        });
    };

    var BindDefaultPictureItem = function (urls_name, urls_div) {
        var div_Image = $(urls_div).find(".div_Image");
        var MediaID = div_Image.attr("data-MediaID");
        if (MediaID != null && MediaID != '') {
            div_Image.removeAttr("data-MediaID");
            $.getJSON(Module.ModulePath + "Resource_Service.aspx?Token=PictureItem&" + MediaID, { ModuleId: Module.ModuleId, TabId: Module.TabId, PortalId: Module.PortalId }, function (data) {
                div_Image.html($("#scriptImage").tmpl(data));
                BindPictureDelete(urls_name, urls_div);
            });
        }

    };

    var BindPictureItem = function (urls_name, urls_div, i, item) {
        $("#scriptLibrary").tmpl(item).appendTo($(urls_div).find("#Urls_Pictures_ol"));
    };
    var BindPictureDelete = function (urls_name, urls_div) {
        $(urls_div).find(".hlRemoveUrlLink").click(function () {
            $(urls_div).find("input[type='hidden']").val("");
            $(urls_div).find(".div_Image").html('');
            $(urls_div).find(".Urls_Pictures").show();
            BindPictureList(urls_name, urls_div, 1, 10);
        });
    };

    var BindSelectedPicture = function (urls_name, urls_div) {
        $(urls_div).find(".Select_Thumbnail").click(function () {
            if (!$(urls_div).data("rtbox")) {
                $(urls_div).find("input[type='hidden']").val($(this).attr("data-MediaID"));
                var j = eval('(' + $("#div_json" + $(this).attr("data-id")).text() + ')');
                $(urls_div).find(".div_Image").html($("#scriptImage").tmpl(j));
                $(urls_div).find(".Urls_Pictures").hide();
                BindPictureDelete(urls_name, urls_div);
            } else {
                var editor = CKEDITOR.instances[$(urls_div).data("name")];
                var j = eval('(' + $("#div_json" + $(this).attr("data-id")).text() + ')');
                editor.insertHtml($("#scriptImageEditor").tmpl(j).html());
                $("#SImages" + editor.id).modal('hide');

            }


        });
    };
    var ReBindPictureList = function (urls_name, urls_div, pageindex, pagesize) {
        var Li_list = $("div.Controls_Urls[data-name='" + urls_name + "']").find("#Urls_Pictures_ol li");
        if (Li_list.length > 0) {
            $(Li_list).detach();
        }
        BindPictureList(urls_name, urls_div, pageindex, pagesize);

    };


    return {
        ReBind: function (urls_name, urls_div) {
            ReBindPictureList(urls_name, urls_div, 1, 10);
        },

        Bind: function (urls_name, urls_div) {
            BindPictureList(urls_name, urls_div, 1, 10);
        },
        Init: function (urls_name, urls_div) {
            BindSelectedPicture(urls_name, urls_div);
        },
        Show: function (e, urls_name, urls_div) {
            //alert(e);
            if (e == 1 || e == "U") {
                $(urls_div).find(".txtUrlLink").show();
                $(urls_div).find(".ddlUrlLink,.panUrlLink").hide();
            } else if (e == 3 || e == "F") {
                $(urls_div).find(".panUrlLink").show();
                $(urls_div).find(".ddlUrlLink,.txtUrlLink").hide();
                BindPictureList(urls_name, urls_div, 1, 10);
            } else {
                $(urls_div).find(".ddlUrlLink").show();
                $(urls_div).find(".txtUrlLink,.panUrlLink").hide();
            }
        }

    };
} ();

jQuery(function ($) {
    $("div.Controls_Urls").each(function (i, n) {
        var urls_name = $(this).attr("data-name");
        var urls_div = $("div.Controls_Urls[data-name='" + urls_name + "']");
        
        UrlLibrary.Init(urls_name, urls_div);

        $(this).find(".rblUrlLink input").click(function () {
            UrlLibrary.Show($(this).val(), urls_name, urls_div);
        });


        UrlLibrary.Show($(this).attr("data-default"), urls_name, urls_div);



    });
});