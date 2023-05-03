<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_jQuery.ascx.cs"
    Inherits="DNNGo.Modules.DNNGalleryV7.Setting_jQuery" %>
<!-- start: PAGE HEADER -->
<div class="row">
    <div class="col-sm-12">
        <!-- start: PAGE TITLE & BREADCRUMB -->
        <div class="page-header">
            <h1><i class="fa clip-code"></i> <%=ViewResourceText("Header_Title", "jQuery Settings")%></h1>
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
                <i class="fa fa-external-link-square"></i> <%=ViewResourceText("Title_BaseSettings", "Base Settings")%>
                <div class="panel-tools">
                    <a href="#" class="btn btn-xs btn-link panel-collapse collapses"></a>
                </div>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <%=ViewControlTitle("lbljQueryEnable", "jQuery Enable", "cbjQueryEnable", ":", "col-sm-3 control-label")%>
                        <div class="col-sm-5">
                           <div class="control-inline"> <asp:CheckBox ID="cbjQueryEnable" runat="server" /></div>
                        </div>
                    </div>
                  
                        <div class="form-group">
                            <%=ViewControlTitle("lbljQueryVersion", "Installed jQuery Version", "", ":", "col-sm-3 control-label")%>
                            <div class="col-sm-5">
                               <div class="control-inline"> <%=ViewTitle("lbljQueryVersionText", "1.9.1")%></div>
                            </div>
                        </div>
                      
                            <div class="form-group">
                                <%=ViewControlTitle("lbljQueryUIVersion", "Installed jQuery UI Version","", ":", "col-sm-3 control-label")%>
                                <div class="col-sm-5">
                                   <div class="control-inline"> <%=ViewTitle("lbljQueryUIVersionText", "1.10.4")%></div>
                                </div>
                            </div>
                        
                                <div class="form-group">
                                    <%=ViewControlTitle("lblUseHostedjQuery", "Use Hosted jQuery Version", "cbUseHostedjQuery", "?", "col-sm-3 control-label")%>
                                    <div class="col-sm-5">
                                        <div class="control-inline"><asp:CheckBox ID="cbUseHostedjQuery" runat="server" /></div>
                                    </div>
                                </div>
                            
                                    <div class="form-group">
                                        <%=ViewControlTitle("lblHostedjQuery", "Hosted jQuery Url", "txtHostedjQuery", ":", "col-sm-3 control-label")%>
                                        <div class="col-sm-5">
                                          <asp:TextBox runat="server" ID="txtHostedjQuery" Width="80%" CssClass="form-control validate[required]"></asp:TextBox>
                                        </div>
                                    </div>
                                 
                                        <div class="form-group">
                                            <%=ViewControlTitle("lblHostedjQueryUI", "Hosted jQuery UI Url", "txtHostedjQueryUI", ":", "col-sm-3 control-label")%>
                                            <div class="col-sm-5">
                                                <asp:TextBox runat="server" ID="txtHostedjQueryUI" Width="80%" CssClass="form-control validate[required]"></asp:TextBox>
                                            </div>
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
