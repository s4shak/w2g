

$(function() {

	"use strict";

	Modernizr.addTest("macosx", function () {
		var strIndex = navigator.userAgent.toLowerCase().indexOf("mac");
		return (strIndex > -1);
	});

	$("select.toggleSwitch").each(function(i,item) {
		$(item).toggleSwitch({
			highlight: $(item).data("highlight"),
			width: 25
		});
	});
	
//	$( ".multi" ).each(function() {
//		
//		var values = new Array();
//		// read initial values from markup and remove that
//		var i=0;
//		$("option").each(function()
//				{
//			var obj=$( this );
//		var v =  obj.text();
//		values[i++]=v;
//		
//				});
//		var sliderEl=document.createElement('div');
//		$( sliderEl).slider({
//			value: v,
//			range: "min",
//			animate: true,
//			orientation: "vertical"
//		});
//		$(this).after(sliderEl);
//	});

});