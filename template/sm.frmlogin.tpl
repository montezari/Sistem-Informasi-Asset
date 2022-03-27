    <body class="login-body">
    <div class="container">
    <div class="form-box" id="login-box">
        <div class="header">Login Form</div>
        <form action="?m=admin.auth" method="post">
            <div class="body bg-gray">
                <div class="form-group">
                    <input type="text" name="edtUserName" class="form-control" placeholder="User ID"/>
                </div>
                <div class="form-group">
                    <input type="password" name="edtPassword" class="form-control" placeholder="Password"/>
                </div>          
                <div class="form-group">
                    <input type="checkbox" name="remember_me"/> Remember me
                </div>
            </div>
            <div class="footer">                                                               
                <button type="submit" class="btn bg-olive btn-block">SIGN IN</button>  
                <p><a href="#">&nbsp;</a></p>
                <a href="#" class="text-center">&nbsp;</a>
            </div>
        </form>
    </div>
    <script src="js/lib/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slideshow/js/jquery.easing.min.js"></script>
    <script src="js/slideshow/js/supersized.3.2.7.min.js"></script>
    <script src="js/slideshow/theme/supersized.shutter.min.js"></script>

<!--    
<script type="text/javascript">
	jQuery(function($){
		$.supersized({
			// Functionality
			slideshow               :   1,			// Slideshow on/off
			autoplay				:	1,			// Slideshow starts playing automatically
			start_slide             :   1,			// Start slide (0 is random)
			stop_loop				:	0,			// Pauses slideshow on last slide
			random					: 	0,			// Randomize slide order (Ignores start slide)
			slide_interval          :   3000,		// Length between transitions
			transition              :   1, 			// 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
			transition_speed		:	1000,		// Speed of transition
			new_window				:	1,			// Image links open in new window/tab
			pause_hover             :   0,			// Pause slideshow on hover
			keyboard_nav            :   1,			// Keyboard navigation on/off
			performance				:	1,			// 0-Normal, 1-Hybrid speed/quality, 2-Optimizes image quality, 3-Optimizes transition speed 
													// (Only works for Firefox/IE, not Webkit)
			image_protect			:	1,			// Disables image dragging and right click with Javascript
			// Size & Position						   
			min_width		        :   0,			// Min width allowed (in pixels)
			min_height		        :   0,			// Min height allowed (in pixels)
			vertical_center         :   1,			// Vertically center background
			horizontal_center       :   1,			// Horizontally center background
			fit_always				:	0,			// Image will never exceed browser width or height (Ignores min. dimensions)
			fit_portrait         	:   1,			// Portrait images will not exceed browser height
			fit_landscape			:   0,			// Landscape images will not exceed browser width
													   
			// Components							
			slide_links				:	'blank',	// Individual links for each slide (Options: false, 'num', 'name', 'blank')
			thumb_links				:	1,			// Individual thumb links for each slide
			thumbnail_navigation    :   0,			// Thumbnail navigation
			slides 					:  	[			// Slideshow Images
												{image : 'images/slides/img4.jpg', title : '-', thumb : '', url : ''},
												{image : 'images/slides/img5.jpg', title : '-', thumb : '', url : ''},
												{image : 'images/slides/img1.jpg', title : '-', thumb : '', url : ''}
										],
			// Theme Options			   
			progress_bar			:	1,			// Timer for each slide							
			mouse_scrub				:	0
		});
	});
</script>
-->