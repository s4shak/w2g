
var colorButtonsWidth=23;

$(function() {
	"use strict";
	Modernizr.addTest("macosx", function () {
		var strIndex = navigator.userAgent.toLowerCase().indexOf("mac");
		return (strIndex > -1);
	});
	
	$.imgpreload( '../img/grab.png',
			  '../theme/images/slider_handles2.png'
			);
	jQuery.Color.fn.contrastColor = function() {
		var r = this._rgba[0], g = this._rgba[1], b = this._rgba[2];
		return (((r*299)+(g*587)+(b*144))/1000) >= 131.5 ? "black" : "white";
	};
	
	$(window).on("scroll",function(){
		console.log('Scrolling..');
		if($("#ColorSampler").css('display')!='none'){
			console.log(' '+$("#ColorSampler").css('top'));
			$("#ColorSampler").css('top',$(window).scrollTop());
		}
	});
	$("#ColorSampler span img").on('click',function(){
		$("#ColorSampler").css('display','none');
	});
	//extend selectmenu to add a placeholder
	$.widget( 'app.selectmenu', $.ui.selectmenu, {
	    _drawButton: function() {
	        this._super();
	        
	        var selected = this.element
	                .find( '[selected]' )
	                .length,
	            placeholder = this.options.placeholder;
	        
	        if ( !selected && placeholder ) {
	            this.buttonText.text( placeholder );    
	        }
	    }
	});
	
	//add toggle switch to binary select
	$("select.toggleSwitch").each(function(i,item) {
		$(item).toggleSwitch({
			highlight: $(item).data("highlight"),
			width: 25
		});
	});
	
	$("select.dropDownMenu").each(function(i,item) {
		$(item).selectmenu().selectmenu( "menuWidget" ).addClass("selectmenuMaxHeight");
	});
	
	/*Not yet implemented
	 * Should be implemented in w2g.js
	$("select.ui-multiselectmenu-menu").each(function(i,item) {
		$(item).multiselectmenu();
	});
	*/
	$("button.addbtn").button({
		icons: {
	        primary: "ui-icon-plusthick "
	      }
	}).click(function(e){
		var selectedOption = $("select[name='interests'] option:selected");
		addInterest(selectedOption);
	}).focus(function (e){
		this.blur();
	});
	
	$(".defaultButtonStyle").button().focus(function (e){
		this.blur();
	});
	
	
	$( ".ui-size-slider> span" ).each(function() {
		// read initial values from markup and remove that\
		var thisId=$( this ).parent().attr('id').split("_")[1];
		var values =  $( this ).attr('data-'+thisId).split(',');

		$( this ).empty().slider({
			highlight:true,
			value:0,
			range:"min",
			step:1,
			min:0,
			max:values.length-1,
			animate: true,
			orientation: "vertical",
			create:function(event,ui){
				$('#'+($(this).parent().attr('id'))+'_value').text(values[0]);
			},
			slide:function(event,ui){
				$('#'+($(this).parent().attr('id'))+'_value').text(values[ui.value]);
				//alert($(''+($(this).parent().attr('id'))+''));
			}
		});
	});
	
   // $( "div.hobbyItem" ).draggable({ handle: "div.grab" });
	    $("#hobbyHolder").sortable({
		placeholder : "clone",
		connectWith : "#hobbyHolder",
		dropOnEmpty : false,
		handle : "div.grab",
		start : function(event, ui) {
			ui.placeholder.height(ui.item.height());
		}
	});
    
    $("#primaryColorHolder").buttonset().buttonset("refresh");

    $("#primaryColorHolder").each(function(){
    	var e = $(this).children('input [type=radio]');
    	$(this).find('label').each(function(){
    		var thisRadiosId = $(this).attr('for');
    		var hueVal = parseInt($('#'+thisRadiosId).val())*60;
    		$(this).find('.ui-button-text').each(function(){
    			$(this).css('color','hsla('+hueVal+',100%,50%,1)');
    			$(this).css('text-shadow', '-1px -1px 0px rgba(0, 0, 0, 1)');
    			$(this).css('font-size', '.8em');
    		});
    	});
    });
    //$("#primaryColorHolder .ui-buton .ui-button.text").css({'color':jQuery.Color({saturation:this.parent.val()})});
    $("#sliderHolder").width($("#primaryColorHolder").width()-(colorButtonsWidth*2));
    var clrSlider = $("#sliderHolder").slider({
        min: 0,
        max: 360,
        range: "true",
        step:1,
        animate:'500',
        value: $('#primaryColorHolder input:radio:checked').val(),
        orientation: 'horizontal',
        change: function (event, ui) {
        	updateColorSlideEvent(event,ui);
        }
    });
    
	function updateColorSlideEvent(event,ui){
	    var vl = parseInt(ui.value);
	    var primaryClrVal=vl%60>30?parseInt(vl/60)+1:parseInt(vl/60);
	    $('#primaryColorHolder input:radio[value='+primaryClrVal+']').prop('checked','true').button('refresh');
	    getColorRangeNamedValues(vl);
	}	  
	
    $("#primaryColorHolder :radio").click(function(e) {
    	var vl=$(this).val();
    	vl=vl!=null?vl*60:0;
    	clrSlider.slider('option','value', vl);
     });
    $(".colorFineTuner").click(function(e) {
    	var colorFineTunerId=$(this).attr('id');
    	var clrValue=clrSlider.slider( "option", "value" );
    	clrValue = (clrValue!=null)?parseInt(clrValue):0;
    	
    	if(colorFineTunerId=='colorFineTunerLow'){
    		if(clrValue==0) return;
    		clrValue--;
    	}
    	if(colorFineTunerId=='colorFineTunerHigh'){
    		if(clrValue==360) return;
    		clrValue++;	
    	}
    	//alert(colorFineTunerId+"  "+clrValue);
    	/*
    	var vl=$(this).val();
    	vl=vl!=null?vl*60:0;
    	 */
    	clrSlider.slider('option','value', clrValue);
     });   
    
	$("ol.gearOwn, ol.gearNeed").sortable({
		placeholder:'close',
		connectWith:'.gearConnector',
		opacity: 0.5,
		revert:false,
		dropOnEmpty : true,
		handle : "span.gearSort",
		start : function(event, ui) {
			ui.placeholder.height(ui.item.height());
		}
	});
//	$("ol#gearNeed").sortable({
//		placeholder:'close',
//		connectWith:'.gearConnector',
//		dropOnEmpty : true,
//		handle : "span.gearNeedSort",
//		revert:true,
//		start : function(event, ui) {
//			ui.placeholder.height(ui.item.height());
//		}
//	});
	$("span.textdelete img").click(function(){
		var totalListElements = $(this).closest("li").siblings().size()+1;
		if(parseInt(totalListElements)>1) $(this).closest("li").remove();
		else alert("Atleast one required.");
	});

	$("#selectedColorEasel").on('click',function(){
		console.log($(this).text());
		if($(this).text().toLowerCase()!='Selected color'.toLowerCase()){
			$("#ColorSampler").css('display','block');
			$("#ColorSampler").css('top',$(window).scrollTop());
			$("#ColorSampler").css('background-color',$(this).css('background-color'));
		}
	});
});