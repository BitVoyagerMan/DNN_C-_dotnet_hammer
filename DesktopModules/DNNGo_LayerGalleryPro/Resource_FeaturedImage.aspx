<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resource_FeaturedImage.aspx.cs" Inherits="DNNGo.Modules.LayerGalleryPro.Resource_FeaturedImage1" %>
 
<!DOCTYPE HTML>
<!--
/*
 * jQuery File Upload Plugin HTML Example 5.0.5
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://creativecommons.org/licenses/MIT/
 */
-->
<html lang="en" class="no-js">
<head>
<meta charset="utf-8">
<title>jQuery File Upload Example</title>
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
     <!-- start: MAIN CSS -->
    <link rel="stylesheet" href="<%=ModulePath %>Resource/plugins/bootstrap/css/bootstrap.min.css"  media="screen" />
    <link rel="stylesheet" href="<%=ModulePath %>Resource/plugins/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=ModulePath %>Resource/fonts/style.css" />
    <link rel="stylesheet" href="<%=ModulePath %>Resource/css/main.css" />
    <link rel="stylesheet" href="<%=ModulePath %>Resource/css/main-responsive.css" />
  
    <!--<link rel="stylesheet/less" type="text/css" href="<%=ModulePath %>Resource/css/styles.less" />-->
    <link rel="stylesheet" href="<%=ModulePath %>Resource/css/theme_light.css" type="text/css" id="skin_color" />
    <!--[if IE 7]>
		    <link rel="stylesheet" href="<%=ModulePath %>Resource/plugins/font-awesome/css/font-awesome-ie7.min.css" />
		    <![endif]-->
    <!-- end: MAIN CSS -->
    <!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
    <link rel="stylesheet" href="<%=ModulePath %>Resource/plugins/bootstrap-social-buttons/social-buttons-3.css" />

       <!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
    <script src="<%=ModulePath %>Resource/js/jquery.min.js"></script>
    <script src="<%=ModulePath %>Resource/js/jquery-ui.min.js"></script>
    

    <!-- start: MAIN JAVASCRIPTS -->
    <!--[if lt IE 9]>
		    <script src="<%=ModulePath %>Resource/plugins/respond.min.js"></script>
		    <script src="<%=ModulePath %>Resource/plugins/excanvas.min.js"></script>
    <![endif]-->

    <script src="<%=ModulePath %>Resource/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=ModulePath %>Resource/plugins/blockUI/jquery.blockUI.js"></script>
 


    <script src="<%=ModulePath %>Resource/plugins/bootstrap-paginator/src/bootstrap-paginator.js"></script>

 

</head>
<body>


    



<div class="tabbable">
  <ul id="myTab4" runat="server" class="nav nav-tabs tab-bricky">
    <li id="liNavigation_add" runat="server"><asp:HyperLink ID="hlNavigation_add" runat="server" Text="<i class='fa fa-plus'></i> Add pictures" ></asp:HyperLink> <%--<a href="#panel_tab3_example1"> Add pictures </a> --%></li>
    <li id="liNavigation_list" runat="server"> <asp:HyperLink ID="hlNavigation_list" runat="server" Text="<i class='fa clip-list-4'></i> Picture list" ></asp:HyperLink><%--<a href="#panel_tab3_example2" > Picture list </a>--%> </li>
  </ul>
  <div class="tab-content">
    <asp:Panel ID="panel_tab3_example1" runat="server" CssClass="tab-pane">
        <%--<uc1:Resource_DropzoneUpload ID="Resource_DropzoneUpload1" runat="server" />--%>
        <asp:PlaceHolder ID="phDropzoneUpload" runat="server"></asp:PlaceHolder>
    </asp:Panel>
    <asp:Panel ID="panel_tab3_example2" runat="server" CssClass="tab-pane">
     
         <form id="form1" runat="server">
            <asp:PlaceHolder ID="phFeaturedImage" runat="server"></asp:PlaceHolder>
            <%--<uc2:Resource_FeaturedImage ID="Resource_FeaturedImage2" runat="server" />--%>
         </form>
      </asp:Panel>
  </div>
</div>
 
   
 
</body> 
</html>