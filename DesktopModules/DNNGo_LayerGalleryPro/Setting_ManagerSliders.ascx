<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_ManagerSliders.ascx.cs" Inherits="DNNGo.Modules.LayerGalleryPro.Setting_ManagerSliders" %>

<asp:Literal ID="liFormatData" runat="server"></asp:Literal>
<div class="row">
  <div class="col-sm-12"> 
    <!-- start: PAGE TITLE & BREADCRUMB -->
    
    <div class="page-header">
      <h1><i class="fa clip-list-4"></i> <%=ViewResourceText("Header_Title", "3D Sliders")%> </h1>
      <div id="alertbox"></div>
    </div>
    <!-- end: PAGE TITLE & BREADCRUMB --> 
  </div>
</div>
<!-- end: PAGE HEADER -->

<div id="JsonFonts" class="hide"><%=ViewSettingT<String>("LayerGalleryPro_JsonFonts",DNNGo.Modules.LayerGalleryPro.Common.ConstDefaultFonts)%></div>

<div class="row">
  <div class="col-sm-12">
    <ul class="nav nav-tabs tab-padding tab-space-3 tab-blue">
      <li> <a href="#panel_tab1_example1" data-toggle="tab">Slider Settings </a> </li>
      <li class="active"> <a href="#panel_tab1_example2" id="slidelist" data-toggle="tab">Slides</a> </li>
    </ul>
    <div class="tab-content">
      <div id="Loading"></div>
      <div class="tab-pane in " id="panel_tab1_example1">
        <div class="panel panel-default small-bottom" id="SliderSettings">
          <div class="panel-heading"> <i class="fa fa-external-link-square"></i> Slider Settings </div>
          <div class="panel-collapse collapse in">
            <div class="panel-body">
              <div class="tabbable tabs-left tabs-left2">
                <ul class="nav nav-tabs tab-green">
                  <li class="active"> <a href="#panel_tab2_example1" data-toggle="tab"><i class="clip-cogs"></i>&nbsp;  Global Settings </a> </li>
                  <li> <a href="#panel_tab2_example5" data-toggle="tab"><i class="clip-screen"></i>&nbsp;  Slide Layout </a> </li>
                  <li> <a href="#panel_tab2_example9" data-toggle="tab"><i class="clip-screen"></i>&nbsp;  Layout & Visual </a> </li>
                  <li> <a href="#panel_tab2_example2" data-toggle="tab"><i class="clip-grid-2"></i>&nbsp;  Navigation Settings </a> </li>
                  <li> <a href="#panel_tab2_example3" data-toggle="tab"><i class="clip-loop"></i>&nbsp;  Parallax & 3D </a> </li>
                  <li> <a href="#panel_tab2_example4" data-toggle="tab"><i class="clip-mobile"></i>&nbsp;  Scroll Effects</a> </li>
                  <li> <a href="#panel_tab2_example6" data-toggle="tab"><i class="clip-stack-2"></i>&nbsp; Problem Handlings </a> </li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="panel_tab2_example1">
                    <table class="table table-title">
                      <thead>
                        <tr>
                          <th colspan="3" >Global Settings</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th colspan="3" >Slideshow</th>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Stop Slide On Hover</td>
                          <td ><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" checked="checked" class="dnn-option" id="stop_on_hover" data-ordinary="true">
                            </div></td>
                          <td class="tips">Stops the Timer when mouse is hovering the slider.</td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Stop Slider After...</td>
                          <td ><div class="make-switch switch-off" data-on="primary" data-off="info"  >
                              <input type="checkbox"  class="dnn-option" id="stop_slider" data-ordinary="true">
                            </div></td>
                          <td class="tips">Stops the slideshow after the predefined loop amount at the predefined slide.</td>
                        </tr>
                        <tr class="conditional" data-condition="#stop_slider =='on'">
                          <td align="right">Amount of Loops </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="stop_after_loops" data-validation="plusint"></td>
                          <td class="tips">Stops the slider after certain amount of loops. 0 related to the first loop.</td>
                        </tr>
                        <tr class="conditional" data-condition="#stop_slider =='on'">
                          <td align="right">At Slide </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="1" id="stop_at_slide" data-validation="plusint"></td>
                          <td class="tips">Stops the slider at the given slide</td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Shuffle / Random Mode </td>
                          <td ><div class="make-switch switch-off" data-on="primary" data-off="info"  >
                              <input type="checkbox"  class="dnn-option" id="shuffle" data-ordinary="true">
                            </div></td>
                          <td class="tips">Randomize the order of the slides at every Page reload.</td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Loop Single Slide </td>
                          <td ><div class="make-switch switch-off" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="loop_slide" data-ordinary="true">
                            </div></td>
                          <td class="tips">If only one Slide is in the Slider, you can choose wether the Slide should loop or if it should stop. If only one Slide exist, slide will be duplicated !</td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Stop Slider Out of ViewPort </td>
                          <td ><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="viewport" data-ordinary="true">
                            </div></td>
                          <td class="tips">Allow to stop the Slider out of viewport.</td>
                        </tr>
                        <tr class="conditional" data-condition="#viewport =='on'">
                          <td width="15%" align="right">Out Of ViewPort</td>
                          <td width="15%" class=""><select class="form-control dnn-option" id="viewport_start">
                              <!--<option value="wait">Wait</option>-->
                              <option value="pause">Pause</option>
                            </select></td>
                          <td class="tips">Min. Size of Slider must be in Viewport before slide starts again.</td>
                        </tr>
                        <tr class="conditional" data-condition="#viewport =='on'">
                          <td align="right">Area out of ViewPort</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="80" id="viewport_area" data-validation="plusint">
                            %</td>
                          <td class="tips">Min. Size of Slider must be in Viewport before slide starts again.</td>
                        </tr>
                        <tr class="conditional" data-condition="#viewport =='on'">
                          <td width="15%" align="right">Preset Slider Height </td>
                          <td ><div class="make-switch switch-off" data-on="primary" data-off="info"  >
                              <input type="checkbox"  class="dnn-option" id="label_presetheight" data-ordinary="true">
                            </div></td>
                          <td class="tips">Precalculate the Height of the Slider to support Inline Links</td>
                        </tr>
                        <!--tr>
                          <td width="15%" align="right">Wait for revapi1.revstart()</td>
                          <td ><div class="make-switch switch-off" data-on="primary" data-off="info"  >
                              <input type="checkbox"  class="dnn-option" id="waitforinit" data-ordinary="true">
                            </div></td>
                          <td class="tips">Wait for the revstart method to be called before playing.</td>
                        </tr>-->
                        <tr>
                          <th colspan="3" >Defaults</th>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Layers Selectable</td>
                          <td ><div class="make-switch switch-off" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="def_layer_selection" data-ordinary="true">
                            </div></td>
                          <td class="tips">Default Layer Selection on Frontend enabled or disabled</td>
                        </tr>
                        <tr>
                          <td align="right">Slider ID</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="" id="slider_id"></td>
                          <td class="tips">Set a specific ID to the Slider, if empty, there will be a default one written</td>
                        </tr>
                        <tr>
                          <td align="right">Default Slide Duration </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="9000" id="delay" data-validation="plusint">
                            ms</td>
                          <td class="tips">The time one slide stays on the screen in Milliseconds. This is a Default Global value. Can be adjusted slide to slide also in the slide editor.</td>
                        </tr>
                        <tr>
                          <td align="right">Initialization Delay </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="start_js_after_delay" data-validation="plusint">
                            ms</td>
                          <td class="tips">Sets a delay before the Slider gets initialized</td>
                        </tr>
                        <tr>
                          <th colspan="3" >Progress Bar </th>
                        <tr>
                          <td width="15%" align="right">Progress Bar Active</td>
                          <td ><div class="make-switch" data-on="primary" data-off="info">
                              <input type="checkbox" checked="checked" class="dnn-option" id="enable_progressbar" data-ordinary="true">
                            </div></td>
                          <td class="tips">Enable / disable progress var</td>
                        </tr>
                        <tr  class="conditional" data-condition="#enable_progressbar =='on'">
                          <td width="15%" align="right">Progress Bar Position</td>
                          <td width="15%" class=""><select class="form-control dnn-option" id="show_timerbar">
                              <option value="top">Top</option>
                              <option value="bottom">Bottom</option>
                            </select></td>
                          <td class="tips">Position of the progress bar.</td>
                        </tr>
                        <tr  class="conditional" data-condition="#enable_progressbar =='on'">
                          <td align="right">Progress Bar Height </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="5" id="progress_height" data-validation="plusint">
                            px</td>
                          <td class="tips">The height of the progress bar</td>
                        </tr>
                        <tr  class="conditional" data-condition="#enable_progressbar =='on'">
                          <td align="right">Progress Bar Color</td>
                          <td><input type="text" class="form-control dnn-option color-picker tooltips form-validation" data-color-format="rgba" data-validation="string" value="rgba(0,0,0,0.15)" data-colorpicker-guid="1" style="width:150px;" id="progressbar_color">
                          </td>
                          <td class="tips">Color of the progress bar.</td>
                        </tr>
                          </tr>
                        
