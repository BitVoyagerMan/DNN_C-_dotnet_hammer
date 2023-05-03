function themepunch_arrow_html(o){
	switch(o){
		case "news-header":
			return '<div class="tp-title-wrap" data-title="{{title}}"><div class="tp-arr-imgholder"></div><div class="tp-arr-img-over"></div><span class="tp-arr-titleholder">{{title}}</span></div>';
		case "hades":
			return '<div class="tp-arr-allwrapper"><div class="tp-arr-imgholder"></div></div>';
		case "ares":
			return '<div class="tp-title-wrap" data-title="{{title}}"><span class="tp-arr-titleholder">{{title}}</span></div>';
		case "hebe":
			return '<div class="tp-title-wrap" data-title="{{title}}"><span class="tp-arr-titleholder">{{title}}</span><span class="tp-arr-imgholder"></span></div>';
		case "hermes":
			return '<div class="tp-arr-allwrapper"><div class="tp-arr-imgholder"></div><div class="tp-arr-titleholder">{{title}}</div></div>';
		case "erinyen":
			return '<div class="tp-title-wrap" data-title="{{title}}"><div class="tp-arr-imgholder"></div><div class="tp-arr-img-over"></div><span class="tp-arr-titleholder">{{title}}</span></div>';
		case "zeus":
			return '<div class="tp-title-wrap"><div class="tp-arr-imgholder"></div></div>';
		case "dione":
			return '<div class="tp-arr-imgwrapper"><div class="tp-arr-imgholder"></div></div>';
		case "default":
			return '<span class="tp-bullet-image"></span><span class="tp-bullet-title"></span>';
		default:
			return '';
	}
};


function themepunch_bullet_html(o){
	switch(o){
		case "hades":
			return '<span class="tp-bullet-image"></span>';
		case "ares":
			return '<span class="tp-bullet-title" data-title="{{title}}">{{title}}</span>';
		case "hebe":
			return '<span class="tp-bullet-image"></span>';
		case "zeus":
			return '<span class="tp-bullet-image" data-title="{{title}}"></span><span class="tp-bullet-imageoverlay"></span><span class="tp-bullet-title">{{title}}</span>';
		case "metis":
			return '<span class="tp-bullet-img-wrap" data-title="{{title}}"><span class="tp-bullet-image"></span></span><span class="tp-bullet-title">{{title}}</span>';
		case "dione":
			return '<span class="tp-bullet-img-wrap" data-title="{{title}}"><span class="tp-bullet-image"></span></span><span class="tp-bullet-title">{{title}}</span>';
		case "uranus":
			return '<span class="tp-bullet-inner"></span>';
		case "default":
			return '<span class="tp-bullet-image"></span><span class="tp-bullet-title"></span>';
		default:
			return '';
	}
};

function themepunch_thumbnail_html(o){
	switch(o){
		case "news-header":
			return '<span class="tp-thumb-over" data-title="{{title}}"></span><span class="tp-thumb-title">{{title}}</span><span class="tp-thumb-more"></span>';
		case "hesperiden":
			return '<span class="tp-thumb-image" data-title="{{title}}"></span><span class="tp-thumb-title">{{title}}</span>';
		case "gyges":
			return '<span class="tp-thumb-img-wrap"><span class="tp-thumb-image"></span></span>';
		case "hades":
			return '<span class="tp-thumb-img-wrap"><span class="tp-thumb-image"></span></span>';
		case "custom":
			return '<span class="tp-thumb-image"></span>';
		case "erinyen":
			return '<span class="tp-thumb-over" data-title="{{title}}"></span><span class="tp-thumb-image"></span><span class="tp-thumb-title">{{title}}</span><span class="tp-thumb-more"></span>';
		case "zeus":
			return '<span class="tp-thumb-over" data-title="{{title}}"></span><span class="tp-thumb-image"></span><span class="tp-thumb-title">{{title}}</span><span class="tp-thumb-more"></span>';
		case "default":
			return '<span class="tp-thumb-image"></span><span class="tp-thumb-title"></span>';
		default:
			return '';
	}
}

function themepunch_tabs_html(o){
	switch(o){
		case "news-header":
			return '<div class="tp-tab-title" data-title="{{title}}">{{title}} <i style="float:right; margin-top:5px;" class="fa-icon-chevron-right"></i></div><div class="tp-tab-desc">{{param1}}</div>';
		case "hesperiden":
			return '<div class="tp-tab-content" data-title="{{title}}"><span class="tp-tab-date">{{param1}}</span><span class="tp-tab-title">{{param2}}</span></div><div class="tp-tab-image"></div>';
		case "gyges":
			return '<div class="tp-tab-content" data-title="{{title}}"><span class="tp-tab-date">{{param1}}</span><span class="tp-tab-title">{{title}}</span></div><div class="tp-tab-image"></div>';
		case "hades":
			return '<div class="tp-tab-inner" data-title="{{title}}"><span class="tp-tab-title">{{param1}}</span><span class="tp-tab-price">{{param2}}</span>  <span class="tp-tab-button">{{param3}}</span></div>';
		case "ares":
			return '<div class="tp-tab-content" data-title="{{title}}"><span class="tp-tab-date">{{param1}}</span><span class="tp-tab-title">{{param2}}</span></div><div class="tp-tab-image"></div>';
		case "hebe":
			return '<div class="tp-tab-title" data-title="{{title}}">{{param1}}</div><div class="tp-tab-desc">{{title}}</div>';
		case "hermes":
			return '<span class="tp-tab-image"></span><span class="tp-tab-content-wrapper"><span class="tp-tab-bg"></span><span class="tp-tab-content"> <span class="tp-tab-date">{{param1}}</span> <span class="tp-tab-title">{{param2}}</span></span></span>';
		case "custom":
			return '<span class="tp-tab-image"></span>';
		case "erinyen":
			return '<div class="tp-tab-title" data-title="{{title}}">{{title}}</div><div class="tp-tab-desc">{{description}}</div>';
		case "zeus":
			return '<span class="tp-tab-title" data-title="{{title}}">{{title}}</span>';
		case "metis":
			return '<div class="tp-tab-wrapper" data-title="{{title}}"><div class="tp-tab-number">{{param1}}</div><div class="tp-tab-divider"></div><div class="tp-tab-title-mask"><div class="tp-tab-title">{{title}}</div></div></div>';
		default:
			return '';
	}
}





