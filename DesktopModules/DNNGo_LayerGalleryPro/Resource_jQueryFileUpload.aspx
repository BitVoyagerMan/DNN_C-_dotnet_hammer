<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resource_jQueryFileUpload.aspx.cs" Inherits="DNNGo.Modules.LayerGalleryPro.Resource_jQueryFileUpload" %>
<%@ Register src="Resource_DropzoneUpload.ascx" tagname="Resource_DropzoneUpload" tagprefix="uc1" %>
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
		<link href="<%=ModulePath %>Resource/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="<%=ModulePath %>Resource/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=ModulePath %>Resource/fonts/style.css">
		<link rel="stylesheet" href="<%=ModulePath %>Resource/css/main-responsive.css">
		<!--[if IE 7]>
		<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome-ie7.min.css">
		<![endif]-->
		<!-- end: MAIN CSS -->

        <script src="<%=ModulePath %>Resource/js/jquery.min.js"></script>
        <script src="<%=ModulePath %>Resource/js/jquery-ui.min.js"></script>
        <script src="<%=ModulePath %>Resource/plugins/bootstrap/js/bootstrap.min.js"></script>
  
</head>
<body>

<uc1:Resource_DropzoneUpload ID="Resource_DropzoneUpload1" runat="server" />
 
</body> 
</html>