<!--                        <tr>
                          <th colspan="3" >1st Slide</th>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Activate Alt. 1st Slide</td>
                          <td ><div class="make-switch" data-on="primary" data-off="info">
                              <input type="checkbox" class="dnn-option" id="start_with_slide_enable" data-ordinary="true">
                            </div></td>
                          <td class="tips">Activate Alternative 1st Slide.</td>
                        </tr>
                        <tr>
                          <td align="right">Alternative 1st Slide </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="1" id="start_with_slide" data-validation="plusint"></td>
                          <td class="tips">Start from a different slide instead of the first slide. I.e. good for preview / edit mode.</td>
                        </tr>
                        <tr class="conditional" data-condition="#start_with_slide =='on'">
                          <td width="15%" align="right">First Transition Active </td>
                          <td ><div class="make-switch" data-on="primary" data-off="info">
                              <input type="checkbox" class="dnn-option" id="first_transition_active" data-ordinary="true">
                            </div></td>
                          <td class="tips">If active, it will overwrite the first slide transition. Use it to get special transition for the first slide.</td>
                        </tr>
                        <tr data-condition="#start_with_slide =='on'">
                          <td width="15%" align="right">Transition Type </td>
                          <td width="15%" class=""><select class="form-control dnn-option" id="first_transition_type">
                              <option value="notselectable1" disabled="disabled">BASICS</option>
                              <option value="notransition">No Transition</option>
                              <option value="fade" selected="selected">Fade</option>
                              <option value="crossfade">Fade Cross</option>
                              <option value="fadethroughdark">Fade Through Black</option>
                              <option value="fadethroughlight">Fade Through Light</option>
                              <option value="fadethroughtransparent">Fade Through Transparent</option>
                              <option value="notselectable2" disabled="disabled">SLIDE SIMPLE</option>
                              <option value="slideup">Slide To Top</option>
                              <option value="slidedown">Slide To Bottom</option>
                              <option value="slideright">Slide To Right</option>
                              <option value="slideleft">Slide To Left</option>
                              <option value="slidehorizontal">Slide Horizontal (Next/Previous)</option>
                              <option value="slidevertical">Slide Vertical (Next/Previous)</option>
                              <option value="notselectable21" disabled="disabled">SLIDE OVER</option>
                              <option value="slideoverup">Slide Over To Top</option>
                              <option value="slideoverdown">Slide Over To Bottom</option>
                              <option value="slideoverright">Slide Over To Right</option>
                              <option value="slideoverleft">Slide Over To Left</option>
                              <option value="slideoverhorizontal">Slide Over Horizontal (Next/Previous)</option>
                              <option value="slideoververtical">Slide Over Vertical (Next/Previous)</option>
                              <option value="notselectable22" disabled="disabled">SLIDE REMOVE</option>
                              <option value="slideremoveup">Slide Remove To Top</option>
                              <option value="slideremovedown">Slide Remove To Bottom</option>
                              <option value="slideremoveright">Slide Remove To Right</option>
                              <option value="slideremoveleft">Slide Remove To Left</option>
                              <option value="slideremovehorizontal">Slide Remove Horizontal (Next/Previous)</option>
                              <option value="slideremovevertical">Slide Remove Vertical (Next/Previous)</option>
                              <option value="notselectable26" disabled="disabled">SLIDING OVERLAYS</option>
                              <option value="slidingoverlayup">Sliding Overlays To Top</option>
                              <option value="slidingoverlaydown">Sliding Overlays To Bottom</option>
                              <option value="slidingoverlayright">Sliding Overlays To Right</option>
                              <option value="slidingoverlayleft">Sliding Overlays To Left</option>
                              <option value="slidingoverlayhorizontal">Sliding Overlays Horizontal (Next/Previous)</option>
                              <option value="slidingoverlayvertical">Sliding Overlays Vertical (Next/Previous)</option>
                              <option value="notselectable23" disabled="disabled">SLOTS AND BOXES</option>
                              <option value="boxslide">Slide Boxes</option>
                              <option value="slotslide-horizontal">Slide Slots Horizontal</option>
                              <option value="slotslide-vertical">Slide Slots Vertical</option>
                              <option value="boxfade">Fade Boxes</option>
                              <option value="slotfade-horizontal">Fade Slots Horizontal</option>
                              <option value="slotfade-vertical">Fade Slots Vertical</option>
                              <option value="notselectable31" disabled="disabled">FADE &amp; SLIDE</option>
                              <option value="fadefromright">Fade and Slide from Right</option>
                              <option value="fadefromleft">Fade and Slide from Left</option>
                              <option value="fadefromtop">Fade and Slide from Top</option>
                              <option value="fadefrombottom">Fade and Slide from Bottom</option>
                              <option value="fadetoleftfadefromright">To Left From Right</option>
                              <option value="fadetorightfadefromleft">To Right From Left</option>
                              <option value="fadetotopfadefrombottom">To Top From Bottom</option>
                              <option value="fadetobottomfadefromtop">To Bottom From Top</option>
                              <option value="notselectable4" disabled="disabled">PARALLAX</option>
                              <option value="parallaxtoright">Parallax to Right</option>
                              <option value="parallaxtoleft">Parallax to Left</option>
                              <option value="parallaxtotop">Parallax to Top</option>
                              <option value="parallaxtobottom">Parallax to Bottom</option>
                              <option value="parallaxhorizontal">Parallax Horizontal</option>
                              <option value="parallaxvertical">Parallax Vertical</option>
                              <option value="notselectable5" disabled="disabled">ZOOM TRANSITIONS</option>
                              <option value="scaledownfromright">Zoom Out and Fade From Right</option>
                              <option value="scaledownfromleft">Zoom Out and Fade From Left</option>
                              <option value="scaledownfromtop">Zoom Out and Fade From Top</option>
                              <option value="scaledownfrombottom">Zoom Out and Fade From Bottom</option>
                              <option value="zoomout">ZoomOut</option>
                              <option value="zoomin">ZoomIn</option>
                              <option value="slotzoom-horizontal">Zoom Slots Horizontal</option>
                              <option value="slotzoom-vertical">Zoom Slots Vertical</option>
                              <option value="notselectable6" disabled="disabled">CURTAIN TRANSITIONS</option>
                              <option value="curtain-1">Curtain from Left</option>
                              <option value="curtain-2">Curtain from Right</option>
                              <option value="curtain-3">Curtain from Middle</option>
                              <option value="notselectable8" disabled="disabled">FILTER TRANSITIONS</option>
                              <option value="grayscale">Grayscale Transition</option>
                              <option value="grayscalecross">Grayscale Cross Transition</option>
                              <option value="brightness">Brightness Transition</option>
                              <option value="brightnesscross">Brightness Cross Transition</option>
                              <option value="blurlight">Blur Light Transition</option>
                              <option value="blurlightcross">Blur Light Cross Transition</option>
                              <option value="blurstrong">Blur Strong Transition</option>
                              <option value="blurstrongcross">Blur Strong Cross Transition</option>
                              <option value="notselectable7" disabled="disabled">PREMIUM TRANSITIONS</option>
                              <option value="3dcurtain-horizontal">3D Curtain Horizontal</option>
                              <option value="3dcurtain-vertical">3D Curtain Vertical</option>
                              <option value="cube">Cube Vertical</option>
                              <option value="cube-horizontal">Cube Horizontal</option>
                              <option value="incube">In Cube Vertical</option>
                              <option value="incube-horizontal">In Cube Horizontal</option>
                              <option value="turnoff">TurnOff Horizontal</option>
                              <option value="turnoff-vertical">TurnOff Vertical</option>
                              <option value="papercut">Paper Cut</option>
                              <option value="flyin">Fly In</option>
                              <option value="notselectable1a" disabled="disabled">RANDOM</option>
                              <option value="random-selected">Random of Selected</option>
                              <option value="random-static">Random Flat</option>
                              <option value="random-premium">Random Premium</option>
                              <option value="random">Random Flat and Premium</option>
                            </select></td>
                          <td class="tips">First slide transition type</td>
                        </tr>
                        <tr data-condition="#start_with_slide =='on'">
                          <td align="right">Transition Duration </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="300" id="first_transition_duration" data-validation="plusint">
                            ms </td>
                          <td class="tips">First slide transition duration.</td>
                        </tr>
                        <tr>
                          <td align="right">Transition Slot Amount </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="7" id="first_transition_slot_amount" data-validation="plusint">
                            ms </td>
                          <td class="tips">The number of slots or boxes the slide is divided into.</td>
                        </tr>-->
                        
                        
                        <tr>
                          <th colspan="3" >Misc.</th>
                        <tr>
                          <td width="15%" align="right">Next Slide on Focus </td>
                          <td ><div class="make-switch switch-off" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="next_slide_on_window_focus" data-ordinary="true">
                            </div></td>
                          <td class="tips">Call next slide when inactive browser tab is focused again. Use this for avoid dissorted layers and broken timeouts after bluring the browser tab.</td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Disable Blur/Focus behavior</td>
                          <td ><div class="make-switch switch-off" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="disable_focus_listener" data-ordinary="true">
                            </div></td>
                          <td class="tips">This will disable the blur/focus behavior of the browser.</td>
                        </tr>
                          </tr>
                          <tr>
                            <th colspan="3" >LazyLoad Type</th>
                          </tr>
                            <tr>
                            <td align="right">LazyLoad Type</td>
                            <td ><select id="lazyLoad_type" class="form-control dnn-option">
                                  <option value="all">All</option>
                                  <option value="smart">Smart</option>
                                  <option value="single">Single</option>
                                  <option value="none" selected="selected">No Lazy Loading</option>
                              </select></td>
                            <td class="tips">“All” = All images will be Lazy Loaded by default.<br>
											“Smart” = Lazy Load images from the current slide, the previous slide, and the next slide.<br>
											“Single” = Only Lazy Load images from the current slide.<br>
											“No Lazy Loading” = No Lazy Loading by default</td>
                          </tr>
                          <tr>
                          <th colspan="3" >Default Settings for Advanced Responsive Grid Sizes:</th>
                          </tr>
                            <tr>
                            <td align="right">Desktop Grid Width >=</td>
                            <td>
                                <input type="text"  id="DesktopGridWidth" data-ordinary="true" disabled="disabled" class="disabled disable" style="border:none" >
                            </td>
                            <td class="tips"></td>
                          </tr> 
                            <tr>
                            <td align="right">Notebook Grid Width &nbsp;< </td>
                            <td>
                                <input type="text" class="dnn-option" id="NotebookGridWidth" data-ordinary="true">
                                	<script type="text/javascript">
                                    $("#NotebookGridWidth").on("change",function(){
                                      $("#DesktopGridWidth").val($(this).val())
                                    })
                                    $(window).load(function(){
                                      $("#DesktopGridWidth").val($("#NotebookGridWidth").val())
                                    })
                                  </script>
                            </td>
                            <td class="tips"></td>
                          </tr>
                            <tr>
                            <td align="right">Tablet Grid Width &nbsp;< </td>
                            <td>
                                <input type="text" class="dnn-option" id="TabletGridWidth" data-ordinary="true">
                            </td>
                            <td class="tips"></td>
                          </tr>
                            <tr>
                            <td align="right">Mobile Grid Width &nbsp;< </td>
                            <td>
                                <input type="text" class="dnn-option" id="MobileGridWidth" data-ordinary="true">
                            </td>
                            <td class="tips"></td>
                          </tr>
                       
                          
                        
                      </tbody>
                    </table>
                  </div>
                  <div class="tab-pane" id="panel_tab2_example5">
                    <table class="table table-title">
                      <thead>
                        <tr>
                          <th colspan="3" >Slide Layout</th>
                        </tr>
                      </thead>
                      <tbody>
                        <!--                        <tr>
                          <td width="15%" align="right">Select a Slider Type</td>
                          <td width="15%" class=""><select class="form-control dnn-option" id="SelectSliderType">
                              <option value="standard">Standard Slider</option>
                              <option value="hero">Hero Scene</option>
                              <option value="carousel">Carousel Slider</option>
                            </select></td>
                          <td class="tips"></td>
                        </tr>                    
