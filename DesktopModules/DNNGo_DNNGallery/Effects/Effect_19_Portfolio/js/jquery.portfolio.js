

(function($){
    
        
$.fn.portfolio = function(o) {
    o = $.extend({ smallContWidth: 300, filter: '*' }, o);
    this.each(function(){
         	var $container =  $(this).find('.portfolio_block');
	        var $smallBox = $(this).find('.element');
	        var ContWidth = $container.width();
	        smallleft = parseInt($smallBox.css("margin-left")=="auto"?0:$smallBox.css("margin-left"));
	        smallRight = parseInt($smallBox.css("margin-Right")=="auto"?0:$smallBox.css("margin-Right"));
	        $smallBox.css("width", Math.floor(ContWidth / Math.floor(ContWidth / (o.smallContWidth + smallleft + smallRight)) - smallleft - smallRight) + "px");
	
 	        if (Math.floor(ContWidth / o.smallContWidth) == 0) {
		        $smallBox.css("width", "100%");
	        }
		    $container.isotope({ filter: o.filter });

	        jQuery(window).resize(function() {
		        var ContWidth = $container.width();
		        $smallBox.css("width", Math.floor(ContWidth / Math.floor(ContWidth / (o.smallContWidth + smallleft + smallRight)) - smallleft - smallRight) + "px");
		        if (Math.floor(ContWidth / o.smallContWidth) == 0) {
			        $smallBox.css("width", "100%");
		        }
	        });
 
	        $(this).find('.options .optionset a').click(function() {
 		        var $this = $(this);
		        // don't proceed if already selected
		        if ($this.parent('li').hasClass('selected')) {
			        return false;
		        }
		        var $optionSet = $this.parents('.optionset');
		        $optionSet.find('.selected').removeClass('selected');
		        $this.parent('li').addClass('selected');
		        // make option object dynamically, i.e. { filter: '.my-filter-class' }
		        var options = {},
		        key = $optionSet.attr('data-option-key'),
		        value = $this.attr('data-option-value');
		        // parse 'false' as false boolean
		        value = value === 'false' ? false: value;
		        options[key] = value;
		        if (key === 'layoutMode' && typeof changeLayoutMode === 'function') {
			        // changes in layout modes need extra logic
			        changeLayoutMode($this, options);
		        } else {
			        // otherwise, apply new options
			        $this.parents('.filter_Box').find('.portfolio_block').isotope(options);
		        }
		
		        return false;
	        });

    });
    
    return this;

};

})(jQuery);









 