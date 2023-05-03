<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Resource_FeaturedImage.ascx.cs" Inherits="DNNGo.Modules.LayerGalleryPro.Resource_FeaturedImage" %>
    <div class="row">
        <div class="col-sm-8">
         <div class="form-group">
                <asp:TextBox ID="txtSearch" runat="server" placeholder="Search Text Field" x-webkit-speech></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary btn-sm" Text="Search" onclick="btnSearch_Click"  resourcekey="btnSearch" />
            </div>
        </div>
        <div class="col-sm-3 text_right"> <br />
                <asp:Label ID="lblRecordCount" runat="server"></asp:Label> 
        </div>
      </div>
      <!-- start-->
      <div class="form-group">
             <asp:GridView ID="gvArticleList" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvArticleList_RowDataBound" OnRowCreated="gvArticleList_RowCreated" OnSorting="gvArticleList_Sorting" AllowSorting="true"
                        Width="98%" CellPadding="0" cellspacing="0" border="0" CssClass="table table-striped table-bordered table-hover"  GridLines="none" >
                        <Columns>
                             
                             <asp:TemplateField HeaderText="File Information" SortExpression="Name" >
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                       <tr>
                                        <td><asp:Image  runat="server" ID="imgFileName" style=" max-height:80px;max-width:80px;" />&nbsp;</td>
                                        <td> <asp:HyperLink Target="_blank" runat="server" ID="hlFileName" CssClass=""></asp:HyperLink><br />
                                   <asp:Label ID="lblFileExtension" runat="server"></asp:Label>      </td>
                                      </tr>
                                   </table>              
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="LastUser" HeaderText="Author" SortExpression="LastUser" HeaderStyle-CssClass="hidden-xs" ItemStyle-CssClass="hidden-xs" /> 
                            <asp:BoundField DataField="LastTime" HeaderText="CreateTime" SortExpression="LastTime"  HeaderStyle-CssClass="hidden-xs" ItemStyle-CssClass="hidden-xs"/> 
                             <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"/> 
                            <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="center">
                                <ItemTemplate>
                                     <asp:HyperLink Target="_blank" runat="server" ID="hlAdditional" Text="Add" CssClass="btn btn-xs btn-primary tooltips"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                        </Columns>
                        <PagerSettings Visible="False" />
                    </asp:GridView>
                    <ul id="paginator-ArticleList" class="pagination-purple"></ul>
      </div>
      <!-- end--> 
 
           
            <script type="text/javascript">
                 $(document).ready(function () {
                    $('#paginator-ArticleList').bootstrapPaginator({
                        bootstrapMajorVersion: 3,
                        currentPage: <%=PageIndex %>,
                        totalPages: <%=RecordPages %>,
                        numberOfPages:7,
                        useBootstrapTooltip:true,
                        onPageClicked: function (e, originalEvent, type, page) {
                            window.location.href='<%=CurrentUrl %>&PageIndex='+ page;
                        }
                    });
                });

             
                function ReturnPicture(PictureUrl, PictureID) {
                    window.parent.ShowPicture(PictureUrl, PictureID);
                    window.parent.$('#AdditionalPicture_Modal').modal('hide');
                }
                
                function ReturnThumbnail(PictureUrl, PictureID) {
                    window.parent.ShowThumbnail(PictureUrl, PictureID);
                    window.parent.$('#AdditionalThumbnail_Modal').modal('hide');
                }

                function ReturnUrlLink(PictureUrl, PictureID) {
                    window.parent.ShowUrlLink(PictureUrl, PictureID);
                    window.parent.$('#UrlLink_Modal').modal('hide');
                }

                  function ReturnImgUrl(PictureUrl, PictureID) {
                    window.parent.imgurl(PictureUrl);
                    window.parent.$('#AddMedia_Modal').modal('hide');
                }

               function ReturnHtmlPicture(PictureUrl, PictureID) {
                    window.parent.ReturnHtmlPicture(PictureUrl, PictureID);
                    window.parent.$('#AddMedia_Modal').modal('hide');
                }
                

 
            </script>
       