-->
                        <tr>
                          <td width="15%" align="right">Slide Layout</td>
                          <td width="200px" class=""><select class="form-control dnn-option" id="slidelayout">
                              <option value="auto" selected>Auto</option>
                              <option value="fullwidth">Full Width</option>
                              <option value="fullscreen">Full Screen</option>
                            </select></td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Layer Grid Size</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="1240" id="sizewidth" data-validation="plusint">
                            <span> * </span>
                            <input type="text" class="form-control dnn-option form-validation" value="868" id="sizeheight" data-validation="plusint">
                            px</td>
                          <td class="tips">Slider is always Linear Responsive till next Defined Grid size has been hit.</td>
                        </tr>
                        <tr>
                          <td align="right">Notebook Custom Grid Size</td>
                          <td ><div class="make-switch switch-off" data-on="primary" data-off="info"  >
                              <input type="checkbox"  class="dnn-option" id="custom_size_notebook" data-ordinary="true">
                            </div></td>
                          <td class="tips">If not defined, the next bigger Layer Grid Size is the basic of Linear Responsive calculations.</td>
                        </tr>
                        <tr class="conditional" data-condition="#custom_size_notebook =='on'">
                          <td align="right">Grid Size</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="1024" id="notebookwidth" data-validation="plusint">
                            <span> * </span>
                            <input type="text" class="form-control dnn-option form-validation" value="768" id="notebookheight" data-validation="plusint">
                            px</td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Tablet Custom Grid Size</td>
                          <td><div class="make-switch switch-off" data-on="primary" data-off="info"  >
                              <input type="checkbox"  class="dnn-option" id="custom_size_tablet" data-ordinary="true">
                            </div></td>
                          <td class="tips">If not defined, the next bigger Layer Grid Size is the basic of Linear Responsive calculations.</td>
                        </tr>
                        <tr class="conditional" data-condition="#custom_size_tablet =='on'">
                          <td align="right">Grid Size</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="778" id="tabletwidth" data-validation="plusint">
                            <span> * </span>
                            <input type="text" class="form-control dnn-option form-validation" value="960" id="tabletheight" data-validation="plusint">
                            px</td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Mobile Custom Grid Size</td>
                          <td ><div class="make-switch switch-off" data-on="primary" data-off="info">
                              <input type="checkbox" class="dnn-option" id="custom_size_mobile" data-ordinary="true">
                            </div></td>
                          <td class="tips">If not defined, the next bigger Layer Grid Size is the basic of Linear Responsive calculations.</td>
                        </tr>
                        <tr class="conditional" data-condition="#custom_size_mobile =='on'">
                          <td align="right">Grid Size</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="480" id="mobilewidth" data-validation="plusint">
                            <span> * </span>
                            <input type="text" class="form-control dnn-option form-validation" value="720" id="mobileheight" data-validation="plusint">
                            px</td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Overflow Hidden </td>
                          <td ><div class="make-switch switch-off" data-on="primary" data-off="info">
                              <input type="checkbox" class="dnn-option" id="OverflowHidden" data-ordinary="true">
                            </div></td>
                          <td class="tips">Adds overflow:hidden to the slider wrapping container which will hide / cut any overlapping elements. Mostly used in Carousel Sliders.</td>
                        </tr>
                        <tr>
                          <td align="right">Respect Aspect Ratio </td>
                          <td ><div class="make-switch switch-off" data-on="primary" data-off="info">
                              <input type="checkbox" class="dnn-option" id="RespectAspectRatio" data-ordinary="true">
                            </div></td>
                          <td class="tips">It will keep aspect ratio and ignore max height of Layer Grid by upscaling. Layer Area will be vertical centered.</td>
                        </tr>
                        <tr>
                          <td align="right">Min Height</td>
                          <td><input type="text" class="form-control dnn-option form-validation" value="" id="minHeight" data-validation="plusint"></td>
                          <td class="tips">The minimum height of the Slider in FullWidth or Auto mode. </td>
                        </tr>
                        <tr class="conditional" data-condition="#slidelayout =='auto'">
                          <td align="right">Max Width</td>
                          <td><input type="text" class="form-control dnn-option form-validation" value="" id="maxWidth" data-validation="plusint"></td>
                          <td class="tips">The maximum width of the Slider in Auto mode. </td>
                        </tr>
                        <tr class="conditional" data-condition="#slidelayout =='fullscreen'">
                          <td align="right">Disable Force FullWidth</td>
                          <td><div class="make-switch switch-off" data-on="primary" data-off="info">
                              <input type="checkbox" class="dnn-option" id="forcefullWidth" data-ordinary="true">
                            </div>
                            </td>
                            <td class="tips">Disable the FullWidth Force function, and allow to float the Fullheight slider horizontal.</td>
                        </tr>
                        <tr class="conditional" data-condition="#slidelayout =='fullscreen'">
                          <td align="right">Increase/Decrease Fullscreen Height (Optional)</td>
                          <td><input type="text" class="form-control dnn-option" value="" id="fullscreen_offset_container"></td>
                          <td class="tips">Example: #header or .header, .footer, #somecontainer | Height of Slider will be decreased with the height of these Containers to fit perfect in the screen.</td>
                        </tr>
                        <tr class="conditional" data-condition="#slidelayout =='fullscreen'">
                          <td align="right">Fullscreen Offset Size</td>
                          <td><input type="text" class="form-control dnn-option" value="" id="fullscreen_offset_size"  placeholder="PX or %"></td>
                          <td class="tips">Decrease/Increase height of Slider. Can be used with px and %. Positive/Negative values allowed. Example: 40px or 10%</td>
                        </tr>
                                             
                                              
                      </tbody>
                    </table>
                  </div>
                  <div class="tab-pane" id="panel_tab2_example9">
                    <table class="table table-title">
                      <thead>
                        <tr>
                          <th colspan="3" >Layout & Visual</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th colspan="3" >Appearance</th>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Shadow Type </td>
                          <td width="200px"><select class="form-control dnn-option" id="shadow_type">
                              <option value="0" selected="selected">No Shadow</option>
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                            </select></td>
                          <td class="tips">The Shadow display underneath the banner.</td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Dotted Overlay Size </td>
                          <td width="15%"><select class="form-control dnn-option" id="background_dotted_overlay">
                              <option value="none" selected="selected">none</option>
                              <option value="twoxtwo">2 x 2 Black</option>
                              <option value="twoxtwowhite">2 x 2 White</option>
                              <option value="threexthree">3 x 3 Black</option>
                              <option value="threexthreewhite">3 x 3 White</option>
                            </select></td>
                          <td class="tips">Show a dotted overlay over the slides.</td>
                        </tr>
                        <tr>
                          <td align="right">Background color </td>
                          <td><input type="text" class="form-control dnn-option color-picker tooltips form-validation" data-color-format="rgba" data-validation="string" value="rgba(0,0,0,0)" data-colorpicker-guid="1" style="width:150px;" id="background_color"></td>
                          <td class="tips">General background color for slider. Clear value to get transparent slider container.</td>
                        </tr>
                        <tr>
                          <td align="right">Padding as Border </td>
                          <td><input type="text" class="form-control dnn-option form-validation" value="0" id="padding" data-validation="plusint"></td>
                          <td class="tips">Padding around the slider. Together with background color shows as slider border.</td>
                        </tr>
                        <tr>
                          <td align="right">Show Background Image </td>
                          <td ><div class="make-switch switch-off" data-on="primary" data-off="info">
                              <input type="checkbox" class="dnn-option" id="show_background_image" data-ordinary="true">
                            </div></td>
                          <td class="tips">Use a general background image instead of general background color.</td>
                        </tr>
                        <tr id="slide_tab1_example666666666" class="conditional" data-condition="#show_background_image =='on'">
                          <td align="right">Background Image Url </td>
                          <td ><div class="fileupimg fileupimg2"> 
                            <a href="#AddMedia_Modal" class="slideimgs imgdemo"  data-toggle="modal" data-href="Resource/templates/modal.html"> 
                             <img src="Resource/images/thumbnail.jpg" width="100" height="56" /> 
                             </a>
                              <input type="text" value="" id="background_image" class="imgtext dnn-option tooltips form-validation" data-validation="string" >
                              <div class="upimg"> <a href="#" class="btn btn-bricky btn-xs removeimg">X</a> </div>
                            </div>
                            </td>
                          <td class="tips">The source of the general background image.</td>
                        </tr>
                        <tr class="conditional" data-condition="#show_background_image =='on'">
                          <td align="right">Background Fit </td>
                          <td ><select id="bg_fit" class="form-control dnn-option">
                              <option value="cover" selected="selected">cover</option>
                              <option value="contain">contain</option>
                              <option value="normal">normal</option>
                            </select></td>
                          <td class="tips">General background image size. Cover - always fill the container, cuts overlays. Contain- always fits image into slider.</td>
                        </tr>
                        <tr class="conditional" data-condition="#show_background_image =='on'">
                          <td align="right">Background Repeat </td>
                          <td ><select id="bg_repeat" class="form-control dnn-option">
                              <option value="no-repeat" selected="selected">no-repeat</option>
                              <option value="repeat">repeat</option>
                              <option value="repeat-x">repeat-x</option>
                              <option value="repeat-y">repeat-y</option>
                            </select></td>
                          <td class="tips">General background image repeat attitude. Used for tiled images.</td>
                        </tr>
                        <tr class="conditional" data-condition="#show_background_image =='on'">
                          <td align="right">Background Position </td>
                          <td ><select id="bg_position" class="form-control dnn-option">
                              <option value="center top">center top</option>
                              <option value="center right">center right</option>
                              <option value="center bottom">center bottom</option>
                              <option value="center center" selected="selected">center center</option>
                              <option value="left top">left top</option>
                              <option value="left center">left center</option>
                              <option value="left bottom">left bottom</option>
                              <option value="right top">right top</option>
                              <option value="right center">right center</option>
                              <option value="right bottom">right bottom</option>
                            </select></td>
                          <td class="tips">General background image position.  i.e. center center to always center vertical and horizontal the image in the slider background.</td>
                        </tr>
                        <tr>
                          <th colspan="3" >Spinner</th>
                        </tr>
                        <tr>
                          <td align="right">Choose Spinner</td>
                          <td ><select id="use_spinner" class="form-control dnn-option">
                              <option value="-1" selected="selected">Off</option>
                              <option value="0">0</option>
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                            </select></td>
                          <td class="tips">Select a Spinner for your Slider</td>
                        </tr>
                        <tr class="conditional" data-condition="#use_spinner !='-1' && #use_spinner !='0' && #use_spinner !='5'">
                          <td align="right">Spinner Color</td>
                          <td><input type="text" class="form-control dnn-option color-picker tooltips form-validation" data-validation="string" value="#ffffff" data-colorpicker-guid="1" style="width:150px;" id="spinner_color"  data-color-format="rgba"></td>
                          <td class="tips">The Color the Spinner will be shown in</td>
                        </tr>
                        <tr>
                          <th colspan="3" >Mobile</th>
                        </tr>
                        <tr>
                          <td align="right">Disable Slider on Mobile</td>
                          <td ><div class="make-switch switch-off" data-on="primary" data-off="info">
                              <input type="checkbox" class="dnn-option" id="disable_on_mobile" data-ordinary="true">
                            </div></td>
                          <td class="tips">If this is enabled, the slider will not be loaded on mobile devices.</td>
                        </tr>
                        <tr>
                          <td align="right">Disable KenBurn On Mobile</td>
                          <td ><div class="make-switch switch-off" data-on="primary" data-off="info">
                              <input type="checkbox" class="dnn-option" id="disable_kenburns_on_mobile" data-ordinary="true">
                            </div></td>
                          <td class="tips">This will disable KenBurns on mobile devices to save performance</td>
                        </tr>
                        <tr>
                          <td align="right">Slider</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="hide_slider_under" data-validation="plusint">
                            px</td>
                          <td class="tips">Hide the slider under the defined slider width. Value 0 will disable the function.</td>
                        </tr>
                        <tr>
                          <td align="right">Predefined Layers</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="hide_defined_layers_under" data-validation="plusint">
                            px</td>
                          <td class="tips">Hide the selected layers (set layers hide under in slide editor) under the defined slider width. Value 0 will disable the function.</td>
                        </tr>
                        <!--<tr>
                          <td align="right">All Layers</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="hide_all_layers_under" data-validation="plusint">
                            px</td>
                          <td class="tips">Hide all layers under the defined slider width. Value 0 will disable the function.</td>
                        </tr>-->
                        <tr>
                          <th colspan="3" >Position</th>
                        </tr>
                        <tr>
                          <td align="right">Position on the page </td>
                          <td ><select id="position" class="form-control dnn-option">
                              <option value="left">Left</option>
                              <option value="center" selected="selected">Center</option>
                              <option value="right">Right</option>
                            </select></td>
                          <td class="tips">The position of the slider within the parrent container. (float:left or float:right or with margin:0px auto;). We recomment do use always CENTER, since the slider will auto fill and grow with the wrapping container. Set any border,padding, floating etc. to the wrapping container where the slider embeded instead of using left/right here !</td>
                        </tr>
                        <tr>
                          <td align="right">Margin Top </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="margin_top" data-validation="plusint">
                            px</td>
                          <td class="tips">The top margin of the slider wrapper div</td>
                        </tr>
                        <tr>
                          <td align="right">Margin Bottom </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="margin_bottom" data-validation="plusint">
                            px</td>
                          <td class="tips">The bottom margin of the slider wrapper div</td>
                        </tr>
                        <tr class="conditional" data-condition="#position !='center'">
                          <td align="right">Margin Left </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="margin_left" data-validation="plusint">
                            px</td>
                          <td class="tips">The left margin of the slider wrapper div</td>
                        </tr>
                        <tr class="conditional" data-condition="#position !='center'">
                          <td align="right">Margin Right </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="margin_right" data-validation="plusint">
                            px</td>
                          <td class="tips">The right margin of the slider wrapper div</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div class="tab-pane" id="panel_tab2_example2">
                    <div class="tabbable-title" style="margin-top: -2px;">
                      <ul class="nav nav-tabs">
                        <li class="active"> <a data-toggle="tab" href="#panel_tab_Navigation">Navigation </a></li>
                        <li> <a data-toggle="tab" href="#panel_tab_Bullets">Bullets</a></li>
                        <li> <a data-toggle="tab" href="#panel_tab_Tabs">Tabs</a></li>
                        <li> <a data-toggle="tab" href="#panel_tab_Thumbs">Thumbs</a></li>
                        <li> <a data-toggle="tab" href="#panel_tab_Touch">Touch</a></li>
                      </ul>

                  
                   
                   
                    </div> 
                    <div class="tab-content">
                      <div class="tab-pane active" id="panel_tab_Navigation">
                        <table class="table table-title">
                          <tr>
                            <th colspan="3" >Arrows</th>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Enable Arrows</td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" checked="checked" class="dnn-option" id="enable_arrows">
                              </div></td>
                            <td class="tips">Enable / Disable Arrows</td>
                          </tr>
                          <tr>
                            <td width="15%" align="right">RTL Direction </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="rtl_arrows">
                              </div></td>
                            <td class="tips">Change Direction of Arrow Functions for RTL Support</td>
                          </tr>
                          <tr>
                            <td align="right">Arrows Style</td>
                            <td ><select id="navigation_arrow_style" class="form-control dnn-option">
                                <option value="">No Style</option>
                                <option value="news-header">News Header</option>
                                <option value="round" selected="selected">Hesperiden</option>
                                <option value="navbar">Gyges</option>
                                <option value="preview1">Hades</option>
                                <option value="preview2">Ares</option>
                                <option value="preview3">Hebe</option>
                                <option value="preview4">Hermes</option>
                                <option value="round-old">Hephaistos</option>
                                <option value="navbar-old">Erinyen</option>
                                <option value="zeus">Zeus</option>
                                <option value="metis">Metis</option>
                                <option value="custom">Custom</option>
                              </select></td>
                            <td class="tips">Look of the navigation Arrows</td>
                          </tr>
                          <tr class="conditional" data-condition="#navigation_arrow_style == 'custom'">
                            <td align="right">Custom Arrows Style</td>
                            <td><input type="text" class="form-control dnn-option form-validation" value="" id="navigation_arrow_custom"></td>
                            <td class="tips"></td>
                          </tr>


                          
                          <tr>
                            <td colspan="3" ><b style="padding-left: 8px">Visibility</b></td>
                          </tr>
                          <tr>
                            <td align="right">Always Show</td>
                            <td ><select id="arrows_always_on" class="form-control dnn-option">
                                <option value="false">Yes</option>
                                <option value="true" selected="selected">No</option>
                              </select></td>
                            <td class="tips">Enable to make arrows always visible. Disable to hide arrows after the defined time.</td>
                          </tr>
                          <tr class="conditional" data-condition="#arrows_always_on =='true'">
                            <td align="right">Hide After</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="200" id="hide_arrows" data-validation="plusint">
                              ms</td>
                            <td class="tips">Time after the Arrows will be hidden(Default: 200 ms)</td>
                          </tr>
                          <tr class="conditional" data-condition="#arrows_always_on =='true'">
                            <td align="right">Hide After on Mobile</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="1200" id="hide_arrows_mobile" data-validation="plusint">
                              ms</td>
                            <td class="tips">Time after the Arrows will be hidden on Mobile(Default: 1200 ms)</td>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Hide Under</td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" checked="checked" class="dnn-option" id="hide_arrows_on_mobile">
                              </div></td>
                            <td class="tips">Force Hide Navigation Arrows under width</td>
                          </tr>
                          <tr class="conditional" data-condition="#hide_arrows_on_mobile =='on'">
                            <td align="right">Width</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="600" id="arrows_under_hidden" data-validation="plusint">
                              px</td>
                            <td class="tips">If browser size goes below this value, then Navigation Arrows are hidden.</td>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Hide Over</td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="hide_arrows_over">
                              </div></td>
                            <td class="tips">Force Hide Navigation over width</td>
                          </tr>
                          <tr class="conditional" data-condition="#hide_arrows_over =='on'">
                            <td align="right">Width</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="arrows_over_hidden" data-validation="plusint">
                              px</td>
                            <td class="tips">If browser size goes over this value, then Navigation Arrows are hidden.</td>
                          </tr>
                          <tr>
                            <td colspan="3" ><b style="padding-left: 8px">Left Arrow Position</b></td>
                          </tr>
                          <tr>
                            <td align="right">Horizontal Align</td>
                            <td ><select id="leftarrow_align_hor" class="form-control dnn-option">
                                <option value="left" selected="selected">Left</option>
                                <option value="center">Center</option>
                                <option value="right">Right</option>
                              </select></td>
                            <td class="tips">Horizontal position of the left arrow.</td>
                          </tr>
                          <tr>
                            <td align="right">Vertical Align </td>
                            <td ><select id="leftarrow_align_vert" class="form-control dnn-option">
                                <option value="top">Top</option>
                                <option value="center" selected="selected">Center</option>
                                <option value="bottom">Bottom</option>
                              </select></td>
                            <td class="tips">Vertical position of the left arrow.</td>
                          </tr>
                          <tr>
                            <td align="right">Horizontal Offset </td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="30" id="leftarrow_offset_hor" data-validation="plusint">
                              px</td>
                            <td class="tips">Offset from current horizontal position of of left arrow.</td>
                          </tr>
                          <tr>
                            <td align="right">Vertical Offset </td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="leftarrow_offset_vert" data-validation="plusint">
                              px</td>
                            <td class="tips">Offset from current vertical position of of left arrow.</td>
                          </tr>
                          <tr>
                            <td align="right">Aligned by</td>
                            <td ><select id="leftarrow_position" class="form-control dnn-option">
                                <option value="slider" selected="selected">Slider</option>
                                <option value="grid">Layer Grid</option>
                              </select></td>
                            <td class="tips">Position the Left Arrow to Slider or Layer Grid</td>
                          </tr>
                          <tr>
                            <td colspan="3" ><b style="padding-left: 8px">Right Arrow Position</b></td>
                          </tr>
                          <tr>
                            <td align="right">Horizontal Align</td>
                            <td ><select id="rightarrow_align_hor" class="form-control dnn-option">
                                <option value="left">Left</option>
                                <option value="center">Center</option>
                                <option value="right" selected="selected">Right</option>
                              </select></td>
                            <td class="tips">Horizontal position of the left arrow.</td>
                          </tr>
                          <tr>
                            <td align="right">Vertical Align </td>
                            <td ><select id="rightarrow_align_vert" class="form-control dnn-option">
                                <option value="top">Top</option>
                                <option value="center" selected="selected">Center</option>
                                <option value="bottom">Bottom</option>
                              </select></td>
                            <td class="tips">Vertical position of the left arrow.</td>
                          </tr>
                          <tr>
                            <td align="right">Horizontal Offset </td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="30" id="rightarrow_offset_hor" data-validation="plusint">
                              px</td>
                            <td class="tips">Offset from current horizontal position of of left arrow.</td>
                          </tr>
                          <tr>
                            <td align="right">Vertical Offset </td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="rightarrow_offset_vert" data-validation="plusint">
                              px</td>
                            <td class="tips">Offset from current vertical position of of left arrow.</td>
                          </tr>
                          <tr>
                            <td align="right">Aligned by</td>
                            <td ><select id="rightarrow_position" class="form-control dnn-option">
                                <option value="slider" selected="selected">Slider</option>
                                <option value="grid">Layer Grid</option>
                              </select></td>
                            <td class="tips">Position the Left Arrow to Slider or Layer Grid</td>
                          </tr>
                        </table>
                      </div>
                      <div class="tab-pane" id="panel_tab_Bullets">
                        <table class="table table-title">
                          <tr>
                            <th colspan="3" >Bullets</th>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Enable Bullets</td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" checked="checked" class="dnn-option" id="enable_bullets">
                              </div></td>
                            <td class="tips">Enable / Disable Bullets</td>
                          </tr>
                          <tr>
                            <td width="15%" align="right">RTL Direction </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="rtl_bullets">
                              </div></td>
                            <td class="tips">Change Direction of Bullet Functions for RTL Support</td>
                          </tr>
                          <tr>
                            <td align="right">Bullet Style</td>
                            <td ><select id="navigation_bullets_style" class="form-control dnn-option">
                                <option value="">No Style</option>
                                <option value="news-header">News Header</option>
                                <option value="round">Hesperiden</option>
                                <option value="navbar">Gyges</option>
                                <option value="preview1">Hades</option>
                                <option value="preview2">Ares</option>
                                <option value="preview3">Hebe</option>
                                <option value="preview4">Hermes</option>
                                <option value="round-old" selected="selected">Hephaistos</option>
                                <option value="square-old">Persephone</option>
                                <option value="navbar-old">Erinyen</option>
                                <option value="zeus">Zeus</option>
                                <option value="metis">Metis</option>
                                <option value="dione">Dione</option>
                                <option value="uranus">Uranus</option>
                                <option value="custom">Custom</option>
                              </select></td>
                            <td class="tips">Look of the Bullets</td>
                          </tr>

                          <tr class="conditional" data-condition="#navigation_bullets_style == 'custom'">
                            <td align="right">Custom Bullets Style</td>
                            <td><input type="text" class="form-control dnn-option form-validation" value="" id="navigation_bullets_custom"></td>
                            <td class="tips"></td>
                          </tr>




                          <tr>
                            <td align="right">Space</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="5" id="bullets_space" data-validation="plusint">
                              px</td>
                            <td class="tips">Space between the bullets.</td>
                          </tr>
                          <tr>
                            <td align="right">Direction</td>
                            <td ><select id="bullets_direction" class="form-control dnn-option">
                                <option value="horizontal" selected="selected">Horizontal</option>
                                <option value="vertical">Vertical</option>
                              </select></td>
                            <td class="tips">Direction of the Bullets. Vertical or Horizontal.</td>
                          </tr>
                          <tr>
                            <td colspan="3" ><b style="padding-left: 8px">Visibility</b></td>
                          </tr>
                          <tr>
                            <td align="right">Always Show</td>
                            <td ><select id="bullets_always_on" class="form-control dnn-option">
                                <option value="false">Yes</option>
                                <option value="true" selected="selected">No</option>
                              </select></td>
                            <td class="tips">Enable to make bullets always visible. Disable to hide bullets after the defined time.</td>
                          </tr>
                          <tr>
                            <td align="right">Hide After</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="200" id="hide_bullets" data-validation="plusint">
                              ms</td>
                            <td class="tips">Time after that the bullets will be hidden(Default: 200 ms)</td>
                          </tr>
                          <tr>
                            <td align="right">Hide After on Mobile</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="1200" id="hide_bullets_mobile" data-validation="plusint">
                              ms</td>
                            <td class="tips">Time after the bullets will be hidden on Mobile (Default: 1200 ms)</td>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Hide under Width </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" checked="checked" class="dnn-option" id="hide_bullets_on_mobile">
                              </div></td>
                            <td class="tips">Force Hide Navigation Bullets under width</td>
                          </tr>
                          <tr>
                            <td align="right">Width </td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="600" id="bullets_under_hidden" data-validation="plusint">
                              px</td>
                            <td class="tips">If browser size goes below this value, then Navigation bullets are hidden.</td>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Hide over Width </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="hide_bullets_over">
                              </div></td>
                            <td class="tips">Force Hide Navigation Bullets over width</td>
                          </tr>
                          <tr class="conditional" data-condition="#hide_bullets_over =='on'">
                            <td align="right">Hide over Width </td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="bullets_over_hidden" data-validation="plusint">
                              px</td>
                            <td class="tips">Force Hide Navigation Bullets over width</td>
                          </tr>
                          <tr>
                            <td colspan="3" ><b style="padding-left: 8px">Position</b></td>
                          </tr>
                          <tr>
                            <td align="right">Horizontal Align</td>
                            <td ><select id="bullets_align_hor" class="form-control dnn-option">
                                <option value="left">Left</option>
                                <option value="center" selected="selected">Center</option>
                                <option value="right">Right</option>
                              </select></td>
                            <td class="tips">Horizontal position of bullets </td>
                          </tr>
                          <tr>
                            <td align="right">Vertical Align</td>
                            <td ><select id="bullets_align_vert" class="form-control dnn-option">
                                <option value="top">Top</option>
                                <option value="center">Center</option>
                                <option value="bottom" selected="selected">Bottom</option>
                              </select></td>
                            <td class="tips">Vertical positions of bullets </td>
                          </tr>
                          <tr>
                            <td align="right">Horizontal Offset</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="bullets_offset_hor" data-validation="plusint">
                              px</td>
                            <td class="tips">Offset from current horizontal position.</td>
                          </tr>
                          <tr>
                            <td align="right">Vertical Offset</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="30" id="bullets_offset_vert" data-validation="plusint">
                              px</td>
                            <td class="tips">Offset from current Vertical position.</td>
                          </tr>
                          <tr>
                            <td align="right">Aligned by</td>
                            <td ><select id="bullets_position" class="form-control dnn-option">
                                <option value="slider" selected="selected">Slider</option>
                                <option value="grid">Layer Grid</option>
                              </select></td>
                            <td class="tips">Position the Bullets to Slider or Layer Grid</td>
                          </tr>

                        </table>
                      </div>
                      <div class="tab-pane" id="panel_tab_Tabs">
                        <table class="table table-title">
                          <tr>
                            <th colspan="3" >Tabs</th>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Enable Tabs </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="enable_tabs">
                              </div></td>
                            <td class="tips">Enable / Disable navigation tabs.</td>
                          </tr>
                          <tr>
                            <td width="15%" align="right">RTL Direction </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="rtl_tabs">
                              </div></td>
                            <td class="tips">Change Direction of tab Functions for RTL Support</td>
                          </tr>
                          <tr>
                            <td colspan="3" ><b style="padding-left: 8px">Wrapper Container</b></td>
                          </tr>
                          <tr>
                            <td align="right">Wrapper Padding </td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="5" id="tabs_padding" data-validation="plusint">
                              px</td>
                            <td class="tips">The wrapper div padding of tabs.</td>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Span Wrapper </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="span_tabs_wrapper">
                              </div></td>
                            <td class="tips">Span wrapper to full width or full height based on the direction selected.</td>
                          </tr>
                          <tr>
                            <td align="right">Wrapper Color </td>
                            <td><input type="text" class="form-control dnn-option color-picker tooltips form-validation" data-validation="string" value="rgba(0,0,0,0)" data-color-format="rgba" data-colorpicker-guid="1" style="width:150px;" id="tabs_wrapper_color"></td>
                            <td class="tips">Tabs wrapper background color. For transparent leave empty.</td>
                          </tr>
                          <tr>
                            <td colspan="3" ><b style="padding-left: 8px">Tabs</b></td>
                          </tr>
                          <tr>
                            <td align="right">Tabs Style</td>
                            <td ><select id="tabs_style" class="form-control dnn-option">
                                <option value="round">Hesperiden</option>
                                <option value="preview4">Hermes</option>
                              </select></td>
                            <td class="tips">Style of the tabs.</td>
                          </tr>
                          <!--                        <tr>
                          <td align="right">Preset</td>
                          <td ><select id="navigation_tabs_preset" class="form-control dnn-option">
                              <option class="never" value="default" selected="selected">Default</option>
                              <option class="never" value="custom">Custom</option>
                            </select></td>
                          <td class="tips">Preset</td>
                        </tr>-->
                          <tr>
                            <td align="right">Visible Tabs Amount</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="5" id="tabs_amount" data-validation="plusint"></td>
                            <td class="tips">The amount of max visible tabs in same time.</td>
                          </tr>
                          <tr>
                            <td align="right">Space</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="5" id="tabs_space" data-validation="plusint">
                              px</td>
                            <td class="tips">Space between the tabs.</td>
                          </tr>
                          <tr>
                            <td align="right">Direction</td>
                            <td ><select id="tabs_direction" class="form-control dnn-option">
                                <option value="horizontal" selected="selected">Horizontal</option>
                                <option value="vertical">Vertical</option>
                              </select></td>
                            <td class="tips">Direction of the Tabs. Vertical or Horizontal.</td>
                          </tr>
                          <tr>
                            <td colspan="3" ><b style="padding-left: 8px">Tab Sizes</b></td>
                          </tr>
                          <tr>
                            <td align="right">Tabs Width</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="100" id="tabs_width" data-validation="plusint">
                              px</td>
                            <td class="tips">The basic width of one tab.</td>
                          </tr>
                          <tr>
                            <td align="right">Tabs Height</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="50" id="tabs_height" data-validation="plusint">
                              px</td>
                            <td class="tips">the basic height of one tab.</td>
                          </tr>
                          <tr>
                            <td align="right">Min. Tab Width</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="100" id="tabs_width_min" data-validation="plusint">
                              px</td>
                            <td class="tips">The minimum width of the auto resized Tabs. Between Max and Min width the sizes are auto calculated).</td>
                          </tr>
                          <tr>
                            <td colspan="3" ><b style="padding-left: 8px">Visibility</b></td>
                          </tr>
                          <tr>
                            <td align="right">Always Show </td>
                            <td ><select id="tabs_always_on" class="form-control dnn-option">
                                <option value="false" selected="selected">Yes</option>
                                <option value="true">No</option>
                              </select></td>
                            <td class="tips">Enable to make tabs always visible. Disable to hide tabs after the defined time.</td>
                          </tr>
                          <tr class="conditional" data-condition="#tabs_always_on =='true'">
                            <td align="right">Hide After</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="200" id="hide_tabs" data-validation="plusint">
                              ms</td>
                            <td class="tips">Time after that the tabs will be hidden(Default: 200 ms)</td>
                          </tr>
                          <tr class="conditional" data-condition="#tabs_always_on =='true'">
                            <td align="right">Hide  After on Mobile</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="1200" id="hide_tabs_mobile" data-validation="plusint">
                              ms</td>
                            <td class="tips">Time after that the tabs will be hidden on Mobile (Default: 1200 ms)</td>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Hide under Width </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="hide_tabs_on_mobile">
                              </div></td>
                            <td class="tips">Force Hide Navigation tabs under width</td>
                          </tr>
                          <tr>
                            <td align="right">Width</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="tabs_under_hidden" data-validation="plusint">
                              px</td>
                            <td class="tips">If browser size goes below this value, then Navigation tabs are hidden.</td>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Hide over Width </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="hide_tabs_over">
                              </div></td>
                            <td class="tips">Force Hide Navigation tabs under width</td>
                          </tr>
                          <tr>
                            <td align="right">Width</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="tabs_over_hidden" data-validation="plusint">
                              px</td>
                            <td class="tips">If browser size goes below this value, then Navigation tabs are hidden.</td>
                          </tr>
                          <tr>
                            <td colspan="3" ><b style="padding-left: 8px">Position</b></td>
                          </tr>
                          <tr>
                            <td align="right">Inner / outer</td>
                            <td ><select id="tabs_inner_outer" class="form-control dnn-option">
                                <option value="inner" selected="selected">Inner Slider</option>
                                <option value="outer-left">Outer Left</option>
                                <option value="outer-right">Outer Right</option>
                                <option value="outer-top">Outer Top</option>
                                <option value="outer-bottom">Outer Bottom</option>
                              </select></td>
                            <td class="tips">Put the tabs inside or outside of the slider container. Outside added tabs will decrease the size of the slider.</td>
                          </tr>
                          <tr>
                            <td align="right">Horizontal Align</td>
                            <td ><select id="tabs_align_hor" class="form-control dnn-option">
                                <option value="left">Left</option>
                                <option value="center" selected="selected">Center</option>
                                <option value="right">Right</option>
                              </select></td>
                            <td class="tips">Horizontal position of tabs.</td>
                          </tr>
                          <tr>
                            <td align="right">Vertical Align</td>
                            <td ><select id="tabs_align_vert" class="form-control dnn-option">
                                <option value="top">Top</option>
                                <option value="center">Center</option>
                                <option value="bottom" selected="selected">Bottom</option>
                              </select></td>
                            <td class="tips">Vertical position of tabs.</td>
                          </tr>
                          <tr>
                            <td align="right">Horizontal Offset</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="tabs_offset_hor" data-validation="plusint">
                              px</td>
                            <td class="tips">Offset from current horizontal position of tabs.</td>
                          </tr>
                          <tr>
                            <td align="right">Vertical Offset</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="20" id="tabs_offset_vert" data-validation="plusint">
                              px</td>
                            <td class="tips">Offset from current vertical position of tabs.</td>
                          </tr>
                          <tr>
                            <td align="right">Aligned by</td>
                            <td ><select id="tabs_position" class="form-control dnn-option">
                                <option value="slider" selected="selected">Slider</option>
                                <option value="grid">Layer Grid</option>
                              </select></td>
                            <td class="tips">Position the Tabs to Slider or Layer Grid</td>
                          </tr>

                        </table>
                      </div>
                      <div class="tab-pane" id="panel_tab_Thumbs">
                        <table class="table table-title">
                          <tr>
                            <th colspan="3" >Thumbs</th>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Enable Thumbnails </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="enable_thumbnails">
                              </div></td>
                            <td class="tips">Enable / Disable Thumbnails</td>
                          </tr>
                          <tr>
                            <td width="15%" align="right">RTL Direction </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="rtl_thumbnails">
                              </div></td>
                            <td class="tips">Change Direction of thumbnail Functions for RTL Support</td>
                          </tr>
                          <tr>
                            <td colspan="3" ><b style="padding-left: 8px">Wrapper Container</b></td>
                          </tr>
                          <tr>
                            <td align="right">Wrapper Padding </td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="5" id="thumbnails_padding" data-validation="plusint"></td>
                            <td class="tips">The wrapper div padding of thumbnails</td>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Span Wrapper </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="span_thumbnails_wrapper">
                              </div></td>
                            <td class="tips">Span wrapper to full width or full height based on the direction selected</td>
                          </tr>
                          <tr>
                            <td align="right">Wrapper color </td>
                            <td><input type="text" class="form-control dnn-option color-picker tooltips form-validation" data-validation="string" value="" data-color-format="rgba" data-colorpicker-guid="1" style="width:150px;" id="thumbnails_wrapper_color"></td>
                            <td class="tips">Thumbnails wrapper background color. For transparent leave empty.</td>
                          </tr>
                          <tr>
                            <td colspan="3" ><b style="padding-left: 8px">Thumbnails</b></td>
                          </tr>
                          <tr>
                            <td align="right">Thumbnails Style</td>
                            <td ><select id="thumbnails_style" class="form-control dnn-option">
                                <option value="round" selected="selected">Hesperiden</option>
                                <option value="navbar">Gyges</option>
                                <option value="preview1">Hades</option>
                                <option value="navbar-old">Erinyen</option>
                                <option value="zeus">Zeus</option>
                              </select></td>
                            <td class="tips">Style of the thumbnails.</td>
                          </tr>
                          <!--                        <tr>
                          <td align="right">Preset</td>
                          <td ><select id="navigation_thumbs_preset" class="form-control dnn-option">
                              <option class="never" value="default" selected="selected">Default</option>
                              <option class="never" value="custom">Custom</option>
                            </select></td>
                          <td class="tips">Preset</td>
                        </tr>-->
                          <tr>
                            <td align="right">Visible Thumbs Amount</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="5" id="thumb_amount" data-validation="plusint"></td>
                            <td class="tips">The amount of max visible Thumbnails in the same time. </td>
                          </tr>
                          <tr>
                            <td align="right">Space</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="5" id="thumbnails_space" data-validation="plusint">
                              px</td>
                            <td class="tips">Space between the thumbnails.</td>
                          </tr>
                          <tr>
                            <td align="right">Direction</td>
                            <td ><select id="thumbnail_direction" class="form-control dnn-option">
                                <option value="horizontal" selected="selected">Horizontal</option>
                                <option value="vertical">Vertical</option>
                              </select></td>
                            <td class="tips">Direction of the Thumbnails. Vertical or Horizontal.</td>
                          </tr>
                          <tr>
                            <td colspan="3" ><b style="padding-left: 8px">Thumbnail Container Size</b></td>
                          </tr>
                          <tr>
                            <td align="right">Container Width</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="100" id="thumb_width" data-validation="plusint">
                              px</td>
                            <td class="tips">The basic Width of one Thumbnail Container.</td>
                          </tr>
                          <tr>
                            <td align="right">Container Height</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="50" id="thumb_height" data-validation="plusint">
                              px</td>
                            <td class="tips">The basic Height of one Thumbnail.</td>
                          </tr>
                          <tr>
                            <td align="right">Min Container Width</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="100" id="thumb_width_min" data-validation="plusint">
                              px</td>
                            <td class="tips">The minimum width of the auto resized thumbs. Between Max and Min width the sizes are auto calculated).</td>
                          </tr>
                          <tr>
                            <td colspan="3" ><b style="padding-left: 8px">Visibility</b></td>
                          </tr>
                          <tr>
                            <td align="right">Always Show </td>
                            <td ><select id="thumbs_always_on" class="form-control dnn-option">
                                <option value="false" selected="selected">Yes</option>
                                <option value="true">No</option>
                              </select></td>
                            <td class="tips">Enable to make thumbnails always visible. Disable to hide thumbnails after the defined time.</td>
                          </tr>
                          <tr>
                            <td align="right">Hide After</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="200" id="hide_thumbs" data-validation="plusint">
                              ms</td>
                            <td class="tips">Time after that the thumbnails will be hidden(Default: 200 ms)</td>
                          </tr>
                          <tr>
                            <td align="right">Hide After on Mobile</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="1200" id="hide_thumbs_mobile" data-validation="plusint">
                              ms</td>
                            <td class="tips">Time after that the thumbnails will be hidden on Mobile (Default: 1200 ms)</td>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Hide under Width </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="hide_thumbs_on_mobile">
                              </div></td>
                            <td class="tips">Force Hide Navigation Thumbnails under width</td>
                          </tr>
                          <tr class="conditional" data-condition="#hide_thumbs_on_mobile =='on'">
                            <td align="right">Width </td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="thumbs_under_hidden" data-validation="plusint">
                              px</td>
                            <td class="tips">If browser size goes below this value, then Navigation thumbs are hidden.</td>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Hide over Width </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="hide_thumbs_over">
                              </div></td>
                            <td class="tips">Force Hide Navigation Thumbnails under width</td>
                          </tr>
                          <tr class="conditional" data-condition="#hide_thumbs_over =='on'">
                            <td align="right">Width </td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="thumbs_over_hidden" data-validation="plusint">
                              px</td>
                            <td class="tips">If browser size goes below this value, then Navigation thumbs are hidden.</td>
                          </tr>
                          <tr>
                            <td colspan="3" ><b style="padding-left: 8px">Position</b></td>
                          </tr>
                          <tr>
                            <td align="right">Inner / outer</td>
                            <td ><select id="thumbnails_inner_outer" class="form-control dnn-option">
                                <option value="inner" selected="selected">Inner Slider</option>
                                <option value="outer-left">Outer Left</option>
                                <option value="outer-right">Outer Right</option>
                                <option value="outer-top">Outer Top</option>
                                <option value="outer-bottom">Outer Bottom</option>
                              </select></td>
                            <td class="tips">Put the thumbnails inside or outside of the slider container. Outside added thumbnails will decrease the size of the slider.</td>
                          </tr>
                          <tr>
                            <td align="right">Horizontal Align</td>
                            <td ><select id="thumbnails_align_hor" class="form-control dnn-option">
                                <option value="left">Left</option>
                                <option value="center" selected="selected">Center</option>
                                <option value="right">Right</option>
                              </select></td>
                            <td class="tips">Horizontal position of thumbnails</td>
                          </tr>
                          <tr>
                            <td align="right">Vertical Align</td>
                            <td ><select id="thumbnails_align_vert" class="form-control dnn-option">
                                <option value="top">Top</option>
                                <option value="center">Center</option>
                                <option value="bottom" selected="selected">Bottom</option>
                              </select></td>
                            <td class="tips">Vertical position of thumbnails</td>
                          </tr>
                          <tr>
                            <td align="right">Horizontal Offset</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="thumbnails_offset_hor" data-validation="plusint">
                              px</td>
                            <td class="tips">Offset from current Horizontal position.</td>
                          </tr>
                          <tr>
                            <td align="right">Vertical Offset</td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="20" id="thumbnails_offset_vert" data-validation="plusint">
                              px</td>
                            <td class="tips">Offset from current Vertical position.</td>
                          </tr>
                          <tr>
                            <td align="right">Aligned by</td>
                            <td ><select id="thumbnails_position" class="form-control dnn-option">
                                <option value="slider" selected="selected">Slider</option>
                                <option value="grid">Layer Grid</option>
                              </select></td>
                            <td class="tips">Position the Thumbnails to Slider or Layer Grid</td>
                          </tr>
                        </table>
                      </div>
                      <div class="tab-pane" id="panel_tab_Touch">
                        <table class="table table-title">
                          <tr>
                            <th colspan="3" >Touch</th>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Touch Enabled </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" checked="checked" class="dnn-option" id="touchenabled">
                              </div></td>
                            <td class="tips">Enable Swipe Function on touch devices</td>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Touch Enabled on Desktop </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="touchenabled_desktop">
                              </div></td>
                            <td class="tips">Enable Swipe Function on touch devices</td>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Drag Block Vertical </td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="drag_block_vertical">
                              </div></td>
                            <td class="tips">Scroll below slider on vertical swipe</td>
                          </tr>
                          <tr>
                            <td align="right">Swipe Treshhold (0 - 200) </td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="75" id="swipe_velocity" data-validation="plusint"></td>
                            <td class="tips">Defines the sensibility of gestures. Smaller values mean a higher sensibility</td>
                          </tr>
                          <tr>
                            <td align="right">Swipe Min Finger </td>
                            <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="50" id="swipe_min_touches" data-validation="plusint"></td>
                            <td class="tips">Defines how many fingers are needed minimum for swiping</td>
                          </tr>
                          <tr>
                            <td align="right">Swipe Direction</td>
                            <td ><select id="swipe_direction" class="form-control dnn-option">
                                <option value="horizontal" selected="selected">Horizontal</option>
                                <option value="vertical">Vertical</option>
                              </select></td>
                            <td class="tips">Swipe Direction to swap slides?</td>
                          </tr>
                          <tr>
                            <th colspan="3" >Misc.</th>
                          </tr>
                          <tr>
                            <td width="15%" align="right">Keyboard Navigation</td>
                            <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                                <input type="checkbox" class="dnn-option" id="keyboard_navigation">
                              </div></td>
                            <td class="tips">Allow/disallow to navigate the slider with keyboard.</td>
                          </tr>
                          <tr>
                            <td align="right">Key Direction</td>
                            <td ><select id="keyboard_direction" class="form-control dnn-option">
                                <option value="horizontal" selected="selected">Horizontal</option>
                                <option value="vertical">Vertical</option>
                              </select></td>
                            <td class="tips">Keyboard Direction to swap slides (horizontal - left/right arrow, vertical - up/down arrow)?</td>
                          </tr>
                          <tr>
                            <td align="right">Mouse Scroll Navigation</td>
                            <td ><select id="mousescroll_navigation" class="form-control dnn-option">
                                <option value="on">On</option>
                                <option value="off" selected="selected">Off</option>
                              </select></td>
                            <td class="tips">Allow/disallow to navigate the slider with Mouse Scroll.</td>
                          </tr>
                          <tr>
                            <td align="right">Reverse Mouse Scroll</td>
                            <td ><select id="mousescroll_navigation_reverse" class="form-control dnn-option">
                                <option value="reverse">Reverse</option>
                                <option value="default" selected="selected">Default</option>
                              </select></td>
                            <td class="tips">Reverse the functionality of the Mouse Scroll Navigation</td>
                          </tr>
                          
                          
                        </table>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane" id="panel_tab2_example3">
                    <table class="table table-title">
                      <thead>
                        <tr>
                          <th colspan="3" >Parallax & 3D</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td width="15%" align="right">Enable Parallax / 3D </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" checked="checked" class="dnn-option" id="use_parallax">
                            </div></td>
                          <td class="tips">Enabling this, will give you new options in the slides to create a unique parallax effect</td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Disable on Mobile </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="disable_parallax_mobile">
                            </div></td>
                          <td class="tips">If set to on, parallax will be disabled on mobile devices to save performance</td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">3D </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="ddd_parallax">
                            </div></td>
                          <td class="tips">Enabling this, will build a ddd_Rotating World of your Slides.</td>
                        </tr>
                        <tr class="conditional" data-condition="#ddd_parallax =='on'">
                          <td width="15%" align="right">3D Shadow </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="ddd_parallax_shadow">
                            </div></td>
                          <td class="tips">Enabling 3D Shadow</td>
                        </tr>
                        <tr class="conditional" data-condition="#ddd_parallax =='on'">
                          <td width="15%" align="right">3D Background Disabled </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="ddd_parallax_bgfreeze">
                            </div></td>
                          <td class="tips">BG 3D Disabled</td>
                        </tr>
                        <tr class="conditional" data-condition="#ddd_parallax =='on'">
                          <td width="15%" align="right">Slider Overflow Hidden </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="ddd_parallax_overflow">
                            </div></td>
                          <td class="tips">If option is enabled, all slides and Layers are cropped by the Slider sides.</td>
                        </tr>
                        <tr class="conditional" data-condition="#ddd_parallax =='on'">
                          <td width="15%" align="right">Layers Overflow Hidden </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="ddd_parallax_layer_overflow">
                            </div></td>
                          <td class="tips">If option enabled, Layers are cropped by the Grid Layer Dimensions to avoid Floated 3d Texts and hide Elements outside of the Slider.</td>
                        </tr>
                        <tr class="conditional" data-condition="#ddd_parallax =='on'">
                          <td align="right">3D Crop Fix (z) </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="65" id="ddd_parallax_zcorrection" data-validation="plusint">
                            px</td>
                          <td class="tips">Solves issues in Safari Browser. It will move layers along z-axis if BG Freeze enabled to avoid 3d Rendering issues</td>
                        </tr>
                        <tr class="conditional" data-condition="#ddd_parallax !='on'">
                          <td colspan="3" ><b style="padding-left: 8px">Mouse Sensibility</b></td>
                        </tr>
                        <tr class="conditional" data-condition="#ddd_parallax !='on'">
                          <td align="right">Event</td>
                          <td ><select id="parallax_type" class="form-control dnn-option">
                              <option value="mouse" selected="selected">Mouse Move</option>
                              <option value="scroll">Scroll Position</option>
                              <option value="mouse+scroll">Move and Scroll</option>
                            </select></td>
                          <td class="tips">Defines on what event type the parallax should react to</td>
                        </tr>
                        <tr class="conditional" data-condition="#ddd_parallax !='on'">
                          <td align="right">Parallax Origo</td>
                          <td ><select id="parallax_origo" class="form-control dnn-option">
                              <option value="enterpoint">Mouse Enter Point</option>
                              <option value="slidercenter" selected="selected">Slider Center</option>
                            </select></td>
                          <td class="tips">Mouse Based parallax calculation Origo</td>
                        </tr>
                        <tr>
                          <td align="right">Mouse based Speed </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="2000" id="parallax_speed" data-validation="plusint">
                            ms</td>
                          <td class="tips">Parallax Speed for Mouse movements.</td>
                        </tr>
                        <tr>
                          <td align="right">Background Speed </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="parallax_background_speed" data-validation="plusint">
                            ms</td>
                          <td class="tips">Parallax Speed for Background movements.</td>
                        </tr>

                        <tr>
                          <td align="right">Layers Speed </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="2000" id="parallax_layers_speed" data-validation="plusint">
                            ms</td>
                          <td class="tips">Parallax Speed for Layer movements.</td>
                        </tr>




                        <tr>
                          <th colspan="3" >Parallax Levels</th>
                        </tr>
                        <tr class="conditional" data-condition="#ddd_parallax =='on'">
                          <td align="right">Default 3D Depth</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="55" id="parallax_level_3d" data-validation="plusint"></td>
                          <td class="tips"></td>
                        </tr>

                        <tr>
                          <td align="right">Level Depth 1</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="5" id="parallax_level_1" data-validation=""></td>
                          <td class="tips">Defines the strength of the effect. The higher the value, the stronger the effect. In 3D World the smaller Value comes to the front, and the Higher Value goes to the Background. Set for BG in 3D World the highest value always. Elements with higher z-index should get smaller values to make the effect perfect.</td>
                        </tr>
                        <tr>
                          <td align="right">Level Depth 2</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="10" id="parallax_level_2" data-validation=""></td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Level Depth 3</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="15" id="parallax_level_3" data-validation=""></td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Level Depth 4</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="20" id="parallax_level_4" data-validation=""></td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Level Depth 5</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="25" id="parallax_level_5" data-validation=""></td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Level Depth 6</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="30" id="parallax_level_6" data-validation=""></td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Level Depth 7</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="35" id="parallax_level_7" data-validation=""></td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Level Depth 8</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="40" id="parallax_level_8" data-validation=""></td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Level Depth 9</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="45" id="parallax_level_9" data-validation=""></td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Level Depth 10</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="46" id="parallax_level_10" data-validation=""></td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Level Depth 11</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="47" id="parallax_level_11" data-validation=""></td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Level Depth 12</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="48" id="parallax_level_12" data-validation=""></td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Level Depth 13</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="49" id="parallax_level_13" data-validation=""></td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Level Depth 14</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="50" id="parallax_level_14" data-validation=""></td>
                          <td class="tips"></td>
                        </tr>
                        <tr>
                          <td align="right">Level Depth 15</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="51" id="parallax_level_15" data-validation=""></td>
                          <td class="tips"></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div class="tab-pane" id="panel_tab2_example4">
                    <table class="table table-title">
                      <thead>
                        <tr>
                          <th colspan="3" >Scroll Effects</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td width="15%" align="right">Endable / Disable Fade Effect on Scroll</td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="fade_scrolleffect">
                            </div></td>
                          <td class="tips">Fade Effect </td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Endable / Disable Blur Effect on Scrol</td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="blur_scrolleffect">
                            </div></td>
                          <td class="tips">Blur Effect </td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Enable / Disable grayscale Effect on Scrol</td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="grayscale_scrolleffect">
                            </div></td>
                          <td class="tips">Grayscale Effect </td>
                        <tr>
                          <th colspan="3" >Effect Level:</th>
                        </tr>
                          </tr>
                        
                        <tr>
                          <td align="right">Max. Blur Effect </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="10" id="scrolleffect_maxblur" data-validation="plusint">
                            px</td>
                          <td class="tips">Maximum Blur Level on Elements by Maximal Scroll. Optimal Values between 0-100</td>
                        </tr>
                        <tr>
                          <th colspan="3" >Effects on Elements</th>
                        </tr>
                        <tr>
                          <td width="15%" align="right">On Slider BG's </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" checked="checked" id="scrolleffect_bg">
                            </div></td>
                          <td class="tips">Effects enabled on Slide BG</td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">None Parallax Layers </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="scrolleffect_layers">
                            </div></td>
                          <td class="tips">Effects on Layers without Parallax Effect</td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Parallax Layers </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="scrolleffect_parallax_layers">
                            </div></td>
                          <td class="tips">Effects on Layers with Parallax Effect</td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">None Parallax Static Layers </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="scrolleffect_static_layers">
                            </div></td>
                          <td class="tips">Effects on Static Layers without Parallax Effect</td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Parallax Static Layers </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="scrolleffect_static_parallax_layers">
                            </div></td>
                          <td class="tips">Effects on Static Layers with Parallax Effect</td>
                        </tr>
                        <tr>
                          <th colspan="3" >Scroll Dependencies</th>
                        </tr>
                        <tr>
                          <td align="right">Effect Directions </td>
                          <td ><select id="scrolleffect_direction" class="form-control dnn-option">
                              <option value="top">Top Direction</option>
                              <option value="bottom">Bottom Direction</option>
                              <option value="both" selected="selected">Both Direction</option>
                            </select></td>
                          <td class="tips">Select the Direction where the Elements should be Fade In/Out from/to</td>
                        </tr>
                        <tr>
                          <td align="right">Offset Effect </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="30" id="scrolleffect_tilt" data-validation="plusint">
                            %</td>
                          <td class="tips">Offset the Effect with % of Screen. Best Values between 0% and 100%</td>
                        </tr>
                        <tr>
                          <td align="right">Effect Factor BG </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" data-validation="floating" value="1.3" id="scrolleffect_multiplicator"></td>
                          <td class="tips">Parallax Speed Multiplicator For Background. Best Values between 0.2 and 2</td>
                        </tr>
                        <tr>
                          <td align="right">Effect Factor Layers </td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="1.3" id="scrolleffect_multiplicator_layers"></td>
                          <td class="tips">Parallax Speed Multiplicator For Layers.  Best Values between 0.2 and 2</td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Disable on Mobile </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="scrolleffect_off_mobile">
                            </div></td>
                          <td class="tips">Disable Fade Out Effect On Mobile Devices</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div class="tab-pane" id="panel_tab2_example6">
                    <table class="table table-title">
                      <thead>
                        <tr>
                          <th colspan="3" >Problem Handlings</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th colspan="3" >Fallbacks</th>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Simplify on IOS4/IE8 </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="simplify_ie8_ios4">
                            </div></td>
                          <td class="tips">Simplyfies the Slider on IOS4 and IE8</td>
                        </tr>
                        <tr>
                          <td align="right">Use Alternative Image </td>
                          <td ><select id="show_alternative_type" class="form-control dnn-option">
                              <option value="off" selected="selected">Off</option>
                              <option value="mobile">On Mobile</option>
                              <option value="ie8">On IE8</option>
                              <option value="mobile-ie8">On Mobile and IE8</option>
                              >
                            </select></td>
                          <td class="tips">Disables the Slider and load an alternative image instead</td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">HTML5 Autoplay on Mobiles </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="allow_android_html5_autoplay">
                            </div></td>
                          <td class="tips">HTML5 autoplay on mobile devices</td>
                        </tr>
                        <tr>
                          <td align="right">Ignore Height Changes </td>
                          <td ><select id="ignore_height_changes" class="form-control dnn-option">
                              <option value="off" selected="selected">Off</option>
                              <option value="mobile">On Mobile</option>
                              <option value="always">Always</option>
                            </select></td>
                          <td class="tips">Prevents jumping of background image for Android devices for example</td>
                        </tr>
                        <tr>
                          <td align="right">Ignore Height Changes Under</td>
                          <td class="size-text-line"><input type="text" class="form-control dnn-option form-validation" value="0" id="ignore_height_changes_px" data-validation="plusint">
                            px</td>
                          <td class="tips">Ignores the Ignore Height Changes feature under a certain amount of pixels.</td>
                        </tr>
