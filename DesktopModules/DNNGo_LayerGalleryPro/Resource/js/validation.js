(function($) {
	$.fn.newValidator = function(op) {
		var e = $(this);
		var notEmpty = function(o) {
			if (o) {
				return true
			} else {
				return false
			}
			
		}
		var plusint = function(o) {
			Str = /^[0-9]*$/;
			if (!o || Str.test(o)) {
				return true
			} else {
				return false
			}
		}
		var floating = function(o) {
			Str = /^(-?\d+)(\.\d+)?$/;
			if (!o || Str.test(o)) {
				return true
			} else {
				return false
			}
		}
		if(e.data("validation")){
			var s=e.data("validation").split(",");
			for(i=0;i<s.length;i++){
				if(s[i]=="plusint"){
					e.on("keyup blur",function(){
						if(!plusint(e.val())){
							e.val(parseInt(e.val())?parseInt(e.val().replace(/-/g,"")):"0")
						}
					})
				}
				if(s[i]=="int"){
					e.on("keyup blur",function(){
						if(!plusint(e.val()) && e.val()!="-" ){
							e.val(parseInt(e.val())?parseInt(e.val()):"0")
						}
					}) 
				}
				if(s[i]=="notEmpty"){
					e.on("keyup blur",function(){
						if(notEmpty(e.val())){
							e.removeClass("error")
						}else{
							e.addClass("error")
						}
					})
				}

				if(s[i]=="unitint"){
					e.on("keyup blur",function(){
						if( e.val().charAt(e.val().length-1) == "%"  && e.val()!="-"){
							e.val(parseInt(e.val())?parseInt(e.val())+"%":"0")
						}else if(e.val().charAt(e.val().length-1) == "p" || e.val().charAt(e.val().length-1) == "x"  && e.val()!="-"){
							e.val(parseInt(e.val())?parseInt(e.val())+"px":"0")
						}else if(!plusint(e.val())){
							e.val(parseInt(e.val())?parseInt(e.val()):"0")
						}
					})
				}
				if(s[i]=="highint"){
					e.on("keyup blur",function(){
						if(e.val().charAt(e.val().length-1) == "c" || e.val()=="center"){
							e.val("center")
						}else if(e.val().charAt(e.val().length-1) == "r" || e.val()=="right"){
							e.val("right")
						}else if(e.val().charAt(e.val().length-1) == "b" || e.val()=="bottom" ){
							e.val("bottom")
						}else if(e.val().charAt(e.val().length-1) == "l" || e.val()=="left" ){
							e.val("left")
						}else if(e.val().charAt(e.val().length-1) == "t" || e.val()=="top" ){
							e.val("top")
						}else if( e.val().charAt(e.val().length-1) == "%" && e.val()!="-"){
							e.val(parseInt(e.val())?parseInt(e.val())+"%":"0")
						}else if(e.val().charAt(e.val().length-1) == "p"  || e.val().charAt(e.val().length-1) == "x"  && e.val()!="-"){
							e.val(parseInt(e.val())?parseInt(e.val())+"px":"0")
						}else if(!plusint(e.val())&& e.val()!="-"){
							e.val(parseInt(e.val())?parseInt(e.val()):"0")
						}
					})
				}
				if(s[i]=="floating"){
					e.on("keyup blur",function(){
						var e_val =e.val();
						if(e_val=="-"){ 
							return;
						}else if(!floating(e_val) && e.val().charAt(e_val.length-1) == "-" ) {
							e.val("-" +parseFloat(e.val()));
						}else if(!floating(e_val) && e.val().charAt(e_val.length-1) != "." ){
							e.val(parseFloat(e_val)?parseFloat(e_val):"0")
						}
					})
				}
				if(s[i]=="string"){
					e.on("blur",function(){
					//	e.val(e.val().replace(/</g,"&lt;").replace(/>/g,">").replace(/\"/g,"""));
					})
				}
				if(s[i]=="mp4"){
					e.on("blur",function(){
						if(!e.val().indexof(".mp4")>=0 || !e.val().indexof(".m4v")>=0 ){
							e.css("border","1px solid #F00")
						}


					})
				}


			}
		}	
	}
	
})(jQuery);