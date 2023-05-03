<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="~/Resource_RichUrls.ascx.cs" Inherits="DNNGo.Modules.DNNGalleryV7.Resource_RichUrls" %>
			 <div class="Controls_Urls" data-name="<%=ClientName %>" data-default="<%=ShowDefault %>">
                <asp:RadioButtonList ID="rblUrlLink" runat="server" CssClass="rblUrlLink" RepeatDirection="Vertical"></asp:RadioButtonList>
                <asp:TextBox ID="txtUrlLink" runat="server" Width="350" CssClass="txtUrlLink form-control input_text" placeholder="http://" ></asp:TextBox>
                <asp:DropDownList  ID="ddlUrlLink" runat="server" CssClass="ddlUrlLink  form-control input_text" style="width:auto !important;"></asp:DropDownList>
                <asp:Panel ID="panUrlLink" CssClass="panUrlLink" runat="server">
                    <asp:HiddenField runat="server" ID="hfUrlLink" />
                    <asp:Panel ID="div_Image" runat="server" CssClass="div_Image" style=" max-width:400px;">
            
                    </asp:Panel>    
  
                     <div class="nav nav-tabs Urls_Pictures"  id="Urls_Pictures" runat="server" style="display:none;">
                        <ul id="myTab2" class="nav nav-tabs tab-purple">
		                    <li class="active">
			                    <a href="#panel_tab_list_<%=ClientName %>" data-toggle="tab">
				                   <i class="green fa clip-list"></i> List
			                    </a>
		                    </li>
		                    <li class="">
			                    <a href="#panel_tab_add_<%=ClientName %>" data-toggle="tab">
				                   <i class="green fa clip-plus-circle"></i> Uploads
			                    </a>
		                    </li>
	                    </ul>
	                    <div class="tab-content">
		                    <div class="tab-pane active" id="panel_tab_list_<%=ClientName %>">
                             <div class="dd handlelist" id="Urls_Pictures_div" >
                                <div class="listtitle" >
                                    <div class="row">
                                    <div class="col-xs-1">ID</div>
                                    <div class="col-xs-3">Images</div> 
                                    <div class="col-xs-4">Name</div>
                                    <div class="col-xs-2">Extension</div>

                                    <div class="col-xs-2 last"> </div>
                                    </div>
                                </div>
                                <ol class="dd-list listbox" id="Urls_Pictures_ol">
                                </ol>
                                <ul id="Urls_Pictures_page"></ul>
                             </div> 
		                    </div>
		                    <div class="tab-pane" id="panel_tab_add_<%=ClientName %>">
                                <div id="dropzone<%=ClientName %>" action="<%=ModulePath %>Resource_jQueryFileUpload.ashx?<%=QueryString %>" method="post"  class="dropzone" enctype="multipart/form-data"></div>
                                <script type="text/javascript">
                                    $(document).ready(function(){
                                           Dropzone.options.dropzone<%=ClientName %> = {
                                            init: function () {
                                                this.on("queuecomplete", function (data) {
                                                      $("div.Controls_Urls").each(function (i, n) {
                                                             UrlLibrary.ReBind($(this).attr("data-name"), this);
                                                      });
                                                });
                                            }
                                        };
                                    });
                                </script>
		                    </div>
	                    </div>
	
                    </div>
                </asp:Panel>
            </div>