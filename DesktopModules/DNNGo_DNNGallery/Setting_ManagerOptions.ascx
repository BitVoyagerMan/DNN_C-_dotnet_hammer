<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_ManagerOptions.ascx.cs" Inherits="DNNGo.Modules.DNNGalleryV7.Setting_ManagerOptions" %>
<!-- start: PAGE HEADER -->
      <div class="row">
        <div class="col-sm-12"> 
          <!-- start: PAGE TITLE & BREADCRUMB -->
          
          <div class="page-header">
            <h1><i class="fa clip-cogs"></i> <%=ViewResourceText("Header_Title", "Effect Options")%></h1>
          </div>
          <!-- end: PAGE TITLE & BREADCRUMB --> 
        </div>
      </div>
      <!-- end: PAGE HEADER -->
            <!-- start: PAGE CONTENT -->
      
      <div class="row">
        <div class="col-sm-12">
    
            
          <div class="panel panel-default">
            <div class="panel-heading"> <i class="fa fa-external-link-square"></i> <%=ViewResourceText("Title_BaseSettings", "General Settings")%>
              <div class="panel-tools"> <a href="#" class="btn btn-xs btn-link panel-collapse collapses"> </a> </div>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">

              <!--    <div class="form-group">
                    <%=ViewControlTitle("lblEffectName", "Effect Name", "lblEffectName", ":", "col-sm-3 control-label")%>
                    <div class="col-sm-5">
                        <asp:Label ID="lblEffectName" runat="server"></asp:Label>
                    </div>
                  </div>
                  <div class="form-group">
                    <%=ViewControlTitle("lblEffectDescription", "Effect Description", "lblEffectDescription", ":", "col-sm-3 control-label")%>
                    <div class="col-sm-5">
                        <asp:Label ID="lblEffectDescription" runat="server"></asp:Label>
                    </div>
                  </div>-->



                  <div class="form-group">
                    <%=ViewControlTitle("lblThemeName", "Theme Name", "ddlThemeName", ":", "col-sm-3 control-label")%>
                    <div class="col-sm-3">
                        <asp:DropDownList ID="ddlThemeName" runat="server" CssClass="form-control" ></asp:DropDownList>
                    </div>
                  </div>
                  <div class="form-group">
                     <div class="col-sm-3"></div>
                    <div class="col-sm-5">
                      <asp:Image runat="server" style="width:350px;" ID="imgThemeThumbnails" Visible="false" CssClass="img-responsive" />
                      <asp:HiddenField runat="server" ID="hfThemeThumbnails" />
                    </div>
                  </div>
                </div>
            </div>
          </div>

 



          
            <div runat="server" id="divOptions" visible="false">
                <asp:Repeater ID="RepeaterGroup" runat="server" OnItemDataBound="RepeaterGroup_ItemDataBound">
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
      </div>
      <!-- end: PAGE CONTENT-->
      
      <div class="row">
        <div class="col-sm-3"> </div>
        <div class="col-sm-5">
          <asp:Button CssClass="btn btn-primary" lang="Submit" ID="cmdUpdate" resourcekey="cmdUpdate"
        runat="server" Text="Update" OnClick="cmdUpdate_Click"></asp:Button>&nbsp;
        <asp:Button CssClass="btn btn-default" ID="cmdCancel" resourcekey="cmdCancel" runat="server"
            Text="Cancel" CausesValidation="False" OnClick="cmdCancel_Click"  OnClientClick="CancelValidation();"></asp:Button>&nbsp;
        
         </div>
      </div>
	<br/>

<script type="text/javascript">
    jQuery().ready(function ($) {
        $("#<%=ddlThemeName.ClientID %>").change(function () {
            var selecttext = $("#<%=ddlThemeName.ClientID %> option:selected").val();
            var urltext = $("#<%=hfThemeThumbnails.ClientID %>").val();
            $("#<%=imgThemeThumbnails.ClientID %>").attr("src", selecttext);


        });
    });
</script>