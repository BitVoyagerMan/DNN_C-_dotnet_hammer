<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_ManagerItem.ascx.cs" Inherits="DNNGo.Modules.DNNGalleryV7.Setting_ManagerItem" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<link rel="stylesheet" href="<%=ModulePath %>Resource/plugins/jQuery-Tags-Input/jquery.tagsinput.css">
<script src="<%=ModulePath %>Resource/plugins/jQuery-Tags-Input/jquery.tagsinput.js"></script>

<!-- start: PAGE HEADER -->
<div class="row">
    <div class="col-sm-12">
        <!-- start: PAGE TITLE & BREADCRUMB -->
        
        <div class="page-header">
            <h1>
                <i class="fa fa-plus"></i> <%=ViewResourceText("Header_Title", "Add New Content")%>
                <%--<small>overview &amp; stats </small>--%></h1>
        </div>
        <!-- end: PAGE TITLE & BREADCRUMB -->
    </div>
</div>
<!-- end: PAGE HEADER -->
<!-- start: PAGE CONTENT -->
<div class="row">
    <div class="col-sm-8">
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label for="form-field-1">
                        <%=ViewTitle("lblTitle", "Title", "txtTitle")%>:</label>
                    <asp:TextBox ID="txtTitle" placeholder="Title" runat="server" CssClass="form-control validate[required,maxSize[100]]"></asp:TextBox>
                </div>
                <div class="form-group"  runat="server" id="divSubtitle" visible="false">
                    <label for="form-field-1">
                        <%=ViewTitle("lblSubTitle", "Sub Title", "txtSubTitle")%>:</label>
                    <asp:TextBox ID="txtSubTitle" placeholder="Sub Title" runat="server" CssClass="form-control validate[maxSize[100]]"></asp:TextBox>
                </div>
                <div class="form-group"  runat="server" id="divDescription" visible="false">
                    <label for="form-field-2">
                        <%=ViewTitle("lblDescription", "Description", "txtDescription")%>:</label>
                    <asp:TextBox ID="txtDescription" placeholder="Description" CssClass="form-control limited validate[maxSize[2000]]"
                        runat="server" Rows="3" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group" runat="server" id="divContentText" visible="false">
                    <label for="form-field-3">
                        <%=ViewTitle("lblContentText", "Content Text", "txtContentText")%>:
                    </label>
                    <asp:HyperLink ID="hlAddMedia" runat="server" CssClass="btn btn-light-grey" Text="<i class='fa fa-picture-o'></i> Add Media"  data-toggle="modal" NavigateUrl="#AddMedia_Modal"></asp:HyperLink>
                    <asp:TextBox ID="txtContentText" CssClass="form-control" runat="server"
                        Height="300" Width="100%" TextMode="MultiLine"></asp:TextBox>
                    

                        <div id="AddMedia_Modal" class="modal fade" tabindex="-1" data-width="820"
                                data-height="400" style="display: none;">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">
                                        <i class='fa fa-folder-open'></i>Set Picture</h4>
                                </div>
                                <div class="modal-body">
                                    <iframe id="AddMedia_Iframe" width="100%" height="100%" style="border-width: 0px;">
                                    </iframe>
                                </div>
                            </div>


                </div>
            </div>
        </div>
        

        <div class="panel panel-default"  runat="server" id="divUrlLink" visible="false">
            <div class="panel-heading">
                <i class="fa fa-external-link-square"></i> <%=ViewResourceText("Title_UrlLinkTitle", "Link Setting")%>
                <div class="panel-tools">
                    <a href="#" class="btn btn-xs btn-link panel-collapse collapses"></a>
                </div>
            </div>
            <div class="panel-body">
            	<div class="form-horizontal">
                <div class="form-group">
                    <div class="col-sm-3 control-label"><%=ViewTitle("lblUrlLink", "Url Link", "txtUrlLink")%>:</div>
                    <div class="col-sm-9 control-inline">
                    	<asp:RadioButtonList ID="rblUrlLink" runat="server" RepeatDirection="Vertical"></asp:RadioButtonList>
                     	<asp:TextBox ID="txtUrlLink" runat="server" Width="350" CssClass="form-control input_text" placeholder="http://" ></asp:TextBox>
                     	<asp:DropDownList  ID="ddlUrlLink" runat="server" CssClass="form-control input_text"></asp:DropDownList>
                        <asp:Panel ID="panUrlLink" runat="server">
                            <asp:HiddenField runat="server" ID="hfUrlLink" />
                            <asp:HyperLink runat="server" ID="hlUrlLink" resourcekey="hlUrlLink"
                                data-toggle="modal" NavigateUrl="#UrlLink_Modal" Text="<i class='fa clip-pictures'></i> Set Picture"
                                ToolTip="Set Picture" Target="_blank" CssClass="btn btn-light-grey"></asp:HyperLink>
                            <asp:HyperLink runat="server" ID="hlRemoveUrlLink" onclick="RemoveUrlLink();" Text="<i class='fa fa-trash-o'></i> Delete"
                                NavigateUrl="javascript:;" resourcekey="hlRemoveUrlLink" CssClass="btn btn-xs btn-bricky"  style="display:none;"></asp:HyperLink>	
                                
                            <div class="add_Description form_field">
                            <br/>
                                <asp:Image runat="server" ID="imgUrlLink" CssClass="img-responsive" />
                            </div>
                            <div id="UrlLink_Modal" class="modal fade" tabindex="-1" data-width="820"
                                data-height="400" style="display: none;">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">
                                        <i class='fa fa-folder-open'></i>Set Picture</h4>
                                </div>
                                <div class="modal-body">
                                    <iframe id="UrlLink_Iframe" width="100%" height="100%" style="border-width: 0px;">
                                    </iframe>
                                </div>
                            </div>
                        </asp:Panel>
                    </div> 
                </div>
                
                <div class="form-group">
                	<div class="col-sm-3 control-label"><%=ViewTitle("lblLinkTarget", "New Window", "rblLinkTarget")%>:</div>
                	<div class="col-sm-9 control-inline"><asp:CheckBox ID="cbLinkTarget" runat="server" /></div> 
                    
                </div>
                <div class="form-group"  id="divLinkType" runat="server" visible="false">
                    <div class="col-sm-3 control-label"><%=ViewTitle("lblLinkMeta", "Link Meta", "rblLinkMeta")%>:</div>
                    <div class="col-sm-9 control-inline">
                        <asp:DropDownList ID="rblLinkType" runat="server" CssClass="form-control input_text"></asp:DropDownList>
                         <%=ViewHelp("lblLinkMeta", "When you choose Lightbox option, you can input custom address in URL Link, the address can be web video, image, map or flash multimedia link.")%>
                        <%=ViewHelp("lblLinkMeta_1", "http://www.dnngo.com/abc.mp4")%><br />
                        <%=ViewHelp("lblLinkMeta_1", "http://www.dnngo.com/abc.jpg")%><br />
                        <%=ViewHelp("lblLinkMeta_2", "http://vimeo.com/8245346")%><br />
                         <%=ViewHelp("lblLinkMeta_2", "http://www.youtube.com/watch?v=qqXi8WmQ_WM")%><br />
                        <%=ViewHelp("lblLinkMeta_3", "https://maps.google.com/maps?hl=en&ll=40.730608,-74.047852&spn=9.669773,21.643066")%>
                    </div> 
                    <%--<asp:RadioButtonList ID="rblLinkType" runat="server"></asp:RadioButtonList>--%>
                   
                </div>
            </div>
            </div>
        </div>


        <div runat="server" id="divOptions_Left" visible="false">
            <asp:Repeater ID="RepeaterGroup_Left" runat="server" OnItemDataBound="RepeaterGroup_ItemDataBound">
                <ItemTemplate>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-external-link-square"></i>
                            <%#Eval("key")%>
                            <div class="panel-tools">
                                <a href="#" class="btn btn-xs btn-link panel-collapse collapses"></a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="form-horizontal">
                                <asp:Repeater ID="RepeaterOptions" runat="server" OnItemDataBound="RepeaterOptions_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="form-group">
                                            <asp:Literal ID="liTitle" runat="server"></asp:Literal>
                                            <div class="col-sm-9">
                                                <asp:PlaceHolder ID="ThemePH" runat="server"></asp:PlaceHolder>
                                                <asp:Literal ID="liHelp" runat="server"></asp:Literal>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <!-- end: TEXT AREA PANEL -->
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>
    <div class="col-sm-4">
        <!-- start: SELECT BOX PANEL -->
        <!--Publish-->
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-external-link-square"></i> <%=ViewResourceText("Title_Publish", "Publish")%>
                <div class="panel-tools">
                    <a href="#" class="btn btn-xs btn-link panel-collapse collapses"></a>
                </div>
            </div>
            <div class="panel-body buttons-widget">
                <ul class="Edit_List" id="accordion">
                    <li>
                        <p>
                            <i class="fa clip-grid-5"></i>&nbsp;&nbsp;<%=ViewResourceText("Title_Status", "Status")%>: <b>
                                <asp:Label ID="liArticleStatus" runat="server" Text="Draft"></asp:Label></b>&nbsp;&nbsp;<a
                                    href="#Status" data-toggle="collapse" data-parent="#accordion"><i class="fa fa-pencil"></i>[<%=ViewResourceText("Title_Edit", "Edit")%>]</a></p>
                        <div class="collapse" id="Status">
                            <div class="row form-group">
                                <div class="col-sm-6">
                                    <asp:DropDownList ID="ddlArticleStatus" runat="server" CssClass="form-control form-trumpet">
                                    </asp:DropDownList>
           
                                </div>
                                <div class="col-sm-6 text_right">
                                    <a id="link_ArticleStatus" class="btn btn-default btn-ms2" href="#Status" data-toggle="collapse"
                                        data-parent="#accordion"><%=ViewResourceText("Title_OK", "OK")%> </a>&nbsp;<a href="#Status" data-toggle="collapse" data-parent="#accordion"><%=ViewResourceText("Title_Cancel", "Cancel")%></a>
                                </div>
                            </div>
                        </div>
                    </li>
                    
                    <li>
                        <p>
                            <i class="fa clip-calendar-3"></i>&nbsp;&nbsp;<%=ViewResourceText("Title_Publish", "Publish")%>: <b>
                                <asp:Label ID="liPublishDateTime" runat="server" Text="Immediately"></asp:Label></b>&nbsp;<a
                                    href="#Publish" data-toggle="collapse" data-parent="#accordion"><i class="fa fa-pencil"></i>[<%=ViewResourceText("Title_Edit", "Edit")%>]</a></p>
                        <div class="panel-collapse collapse" id="Publish">
                            <div class="row form-group">
                                <div class="col-md-6 input-group">
                                    <asp:TextBox ID="txtPublishDate" runat="server" data-date-format="mm/dd/yyyy" data-date-viewmode="years"
                                        CssClass="form-control date-picker"></asp:TextBox>
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                </div>
                                <div class="col-md-5 input-group input-append bootstrap-timepicker">
                                    <asp:TextBox ID="txtPublishTime" runat="server" CssClass="form-control time-picker"></asp:TextBox>
                                    <span class="input-group-addon add-on"><i class="fa fa-clock-o"></i></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <a id="link_PublishDateTime" class="btn btn-default btn-ms2" href="#Publish" data-toggle="collapse"
                                    data-parent="#accordion"><%=ViewResourceText("Title_OK", "OK")%> </a>&nbsp;<a href="#Publish" data-toggle="collapse" data-parent="#accordion"><%=ViewResourceText("Title_Cancel", "Cancel")%></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <p>
                            <i class="clip-stopwatch"></i>&nbsp;&nbsp;<%=ViewResourceText("Title_Disable", "Disable")%>: <b>
                                <asp:Label ID="liDisableDateTime" runat="server" Text="None"></asp:Label></b>&nbsp;<a
                                    href="#DisableDateTime" data-toggle="collapse" data-parent="#accordion"><i class="fa fa-pencil"></i>[<%=ViewResourceText("Title_Edit", "Edit")%>]</a></p>
                        <div class="panel-collapse collapse" id="DisableDateTime">
                            <div class="row form-group">
                                <div class="col-md-6 input-group">
                                    <asp:TextBox ID="txtDisableDate" runat="server" data-date-format="mm/dd/yyyy" data-date-viewmode="years"
                                        CssClass="form-control date-picker"></asp:TextBox>
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                </div>
                                <div class="col-md-5 input-group input-append bootstrap-timepicker">
                                    <asp:TextBox ID="txtDisableTime" runat="server" CssClass="form-control time-picker"></asp:TextBox>
                                    <span class="input-group-addon add-on"><i class="fa fa-clock-o"></i></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <a id="link_DisableDateTime" class="btn btn-default btn-ms2" href="#DisableDateTime"
                                    data-toggle="collapse" data-parent="#accordion"><%=ViewResourceText("Title_OK", "OK")%> </a>&nbsp;<a href="#DisableDateTime"
                                        data-toggle="collapse" data-parent="#accordion"><%=ViewResourceText("Title_Cancel", "Cancel")%></a>
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="row">
                	<br/>
                    <div class="col-sm-5">
                       
                    </div>
                    <div class="col-sm-7 text_right">
                        <asp:Button CssClass="btn btn-primary btn-sm" lang="Submit" ID="cmdPublish" resourcekey="cmdPublish"
                            runat="server" Text="Publish" OnClick="cmdPublish_Click"></asp:Button>&nbsp;
                        <asp:Button CssClass="btn btn-primary btn-sm" ID="cmdCancel" resourcekey="cmdCancel"
                            runat="server" Text="Cancel" CausesValidation="False" OnClick="cmdCancel_Click"
                            OnClientClick="CancelValidation();"></asp:Button>&nbsp;
                    </div>
                </div>
            </div>
        </div>
        <!--Categories-->
        <div class="panel panel-default"  runat="server" id="divGroups" visible="false">
            <div class="panel-heading">
                <i class="fa fa-external-link-square"></i> <%=ViewResourceText("Title_Groups", "Groups")%>
                <div class="panel-tools">
                    <a href="#" class="btn btn-xs btn-link panel-collapse collapses"></a>
                </div>
            </div>
            <div class="panel-body buttons-widget">
            <div class="checkbox">
                <asp:Literal runat="server" ID="liGroups"></asp:Literal></div>
                <asp:HyperLink runat="server" ID="hlAddGroups" resourcekey="hlAddGroups" Text="Add new Groups"></asp:HyperLink>
            </div>
        </div>


        <div class="panel panel-default"   runat="server" id="divPermissions">
            <div class="panel-heading">
                <i class="fa fa-external-link-square"></i>
                <%=ViewResourceText("Title_Permissions", "Permissions")%>
                <div class="panel-tools">
                    <a href="#" class="btn btn-xs btn-link panel-collapse collapses"></a>
                </div>
            </div>
            <div class="panel-body buttons-widget form-horizontal">
                  <div class="form-group">
                       <%=ViewControlTitle("lblPermissionsAllUsers", "All Users", "cbPermissionsAllUsers", ":", "col-sm-3 control-label")%>
                        <div class="col-sm-9">
                             <div class="checkbox-inline">
                                <asp:CheckBox ID="cbPermissionsAllUsers" runat="server" CssClass="auto"/>
                            </div>
                        </div>
                  </div>

                  <div class="form-group">
                       <%=ViewControlTitle("lblPermissionsRoles", "Permission Roles", "cblPermissionsRoles", ":", "col-sm-3 control-label")%>
                        <div class="col-sm-9">
                            <div class="checkbox-inline">
                                <asp:CheckBoxList ID="cblPermissionsRoles" runat="server" CssClass="auto"></asp:CheckBoxList>
                            </div>
                        </div>
                  </div>
            </div>
        </div>

      
        <!--Thumbnail Image-->
        <div class="panel panel-default"  runat="server" id="divThumbnails" visible="false">
            <div class="panel-heading">
                <i class="fa fa-external-link-square"></i><%=ViewResourceText("Title_SetThumbnail", "Set Thumbnail")%>
                <div class="panel-tools">
                    <a href="#" class="btn btn-xs btn-link panel-collapse collapses"></a>
                </div>
            </div>
            <div class="panel-body buttons-widget">
                <asp:HiddenField runat="server" ID="hfAddThumbnail" />
                <asp:HyperLink runat="server" ID="hlAddThumbnail" resourcekey="hlAddThumbnail"
                    data-toggle="modal" NavigateUrl="#AddThumbnail_Modal" Text="<i class='fa clip-pictures'></i> Set Thumbnail"
                    ToolTip="Set Thumbnail" Target="_blank" CssClass="btn btn-light-grey"></asp:HyperLink>
                <asp:HyperLink runat="server" ID="hlRemoveThumbnail" onclick="RemoveThumbnail();" Text="<i class='fa fa-trash-o'></i> Delete"
                    NavigateUrl="javascript:;" resourcekey="hlRemoveThumbnail" CssClass="btn btn-xs btn-bricky"></asp:HyperLink>
                <div class="add_Description form_field">
                    <asp:Image runat="server" ID="imgAddThumbnail" CssClass="img-responsive" />
                </div>
                <div id="AddThumbnail_Modal" class="modal fade" tabindex="-1" data-width="820"
                    data-height="400" style="display: none;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title">
                            <i class='fa fa-folder-open'></i>Set Thumbnail</h4>
                    </div>
                    <div class="modal-body">
                        <iframe id="AddThumbnail_Iframe" width="100%" height="100%" style="border-width: 0px;">
                        </iframe>
                    </div>
                </div>
                <%--<a href="#">Set featured image </a> --%>
            </div>
        </div>
        <!--Picture Image-->
        <div class="panel panel-default"  runat="server" id="divPicture" visible="false">
            <div class="panel-heading">
                <i class="fa fa-external-link-square"></i><%=ViewResourceText("Title_SetPicture", "Set Picture")%>
                <div class="panel-tools">
                    <a href="#" class="btn btn-xs btn-link panel-collapse collapses"></a>
                </div>
            </div>
            <div class="panel-body buttons-widget">
                <asp:HiddenField runat="server" ID="hfAddPicture" />
                <asp:HyperLink runat="server" ID="hlAddPicture" resourcekey="hlAddPicture"
                    data-toggle="modal" NavigateUrl="#AddPicture_Modal" Text="<i class='fa clip-pictures'></i> Set Picture"
                    ToolTip="Set Picture" Target="_blank" CssClass="btn btn-light-grey"></asp:HyperLink>
                <asp:HyperLink runat="server" ID="hlRemovePicture" onclick="RemovePicture();" Text="<i class='fa fa-trash-o'></i> Delete"
                    NavigateUrl="javascript:;" resourcekey="hlRemovePicture" CssClass="btn btn-xs btn-bricky"></asp:HyperLink>
                <div class="add_Description form_field">
                    <asp:Image runat="server" ID="imgAddPicture" CssClass="img-responsive" />
                </div>
                <div id="AddPicture_Modal" class="modal fade" tabindex="-1" data-width="820"
                    data-height="400" style="display: none;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title">
                            <i class='fa fa-folder-open'></i>Set Picture</h4>
                    </div>
                    <div class="modal-body">
                        <iframe id="AddPicture_Iframe" width="100%" height="100%" style="border-width: 0px;">
                        </iframe>
                    </div>
                </div>
                <%--<a href="#">Set featured image </a> --%>
            </div>
        </div>








         <!-- Layout Right Options -->
         <div runat="server" id="divOptions_Right" visible="false">
            <asp:Repeater ID="RepeaterGroup_Right" runat="server" OnItemDataBound="RepeaterGroup_ItemDataBound">
                <ItemTemplate>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-external-link-square"></i> <%#Eval("key")%>
                            <div class="panel-tools">
                                <a href="#" class="btn btn-xs btn-link panel-collapse collapses"></a>
                            </div>
                        </div>
                        <div class="panel-body buttons-widget">
                            <asp:Repeater ID="RepeaterOptions" runat="server" OnItemDataBound="RepeaterOptions_ItemDataBound">
                                <ItemTemplate>
                                    <div class="form-group">
                                        <asp:Literal ID="liTitle" runat="server"></asp:Literal>
                                        <div class="col-sm-8">
                                            <asp:PlaceHolder ID="ThemePH" runat="server"></asp:PlaceHolder>
                                        </div>
                                        <div class="col-sm-12">
                                            <asp:Literal ID="liHelp" runat="server"></asp:Literal>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
         </div>
 
       
        <!-- end: SELECT BOX PANEL -->
    </div>
    <!-- end: PAGE CONTENT-->
