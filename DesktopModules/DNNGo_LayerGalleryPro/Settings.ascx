<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Settings.ascx.cs" Inherits="DNNGo.Modules.LayerGalleryPro.Settings" %>
<!-- start: PAGE HEADER -->
<div class="row">
    <div class="col-sm-12">
        <!-- start: PAGE TITLE & BREADCRUMB -->
        
        <div class="page-header">
            <h1>
                <i class="fa fa-wrench"></i>
                <%=ViewResourceText("Header_Title", "General Settings")%></h1>
        </div>
        <!-- end: PAGE TITLE & BREADCRUMB -->
    </div>
</div>
<!-- end: PAGE HEADER -->
<!-- start: PAGE CONTENT -->
<div class="row">
    <div class="col-sm-12">





        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-external-link-square"></i>
                <%=ViewTitle("lblDataSettings", "Data Settings")%>
                <div class="panel-tools">
                    <a href="#" class="btn btn-xs btn-link panel-collapse collapses"></a>
                </div>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <%=ViewControlTitle("lblCopyOfOtherModule", "Copy Of Other Module", "cbCopyOfOtherModule", ":", "col-sm-3 control-label")%>
                        <div class="col-sm-5">
                            <div class="control-inline">
                                <asp:CheckBox ID="cbCopyOfOtherModule" runat="server" />
                             </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <%=ViewControlTitle("lblPortals", "Portals", "ddlPortals", ":", "col-sm-3 control-label")%>
                        <div class="col-sm-5">
                            <div class="control-inline">
                                <asp:DropDownList ID="ddlPortals" runat="server" CssClass="form-control input_text validate[required]"
                                    OnSelectedIndexChanged="ddlPortals_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                                
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <%=ViewControlTitle("lblTabModule", "Tab & Module", "ddlTabModule", ":", "col-sm-3 control-label")%>
                        <div class="col-sm-5">
                            <div class="control-inline">
                                <asp:DropDownList ID="ddlTabModule" runat="server" CssClass="form-control input_text validate[required]"></asp:DropDownList>
                                
                                </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>


        
         <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-external-link-square"></i>
                <%=ViewTitle("lblMediaLibrary", "Media Library")%>
                <div class="panel-tools">
                    <a href="#" class="btn btn-xs btn-link panel-collapse collapses"></a>
                </div>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                   <div class="form-group">
                        <%=ViewControlTitle("lblCompressionEnable", "Enable Compression", "cbCompressionEnable", ":", "col-sm-3 control-label")%>
                        <div class="col-sm-5">
                            <div class="control-inline auto checkbox-inline">
                               <asp:CheckBox ID="cbCompressionEnable" runat="server"  />
                            </div>
                        </div>
                    </div>


                  <div class="form-group">
                        <%=ViewControlTitle("lblCompressionQuality", "Compression Quality", "txtCompressionQuality", ":", "col-sm-3 control-label")%>
                        <div class="col-sm-5">
                            <div class="control-inline">
                                <asp:TextBox ID="txtCompressionQuality" runat="server" CssClass="form-control validate[required,custom[integer]]" Width="100"></asp:TextBox>
                                 <%=ViewHelp("lblCompressionQuality", "0~100")%>
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
        </div>



        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-external-link-square"></i><%=ViewResourceText("Title_AddFonts", "Google Fonts Settings")%>
                <div class="panel-tools">
                    <a href="#" class="btn btn-xs btn-link panel-collapse collapses"></a>
                </div>
            </div>
            <div class="panel-body buttons-widget form-horizontal">

                <asp:TextBox ID="txtJsonFonts" runat="server" TextMode="MultiLine" CssClass="hide"></asp:TextBox>


                <div class="row form-group">
                    <%=ViewControlTitle("lblFontAlias", "Font Alias", "txtFontAlias", ":", "col-sm-3 control-label")%>
                    <div class="col-sm-9">
                     
                        <div id="fonts-list-view"></div>
                    </div>
                </div>

               
            </div>
        </div>

    </div>
</div>
<!-- end: PAGE CONTENT-->
<div class="row">
    <div class="col-sm-2">
    </div>
    <div class="col-sm-10">
        <asp:Button CssClass="btn btn-primary" lang="Submit" ID="cmdUpdate" resourcekey="cmdUpdate"
            runat="server" Text="Update" OnClick="cmdUpdate_Click"></asp:Button>&nbsp;
        <asp:Button CssClass="btn btn-default" ID="cmdCancel" resourcekey="cmdCancel" runat="server"
            Text="Cancel" CausesValidation="False" OnClick="cmdCancel_Click" OnClientClick="CancelValidation();">
        </asp:Button>&nbsp;
    </div>
</div>



<div class="data-fonts" style="height:200px;overflow-y:scroll;"></div>

