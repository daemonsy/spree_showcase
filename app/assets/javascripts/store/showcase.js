//= require store/jquery.flexslider.min
// Put your own showcase trigger here if you wish to use another JS Library.

$(window).load(function() {
  $('.flexslider').flexslider({
	animation: "slide",              //String: Select your animation type, "fade" or "slide"
	slideDirection: "horizontal",   //String: Select the sliding direction, "horizontal" or "vertical"
	slideshow: true,                //Boolean: Animate slider automatically
	slideshowSpeed: 12000,           //Integer: Set the speed of the slideshow cycling, in milliseconds
	animationDuration: 500,         //Integer: Set the speed of animations, in milliseconds
	directionNav: false,             //Boolean: Create navigation for previous/next navigation? (true/false)
	controlNav: false,               //Boolean: Create navigation for paging control of each clide? Note: Leave true for manualControls usage
	keyboardNav: true,              //Boolean: Allow slider navigating via keyboard left/right keys
	mousewheel: false,              //Boolean: Allow slider navigating via mousewheel
	prevText: "Previous",           //String: Set the text for the "previous" directionNav item
	nextText: "Next",               //String: Set the text for the "next" directionNav item
	pausePlay: false,               //Boolean: Create pause/play dynamic element
	pauseText: 'Pause',             //String: Set the text for the "pause" pausePlay item
	playText: 'Play',               //String: Set the text for the "play" pausePlay item
	randomize: false,               //Boolean: Randomize slide order
	slideToStart: 0,                //Integer: The slide that the slider should start on. Array notation (0 = first slide)
	animationLoop: true,            //Boolean: Should the animation loop? If false, directionNav will received "disable" classes at either end
	pauseOnAction: true,            //Boolean: Pause the slideshow when interacting with control elements, highly recommended.
	pauseOnHover: false,            //Boolean: Pause the slideshow when hovering over slider, then resume when no longer hovering
	controlsContainer: "",          //Selector: Declare which container the navigation elements should be appended too. Default container is the flexSlider element. Example use would be ".flexslider-container", "#container", etc. If the given element is not found, the default action will be taken.
	manualControls: "",             //Selector: Declare custom control navigation. Example would be ".flex-control-nav li" or "#tabs-nav li img", etc. The number of elements in your controlNav should match the number of slides/tabs.
	start: function(){},            //Callback: function(slider) - Fires when the slider loads the first slide
	before: function(){},           //Callback: function(slider) - Fires asynchronously with each slider animation
	after: function(){},            //Callback: function(slider) - Fires after each slider animation completes
	end: function(){}               //Callback: function(slider) - Fires when the slider reaches the last slide (asynchronous)
	});
});

// $(document).ready(function() {
// 	$("#showcase").awShowcase({
// 		content_width:			940,
// 		content_height:			470,
// 		fit_to_parent:			true,
// 		auto:					true,
// 		interval:				13000,
// 		continuous:				false,
// 		loading:				true,
// 		// tooltip_width:			200,
// 		// tooltip_icon_width:		32,
// 		// tooltip_icon_height:	32,
// 		// tooltip_offsetx:		18,
// 		// tooltip_offsety:		0,
// 		arrows:					false,
// 		buttons:				false,
// 		btn_numbers:			false,
// 		keybord_keys:		false,
// 		mousetrace:				false, /* Trace x and y coordinates for the mouse */
// 		pauseonover:			true,
// 		stoponclick:			false,
// 		transition:				'hslide', /* hslide/vslide/fade */
// 		transition_delay:		300,
// 		transition_speed:		500,
// 		show_caption:			'show', /* onload/onhover/show */
// 		thumbnails:				true,
// 		thumbnails_position:	'outside-last', /* outside-last/outside-first/inside-last/inside-first */
// 		thumbnails_direction:	'horizontal', /* vertical/horizontal */
// 		thumbnails_slidex:		1, /* 0 = auto / 1 = slide one thumbnail / 2 = slide two thumbnails / etc. */
// 		dynamic_height:			false, /* For dynamic height to work in webkit you need to set the width and height of images in the source. Usually works to only set the dimension of the first slide in the showcase. */
// 		speed_change:			false, /* Set to true to prevent users from swithing more then one slide at once. */
// 		
// 		viewline:				false /* If set to true content_width, thumbnails, transition and dynamic_height will be disabled. As for dynamic height you need to set the width and height of images in the source. */
// 	});
// });
