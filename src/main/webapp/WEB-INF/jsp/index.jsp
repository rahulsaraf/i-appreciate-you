<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="google-signin-client_id" content="67690013470-b02t3o44sn4tg7kpon2fau36n7hba5h9.apps.googleusercontent.com">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>I Appreciate You</title>

<!-- Fonts Online -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800,300' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

<!-- Style Sheet -->
<link rel="stylesheet" href="/iappreaciateyou/static/css/owl.carousel.css">
<link rel="stylesheet" href="/iappreaciateyou/static/css/main-style.css">
<link rel="stylesheet" href="/iappreaciateyou/static/css/style.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>

<div id="main-wrapper"> 
  <div class="box-shadow-for-ui">
    <div class="uou-block-2b">
      <div class="container"> <a href="#" class="logo"><img src="/iappreaciateyou/static/images/logo.png" alt=""></a> <a href="#" class="mobile-sidebar-button mobile-sidebar-toggle"><span></span></a>
      </div>
    </div>
    <!-- end .uou-block-2b --> 
  </div>
  
  <!-- HOME PRO-->
  <div class="home-pro"> 
    
    <!-- PRO BANNER HEAD -->
    <div class="banr-head">
    	<div class=" container banr-head-image"></div>
      <div class="container">
      
        <div class="row"> 
          
          <!-- CONTENT -->
          <div class="col-sm-8">
            <div class="text-area">
              <div class="position-center-center col-md-10">
               
              </div>
            </div>
          </div>
          
          <!-- FORM SECTION -->
          <div class="col-sm-4">
            <div class="login-sec"> 
              
              <!-- TABS -->
              <div class="uou-tabs">
                <ul class="tabs">
                  <li><a href="#register">Register Now</a></li>
                  <li class="active"><a href="#log-in">Member Login</a></li>
                </ul>
                
                <!-- REGISTER -->
                <div class="content">
                  <div id="register">
                  <div id="errorMessage">
			<c:if test="${not empty registerError}">
			    <div id = "error" class="alert alert-error alert-dismissible" role="alert">
            		<a href="#" class="close" data-dismiss="alert">&times;</a>
            			<strong>Error:</strong> ${registerError} </div>
    		</c:if>
   
    		
		</div>
                    <form name="register" action="register" method="POST">
                      <input type="text" placeholder="Full Name" name="full_name" required="">
                      <input type="email" placeholder="Email Address" name="email" required="">
                      <input type="text" placeholder="Phone" name="phone_num">
                      <input type="password" placeholder="Password" name="password" required="">
                      <button type="submit">Register</button>
                      <div class="login-with"> <span>Or login with:</span> <a href="#."><i class="fa fa-facebook"></i></a> <a href="#."><i class="fa fa-google"></i></a> <a href="#."><i class="fa fa-linkedin"></i></a> </div>
                    </form>
                    
                  </div>
                  
                  <!-- LOGIN -->
                  <div id="log-in" class="active">
                  <div id="errorMessage">
			<c:if test="${not empty loginError}">
			    <div id = "error" class="alert alert-error alert-dismissible" role="alert">
            		<a href="#" class="close" data-dismiss="alert">&times;</a>
            			<strong>Error:</strong> ${loginError} </div>
    		</c:if>
   
    		
		</div>
	        	
                  
                    <form name="login" action="login" method="POST">
                      <input type="email" placeholder="Email Address" name="email" required="">
                      <input type="password" placeholder="Password" name="password" required="">
                      
                      <button type="submit">Login</button>
                      
                      <div class="login-with"> <span>Or login with:</span> <a href="#."><i class="fa fa-facebook"></i></a> <a id="google-signin"  href="#." ><i class="fa fa-google"></i></a> <a href="#."><i class="fa fa-linkedin"></i></a> </div>
                      
                      <div class="forget">Forgot your password? <a href="#.">Click Here</a></div>
                    </form>
                  </div>
                  <div id="forget">
                    <form>
                      <input type="email" placeholder="Email Address">
                      <button type="submit">Login</button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>



<div class="uou-block-4a secondary dark">
  <div class="container">
    <ul class="links">
      <li><a href="#">Privacy Policy</a></li>
      <li><a href="#">Terms &amp; Conditions</a></li>
    </ul>
    <p>Copyright &copy; 2015 <a href="#">UOUAPPS</a>. All Rights reserved.</p>
  </div>
</div>
<!-- end .uou-block-4a -->

<div class="uou-block-11a">
  <h5 class="title">Menu</h5>
  <a href="#" class="mobile-sidebar-close">&times;</a>
  <nav class="main-nav">
    <ul>
      <li class="active"><a href="index.html">Index</a></li>
      <li> <a href="listing-filter.html">Professionals</a> </li>
      <li><a href="profile_company.html">Profile Company</a></li>
      <li><a href="profile_company-no-tabs.html">Profile Company No Tabs</a></li>
      <li><a href="user-dashboard(connections)(hotkeys-disabled).html">User Dashboard 1</a></li>
      <li><a href="user-dashboard(connections)(hotkeys-enabled).html">User Dashboard 2</a></li>
      <li><a href="user-dashboard(followers).html">User Dashboard 3</a></li>
      <li><a href="user-dashboard(following).html">User Dashboard 4</a></li>
      <li><a href="blog-post.html">Blog Post</a></li>
      <li> <a href="user-profile(layout-1).html">User Profile</a></li>
      <li><a href="blog.html">Blog</a></li>
      <li><a href="gui-kit.html">GUI KIT</a></li>
    </ul>
  </nav>
  <hr>
</div>

<!-- Scripts --> 
<script src="https://maps.googleapis.com/maps/api/js"></script> 
<script src="/iappreaciateyou/static/scripts/js/jquery-2.1.3.min.js"></script> 
<script src="/iappreaciateyou/static/scripts/js/bootstrap.js"></script> 
<script src="/iappreaciateyou/static/scripts/js/superfish.min.js"></script> 
<script src="/iappreaciateyou/static/scripts/js/jquery.ui.min.js"></script> 
<script src="/iappreaciateyou/static/scripts/js/rangeslider.min.js"></script> 
<script src="/iappreaciateyou/static/scripts/js/jquery.flexslider-min.js"></script> 
<script src="/iappreaciateyou/static/scripts/js/uou-accordions.js"></script> 
<script src="/iappreaciateyou/static/scripts/js/uou-tabs.js"></script> 
<script src="/iappreaciateyou/static/scripts/js/select2.min.js"></script> 
<script src="/iappreaciateyou/static/scripts/js/owl.carousel.min.js"></script> 
<script src="/iappreaciateyou/static/scripts/js/gmap3.min.js"></script> 
<script src="/iappreaciateyou/static/scripts/js/scripts.js"></script> 
 <script src="https://apis.google.com/js/platform.js" async defer></script>
<script>
	function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile();
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail());
		}
		
	$('#google-signin').click(function(){
		onSignIn();
	});
	
	
	
</script>
</body>
</html>