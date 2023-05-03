<%@ Control Language="C#" AutoEventWireup="true" Inherits="DNNGo.Modules.LayerGalleryPro.License" Codebehind="License.ascx.cs" %>
      <!-- start: PAGE HEADER -->
      <div class="row">
        <div class="col-sm-12"> 
          <!-- start: PAGE TITLE & BREADCRUMB -->
          
          <div class="page-header">
            <h1><i class="fa clip-globe"></i> <%=ViewResourceText("Header_Title", "License")%></h1>
          </div>
          <!-- end: PAGE TITLE & BREADCRUMB --> 
        </div>
      </div>
      <!-- end: PAGE HEADER --> 



      <!-- start: PAGE CONTENT -->
      
      <div class="row">
        <div class="col-sm-12">                                 
          <div class="panel panel-default">
            <div class="panel-heading"> <i class="fa fa-external-link-square"></i> <%=ViewResourceText("Title_LicenseSettings", "License Settings")%>
              <div class="panel-tools"> <a href="#" class="btn btn-xs btn-link panel-collapse collapses"> </a> </div>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                  <div class="form-group">
                    <div class="col-sm-9">
                        <label ><%=ViewResourceText("Title_Text1", "1. Please login or register your account at <a  target='_blank' href='http://www.dnngo.net/'>http://www.dnngo.net</a>")%></label>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-9">
                        <label ><%=ViewResourceText("Title_Text2", "2. Send an email to <a href='mailto:dnnskindev@gmail.com'>dnnskindev@gmail.com</a> with your invoice ID, machine key (below), and your DNNgo username. We will generate an activation code for you.  Please note: If your site is a demo site, your license will still be valid when you transfer your site to a live site.")%></label>
                    </div>
                  </div>
                  <div class="form-group"> 
                    <div class="col-sm-9">
                        <label ><%=ViewResourceText("Title_Text3", "3. <a target='_blank' href='http://www.dnngo.net/MyAccount/OnlineAuthorization.aspx'>Manage my licenses</a>")%></label>
                    </div>
                  </div>

                  <div class="form-group">
                    <%=ViewControlTitle("lblMachineKey", "Machine Key", "txtMachineKey", ":", "col-sm-3 control-label")%>
                    <div class="col-sm-8">
                        <asp:TextBox  id="txtMachineKey" style="cursor: auto!important;" CssClass="form-control" ReadOnly="true" runat="server" Rows="3" width="100%" TextMode="MultiLine"></asp:TextBox>
                      
                    </div>
                  </div>
                  <div class="form-group">
                    <%=ViewControlTitle("lblVersionStatus", "Version Status", "lblVersionStatusShow", ":", "col-sm-3 control-label")%>
                    <div class="col-sm-5">
                      <div class="control-inline"><asp:Literal ID="lblVersionStatusShow" runat="server"></asp:Literal></div>
                     
                    </div>
                  </div>
                  <div class="form-group">
                    <%=ViewControlTitle("lblBuyTime", "Buy Time", "lblBuyTimeShow", ":", "col-sm-3 control-label")%>
                    <div class="col-sm-5">
                      <div class="control-inline"><asp:Label ID="lblBuyTimeShow" runat="server" CssClass="Normal"></asp:Label></div>
                     
                    </div>
                  </div>
                  <div class="form-group">
                    <%=ViewControlTitle("lblExpirationTime", "Expiration Time", "lblExpirationTimeShow", ":", "col-sm-3 control-label")%>
                    <div class="col-sm-5">
                      <div class="control-inline"><asp:Label ID="lblExpirationTimeShow" runat="server" CssClass="Normal"></asp:Label></div>
                     
                    </div>
                  </div>
                   <div class="form-group">
                    <%=ViewControlTitle("lblVerificationTime", "Verification Time", "lblVerificationTimeShow", ":", "col-sm-3 control-label")%>
                    <div class="col-sm-5">
                      <div class="control-inline"><asp:Label ID="lblVerificationTimeShow" runat="server" CssClass="Normal"></asp:Label></div>
                     
                    </div>
                  </div>
                  <div class="form-group">
                    <%=ViewControlTitle("lblReturnMessage", "Return Message", "lblReturnMessageShow", ":", "col-sm-3 control-label")%>
                    <div class="col-sm-5">
                      <div class="control-inline"><asp:Label ID="lblReturnMessageShow" runat="server"></asp:Label></div>
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
            <asp:LinkButton ID="lbActive" runat="server" CssClass="btn btn-primary" resourcekey="lbActive" OnClick="lbActive_Click"></asp:LinkButton>
            <asp:LinkButton ID="lkbReturn" runat="server" CssClass="btn btn-default" resourcekey="lkbReturn"  OnClick="lkbReturn_Click"></asp:LinkButton>
        
         </div>
      </div>








 