<!--                        <tr>
                          <th colspan="3" >Troubleshooting</th>
                        </tr>
                        <tr>
                          <td width="15%" align="right">JQuery No Conflict Mode </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="jquery_noconflict">
                            </div></td>
                          <td class="tips">Turns on / off jquery noconflict mode. Try to enable this option if javascript conflicts exist on the page.</td>
                        </tr>
                        <tr>
                          <td align="right">Put JS Includes To Body </td>
                          <td ><select id="js_to_body" class="form-control dnn-option">
                              <option value="true" >ON</option>
                              <option value="false" selected="selected">OFF</option>
                            </select></td>
                          <td class="tips">Try this to fix some javascript conflicts of type: TypeError: tpj('#rev_slider_1_1').show().revolution is not a function</td>
                        </tr>
                        <tr>
                          <td align="right">Output Filters Protection </td>
                          <td ><select id="output_type" class="form-control dnn-option">
                              <option value="none" selected="selected">None</option>
                              <option value="compress">By Compressing Output</option>
                              <option value="echo">By Echo Output</option>
                            </select></td>
                          <td class="tips">Activate a protection against wordpress output filters that adds html blocks to the shortcode output like P and BR.</td>
                        </tr>
                        <tr>
                          <td width="15%" align="right">Debug Mode </td>
                          <td width="200px"><div class="make-switch" data-on="primary" data-off="info"  >
                              <input type="checkbox" class="dnn-option" id="jquery_debugmode">
                            </div></td>
                          <td class="tips">Turns on / off visible Debug Mode on Front End.</td>
                        </tr>
