<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_ManagerImportExport.ascx.cs" Inherits="DNNGo.Modules.DNNGalleryV7.Setting_ManagerImportExport" %>

<link rel="stylesheet" href="<%=ModulePath %>/plugins/bootstrap-fileupload/bootstrap-fileupload.min.css">

<script src="<%=ModulePath %>/plugins/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
<!-- start: PAGE HEADER -->
      <div class="row">
        <div class="col-sm-12"> 
          <!-- start: PAGE TITLE & BREADCRUMB -->
          
          <div class="page-header">
            <h1><i class="fa fa-retweet"></i> <%=ViewResourceText("Header_Title", "Export & Import")%> </h1>
          </div>
          <!-- end: PAGE TITLE & BREADCRUMB --> 
        </div>
      </div>
      <!-- end: PAGE HEADER --> 
      <!-- start: PAGE CONTENT -->
      
      <div class="row">
        <div class="col-sm-12">

          <div class="panel panel-default">
            <div class="panel-heading"> <i class="fa clip-download"></i> <%=ViewResourceText("Title_Export", "All Items Export")%>
              <div class="panel-tools"> <a href="#" class="btn btn-xs btn-link panel-collapse collapses"> </a> </div>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="form-horizontal">
                     <div class="form-group">
                        <%=ViewControlTitle("lblExportToXml", "Export To Xml", "cmdExportToXml", ":", "col-sm-3 control-label")%>
                        <div class="col-sm-6">
                           <asp:Button runat="server" Text="Export Article List" ID="cmdExportToXml"  resourcekey="cmdExportToXml" onclick="cmdExportToXml_Click"  OnClientClick="CancelValidation();" CssClass="btn btn-bricky" /> 
                        </div>
                      </div>
                      
                </div>
              </div>
            </div>
          </div>


                    <div class="panel panel-default">
            <div class="panel-heading"> <i class="fa clip-upload"></i> <%=ViewResourceText("Title_Import", "All Items Import")%>
              <div class="panel-tools"> <a href="#" class="btn btn-xs btn-link panel-collapse collapses"> </a> </div>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="form-horizontal">
                     <div class="form-group">
                        <%=ViewControlTitle("lblImportFormXml", "Import For Xml", "fuImportFormXml", ":", "col-sm-3 control-label")%>
                        <div class="col-sm-4">
                           <asp:FileUpload runat="server" ID="fuImportFormXml" Width="340" CssClass=" file-input validate[required]" />  
                               <br/>
                            <asp:Button ID="cmdImportFormXml" runat="server" Text="Import Article List" resourcekey="cmdImportFormXml" onclick="cmdImportFormXml_Click" CssClass="btn btn-primary" /> 
                        </div>
                      </div>
                      
                </div>
              </div>
            </div>
          </div>
 
        </div>
      </div>
      
      <!-- end: PAGE CONTENT--> 
 
								            
							             
