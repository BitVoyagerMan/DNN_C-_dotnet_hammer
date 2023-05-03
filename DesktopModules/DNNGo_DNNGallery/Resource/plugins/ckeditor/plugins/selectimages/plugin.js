(function () {
    //Section 1 : 按下自定义按钮时执行的代码 
    var Event = {
        exec: function (editor) {
            $RTBox = $("div." + editor.id);
            var position = $RTBox.position();
            var SImagesID = "SImages" + editor.id;

            if ($RTBox.find("#" + SImagesID).size() == 0) {
                var pluginpath = editor.plugins["selectimages"].path;
                $("div.modal_copy[id='-']").clone().prependTo($RTBox);
                $RTBox.find("div.modal_copy").attr("id", SImagesID);
                $RTBox.find("div.modal-body").attr("id", "body-" + SImagesID);

                $.get(pluginpath + "template.html?" + (new Date()).toLocaleString(), function (data) {

                    data = data.replace(/<%--ClientID--%>/g, editor.id);
                    data = data.replace(/<%--ClientName--%>/g, editor.name);
                    data = data.replace(/<%--QueryString--%>/g, Module.QueryString);
                    data = data.replace(/<%--ModulePath--%>/g, Module.ModulePath);

                    $RTBox.find("div.modal-body").prepend(data);

                    $('#' + SImagesID).modal({ show: true, width: $RTBox.width() });

                    var urls_div = $("div.Controls_Urls[data-id='" + editor.id + "']");
                    UrlLibrary.Bind(editor.name, urls_div);

                    var myDropzone = new Dropzone("#dropzone" + editor.id);
                    myDropzone.on("queuecomplete", function (data) {
                        UrlLibrary.ReBind(editor.name, urls_div);
                    });

                });
            }
            else {

                $('#' + SImagesID).modal({ show: true, width: $RTBox.width() });
            }
        }
    },
    //Section 2 : 创建自定义按钮、绑定方法 
    pluginName = 'selectimages';
    CKEDITOR.plugins.add(pluginName, {
        init: function (editor) {
            editor.addCommand(pluginName, Event);
            editor.ui.addButton(pluginName, {
                label: 'Select media file',
                icon: this.path + 'icon.png',
                command: pluginName
            });
        }
    });

})();