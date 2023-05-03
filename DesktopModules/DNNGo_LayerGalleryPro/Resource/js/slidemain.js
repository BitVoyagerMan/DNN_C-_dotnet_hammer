var imgurl = function () {};
$(document).ready(function () {
	Date.prototype.Format = function (fmt) {
		var o = {
			"M+": this.getMonth() + 1,
			"d+": this.getDate(),
			"h+": this.getHours(),
			"m+": this.getMinutes(),
			"s+": this.getSeconds(),
			"q+": Math.floor((this.getMonth() + 3) / 3),
			"S": this.getMilliseconds()
		};
		if (/(y+)/.test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		}
		for (var k in o) {
			if (new RegExp("(" + k + ")").test(fmt)) {
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			}
			return fmt;
		}
	};
	var SlidersHtml,
		layersHtml,
		SlidersHtmlBox,
		layersHtmlBox,
		LayersContentHtml,
		LayersContentHtmlBox,
		receive_data,
		Sliders_length = 0,
		current = 0,
		defaultSliderData = false,
		defaultLayerData = false,
		slideTab = $("#slide-tab-title"),
		slidecontent = $("#slide-tab-content"),
		device = 0;

	
	var size_notebook = $("#custom_size_notebook").val() === "off" ? false : true,
		size_tablet = $("#custom_size_tablet").val() === "off" ? false : true,
		size_mobile = $("#custom_size_mobile").val() === "off" ? false : true;

	$(window).load(function(){
	  	size_notebook = $("#custom_size_notebook").val() === "off" ? false : true,
		size_tablet = $("#custom_size_tablet").val() === "off" ? false : true,
		size_mobile = $("#custom_size_mobile").val() === "off" ? false : true;
	});
	
	
	$("#custom_size_notebook").parent().on("click", function () { 
		size_notebook = $("#custom_size_notebook").val() != "off" ? false : true,
		receive_data = responsive_val(receive_data);
	});
	$("#custom_size_tablet").parent().on("click", function () {
		size_tablet = $("#custom_size_tablet").val() != "off" ? false : true,
		receive_data = responsive_val(receive_data);
	});
	$("#custom_size_mobile").parent().on("click", function () {
		size_mobile = $("#custom_size_mobile").val() != "off" ? false : true;
		receive_data = responsive_val(receive_data);
	});

	$("body").append("<input type='text' id='StaticLayersItem' class='hide' value='off' />");



	responsive_val =function(data){
			for(var x in data){
				if(data[x]["layers"]){
				for(var y in data[x]["layers"]){
					for(var z in responsive_list){
						var d = data[x]["layers"][y][responsive_list[z]];
						
						if (!size_notebook) {
							d[1] = d[0];
						}
						if (!size_tablet) {
							d[2] = d[1];
						}
						if (!size_mobile) {
							d[3] = d[2];
						}
						data[x]["layers"][y][responsive_list[z]] = d;
					}
				}
				}	
			}
		if(!size_notebook && !size_tablet && !size_mobile){
			$(".responsive-option").addClass("responsive-option");
		}
		return data;
	}


	var type_button_change_value = {
		font_size: "17",
		line_height: "17",
		font_weight: 500,
		color: "#ffffff",
		bg_color: "rgba(0,0,0,0.75)",
		padding_top: "12",
		padding_right: "35",
		padding_bottom: "12",
		padding_left: "35",
		"css_border-radius-top": "3",
		"css_border-radius-left": "3",
		"css_border-radius-right": "3",
		"css_border-radius-bottom": "3",
		"layer_auto_line_break": "nowrap"
	}
	var responsive_list = [
		"font_size",
		"line_height",
		"letter_spacing",
		"color",
		"v_align",
		"h_align",
		"top",
		"left",
		"width",
		"height",
		"padding_top",
		"padding_right",
		"padding_bottom",
		"padding_left",
		"margin_top",
		"margin_right",
		"margin_bottom",
		"margin_left",
		"css_text-align",
		"font_weight",
		"layer_auto_line_break"
	];

	$.ajax({
		url: $("#ajaxParameters").attr("TemplateUrl"),
		async: false,
		success: function (data) {
			SlidersHtml = data;
			SlidersHtmlBox = $(data);
		}
	});
	$.ajax({
		url: $("#ajaxParameters").attr("LayersUrl"),
		async: false,
		success: function (data) {
			layersHtml = data;
			layersHtmlBox = $(data);
		}
	});
	$.ajax({
		url: $("#ajaxParameters").attr("LayersContentUrl"),
		async: false,
		success: function (data) {
			LayersContentHtml = data;
			LayersContentHtmlBox = $(data);
		}
	});

	var SlideEvent = function (id) {
		slideTab.children("#slide-title" + id).find(".ico-close").on("click", function () {
			delSlide($(this).attr("id"));
		});
	};
	$.ajax({
		url: $("#ajaxParameters").attr("GetDataUrl_Sliders") + "?d=" + (new Date()).Format("hhmmss"),
		async: false,
		success: function (data) {
			receive_data = JSON.parse(data); 
		//	console.log(receive_data)
		}
	});
	for (var Slider in receive_data) {
		Sliders_length++;
		var sle = eval("(" + "receive_data." + Slider + ")");
		var id = sle.id;
		var ls = sle.layers;
		var sort=0;
		if(sle.staticSlide=="on"){
			sort = 9999;
		}else{
			sort = parseInt(slideTab.find('li').length + 1);
		}

		slideTab.append("<li id=\"slide-title" + id + "\" class=\"slide-tab-nav "+(sle.staticSlide=="on"?"static-layers-item hide":"")+"\"  data-id=\"" + id + "\" data-sort=\"" +sort+ "\"> <a  data-toggle=\"tab\" href=\"#slide_tab1_example" + id + "\" >Slide<span>" + parseInt(slideTab.find('li:not(.static-layers-item)').length + 1) + "</span><i class=\"clip-cancel-circle-2 ico-close\" id=\"" + id + "\" ></i><i class=\"drag clip-arrow-3\"></i></a></li>");
		SlideEvent(id);
	}
	if(slideTab.find("li").eq(0).hasClass("static-layers-item")){
		$("#StaticLayersItem").val("on");
		$("#add-static-layers").addClass("active");
	}

	var acquisition_data = function (id) {
		
		slideoption(id);
		if(!receive_data["slide_" + id]) return false;
		if (receive_data["slide_" + id].layers) {
			var layer = JSON.parse(JSON.stringify(receive_data["slide_" + id].layers));
		} else {
			receive_data["slide_" + id].layers = {};
			var layer = {};
		}
		for (x = 0; x < $("#layers-accordion" + id).children(".panel").length; x++) {

			var layerid = $("#layers-accordion" + id).children(".panel").eq(x).attr("data-id");

			if ($("#panel" + id + "_" + layerid + " .layer-content-box").length !== 0) {
				var layerids = $("#panel" + id + "_" + layerid).attr("data-id"),
					layersorts = $("#panel" + id + "_" + layerid).attr("data-sort");
				var layerItem = layersoption(id, layerids);
				layerItem.id = parseInt(layerids);
				layerItem.sort = parseInt(layersorts);
				layerItem.SliderID = parseInt(id);
				          
				layer["layer_" + id + "_" + layerid] = layerItem;

			}
		}
		
		sop.layers = layer;
		return sop;
	};
	var loadslider = function (id) {
		$("#Loading2").show();

		slideTab.css("pointer-events", "none");
		$(this).addClass("active");
		var sle = receive_data["slide_" + id];
		addSlide(id, sle);
		var ls = sle.layers;
		for (var pros in ls) {
			var slle = eval("(" + "ls." + pros + ")");
			addLayer(id, slle.id, slle);
		}
		slideTab.css("pointer-events", "inherit");

		if (current !== 0 && current !== id) {
			receive_data["slide_" + current] = acquisition_data(current);
			$("#slide_tab1_example" + current).remove();
		}
		$("#slide_tab1_example" + id).addClass("active");
		current = id;
		$("#Loading2").hide();
	};
	slideTab.find("li").on("click", function () {
		if ($(this).hasClass("active")) {
			return false;
		}
		if(!$(this).hasClass("static-layers-item")){
			$("#StaticLayersItem").val("off");
			$("#add-static-layers").removeClass("active");			
		}

		loadslider($(this).find(".ico-close").attr("id"));
	});
	$("#addnewslide").on("click", function () {
		if (!defaultSliderData) {
			defaultSliderData = get_defaultSliderData();
		}
		var AddSlideData = JSON.parse(JSON.stringify(defaultSliderData));;
		AddSlideData.id = 0;
		AddSlideData.sort = parseInt($("#slide-tab-title > li").length + 1);

		$.post($("#ajaxParameters").attr("AddDataUrl_Slider") + "?d=" + (new Date()).Format("hhmmss"), {
			Content: JSON.stringify(AddSlideData)
		}, function (data) {
			var id = data;
			var sort=0;
			AddSlideData.id = parseInt(id);

			if(AddSlideData.staticSlide=="on"){
				sort = 9999;
			}else{
				sort = parseInt(slideTab.find('li').length + 1);
			}

			slideTab.append("<li id=\"slide-title" + id + "\" class=\"slide-tab-nav\"  data-id=\"" + id + "\" data-sort=\"" + sort + "\"> <a  data-toggle=\"tab\" href=\"#slide_tab1_example" + id + "\" >Slide<span>" + parseInt(slideTab.find('li:not(.static-layers-item)').length + 1) + "</span><i class=\"clip-cancel-circle-2 ico-close\" id=\"" + id + "\" ></i><i class=\"drag clip-arrow-3\"></i></a></li>");
			SlideEvent(id);
			var newslide = $("#slide-title" + id);
			newslide.on("click", function () {
				if ($(this).hasClass("active")) {
					return false;
				}
				loadslider($(this).find(".ico-close").attr("id"));
			});
			receive_data["slide_" + id] = AddSlideData;
			$("#StaticLayersItem").val("off");
			newslide.click();
		});
	});

	$("#add-static-layers").on("click", function () {
		if($(".static-layers-item").length==0){
			if (!defaultSliderData) {
				defaultSliderData = get_defaultSliderData();
			}
			var AddSlideData = JSON.parse(JSON.stringify(defaultSliderData));;
			AddSlideData.id = 0;
			AddSlideData.sort = 9999;
			AddSlideData["staticSlide"] ="on";

			$.post($("#ajaxParameters").attr("AddDataUrl_Slider") + "?d=" + (new Date()).Format("hhmmss"), {
				Content: JSON.stringify(AddSlideData)
			}, function (data) {
				var id = data; 

				AddSlideData.id = parseInt(id);
				slideTab.append("<li id=\"slide-title" + id + "\" class=\"slide-tab-nav static-layers-item hide\"  data-id=\"" + id + "\" data-sort=\"" + AddSlideData.sort + "\"> <a  data-toggle=\"tab\" href=\"#slide_tab1_example" + id + "\" >Slide<span>" + parseInt(slideTab.find('li:not(.static-layers-item)').length + 1) + "</span><i class=\"clip-cancel-circle-2 ico-close\" id=\"" + id + "\" ></i><i class=\"drag clip-arrow-3\"></i></a></li>");

				$("#StaticLayersItem").val("on");

				SlideEvent(id);
				var newslide = $("#slide-title" + id);
				newslide.on("click", function () {
					if ($(this).hasClass("active")) {
						return false;
					}
					loadslider($(this).find(".ico-close").attr("id"));
				});

				receive_data["slide_" + id] = AddSlideData;
				receive_data["slide_" + id]["staticSlide"]="on";
				console.log(receive_data["slide_" + id])

				newslide.click();
			});

		}else{
			$("#StaticLayersItem").val("on");
			$(".static-layers-item").click();
		}
		$(this).addClass("active")
	});




	var delSlide = function (id) {
		if (confirm("Sure to delete ?")) {
			var it = "#slide-title" + id,
				ic = "#slide_tab1_example" + id,
				index = slideTab.children(it).index();
			if ($(it).attr("data-id") !== "0") {
				$.get($("#ajaxParameters").attr("DeleteDataUrl_Slider") + "?d=" + (new Date()).Format("hhmmss"), {
					DeleteID: id
				}, function () {
					messageInfo("<span class=\"fa fa-check\"></span> Delete \"" + $(it + " a").text() + "\" successful", "#27ae60");
					slideTab.children(it).remove();
					slidecontent.children(ic).remove();
					if (slideTab.children(it).last().length === 0) {
						index = index - 1;
						current = slideTab.find("li").eq(index).find(".ico-close").attr("id");
						slideTab.find("li").eq(index).click();
					}else{
						current = 0;
					}
					
					delete receive_data["slide_" + id];
					slideName();
					contentnot();

				});
			}
		}
	};
	$.get($("#ajaxParameters").attr("GetDataUrl_Settings") + "?d=" + (new Date()).Format("hhmmss"), function (data) {
		if (!data) {
			return false;
		}
		recomposesettings(eval("(" + data + ")"));
		$("#SliderSettings").find("input[type=checkbox]").each(function () {
			if ($(this).val() === "off") {
				$(this).removeAttr("checked");
			} else if($(this).val() === "on")  {
				$(this).attr("checked", "checked");
			}
			checkboxval($(this));
		});
		$("#SliderSettings").find(".make-switch")['bootstrapSwitch']();
		var dynamic = function () {
			$("#Loading").hide();
			clearTimeout(intervals);
		};
		$('.conditional').conditionize();

		$('#SliderSettings .color-picker').each(function(){
			if(!$(this).siblings("i").length){
				$(this).wrap("<div class=\"color-picker-box\">")
				$(this).after("<i style=\"background-color: "+$(this).val()+";\"></i>");
			}
			$(this).on("change",function(){
				$(this).siblings("i").css("background-color",$(this).val())
			})
		})
		$('#SliderSettings .color-picker').colorpicker();


		$(".form-validation").each(function () {
			$(this).newValidator()
		});
		modalImg("666666666");
		var intervals = setInterval(dynamic, 2000);
	});
	var contentnot = function () {
		if (slideTab.find("li").length === 0) {
			$("#slide-tab-content").append("<div id=\"contentnot\">Please add a Slide ...</div>");
		} else {
			$("#contentnot").remove();
		}
	};
	var recomposesettings = function (se) {


		$("#SliderSettings .dnn-option").each(function () {
			var g = $(this),
				gv = se[g.attr("id")];
			if (g.data("changeval")) {
				var v = g.data("changeval");
				for (a in v) {
					if (v[a] === gv) {
						gv = a;
					}
				}
			}
			g.val(gv);
		});

	};
	var recomposeslide = function (id, sle) {

		SlidersHtmlBox.find(".dnn-option").each(function () {
			g = $(this).attr("id"), gv = sle[g.split("<SlideID>")[0]];
			if ($(this).data("changeval")) {
				var v = $(this).data("changeval");
				for (a in v) {
					if (v[a] === gv) {
						gv = a;
					}
				}
			}
			$("#" + g.replace("<SlideID>", id)).val(gv);

		});

		sle.display_desktop === "off" ? $("#display_desktop" + id).val("off").attr("checked", false) : $("#display_desktop" + id).val("on").attr("checked", "checked");
		sle.display_tablet === "off" ? $("#display_tablet" + id).val("off").attr("checked", false) : $("#display_tablet" + id).val("on").attr("checked", "checked");
		sle.display_phone === "off" ? $("#display_phone" + id).val("off").attr("checked", false) : $("#display_phone" + id).val("on").attr("checked", "checked");

		$("#slidetype_nav" + id).find("li[data-type^='" + sle.type + "']").addClass("active").siblings().removeClass("active");
		var index = $("#slidetype_nav" + id).find("li[data-type^='" + sle.type + "']").index() + 1;
		$("#slidetype_tab" + id + "_example" + index).addClass("active").siblings(".tab-pane").removeClass("active");
		$("#slide-title" + id).addClass("active").siblings("li").removeClass("active");
		$("#slide-tab-content").children(".tab-pane").eq($("#slide-title" + id).index()).addClass("active").siblings(".tab-pane").removeClass("active");


		if (sle.StartTime) {
			$("#display_starttime" + id).val(sle.StartTime.split(" ")[0]);
			$("#display_starttimehh" + id).val(sle.StartTime.split(" ")[1]);
		} else {
			var starttime = $('div[id^="format_data"]').data("starttime") && $('div[id^="format_data"]').data("starttime").split(" ");
			if (starttime) {
				$("#display_starttime" + id).val(starttime[0]);
				$("#display_starttimehh" + id).val(starttime[1]);
			} else {
				$("#display_starttime" + id).val(" ");
				$("#display_starttimehh" + id).val(" ");
			}
		}

		if (sle.EndTime) {
			$("#display_endtime" + id).val(sle.EndTime.split(" ")[0]);
			$("#display_endtimehh" + id).val(sle.EndTime.split(" ")[1]);
		} else {
			var endtime = $('div[id^="format_data"]').data("endtime") && $('div[id^="format_data"]').data("endtime").split(" ");
			if (endtime) {
				$("#display_endtime" + id).val(endtime[0]);
				$("#display_endtimehh" + id).val(endtime[1]);
			} else {
				$("#display_endtime" + id).val(" ");
				$("#display_endtimehh" + id).val(" ");
			}
		}





	};
	var recomposeLayers = function (s, l, slle) {

		layersHtmlBox.find(".dnn-option").each(function (index) {
			g = $(this).attr("id"), gv = slle[g.split("<SlideID>")[0]];
			if ($(this).data("changeval")) {
				var v = $(this).data("changeval");
				for (a in v) {
					if (v[a] == gv) {
						gv = a;
					}
				}
			}
			$("#" + g.replace("<SlideID>", s).replace("<LayersID>", l)).val(gv);
		});
		LayersContentHtmlBox.find(".dnn-option").each(function (index) {
			g = $(this).attr("id"), gv = slle[g.split("<SlideID>")[0]];
			if ($(this).data("changeval")) {
				var v = $(this).data("changeval");
				for (a in v) {
					if (v[a] == gv) {
						gv = a;
					}
				}
			}
			if (typeof gv === "object") {
			 if(gv) gv = gv[device];
				
			}
			$("#" + g.replace("<SlideID>", s).replace("<LayersID>", l)).val(gv);
		});

		$("#panel" + s + "_" + l).attr("data-id", slle.id);
		$("#panel" + s + "_" + l).attr("data-sort", slle.sort);

		$("#Item" + s + "_" + l).val(slle.itemname);
		if (!slle.itemname) {
			$("#itemname" + s + "_" + l).val("Item #" + slle.id);
		}
		$("#click_link_layer" + s + "_" + l).data("layer", slle.click_link_layer);
		$("#click_link_jumpto" + s + "_" + l).data("slide", slle.click_link_jumpto);
		$("#enter_link_layer" + s + "_" + l).data("layer", slle.enter_link_layer);
		$("#enter_link_jumpto" + s + "_" + l).data("slide", slle.enter_link_jumpto);
		$("#leave_link_layer" + s + "_" + l).data("layer", slle.leave_link_layer);
		$("#leave_link_jumpto" + s + "_" + l).data("slide", slle.leave_link_jumpto);


		$("#layercontent_tab" + s + "_" + l).find("li[data-type^='" + slle.type + "']").addClass("active").siblings().removeClass("active");
		var index = $("#layercontent_tab" + s + "_" + l).find("li[data-type^='" + slle.type + "']").index() + 1;
		$("#layercontent_tab" + s + "_" + l + "_example" + index).addClass("active").siblings(".tab-pane").removeClass("active");
		$("#layervideo" + s + "_" + l).find("li[data-type^='" + slle.vtype + "']").addClass("active").siblings().removeClass("active");
		var index2 = $("#layervideo" + s + "_" + l).find("li[data-type^='" + slle.vtype + "']").index() + 1;
		$("#layervideo_tab" + s + "_" + l + "_example" + index2).addClass("active").siblings(".tab-pane").removeClass("active");
		$("#contentcode" + s + "_" + l).find("span[data-code^='" + slle.contentcode + "']").addClass("active").siblings("span").removeClass("active");
	};
	var ShowroomStyling = "#1_1";
	var copyslide = function (copyid) {
		var copyData = receive_data["slide_" + copyid];
		copyData = acquisition_data(copyid);

		var CopySlideData = JSON.parse(JSON.stringify(copyData));

		CopySlideData.id = 0;
		CopySlideData.sort = slideTab.children("li").length + 1;
		delete CopySlideData.layers;
		$.post($("#ajaxParameters").attr("AddDataUrl_Slider") + "?d=" + (new Date()).Format("hhmmss"), {
			Content: JSON.stringify(CopySlideData)
		}, function (data) {
			var id = data;

			CopySlideData.id = parseInt(id);
			CopySlideData.layers = {};

			slideTab.append("<li id=\"slide-title" + id + "\" class=\"slide-tab-nav\"  data-id=\"" + id + "\" data-sort=\"" + CopySlideData.sort + "\"> <a  data-toggle=\"tab\" href=\"#slide_tab1_example" + id + "\" >Slide<span>" + parseInt(slideTab.find('li:not(.static-layers-item)').length + 1) + "</span><i class=\"clip-cancel-circle-2 ico-close\" id=\"" + id + "\" ></i><i class=\"drag clip-arrow-3\"></i></a></li>");
			var newslide = $("#slide-title" + id);
			var index = 0;
			var CopySlideLayerData = copyData.layers;
			$.ajaxSettings.async = false;
			for (var i in CopySlideLayerData) {
				index++;
				var NewlayerItem = JSON.parse(JSON.stringify(CopySlideLayerData[i]));
				NewlayerItem.id = 0;
				NewlayerItem.sort = index;
				NewlayerItem.SliderID = id;
				$.post($("#ajaxParameters").attr("AddDataUrl_Layer") + "?d=" + (new Date()).Format("hhmmss"), {
					Content: JSON.stringify(NewlayerItem)
				}, function (layerdata) {
					NewlayerItem.id = parseInt(layerdata);
					addLayer(id, layerdata, NewlayerItem);
					CopySlideData.layers["layer_" + id + "_" + layerdata] = NewlayerItem;
					if ($("#slide_tab1_example" + id).find(".panel").length > 1) {
						$("#panel" + id + "_" + layerdata).find(".panel-title a").click();
					}
				});
			}

			$.ajaxSettings.async = true;

			receive_data["slide_" + id] = CopySlideData;

			SlideEvent(id);

			newslide.on("click", function () {
				if ($(this).hasClass("active")) {
					return false;
				}
				loadslider($(this).find(".ico-close").attr("id"));
			});
			newslide.click();
		});
	};
	var copylayer = function (copyid) {
		var n = copyid.split(",");
		var copydata = receive_data["slide_" + n[0]]["layers"]["layer_" + n[0] + "_" + n[1]];
		copydata = layersoption(n[0], n[1]);

		var NewlayerItem = JSON.parse(JSON.stringify(copydata));
		NewlayerItem.itemname = NewlayerItem.itemname + "(copy)";
		NewlayerItem.id = 0;
		NewlayerItem.sort = parseInt($("#layers-accordion" + n[0] + " > li").length + 1);
		NewlayerItem.SliderID = parseInt(n[0]);
		$.post($("#ajaxParameters").attr("AddDataUrl_Layer") + "?d=" + (new Date()).Format("hhmmss"), {
			Content: JSON.stringify(NewlayerItem)
		}, function (data) {
			NewlayerItem.id = data;
			addLayer(n[0], data, NewlayerItem);
			receive_data["slide_" + n[0]]["layers"]["layer_" + n[0] + "_" + data] = NewlayerItem;
			if ($("#slide_tab1_example" + n[0]).find(".panel").length > 1) {
				$("#panel" + n[0] + "_" + data).find(".panel-title a").click();
			}
		});
	};
	var sortlayer = function (id) {
		$("#layers-accordion" + id).children(".panel-default").each(function () {
			$(this).attr("data-sort", $(this).index() + 1);
		});
	};
	var dellayer = function (d) {
		if (confirm("Sure to delete ?")) {
			if ($("#panel" + d).attr("data-id") === "0") {
				$("#panel" + d).remove();
			} else {
				new_d = $("#panel" + d).attr("data-id");
				$.get($("#ajaxParameters").attr("DeleteDataUrl_Layer"), {
						DeleteID: new_d
					},
					function (data) {
						if (data > 0) {
							messageInfo("<span class=\"fa fa-check\"></span> Delete \"" + $("#itemname" + d).val() + "\" successful", "#27ae60");
							var delid = d.split("_");
							delete receive_data["slide_" + delid[0]]["layers"]["layer_" + d];
							$("#panel" + d).remove();
							sortlayer(d.split("_")[0]);
						}
					});
			}
			sortlayer(d.split("_")[0]);
		}
	};
	var slideName = function () {
		slideTab.find("li").each(function () {
			var nu = $(this).index() + 1;
			$(this).find("span").html(nu);
			$(this).data("sort", nu);
		});
	};
	var responsive_icon_click = function (d) {
		$("#responsive_icon" + d + " > a").on("click", function () {
			var old_device = device;
			device = $(this).data("index");

			$(this).addClass("active").siblings().removeClass("active");
			$("#layers-accordion" + d).children("li").each(function () {
				if ($(this).find(".layer-content-box").length) {
					var id = $(this).data("id");
					var layer_data = receive_data["slide_" + d]["layers"]["layer_" + d + "_" + id];
					responsive_list.forEach(function (x) {
						var v = layer_data[x];
						if (typeof v != "object") {
							var obj;
							if (x === "width" || x === "width" || x === "letter_spacing") {
								obj = ["", "", "", ""];
								obj[device] = v;

							} else {
								var df = $("#" + x + d + "_" + id).val();
								obj = [df, df, df, df];
								if (!size_notebook) {
									obj[1] = obj[0];
								}
								if (!size_tablet) {
									obj[2] = obj[1];
								}
								if (!size_mobile) {
									obj[3] = obj[2];
								}
							}

							receive_data["slide_" + d]["layers"]["layer_" + d + "_" + id][x] = obj;
							v = obj;
						}

						if (!size_notebook) {
							v[1] = v[0];
						}
						if (!size_tablet) {
							v[2] = v[1];
						}
						if (!size_mobile) {
							v[3] = v[2];
						}
						receive_data["slide_" + d]["layers"]["layer_" + d + "_" + id][x][old_device] = $("#" + x + d + "_" + id).val();
						$("#" + x + d + "_" + id).val(v[device]).change().addClass("responsive-option");


					})
				


				}
			})

			return false;
		}).eq(device).addClass("active").siblings().removeClass("active");

	};

	var addLayer = function (SlideID, LayersID, op) {

		$("#layers-accordion" + SlideID).append(layersHtml.replace(/<SlideID>/g, SlideID).replace(/<LayersID>/g, LayersID));
		if (op) {
			recomposeLayers(SlideID, LayersID, op);
			$("#panel" + SlideID + "_" + LayersID).find("input[type=checkbox]").each(function () {
				if ($(this).val() === "off") {
					$(this).removeAttr("checked");
				} else if($(this).val() === "on") {
					$(this).attr("checked", "checked");
				}
				checkboxval($(this));
			});
		}

		//if (LayersID <= 1) {
		//	$("#layers-accordion" + SlideID).children(".panel-default").eq(0).find(".accordion-toggle").removeClass("collapsed");
		//	$("#layers-accordion" + SlideID).children(".panel-default").eq(0).find(".panel-collapse").removeClass("collapse").addClass("in");
		//}

		$("#panel" + SlideID + "_" + LayersID + " .accordion-toggle").one("click", function () {
			setTimeout(function () {
				addLayerContent(SlideID, LayersID, op);
				
			}, 300);
			return;
		});

		sortlayer(SlideID);
		modalImg(SlideID, LayersID);
	};
	var addLayerContent = function (SlideID, LayersID, op) {

		$("#collapse" + SlideID + "_" + LayersID).append(LayersContentHtml.replace(/<SlideID>/g, SlideID).replace(/<LayersID>/g, LayersID));
		//if (op) {};
		recomposeLayers(SlideID, LayersID, op);
		$("#panel" + SlideID + "_" + LayersID).find("input[type=checkbox]").each(function () {
			if ($(this).val() === "off") {
				$(this).removeAttr("checked");
			} else if ($(this).val() === "on") {
				$(this).attr("checked", "checked");
			}
			checkboxval($(this));
		});

		sortlayer(SlideID);
		modalImg(SlideID, LayersID);
		familylist(SlideID, LayersID);
		moreValueList(SlideID, LayersID);


		$("#dellayer" + SlideID + "_" + LayersID).on("click",
			function () {
				dellayer($(this).attr("delid"));
			});
		$("#contentcode" + SlideID + "_" + LayersID).find("span").on("click",
			function () {
				$(this).addClass("active").siblings().removeClass("active");
			});

		$("#slidecopy" + SlideID + "_" + LayersID).on("click", function () {
			copylayer($(this).data("layerscopy"));
		});

		$("#panel" + SlideID + "_" + LayersID).attr("data-sort", $("#panel" + SlideID + "_" + LayersID).index() + 1);
		$("#panel" + SlideID + "_" + LayersID).find('.make-switch')['bootstrapSwitch']();
		$("#panel" + SlideID + "_" + LayersID).find('.tooltips').tooltip();
		$("#panel" + SlideID + "_" + LayersID).find(".form-validation").each(function () {
			$(this).newValidator()
		});

		$("#panel" + SlideID + "_" + LayersID).find('.color-picker').each(function(){
			if(!$(this).siblings("i").length){
				$(this).wrap("<div class=\"color-picker-box\">")
				$(this).after("<i style=\"background-color: "+$(this).val()+";\"></i>");
			}
			$(this).on("change",function(){
				$(this).siblings("i").css("background-color",$(this).val())
			})
		})


		$("#panel" + SlideID + "_" + LayersID).find('.color-picker').colorpicker();
		$("#panel" + SlideID + "_" + LayersID).find('.conditional').conditionize();
		$("#panel" + SlideID + "_" + LayersID).find(".date-picker").datepicker();
		$("#panel" + SlideID + "_" + LayersID).find(".ShowroomStyling").on("click", function () {
			ShowroomStyling = "#stylingcaptions" + SlideID + "_" + LayersID
		});

		var layeroptionhtml = "";

		$("#layers-accordion" + SlideID + " > li").each(function () {
			if ($(this).data("id") == "0") return;
			layeroptionhtml += "<option value=\"" + $(this).data("id") + "\">" + $(this).find(".edit_name > input").val() + "</option>";
		});

		$("#layers-accordion" + SlideID + " .click_link_layer").each(function () {
			var layer_id = $(this).data("layer");
			$(this).html(layeroptionhtml).val(layer_id).change();

			$(this).blur(function () {
				$(this).data("layer", $(this).val());
			});
		});
		var slideoptionhtml = "";

		$("#slide-tab-title > li:not(.static-layers-item)").each(function () {
			if ($(this).data("id") == "0") return;
			slideoptionhtml += "<option value=\"" + $(this).data("id") + "\">" + $(this).find("a").text() + "</option>";
		});
		$("#slide_tab1_example" + SlideID + " .click_link_jumpto").each(function () { 
			var layer_id = $(this).data("slide");
			$(this).html(slideoptionhtml).val(layer_id).change();
			$(this).blur(function () {
				$(this).data("layer", $(this).val());
			});
		});

		
		$("#collapse" + SlideID + "_" + LayersID).find(".layer-content-box").fadeIn();
		$("#collapse" + SlideID + "_" + LayersID).find(".content-loading").remove();
		
		if(size_notebook || size_tablet || size_mobile){
			responsive_list.forEach(function (x) {
				$("#" + x+SlideID + "_" + LayersID).addClass("responsive-option");
			})
		}

		
		
	};
	var addSlide = function (SlideID, op) {
		var starttime = $('div[id^="format_data"]').data("starttime") && $('div[id^="format_data"]').data("starttime").split(" ");
		var endtime = $('div[id^="format_data"]').data("endtime") && $('div[id^="format_data"]').data("endtime").split(" ");
		if (!starttime) {
			starttime = ["", ""];
		}
		if (!endtime) {
			endtime = ["", ""];
		}
		slidecontent.append(SlidersHtml.replace(/<SlideID>/g, SlideID).replace(/<starttime>/g, starttime[0]).replace(/<endtime>/g, endtime[0]).replace(/<starttimehh>/g, starttime[1]).replace(/<endtimehh>/g, endtime[1]));
		contentnot();
		if (op && op !== "newSlideID") {
			recomposeslide(SlideID, op);
			$("#slide_tab1_example" + SlideID).find("input[type=checkbox]").each(function () {
				if ($(this).val() === "off") {
					$(this).removeAttr("checked");
				} else if ($(this).val() === "on") {
					$(this).attr("checked", "checked");
				}
				checkboxval($(this));
			});
		} else {
			$("#slide_tab1_example" + SlideID).find("input[type=checkbox]").each(function () {
				checkboxval($(this));
			});
		}
		$("#add-layer" + SlideID).on("click", function () {
			addNewLayer(SlideID);
		});
		$("#slidecopy" + SlideID).on("click", function () {
			copyslide($(this).data("slidecopy"));
		});
		modalImg(SlideID);
		$("#layers-accordion" + SlideID).dragsort({
			dragSelector: ".panel-heading .drag",
			placeHolderTemplate: "<li class=\"placeHolder\"><div></div></li>",
			dragEnd: function () {
				sortlayer(SlideID);
			}
		});
		$("#slide_tab1_example" + SlideID).find('.make-switch')['bootstrapSwitch']();
		$("#slide_tab1_example" + SlideID).find('.tooltips').tooltip();
		$("#slide_tab1_example" + SlideID).find(".form-validation").each(function () {
			$(this).newValidator();
		});
		$("#slide_tab1_example" + SlideID).find('.color-picker').each(function(){
			if(!$(this).siblings("i").length){
				$(this).wrap("<div class=\"color-picker-box\">")
				$(this).after("<i style=\"background-color: "+$(this).val()+";\"></i>");
			}
			$(this).on("change",function(){
				$(this).siblings("i").css("background-color",$(this).val())
			})
		})

		$("#slide_tab1_example" + SlideID).find('.color-picker').colorpicker();
		$("#slide_tab1_example" + SlideID).find('.conditional').conditionize();
		//	$("#slide_tab1_example" + SlideID).find('.date-picker').datepicker();

		slidecontent.find('.date-picker').datepicker();
		slidecontent.find('.date-time-picker').timepicker({
			minuteStep: 1,
			template: false,
			showInputs: false,
			disableFocus: true,
			showSeconds: false,
			showMeridian: false
		});

		responsive_icon_click(SlideID);
	};
	var addNewLayer = function (SlideID) {
		if (!defaultLayerData) {
			defaultLayerData = get_defaultLayerData();
		}
		
		var addLayerData =JSON.parse(JSON.stringify(defaultLayerData));
		addLayerData.id = 0;
		addLayerData.sort = parseInt($("#layers-accordion" + SlideID).children("li").length + 1);
		addLayerData.SliderID = parseInt(SlideID);
		addLayerData.itemname = "";
		$.post($("#ajaxParameters").attr("AddDataUrl_Layer") + "?d=" + (new Date()).Format("hhmmss"), {
			Content: JSON.stringify(addLayerData)
		}, function (data) {
			addLayerData.id = parseInt(data);
			addLayer(SlideID, data, addLayerData);
			//if ($("#slide_tab1_example" + SlideID).find(".panel").length > 1) {
			$("#panel" + SlideID + "_" + data).find(".panel-title a").click();
			//}

			$("#panel" + SlideID + "_" + data).one("click", '.type_button > a', function () {
				for (var vl in type_button_change_value) {
					$("#" + vl + SlideID + "_" + data).val(type_button_change_value[vl]).change();
				}
			});	

			if(!receive_data["slide_"+SlideID]["layers"]){
				receive_data["slide_"+SlideID]["layers"] = {};
			}

			receive_data["slide_"+SlideID]["layers"]["layer_"+SlideID+"_"+data] =addLayerData;

		});
	};
	$("#slide-tab-title").dragsort({
		dragSelector: "li .drag",
		placeHolderTemplate: "<li class=\"placeHolder\"><div></div></li>",
		dragEnd: slideName
	});
	var get_defaultSliderData = function () {
		slideoption(0);
		return sop;
	};
	var get_defaultLayerData = function () {
		return layersoption(0);
	};
	var checkboxval = function (e) {
		if (e.attr("checked")) {
			e.attr("checked", true);
			e.val("on");
		} else {
			e.attr("checked", false);
			e.val("off");
		}


		e.parent(".make-switch").on("click", function () {
			var box = $(this);
			//	alert($(this).children(".switch-animate").hasClass("switch-on"));
			if (box.children(".switch-animate").length > 0) {
				if (box.children(".switch-animate").hasClass("switch-on")) {
					//e.val("off");
					//e.attr("checked", false);
					e.val("off");
					e.change();
					e.attr("checked", false);
					box.children(".switch-animate").addClass("switch-off").removeClass("switch-on");

				} else {
					//e.val("on");
					//e.attr("checked", true);
					e.val("on");
					e.change();
					e.attr("checked", true);
					box.children(".switch-animate").removeClass("switch-off").addClass("switch-on");


				}

			}
		});
	};
	var settings = function () {

		stg = {};
		$("#SliderSettings .dnn-option").each(function () {

			var gv = $(this).val();

			if ($(this).data("changeval")) {
				var v = $(this).data("changeval");
				gv = v[gv];
			}


			stg[$(this).attr("id")] = gv;

		});

	};
	var slideoption = function (id) {
		if (id === 0) {
			sop = {
				id: 0
			};
		} else {
			sop = {
				id: parseInt($("#slide-title" + id).attr("data-id")),
				sort: parseInt($("#slide-title" + id).attr("data-sort")),
				//	type: $("#slidetype_nav" + id).find("li.active").data("type"),
				//	temporary: id,	
				StartTime: $("#display_starttime" + id).val() + " " + $("#display_starttimehh" + id).val(),
				EndTime: $("#display_endtime" + id).val() + " " + $("#display_endtimehh" + id).val(),
			};
		}
		SlidersHtmlBox.find(".dnn-option").each(function () {
			var g = $(this).attr("id").split("<SlideID>")[0];
			if (id === 0) {
				var gv = $(this).val();
			} else {
				var gv = $("#" + g + id).val();
			}

			if ($(this).data("changeval")) {
				var v = $(this).data("changeval");
				gv = v[gv];
			}
			sop[g] = gv;
		});
	};
	var layersoption = function (s, l) {
		if (s === 0) {
			var cc = {
				id: 0,
			};
		} else {
			var cc = {
				id: $("#panel" + s + "_" + l).attr("data-id"),
				//currentid: $("#panel" + s + "_" + l).attr("data-new"),
				sort: $("#panel" + s + "_" + l).data("sort"),
				//temporary: s + "_" + l,
				type: $("#layercontent_tab" + s + "_" + l).find("li.active").data("type"),
				vtype: $("#layervideo" + s + "_" + l).find("li.active").data("type"),
				contentcode: $("#contentcode" + s + "_" + l).find("span.active").data("code")
			};
		}

		layersHtmlBox.find(".dnn-option").each(function () {


			var g = $(this).attr("id").split("<SlideID>")[0];

			if (s === 0) {
				var gv = $(this).val();
			} else {
				var gv = $("#" + $(this).attr("id").replace("<SlideID>", s).replace("<LayersID>", l)).val();
			}

			if ($(this).data("changeval")) {
				var v = $(this).data("changeval");
				gv = v[gv];
			}
			cc[g] = gv;
		});
		var layers=false;
		if(receive_data["slide_" + s] && receive_data["slide_" + s]["layers"]){
			layers = receive_data["slide_" + s]["layers"]["layer_" + s + "_" + l];
		}
		LayersContentHtmlBox.find(".dnn-option").each(function () {
			var g = $(this).attr("id").split("<SlideID>")[0];

			if (s === 0) {
				var gv = $(this).val();
			} else {
				var gv = $("#" + $(this).attr("id").replace("<SlideID>", s).replace("<LayersID>", l)).val();
			}

			if ($(this).data("changeval")) {
				var v = $(this).data("changeval");
				gv = v[gv];
			}
			if (responsive_list.includes(g) && layers) {
				if (layers[g]) {
					if(typeof layers[g] !="object"){
						layers[g] =[layers[g],layers[g],layers[g],layers[g]]	
					}
					cc[g] = layers[g];
					cc[g][device] = gv;
				} else {
					cc[g] = [gv, gv, gv, gv];
				}
			} else {
				cc[g] = gv;
			}
			
			if (!size_notebook) {
				cc[g] ? cc[g][1] = cc[g][0]:"";
			}
			if (!size_tablet) {
				cc[g] ? cc[g][2] = cc[g][1]:"";
			}
			if (!size_mobile) {
				cc[g] ? cc[g][3] = cc[g][2]:"";
			}


		});

		return cc;
	};
	var slidesettings = function () {
		settings();
		$('.slidepreview').revolution(eval(stg));
	};
	var mark;
	var modalImg = function (id, op) {
		if (op) {
			var box = $("#panel" + id + "_" + op).find(".fileupimg");
		} else {
			var box = $("#slide_tab1_example" + id).find(".fileupimg");
		}

		box.each(function () {
			var box = $(this),
				text = box.find(".imgtext"),
				timg = box.find(".slideimgs img");
			remove = box.find(".removeimg");
			box.find(".imgdemo").click(function () {
				$("#AddMedia_Iframe").attr("src", $("#AddMedia_Iframe").attr("data-src"));
				mark = $(this);
			});
			var thumbnail = function () {
				timg.hide().attr("src", text.val() ? text.val() : " ");
				timg.error(function (e) {
					timg.attr("src", "Resource/images/thumbnailerror.jpg");
					if (text.val().replace(/[ ]/g, "").length == 0) {
						timg.attr("src", "Resource/images/thumbnail.jpg");
					}
				})
				timg.show();
			}
			thumbnail();
			if (box.hasClass("fileupimg2")) {
				text.on("focus",
					function () {
						text.css("opacity", "1");
					})
				text.on("blur",
					function () {
						text.attr("style", "");
					})
			}
			text.on("blur",
				function () {
					thumbnail()
				})
			remove.on("click",
				function () {
					text.val("");
					thumbnail();
					return false;
				})
			imgurl = function (i) {
				mark.parents(".fileupimg").find(".imgtext").val(i);
				mark.parents(".fileupimg").find(".slideimgs img").attr("src", i);
				$(".modal-header .close").click();
			}
		});
	}

	var  familylistJson= $("#JsonFonts").html();
		if(familylistJson){
			familylistJson = jQuery.parseJSON(familylistJson);
			var familyitem ='';
			if(familylistJson.length==0){
				familylistJson =false;
			}else{
				familylistJson.forEach(function(i,index){
					if(index>=1){
						familyitem +='||';
					}
					familyitem += i["family"]+':'+i["family"];
				})
				familylistJson = familyitem;
			}
		}

	var familylist = function (id, op) {
		if(familylistJson){
			$("#panel" + id + "_" + op).find(".dng-familylist").each(function () {
				$(this).data("more",familylistJson)
			});
		}
	}
	var moreValueList = function (id, op) {

		$("#panel" + id + "_" + op).find(".dng-more-value").each(function () {
			var ullist=$("<ul class=\"more-value-list\" style=\"display:none\">"),
				e=$(this);
				if(e.data("more")){
					var list = e.data("more").split("||");
					list.forEach(function(i){
						var item = i.split(":");
						ullist.append("<li data-value=\""+item[1]+"\">"+item[0]+"</li>");
					})
				}
				ullist.find("li").on("click",function(){
					e.val($(this).data("value"));
				})
				e.on("focus",function(){
					ullist.slideDown(200);	
				}).on("blur",function(){
					setTimeout(function(){
						ullist.slideUp(200);	
					},100)

				})
				e.after(ullist);
				ullist.wrap("<div class=\"more-value-list-wrap\"></div>")
		});


	}


	var messageInfo = function (info, bg) {
		$("#setting-message-info").stop().hide().html(info).css({
			top: "0px",
			right: "25px",
			opacity: 0,
			display: "block"
		}).delay(300).animate({
			top: "25px",
			opacity: 1
		}).delay(2000).animate({
			right: "0",
			opacity: 0
		});
		$("#setting-message-info span").css("color", bg);
	}
	$("#ajax-modal .modal-body .tp-caption").on("click", function () {
		$(ShowroomStyling).val($(this).text())
		$(".modal-header .close").click();
	})
	if (slideTab.find("li").length != 0) {
		loadslider($(this).find(".ico-close").attr("id"));
	} else {
		contentnot();
	}
	$("#PlaceHolder_container").on("click", ".more_Styles", function () {
		$(this).siblings(".more_Styles_box").slideToggle(100);
		$(this).toggleClass("active");

	})
	$("#submit").on("click", function () {
		var submit = $(this);
		submit.addClass("active");
		$("#setting-message-info-full").fadeIn();
		var nindex = slideTab.find("li.active").index();
		var current = $("#slide-tab-title .slide-tab-nav.active").data("id");
		receive_data["slide_" + current] = acquisition_data(current);
		for (var Slider in receive_data) {
			receive_data[Slider].sort = $("#slide-title" + Slider.split("_")[1]).data("sort");
		}
		
		settings();
		$.post($("#ajaxParameters").attr("PostDataUrl") + "?d=" + (new Date()).Format("hhmmss"), {
			Content: JSON.stringify(receive_data),
			Settings: JSON.stringify(stg)
		}, function () {
			$.get($("#ajaxParameters").attr("GetDataUrl_Sliders") + "?d=" + (new Date()).Format("hhmmss"), function (data) {
				receive_data = JSON.parse(data);
				$("#setting-message-info-full").fadeOut(100);
				messageInfo("<span class=\"fa fa-check\"></span> Update successful", "#27ae60");
				submit.removeClass("active");
			});

		});
		return false;
	});
});

