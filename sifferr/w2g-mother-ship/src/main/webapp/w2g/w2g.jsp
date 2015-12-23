<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.jsp.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="pathPrefix" scope="page"  />
<c:set value="${pathPrefix}/pinkTheme/css" var="cssHome" scope="page" />
<c:set value="${pathPrefix}/pinkTheme/js" var="jsHome" scope="page" />
<c:set value="${pathPrefix}/pinkTheme/img" var="imagesHome" scope="page" />
<c:set value="${pathPrefix}/pinkTheme/theme" var="themeUIHome" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>W2G</title>
  <meta name="description" content="BRR">
  <meta name="organization" content="Sifferr" >
  <meta name="author" content="Shak">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0; user-scalable=1;">
  <link rel="stylesheet" href="${cssHome}/normalise.css">
  <link rel="stylesheet" href="${themeUIHome}/jquery-ui.css">
  <link rel="stylesheet" href="${cssHome}/w2g.css">
  <link rel="stylesheet" media="screen and (min-device-width: 800px)" href="${cssHome}/w2g800.css" />
  <link rel="stylesheet" media="screen and (max-device-width: 400px)" href="${cssHome}/w2gmobile.css" />
  <link rel="stylesheet" media="screen and (max-device-width: 360px)" href="${cssHome}/w2gmobile360.css" />
</head>
<body>
<form id="profileForm" action="interestProcessor" method="post">
	<div id="page01">
		<div class="section01">
					<select id="friendList" name="friendList" class="dropDownMenu">
			<c:forEach items="${friends}" var="friend">
				<option data-style="background-image: url(${friend.cover.source});">${friend.name}</option>
			</c:forEach>
		</select>
		</div>
		<div class="section01">
			<table data-role="table" class="table01" id="table01"
				class="ui-responsive">
				<thead>
					<tr>
						<TD  colspan="2" align="justify">Fill in as many fields as you
							can. The more information you give the better you stand.</TD>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="200px">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>Sex :</td>
						<td><select id="sex" name="sex" class="toggleSwitch"
							data-highlight="false">
								<option>Female</option>
								<option>Male</option>
						</select></td>
					</tr>
					<tr>
						<td>Orientation :</td>
						<td><select id="sexOrient" name="sexOrient"  class="dropDownMenu"
							data-highlight="false">
								<option selected>I prefer not to say</option>
								<option>Heterosexual</option>
								<option>Homosexual</option>
								<option>Bisexual</option>
								<option>Asexual</option>
						</select></td>
					</tr>
					<tr>
						<td>Dietary Preference: </td>
						<td>
						<select size="4" id="dietRestrict" name="dietRestrict"  class="ui-multiselectmenu-menu"
							data-highlight="false" multiple="multiple" >
								<option>Kosher</option>
								<option>Halaal</option>
								<option>Vegetarian</option>
								<option>Lacto-ovo Vegetarian</option>
								<option>Lacto Vegetarian</option>
								<option>Ovo Vegetarian</option>
								<option>Vegan</option>
								<option>Pescetarian</option>
								<option>Low sodium</option>
								<option>Low fat</option>
								<option>Dairy free</option>
								<option>Gluten free</option>
								<option>Organic</option>
								</select>
						</td>
					</tr>