-->                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="tab-pane active tab-style1" id="panel_tab1_example2">
        <div class="tabbable">
          <div  class="tabbable-title">
            <ul class="nav nav-tabs tab-bricky slide-nav-ico" id="slide-tab-title">
            </ul>
             <div id="add-static-layers"><span><i class="fa fa-"></i> Static Layers</span></div>
            <i class="clip-plus-circle-2 ico-add" id="addnewslide"></i> </div>
          <div class="tab-content" id="slide-tab-content" > </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-sm-12">
    <div class="form-group">
      <p>&nbsp;</p>
      <input type="submit" lang="Submit" class="btn btn-primary" value="Update" id="submit" >
      &nbsp;
      <input type="submit" class="btn btn-default" value="Cancel">
      &nbsp; </div>
    <br/>
    <br/>
  </div>
  <!--<div id="Preview">
    <div class="slide-title">
      <i class="clip-eye "></i> Preview </div>
      <div class="previewico">
      <i class="clip-pictures tooltips" data-original-title="show to a single Sliders or all of the Sliders" id="previewpage" data-page="Single"></i>  
      <i class="fa fa-refresh tooltips" data-original-title="refresh Sliders" id="previewrefresh"></i> 
      <i class="fa fa-arrow-up" id="previewfolding"></i> 
     </div>

    <div class="slide-content" id="previewcontent">
      <div class="tp-banner-container">
        <div  class="tp-banner slidepreview">
          <ul class='box'>
          </ul>
        </div>
      </div>
    </div>
  </div>--> 