</div>
<script type="text/javascript">


    /*移除图片*/
    function RemoveThumbnail() {
        jQuery('#<%=hfAddThumbnail.ClientID %>').val('0');
        jQuery('#<%=imgAddThumbnail.ClientID %>').hide();
        jQuery('#<%=imgAddThumbnail.ClientID %>').attr("src", "")
        jQuery('#<%=hlRemoveThumbnail.ClientID %>').hide();
        jQuery('#<%=hlAddThumbnail.ClientID %>').show();
    }
    /*显示图片*/
    function ShowThumbnail(PictureUrl, PictureID) {
        jQuery('#<%=hfAddThumbnail.ClientID %>').val(PictureID);
        jQuery('#<%=imgAddThumbnail.ClientID %>').attr("src", PictureUrl)
        jQuery('#<%=imgAddThumbnail.ClientID %>').show();
        jQuery('#<%=hlRemoveThumbnail.ClientID %>').show();
        jQuery('#<%=hlAddThumbnail.ClientID %>').hide();

    }

    /*移除图片*/
    function RemovePicture() {
        jQuery('#<%=hfAddPicture.ClientID %>').val('0');
        jQuery('#<%=imgAddPicture.ClientID %>').hide();
        jQuery('#<%=imgAddPicture.ClientID %>').attr("src", "")
        jQuery('#<%=hlRemovePicture.ClientID %>').hide();
        jQuery('#<%=hlAddPicture.ClientID %>').show();
    }
    /*显示图片*/
    function ShowPicture(PictureUrl, PictureID) {
        jQuery('#<%=hfAddPicture.ClientID %>').val(PictureID);
        jQuery('#<%=imgAddPicture.ClientID %>').attr("src", PictureUrl)
        jQuery('#<%=imgAddPicture.ClientID %>').show();
        jQuery('#<%=hlRemovePicture.ClientID %>').show();
        jQuery('#<%=hlAddPicture.ClientID %>').hide();

    }


    /*移除图片*/
    function RemoveUrlLink() {
        jQuery('#<%=hfUrlLink.ClientID %>').val('0');
        jQuery('#<%=imgUrlLink.ClientID %>').hide();
        jQuery('#<%=imgUrlLink.ClientID %>').attr("src", "")
        jQuery('#<%=hlRemoveUrlLink.ClientID %>').hide();
        jQuery('#<%=hlUrlLink.ClientID %>').show();
    }
    /*显示图片*/
    function ShowUrlLink(PictureUrl, PictureID) {
        jQuery('#<%=hfUrlLink.ClientID %>').val(PictureID);
        jQuery('#<%=imgUrlLink.ClientID %>').attr("src", PictureUrl)
        jQuery('#<%=imgUrlLink.ClientID %>').show();
        jQuery('#<%=hlRemoveUrlLink.ClientID %>').show();
        jQuery('#<%=hlUrlLink.ClientID %>').hide();

    }



    /*将图片HTML插入到内容*/
    function ReturnHtmlPicture(PictureUrl, PictureID) {
        tinyMCE.execCommand('mceReplaceContent', false, "<img src='" + PictureUrl + "'/>");
    }


    jQuery(function ($) {
        $("#<%=hlAddThumbnail.ClientID %>").click(function () { $("#AddThumbnail_Iframe").attr("src", $(this).attr("data-href")); });
        $("#<%=hlAddMedia.ClientID %>").click(function () { $("#AddMedia_Iframe").attr("src", $(this).attr("data-href")); });
        $("#<%=hlAddPicture.ClientID %>").click(function () { $("#AddPicture_Iframe").attr("src", $(this).attr("data-href")); });
        $("#<%=hlUrlLink.ClientID %>").click(function () { $("#UrlLink_Iframe").attr("src", $(this).attr("data-href")); });


        $("#link_ArticleStatus").click(function () { $('#<%=liArticleStatus.ClientID %>').text($("#<%=ddlArticleStatus.ClientID %>").find("option:selected").text()); });
        $("#link_PublishDateTime").click(function () { $('#<%=liPublishDateTime.ClientID %>').text($("#<%=txtPublishDate.ClientID %>").val() + "  " + $("#<%=txtPublishTime.ClientID %>").val()); });
        $("#link_DisableDateTime").click(function () { $('#<%=liDisableDateTime.ClientID %>').text($("#<%=txtDisableDate.ClientID %>").val() + "  " + $("#<%=txtDisableTime.ClientID %>").val()); });

        $("#<%=rblUrlLink.ClientID %> input").click(function () {
            if ($(this).val() == 1) {
                $("#<%=txtUrlLink.ClientID %>").show();
                $("#<%=ddlUrlLink.ClientID %>").hide();
                $("#<%=panUrlLink.ClientID %>").hide();

            } else if ($(this).val() == 3) {
                $("#<%=panUrlLink.ClientID %>").show();
                $("#<%=ddlUrlLink.ClientID %>").hide();
                $("#<%=txtUrlLink.ClientID %>").hide();
            } else {
                $("#<%=ddlUrlLink.ClientID %>").show();
                $("#<%=txtUrlLink.ClientID %>").hide();
                $("#<%=panUrlLink.ClientID %>").hide();
            }
        });

        tinymce.init({
            selector: "textarea.tinymce",
            convert_urls: false,
            plugins: [
		        "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
		        "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
		        "save table contextmenu directionality template paste textcolor"
	        ]
        });

        CKEDITOR.replace('<%=txtContentText.ClientID %>', { height: '400px' });

    });
</script>