</table>
		</div>
		<div class="section01" >
				<div style="width: 150px;float:left;">Favorite Color: <input type="hidden" name="userSelectedColor" value="" /></div><br>
			<div style="height: 50px;margin:20px 0px 5px 0px;">
				<div id="selectedColorHolder" style="border:1px solid black;float:left;border-radius:5px;">
					<div id="selectedColorName" style="height: 48px; width: 100px; float:left;line-height:48px;"><img height="24" width="24" src="${imagesHome}/button-refresh.png" /></div>
					<div id="selectedColorEasel" >Selected Color</div>
				</div>
			</div>
			<div>
				<span id="primaryColorHolder" >
					<input type="radio" id="primaryColorChoice_red" name="primaryColorChoice" value="0" checked="checked" /><label for="primaryColorChoice_red">&#149;</label>
					<input type="radio" id="primaryColorChoice_yellow" name="primaryColorChoice" value="1" /><label for="primaryColorChoice_yellow">&#149;</label>
					<input type="radio" id="primaryColorChoice_green" name="primaryColorChoice" value="2" /><label for="primaryColorChoice_green">&#149;</label>
					<input type="radio" id="primaryColorChoice_cyan" name="primaryColorChoice" value="3" /><label for="primaryColorChoice_cyan">&#149;</label>
					<input type="radio" id="primaryColorChoice_blue" name="primaryColorChoice" value="4" /><label for="primaryColorChoice_blue">&#149;</label>
					<input type="radio" id="primaryColorChoice_pink" name="primaryColorChoice" value="5" /><label for="primaryColorChoice_pink">&#149;</label>
					<input type="radio" id="primaryColorChoice_ruby" name="primaryColorChoice" value="6" /><label for="primaryColorChoice_ruby">&#149;</label>
				</span><br>
				<img src="${imagesHome}/left_arrow.png" id="colorFineTunerLow" class="colorFineTuner"/>
			<span id="colorSlider" >
				<span id="sliderHolder" ></span>
			</span>
				<img src="${imagesHome}/right_arrow.png" id="colorFineTunerHigh" class="colorFineTuner" />
			<div id="colorCarousel" class="closeCarousel">

			</div>
		</div>
		</div>
		
		<div class="section01">
		<div class="SectionTitle">Measurements:</div>
					<input name="tops_value" type="hidden"   />
				<input name="bottoms_value" type="hidden"   />
				<input name="footwear_value" type="hidden"   />
				<input name="gloves_value" type="hidden"   />
					<div>
					<table id="sliderTable" class="sliderGroup">
							<tr>
								<td valign="bottom">Shirt</td>
								<td valign="bottom">Pants</td>
								<td valign="bottom">Shoes</td>
								<td valign="bottom">Gloves</td>

							</tr>
							<tr>
								<td>
									<div id="m_tops" class="ui-size-slider" 
										class="toggleSwitch" data-highlight="false">
										<span data-tops="XS,S,S,S,M,M,M,L,L,XL,XL">Tops</span>
									</div>
								</td>
								<td>
									<div id="m_bottoms" class="ui-size-slider" class="toggleSwitch"
										data-highlight="false">
										<span data-bottoms="XS,S,S,S,M,M,M,L,L,XL,XL">Bottoms</span>
									</div>
								</td>
								<td>
									<div id="m_footwear" class="ui-size-slider"
										class="toggleSwitch" data-highlight="false">
										<span data-footwear="7,7H,8,8H,9,9H,10,10H,11,11H,12,12H,13">Footwear</span>
									</div>
								</td>
								<td>
									<div id="m_gloves" class="ui-size-slider" 
										data-highlight="false">
										<span data-gloves="S,M,L,XL">gloves</span>
									</div>
								</td>

							</tr>
							<tr>
								<td id="m_tops_value"></td>
								<td id="m_bottoms_value"></td>
								<td id="m_footwear_value"></td>
								<td id="m_gloves_value"></td>

							</tr>
						</table>
					
					</div>

		</div>
		
			<div class="section01">

			<table data-role="table" class="table01" id="table02" class="ui-responsive">
				<tr>
					<td width="200px">Measurements:</td>
					<td>
					<div>
					<table id="sliderTable" class="sliderGroup" border="2">
							<tr>
								<td valign="bottom">Shirt</td>
								<td valign="bottom">Pants</td>
								<td valign="bottom">Shoes</td>
								<td valign="bottom">Gloves</td>

							</tr>
							<tr>
								<td>
									<div id="m_tops" class="ui-size-slider2" 
										class="toggleSwitch" data-highlight="false">
										<span data-tops="XS,S,S,S,M,M,M,L,L,XL,XL">Tops</span>
									</div>
								</td>
								<td>
									<div id="m_bottoms" class="ui-size-slider2" class="toggleSwitch"
										data-highlight="false">
										<span data-bottoms="XS,S,S,S,M,M,M,L,L,XL,XL">Bottoms</span>
									</div>
								</td>
								<td>
									<div id="m_footwear" class="ui-size-slider2"
										class="toggleSwitch" data-highlight="false">
										<span data-footwear="7,7H,8,8H,9,9H,10,10H,11,11H,12,12H,13">Footwear</span>
									</div>
								</td>
								<td>
									<div id="m_gloves" class="ui-size-slider2" class="toggleSwitch"
										data-highlight="false">
										<span data-gloves="S,M,L,XL">gloves</span>
									</div>
								</td>

							</tr>
							<tr>
								<td id="m_tops_value"></td>
								<td id="m_bottoms_value"></td>
								<td id="m_footwear_value"></td>
								<td id="m_gloves_value"></td>

							</tr>
						</table>
					
					</div>
					
					
					
					
					</td>
					</tr>
			</table>
		</div>
		
	
		<div class="section01">
		<div class="SectionTitle">Music:</div>
		<div>
					<div>	
						<select id="musicMain" name="musicMain"  class="dropDownMenu"
							data-highlight="false">
								<option selected>None</option>
								<option>Alternative</option>
								<option>Blues</option>
								<option>Children's Music</option>
								<option>Classical</option>
								<option>Comedy</option>
								<option>Commercial</option>
								<option>Country</option>
								<option>Dance</option>
								<option>Electronic</option>
								<option>Hip-Hop</option>
								<option>Holiday</option>
								<option>Indie Pop</option>
								<option>Industrial</option>
								<option>Inspirational</option>
								<option>Instrumental</option>
								<option>J-Pop</option>
								<option>Jazz</option>
								<option>Latin</option>
								<option>New Age</option>
								<option>Opera</option>
								<option>Pop</option>
								<option>R&amp;B</option>
								<option>Reggae</option>
								<option>Rock</option>
								<option>Soundtrack</option>
								<option>Tejano</option>
								<option>Vocal</option>
								<option>World</option>
						</select>
						</div>
		</div>

						
						<select id="moviesMain" name="moviesMain" class="dropDownMenu"
							data-highlight="false">
								<option>Action and Adventure</option>
								<option>Comedy</option>
								<option>Crime</option>
								<option>Drama</option>
								<option>History</option>
								<option>Horror</option>
								<option>Musical</option>
								<option>Science Fiction</option>
								<option>War</option>
								<option>Western</option>
						</select>

		
		</div>
		<div class="section01" >
		<div class="SectionTitle">Interests: </div>
			<div>

				<div id="alphabetList" class="alphabeList"
					style="width: 200px;; position: relative;">
					<input type="radio" id="a" name="alphabet" /><label for="a">A</label>
				</div>
				<div>
					<div id="interestsDiv" style="width:250px;" >
						<select id="interests" name="interests" class="dropDownMenu"
							data-highlight="false"></select>
					</div>
					<div style="">
					<button type="button" class="addbtn">Add</button>
					</div>
				</div>

			</div>
			<div id="hobbyHolder">
			<!--  hobby Item -->
				<div class="hobbyItem sortable" id="interest_0">
 					<div class="grab">&nbsp;</div>
					<div class="hobbyContent" >
						<table >
							<tr>
								<td class="interestName" height="50px" ></td>
							</tr>
							<tr>
								<td>Gear you own:  <img src="${imagesHome}/add.png" class="addGearItem gown" alt="Add Item" title="Add Item" />
								<div>
								<ol id="" class="gearOwn gearConnector">
								<li><span class="textStyle"><input type="text" name="lname"></span><span class="textdelete"><img height="10px" width="10px" src="${imagesHome}/close.png" /></span><span class="gearSort"><img  src="${imagesHome}/up_down.png" /></span>
								<li><span class="textStyle"><input type="text" name="lname"></span><span class="textdelete"><img height="10px" width="10px" src="${imagesHome}/close.png" /></span><span class="gearSort"><img  src="${imagesHome}/up_down.png" /></span>
								<li><span class="textStyle"><input type="text" name="lname"></span><span class="textdelete"><img height="10px" width="10px" src="${imagesHome}/close.png" /></span><span class="gearSort"><img  src="${imagesHome}/up_down.png" /></span>
								</ol>
								</div>
								</td>
							</tr>
							<tr>
								<td>Gear you need:  <img src="../img/add.png" class="addGearItem gown" alt="Add Item" title="Add Item" />
								<div>
								<ol id="" class="gearNeed gearConnector">
								<li><span class="textStyle"><input type="text" name="lname"></span><span class="textdelete"><img height="10px" width="10px" src="${imagesHome}/close.png" /></span><span class="gearSort"><img  src="${imagesHome}/up_down.png" /></span>
								<li><span class="textStyle"><input type="text" name="lname"></span><span class="textdelete"><img height="10px" width="10px" src="${imagesHome}/close.png" /></span><span class="gearSort"><img  src="${imagesHome}/up_down.png" /></span>
								<li><span class="textStyle"><input type="text" name="lname"></span><span class="textdelete"><img height="10px" width="10px" src="${imagesHome}/close.png" /></span><span class="gearSort"><img  src="${imagesHome}/up_down.png" /></span>
								</ol>
								</div>
								</td>
							</tr>
							<tr>
								<td colspan="2"></td>
							</tr>
						</table>
							
					</div>
				</div>
			<!--  hobby Item end -->
				
			</div>
			<div style="text-align: center">
				<button class="defaultButtonStyle" type="button"> Add </button>
				<input class="defaultButtonStyle" type="submit" value="Submit" />
			</div>
		</div>
