<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_Effect_Style.ascx.cs" Inherits="DNNGo.Modules.DNNGalleryV7.Setting_Effect_Style" %>
<!-- start: PAGE HEADER -->
      <div class="row">
        <div class="col-sm-12"> 
          <!-- start: PAGE TITLE & BREADCRUMB -->
          
          <div class="page-header">
            <h1><i class="fa fa-leaf"></i> <%=ViewResourceText("Header_Title", "Effect Style")%></h1>
          </div>
          <!-- end: PAGE TITLE & BREADCRUMB --> 
        </div>
      </div>
      <!-- end: PAGE HEADER -->
            <!-- start: PAGE CONTENT -->
      
      <div class="row">
        <div class="col-sm-12">
    
            
          <div class="panel panel-default">
            <div class="panel-heading"> <i class="fa fa-external-link-square"></i> <%=ViewResourceText("Title_BaseSettings", "Base Settings")%>
              <div class="panel-tools"> <a href="#" class="btn btn-xs btn-link panel-collapse collapses"> </a> </div>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                  <div class="form-group">
                    <%=ViewControlTitle("lblThemeSetting", "Theme Settings", "txtContent", ":", "col-sm-2 control-label")%>
                    <div class="col-sm-10">
                      <textarea runat="server" ID="txtContent" Rows="20"  style="width:98%; overflow-x:auto;"></textarea>
                    </div>
                  </div>
                </div>
            </div>
          </div>


        



        </div>
      </div>
      <!-- end: PAGE CONTENT-->
      
      <div class="row">
        <div class="col-sm-2"> </div>
        <div class="col-sm-10">
        <asp:Button CssClass="btn btn-primary" lang="Submit" ID="cmdUpdate" resourcekey="cmdUpdate"
        runat="server" Text="Update" OnClick="cmdUpdate_Click"></asp:Button>&nbsp;
        <asp:Button CssClass="btn btn-default" ID="cmdCancel" resourcekey="cmdCancel" runat="server"
            Text="Cancel" CausesValidation="False" OnClick="cmdCancel_Click"  OnClientClick="CancelValidation();"></asp:Button>&nbsp;
        
         </div>
      </div>