<script id="fonts-select-list" type="text/x-jquery-tmpl">
<div class="fonts-select-list-item">
     <select class="form-control search-select-fonts"></select>
     <div class="fonts-select-subsets"></div>
     <div class="fonts-select-variants"></div>
     <div class="delete"><span class="fa fa-close"></span> </div>
</div>
</script>
<script id="fonts-family-list" type="text/x-jquery-tmpl">
   <option value="${family}">${family}</option>
</script>



<script type="text/javascript">
    $(function ($) {

        var GetFonts = function () {

            var fontsData = $.jStorage.get("fonts");
         
            if(!(fontsData != 'undefined' && fontsData != null))
            {
                var agrs = {
                    key: "AIzaSyBUILExVNkdGbRS_2xjdRErTaFcUFOSBzY",
                    fields: ['family', 'variants', 'subsets'],
                    sort: "alpha"
                };

                $.getJSON("https://www.googleapis.com/webfonts/v1/webfonts", agrs, function (json) {
                    $.jStorage.set("fonts", json.items, { TTL: 1000 * 60 * 60 });//1 day expire
                    fontsData = json.items;
                    fonts = fontsData;
                     Fontsload();
                });

            }
            return fontsData;
        };
 

        $(".search-select-fonts").select2({
            placeholder: "Select a fonts",
            allowClear: true
        });
    
var fonts = GetFonts();    

        if(fonts){
            Fontsload();
        }

    function Fontsload(){


    var defaultfont= JSON.parse($("#<%= txtJsonFonts.ClientID %>").html());

        function addFontList(f){
            $.each(f, function (i, item) {
                    var fontItem = $("#fonts-select-list").tmpl(item);
                
                        fontItem.find(".search-select-fonts").append($("#fonts-family-list").tmpl(fonts));
                        fontItem.find('.search-select-fonts option[value="'+item.family+'"]').attr("selected","selected");

                
                        $.each(fonts, function (i, item2) {
                            if (item.family == item2.family){
                                $.each(item2.subsets, function (i, subset) {
                                    fontItem.find(".fonts-select-subsets").append('<label><input name=\"subset\" type=\"checkbox\" value="' + subset + '" '+($.inArray( subset, item.subsets )!=-1?"checked":"")+' />' + subset + ' </label>');
                                });
                                $.each((item2.variants), function (i, variant) {
                                    fontItem.find(".fonts-select-variants").append('<label><input name=\"variant\" type=\"checkbox\" value="' + variant + '" '+($.inArray( variant, item.variants )!=-1?"checked":"")+' />' + variant + ' </label>');
                                });
                                return;
                            }
                        });
                        fontItem.find(".delete").on("click",function(){
                           fontItem.remove();
                        })

                    fontItem.appendTo('#fonts-list-view');

                    fontItem.find(".search-select-fonts").select2({
                        placeholder: "Select a fonts",
                        allowClear: true
                    });

                });
        }

        addFontList(defaultfont);
 
        var addFont = $("<div class=\"addFont btn btn-primary btn-sm\">Add Font</div>");

        $("#fonts-list-view").after(addFont);
        addFont.on("click",function(){addFontList( [{family: "ABeeZee"}]) })


        $("#fonts-list-view").on("change",".search-select-fonts", function () {
            var fonts = GetFonts();
            var e =  $(this);
            var family = e.val();
            console.log("aaa:", fonts);

             e.siblings(".fonts-select-subsets").empty();
               e.siblings(".fonts-select-variants").empty();
            $.each(fonts, function (i, item) {
                if (family == item.family)
                {
                    $.each(item.subsets, function (i, subset) {
                        e.siblings(".fonts-select-subsets").append('<label><input name=\"subset\" type=\"checkbox\" value="' + subset + '" />' + subset + ' </label>');
                    });
                    $.each(item.variants, function (i, variant) {
                        e.siblings(".fonts-select-variants").append('<label><input name=\"variant\" type=\"checkbox\" value="' + variant + '" />' + variant + ' </label>');
                    });


                    return;
                }

            });

        });

        function collectionFontData(){
            var  collectionFont = [];

            $("#fonts-list-view .fonts-select-list-item").each(function(){
                var e= $(this);
               
                var family = e.find(".search-select-fonts").val();
                var subsets =[];
                var variants=[];
                e.find('.fonts-select-subsets [type="checkbox"]').each(function(){
                    if($(this).is(":checked")){
                        subsets.push($(this).val());
                    }
                })
                e.find('.fonts-select-variants [type="checkbox"]').each(function(){
                    if($(this).is(":checked")){
                        variants.push($(this).val());
                    }
                })
                var d ={family: family};

                if(subsets.length) d["subsets"] = subsets ;
                if(variants.length) d["variants"] = variants ;
                collectionFont.push(d)
            })
            return collectionFont;
        
        } 
      $("#<%=cmdUpdate.ClientID %>").on("click",function(){
          var currentFont =collectionFontData();
          $("#<%= txtJsonFonts.ClientID %>").html(JSON.stringify(currentFont))
      })



    }



    });
</script>