</div>
<!-- end: PAGE CONTENT-->
<div id="previewhig"> </div>
<div id="ajaxParameters" 
PostDataUrl="<% =ViewAjaxUrl("post","")%>" 
GetDataUrl_Settings="<% =ViewAjaxUrl("get","Settings")%>" 
GetDataUrl_Sliders="<% =ViewAjaxUrl("get","Sliders")%>" 
DeleteDataUrl_Slider="<% =ViewAjaxUrl("delete_slider","")%>" 
DeleteDataUrl_Layer="<% =ViewAjaxUrl("delete_layer","")%>" 
LayersUrl="<%=ModulePath %>Resource/templates/Layers.html?v=<%=CrmVersion %>"
LayersContentUrl="<%=ModulePath %>Resource/templates/LayersContent.html?v=<%=CrmVersion %>"
TemplateUrl="<%=ModulePath %>Resource/templates/template.html?v=<%=CrmVersion %>"
AddDataUrl_Slider="<% =ViewAjaxUrl("add_slider","")%>" 
AddDataUrl_Layer="<% =ViewAjaxUrl("add_layer","")%>" 
></div>

<div id="setting-message-info"></div>
<div id="setting-message-info-full"><div class="waitaminute-message">
<div class="cog">
<i class="fa icon1 fa-cog"></i>
<i class="fa icon2 fa-cog"></i>
<i class="fa icon3 fa-cog"></i>
</div>
<br>Please Wait a Moment</div></div>