/* jquery - flexible conditionize - v1.1 - https://github.com/rguliev/conditionize.js - by Rustam Guliev at 2017-07-19*/
(function ($) {
	$.fn.conditionize = function (options) {
		var settings = $.extend({
			hideJS: true
		}, options);
		$.fn.showOrHide = function (is_met, $section) {
			if (is_met) {
				$section.slideDown(100);
			} else {
				$section.slideUp(100);
			}
		}
		return this.each(function () {
			var $section = $(this);
			var cond = $(this).data('condition');

			// First get all (distinct) used field/inputs
			var re = /(#?\w+)/ig;
			var match = re.exec(cond);

			var inputs = {},
				e = "",
				name = "";
			while (match !== null) {
				name = match[1];
				e = (name.substring(0, 1) == '#' ? name : "[name=" + name + "]");
				if ($(e).length && !(name in inputs)) {
					inputs[name] = e;
				}
				match = re.exec(cond);
			}

			// Replace fields names/ids by $().val()
			for (name in inputs) {
				e = inputs[name];
				tmp_re = new RegExp("(" + name + ")\\b", "g")
				if ($(e).attr('type') == 'radio') { //  $(e).attr('type') == 'checkbox'
					cond = cond.replace(tmp_re, "$('" + e + ":checked').val()");
				} else {
					cond = cond.replace(tmp_re, "$('" + e + "').val()");
				}
			}

			//Set up event listeners
			for (name in inputs) {
				$(inputs[name]).on('change', function () {
				
					$.fn.showOrHide(eval(cond), $section);
				});
			}

			//If setting was chosen, hide everything first...
			if (settings.hideJS) {
				$(this).hide();
			}
			//Show based on current value on page load
			$.fn.showOrHide(eval(cond), $section);
		});
	}
}(jQuery));


