/**
 * 
 */
jQuery.fn.multiselectmenu = function (params) {
	
    var defaults = {
            highlight: true
        };

        var options = $.extend({}, defaults, params);
        
        $(this).each(function (i, item) {
            multiselectmenuGen(item);
        });
        
        function multiselectmenuGen(selectedObj){
        	alert(selectedObj);
        }
};