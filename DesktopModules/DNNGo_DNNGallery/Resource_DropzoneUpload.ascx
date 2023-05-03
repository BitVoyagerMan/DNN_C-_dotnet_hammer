<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Resource_DropzoneUpload.ascx.cs" Inherits="DNNGo.Modules.DNNGalleryV7.Resource_DropzoneUpload" %>
<script type="text/javascript" src="<%=ModulePath %>Resource/js/dropzone.js"></script>
<link rel="stylesheet" href="<%=ModulePath %>Resource/css/dropzone.css" />
<form action="<%=ModulePath %>Resource_jQueryFileUpload.ashx?<%=QueryString %>" method="post"  class="dropzone" enctype="multipart/form-data"></form>


<script type="text/javascript">




</script>