</div>
						</form>

				<div id="colorTemplate" class="colorBlock" style="display:none" >
					<div class="colorEl"></div>
					<div class="colorName"></div>
				</div>

	<script src="${jsHome}/jquery.js"></script>
	<script src="${jsHome}/jquery-ui.js"></script>
	<script src="${jsHome}/jquery.ui.touch-punch.min.js"></script>
	<script src="${jsHome}/jquery.imgpreload.min.js"></script>
	<script src="${jsHome}/jquery-ui.toggleSwitch.js"></script>
	<script type="text/javascript" src="${jsHome}/jquery.ui.labeledslider.js">
	</script>
	<script src="${jsHome}/modernizr-2.0.6.min.js"></script>
	<script src="${jsHome}/w2g.js"></script>
	<script>
	  var colorCaro = null;

	  var colorElDivMain = null;
	$(function(){
	   colorElDivMain = $("#colorTemplate");
		var charCodeRange = {
				start: 65,
				end: 90
			}
		var list='';
			for (var cc = charCodeRange.start; cc <= charCodeRange.end; cc++) {
				list+='<input type="radio" value="'+(String.fromCharCode(cc).toLowerCase())+'" id="'+(String.fromCharCode(cc).toLowerCase())+'" name="alphabet" /><label for="'+(String.fromCharCode(cc).toLowerCase())+'">'+(String.fromCharCode(cc))+'</label>\n';
		}
			list+='<input type="radio" value="*" id="NILL" name="alphabet" checked="true" /><label for="NILL">*</label>\n';
		$("#alphabetList").html(list);
		$("#alphabetList").buttonset();
		updateHobbyList(null);
		$("#alphabetList input[type=radio]").change(function(){
			updateHobbyList(this.value);
			});

		$( ".ui-size-slider2> span" ).each(function() {
			// read initial values from markup and remove that\
			var thisId=$( this ).parent().attr('id').split("_")[1];
			var values =  $( this ).attr('data-'+thisId).split(',');

			$( this ).empty().labeledslider({
				
				highlight:true,
				value:0,
				range:"min",
				step:1,
				min:0,
				max:values.length-1,
				tickLabels:values,
				tickInterval:4,
				animate: true,
				orientation: "vertical",
				create:function(event,ui){
					//$('#'+($(this).parent().attr('id'))+'_value').text(values[0]);
				},
				slide:function(event,ui){
					//$('#'+($(this).parent().attr('id'))+'_value').text(values[ui.value]);
				}
			});
		});


	});


	function updateHobbyList(v){
			var x = parseInt(v!=null?v.charCodeAt(0):0);
			var textVal='None';
			var keyVal="*";
			if ((x>64 && x<91) || (x>96 && x<123)){
				textVal=v.toUpperCase();
				keyVal=textVal;
				}
			if(x==42 || v==null){
				textVal='A-Z';
				}
		$.ajax({url:"iws",data:{alphabet:''+keyVal},success:function(result){
			var i=0;
		    var selectOption='<select style="width:100%;" id="interests" name="interests" class="dropDownMenu"	data-highlight="false">';
		    selectOption+="<option value=\"0\" selected disabled>"+textVal+"</option>";
			for(var i=0;i<result.length;i++){
				selectOption+="<option value=\""+result[i].id+"\">"+result[i].name+"</option>";
				}
			selectOption+='</select>';
			$("#interestsDiv").html(selectOption);
			$("select.dropDownMenu").each(function(i,item) {
				$(item).selectmenu().selectmenu( "menuWidget" ).addClass("selectmenuMaxHeight");
			});
		  }});
		  }

	  function addInterest(selectedOption){
		  var interestElId=$("div#interest_0").attr("id");
		  var idCount = parseInt(interestElId.substring(interestElId.indexOf("_")+1,interestElId.length));
		  var newInterestElement = $("div#interest_0 td.interestName_0").clone();
		  newInterestElement.attr('id','iterest_'+idCount+1);
		  var newInterestElementId = newInterestElement.attr('id');
			$(newInterestElementId+" td.interestName").text(selectedOption.text());
		  }

	  function getColorRangeNamedValues(hueVal){
		  var colorCaro = $("#colorCarousel");
		  if(!colorElDivMain) colorElDivMain = $("#colorTemplate");
		  var colorElDiv = null;
			$.ajax({url:"colors",data:{hue:''+hueVal},success:function(result){
				  var selectOption="";
				  colorCaro.html('');
				  for(var i=0;i<result.length;i++){
						colorElDiv=colorElDivMain.clone(true);
		  				colorElDiv.attr('id','colorChoice'+i);
		  				colorElDiv.css('display','block');
		  				colorElDiv.css('float','left');
					  	colorElDiv.find('.colorEl').css('background','#'+result[i].hexCode);
					  	colorElDiv.click({colorName:result[i].color,color: '#'+result[i].hexCode, id:result[i].Id },function(e){
							  	$("#selectedColorEasel").css('background-color','#'+e.data.color);
							  	$("#selectedColorEasel").css('color',jQuery.Color('#'+e.data.color).contrastColor());
							  	$("#selectedColorEasel").text(e.data.colorName);
							  	$("input[name='userSelectedColor']").val(''+e.data.id);
						  	});
					  	//colorElDiv.find('.colorEl').html(''+result[i].hue+' '+result[i].saturation+' '+result[i].lightness);
					  	colorElDiv.find('.colorName').html(result[i].color);
		  				var caroHeight = colorCaro.css('height').replace(/[^-\d\.]/g, '');
		  				var  ht =  (caroHeight==null)?0:parseInt(caroHeight);

		  				if(ht<76) {
			  				try{
		  					//colorCaro.css('height',ht+175);
		  					colorCaro.switchClass( "closeCarousel","openCarousel",1000, "easeOutBounce");
				  				}catch(e){alert(e);}
			  				}
				  			colorElDiv.appendTo(colorCaro);
				  }
			  }});
		  }

	/*	    $( "#profileForm input[type=submit]" )
		      .button()
		      .click(function( event ) {
		 		alert('Form submitted...');
		        event.preventDefault();
		      });
*/
	</script>
	<div id="ColorSampler" style="margin:0px;padding:0px;background-color:blue;display:none;z-index:1000;top:0px;left:0px;position:absolute;height:100%;width:100%"><span style="float:right;"  ><img src="../theme/images/modalClose.png"/></span></div>
</body>
</html>
		