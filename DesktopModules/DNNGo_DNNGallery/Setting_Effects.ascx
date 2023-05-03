<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_Effects.ascx.cs" Inherits="DNNGo.Modules.DNNGalleryV7.Setting_Effects" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<!-- start: PAGE HEADER -->
<div class="row">
    <div class="col-sm-12">
        <!-- start: PAGE TITLE & BREADCRUMB -->
        
        <div class="page-header">
            <h1>
                <i class="fa clip-list-4"></i> <%=ViewResourceText("Header_Title", "Effect List")%></h1>
        </div>
        <!-- end: PAGE TITLE & BREADCRUMB -->
    </div>
</div>
<!-- end: PAGE HEADER -->
<div class="row">
    <div class="col-sm-12">
   
                    <asp:GridView ID="gvEffectList" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvEffectList_RowDataBound"
                        Width="100%" CellPadding="0" GridLines="none" CellSpacing="0" border="0" CssClass="table table-striped table-bordered table-hover">
                        <Columns>
                            <asp:TemplateField HeaderText="Effect Information">
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td rowspan="3" style="width: 200px; padding: 0px 10px 0px 0px; background: none;
                                                border: none;">
                                               <asp:Image runat="server" Style="width: 200px;" ID="imgPicture" CssClass="img-responsive" />
                                            </td>
                                            <td style="background: none; padding: 0px; border: none;">
                                                <asp:Label runat="server" ID="labName"></asp:Label>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:HyperLink ID="hlThemeName" runat="server" CssClass="btn btn-default btn-xs"></asp:HyperLink>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background: none; padding: 0px; border: none;">
                                                <asp:Label runat="server" ID="labDescription" CssClass="hidden-xs"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background: none; padding: 0px; border: none;">
                                                <asp:Label runat="server" ID="labVersion" Visible="false"></asp:Label>
                                              <%--  &nbsp;&nbsp;&nbsp;&nbsp;--%>
                                               <asp:Literal runat="server" ID="LiDemoUrl"></asp:Literal> 
                                               <asp:Literal runat="server" ID="LiResponsive"></asp:Literal> 
                                               <asp:Literal runat="server" ID="LiPager"></asp:Literal>
                                                
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <HeaderStyle></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action" HeaderStyle-Width="120">
                                <ItemTemplate>
                                    <asp:LinkButton CssClass="CommandButton" ID="btnApply" runat="server" BorderStyle="none"
                                        Text="<i class='fa fa-stop'></i> Apply Effect" OnClick="btnApply_Click"></asp:LinkButton>
                                      <%--<br /><br />
                                    <asp:Literal runat="server" ID="LiDemoUrl"></asp:Literal>--%>
                                     
                                </ItemTemplate>
                                <HeaderStyle></HeaderStyle>
                            </asp:TemplateField>
                        </Columns>
                        <PagerSettings Visible="False" />
                        <FooterStyle />
                        <PagerStyle />
                        <SelectedRowStyle />
                        <HeaderStyle />
                    </asp:GridView>
                    <div class="full_version_title" id="full_version_title" runat="server" visible="false">
                        <%=ViewTitle("lblFullVersionTitle", "The module you are using is just a single effect version.")%>
                        <br />
                        <%=ViewTitle("lblFullVersionContent", "If you need more effects,Please purchase the <a href='http://www.dnngo.net/DNNStore/tabid/58/CategoryID/105/List/0/Level/a/ProductID/468/Default.aspx' target='_blank'>DNNGo.DNNGallery</a> to own all amazing effects!")%>
                    </div>
                
    </div>
</div>