<%--<div id="ajaxParameters" 
PostDataUrl="<% =ViewAjaxUrl("post")%>" 
GetDataUrl="<%=ModulePath %>Resource/templates/data.html" 
LayersUrl="<%=ModulePath %>Resource/templates/Layers.html"
TemplateUrl="<%=ModulePath %>Resource/templates/template.html"
></div>--%>
<%--$("#ajaxParameters").attr("LayersUrl");--%>
<div id="AddMedia_Modal" class="modal fade" tabindex="-1" data-width="760" data-height="400" style="display: none;">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
    <h4 class="modal-title"> <i class='fa fa-folder-open'></i> Add New Media</h4>
  </div>
  <div class="modal-body">
    <iframe id="AddMedia_Iframe" width="100%" height="100%" style="border-width: 0px;" data-src="<% =ViewIframeUrl()%>"></iframe>
  </div>
</div>
<div id="ajax-modal"  class="modal fade" tabindex="-1" data-width="760" data-height="400" style="display: none;" >
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
    <h4 class="modal-title"> <i class='fa fa-folder-open'></i> Styling Captions </h4>
  </div>
  <div class="modal-body">
    <div class="tp-caption medium_grey">medium_grey</div>
    <div class="tp-caption small_text">small_text</div>
    <div class="tp-caption medium_text">medium_text</div>
    <div class="tp-caption large_text">large_text</div>
    <div class="tp-caption very_large_text">very_large_text</div>
    <div class="tp-caption very_big_white">very_big_white</div>
    <div class="tp-caption very_big_black">very_big_black</div>
    <div class="tp-caption modern_medium_fat">modern_medium_fat</div>
    <div class="tp-caption modern_medium_fat_white">modern_medium_fat_white</div>
    <div class="tp-caption modern_medium_light">modern_medium_light</div>
    <div class="tp-caption modern_big_bluebg">modern_big_bluebg</div>
    <div class="tp-caption modern_big_redbg">modern_big_redbg</div>
    <div class="tp-caption modern_small_text_dark">modern_small_text_dark</div>
    <div class="tp-caption boxshadow">boxshadow</div>
    <div class="tp-caption black">black</div>
    <div class="tp-caption thinheadline_dark">thinheadline_dark</div>
    <div class="tp-caption thintext_dark">thintext_dark</div>
    <div class="tp-caption largeblackbg">largeblackbg</div>
    <div class="tp-caption largepinkbg">largepinkbg</div>
    <div class="tp-caption largewhitebg">largewhitebg</div>
    <div class="tp-caption largegreenbg">largegreenbg</div>
    <div class="tp-caption excerpt">excerpt</div>
    <div class="tp-caption large_bold_grey">large_bold_grey</div>
    <div class="tp-caption medium_thin_grey">medium_thin_grey</div>
    <div class="tp-caption small_thin_grey">small_thin_grey</div>
    <div class="tp-caption lightgrey_divider">lightgrey_divider</div>
    <div class="tp-caption large_bold_darkblue">large_bold_darkblue</div>
    <div class="tp-caption medium_bg_darkblue">medium_bg_darkblue</div>
    <div class="tp-caption medium_bold_red">medium_bold_red</div>
    <div class="tp-caption medium_light_red">medium_light_red</div>
    <div class="tp-caption medium_bg_red">medium_bg_red</div>
    <div class="tp-caption medium_bold_orange">medium_bold_orange</div>
    <div class="tp-caption medium_bg_orange">medium_bg_orange</div>
    <div class="tp-caption grassfloor">grassfloor</div>
    <div class="tp-caption large_bold_white">large_bold_white</div>
    <div class="tp-caption medium_light_white">medium_light_white</div>
    <div class="tp-caption mediumlarge_light_white">mediumlarge_light_white</div>
    <div class="tp-caption mediumlarge_light_white_center">mediumlarge_light_white_center</div>
    <div class="tp-caption medium_bg_asbestos">medium_bg_asbestos</div>
    <div class="tp-caption medium_light_black">medium_light_black</div>
    <div class="tp-caption large_bold_black">large_bold_black</div>
    <div class="tp-caption mediumlarge_light_darkblue">mediumlarge_light_darkblue</div>
    <div class="tp-caption small_light_white">small_light_white</div>
    <div class="tp-caption roundedimage">roundedimage</div>
    <div class="tp-caption large_bg_black">large_bg_black</div>
    <div class="tp-caption mediumwhitebg">mediumwhitebg</div>
    <div class="tp-caption large_bold_white_25">large_bold_white_25</div>
    <div class="tp-caption medium_text_shadow">medium_text_shadow</div>
    <div class="tp-caption black_heavy_60">black_heavy_60</div>
    <div class="tp-caption white_heavy_40">white_heavy_40</div>
    <div class="tp-caption grey_heavy_72">grey_heavy_72</div>
    <div class="tp-caption grey_regular_18">grey_regular_18</div>
    <div class="tp-caption black_thin_34">black_thin_34</div>
    <div class="tp-caption arrowicon">arrowicon</div>
    <div class="tp-caption light_heavy_60">light_heavy_60</div>
    <div class="tp-caption black_bold_40">black_bold_40</div>
    <div class="tp-caption light_heavy_70">light_heavy_70</div>
    <div class="tp-caption black_heavy_70">black_heavy_70</div>
    <div class="tp-caption black_bold_bg_20">black_bold_bg_20</div>
    <div class="tp-caption greenbox30">greenbox30</div>
    <div class="tp-caption blue_heavy_60">blue_heavy_60</div>
    <div class="tp-caption green_bold_bg_20">green_bold_bg_20</div>
    <div class="tp-caption whitecircle_600px">whitecircle_600px</div>
    <div class="tp-caption fullrounded">fullrounded</div>
    <div class="tp-caption light_heavy_40">light_heavy_40</div>
    <div class="tp-caption white_thin_34">white_thin_34</div>
    <div class="tp-caption fullbg_gradient">fullbg_gradient</div>
    <div class="tp-caption light_medium_30">light_medium_30</div>
    <div class="tp-caption red_bold_bg_20">red_bold_bg_20</div>
    <div class="tp-caption blue_bold_bg_20">blue_bold_bg_20</div>
    <div class="tp-caption white_bold_bg_20">white_bold_bg_20</div>
    <div class="tp-caption white_heavy_70">white_heavy_70</div>
    <div class="tp-caption light_heavy_70_shadowed">light_heavy_70_shadowed</div>
    <div class="tp-caption light_medium_30_shadowed">light_medium_30_shadowed</div>
    <div class="tp-caption blackboxed_heavy">blackboxed_heavy</div>
    <div class="tp-caption bignumbers_white">bignumbers_white</div>
    <div class="tp-caption whiteline_long">whiteline_long</div>
    <div class="tp-caption light_medium_20_shadowed">light_medium_20_shadowed</div>
    <div class="tp-caption fullgradient_overlay">fullgradient_overlay</div>
    <div class="tp-caption light_medium_20">light_medium_20</div>
    <div class="tp-caption reddishbg_heavy_70">reddishbg_heavy_70</div>
    <div class="tp-caption borderbox_725x130">borderbox_725x130</div>
    <div class="tp-caption light_heavy_34">light_heavy_34</div>
    <div class="tp-caption black_thin_30">black_thin_30</div>
    <div class="tp-caption black_thin_whitebg_30">black_thin_whitebg_30</div>
    <div class="tp-caption white_heavy_60">white_heavy_60</div>
    <div class="tp-caption black_thin_blackbg_30">black_thin_blackbg_30</div>
    <div class="tp-caption light_thin_60">light_thin_60</div>
    <div class="tp-caption greenbgfull">greenbgfull</div>
    <div class="tp-caption bluebgfull">bluebgfull</div>
    <div class="tp-caption blackbgfull">blackbgfull</div>
    <div class="tp-caption wave_repeat1">wave_repeat1</div>
    <div class="tp-caption wavebg1">wavebg1</div>
    <div class="tp-caption wavebg2">wavebg2</div>
    <div class="tp-caption wavebg3">wavebg3</div>
    <div class="tp-caption wavebg4">wavebg4</div>
    <div class="tp-caption wavebg5">wavebg5</div>
    <div class="tp-caption greenishbg_heavy_70">greenishbg_heavy_70</div>
    <div class="tp-caption deepblue_sea">deepblue_sea</div>
  </div>
</div>
