<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>I Appreciate You - Profile</title>

<!-- Fonts Online -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800,300' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

<!-- Style Sheet -->
<link rel="stylesheet" href="/iappreciateyou/static/css/owl.carousel.css">
<link rel="stylesheet" href="/iappreciateyou/static/css/style.css">
<link rel="stylesheet" href="/iappreciateyou/static/css/main-style.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<style>
.kv-avatar .file-preview-frame,.kv-avatar .file-preview-frame:hover {
    margin: 0;
    padding: 0;
    border: none;
    box-shadow: none;
    text-align: center;
}
.img-profile > input {
    display: none;
}
</style>

</head>

<body>
<div id="main-wrapper"> 
 
  <div class="box-shadow-for-ui">
    <div class="uou-block-2b">
      <div class="container"> <a href="#" class="logo"><img src="/iappreciateyou/static/images/logo.png" alt=""></a> <a href="#" class="mobile-sidebar-button mobile-sidebar-toggle"><span></span></a>
      </div>
    </div>
    <!-- end .uou-block-2b --> 
  </div>
  
  <div class="compny-profile"> 
    <!-- SUB Banner -->
    
    <div class="profile-bnr user-profile-bnr">
      <div class="container">
        <div class="pull-left">
          <h2>${user.fullName}</h2>
          <h5>${user.currentOrg}</h5>
        </div>
        
        <!-- Top Riht Button -->
        <div class="right-top-bnr">
          <div class="connect">
          
          <a href="#." class="upload"><i class="fa fa-upload"></i> Upload Cover Photo</a>
          <a href="#." data-toggle="modal" data-target="#myModal"><i class="fa fa-user-plus"></i> Connect</a> <a href="#."><i class="fa fa-share-alt"></i> Share</a> <a href="#." class="logout"><i class="fa fa-sign-out"></i> Logout</a>
            <div class="bt-ns"> <a href="#."><i class="fa fa-bookmark-o"></i> </a> <a href="#."><i class="fa fa-envelope-o"></i> </a> <a href="#."><i class="fa fa-exclamation"></i> </a> </div>
            <form name = "avatarBgUpload" action="avatarBgUpload" method="post" enctype="multipart/form-data" id="myForm" style="visibility:hidden;">
  			<input type="file" name="file" />
  			<input type="hidden" name="user" value="${user.userId}"/>
  			<input type="submit" name="upload" value="Submit"/>
		</form>
		<form action="logout" method="post" enctype="multipart/form-data" id="logoutForm" style="visibility:hidden;">
		<input type="submit" name="logout" value="Submit"/>
		</form>
          </div>
        </div>
      </div>
      
      <!-- Modal POPUP -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="container">
              <h6><a class="close" href="#." data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></a> Send Message</h6>
              
              <!-- Forms -->
              <form action="addConnection">
                <ul class="row">
                  <li class="col-xs-6">
                    <input id = "connectEmail" type="text" placeholder="Name or Email" name="nameEmail">
                    <input type="hidden" id="connectEmailId" name="userId">
                    <button class="btn btn-primary">Connect</button>
                  </li>
                </ul>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Profile Company Content -->
    <div class="profile-company-content user-profile main-user" data-bg-color="f5f5f5">
      <div class="container">
        <div class="row"> 
          
          <!-- Nav Tabs -->
          <div class="col-md-12">
            <ul class="nav nav-tabs">
              <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
              <li><a data-toggle="tab" href="#Con-tab">Connections</a></li>
              <li><a data-toggle="tab" href="#profile">Profile</a></li>
            </ul>
          </div>
         
          
          <!-- Tab Content -->
          <div class="col-md-12">
            <div class="tab-content"> 
              
              <div id="home" class="tab-pane fade in active">
              
              <!-- Tab Content -->
          <div class="col-md-8">
            <div class="network">
              <h4>Network</h4>
              
              <!-- Nav Tabs -->
              <ul class="nav nav-tabs" style="position:relative; top:0px;">
                <li class="active"><a data-toggle="tab" href="#connec">Post Appreciation</a></li>
                <li><a id="appreciationsPosted" onClick="loadCss()" data-toggle="tab" href="#flow">Appreciations Posted</a></li>
                <li><a id="appreciationsReceived" data-toggle="tab" href="#flowing">Appreciations Received</a></li>
              </ul>
              
              <!-- Tab Content -->
              <div class="tab-content"> 
                
                <!-- Connections -->
                <div id="connec" class="tab-pane fade in active">
                  <div class="net-work-in"> 
                   
                     
                    <!-- Members -->
                    <div class="main-mem"> 
                    <form action="postApp" method="POST">
                    <label for="nameEmail">Name:</label>
                      <input id = "email_val" type="text" placeholder="Name or Email Address" name="nameEmail">
                      <input id = "email_val_id" type="hidden" name="userId">
                      <label for="message">Message:</label>
                   	  <textarea placeholder="Your Message" name="message"></textarea>
                   	 	<input type="hidden" name="happy" id="happy" value="0"> 
                   	  <input type="hidden" name="helpful" id="helpful" value="0">
                   	  <input type="hidden" name="easygoing" id="easygoing" value="0">
                   	  <input type="hidden" name="fun" id="fun" value="0">
                   	  <input type="hidden" name="respectful" id="respectful" value="0">
                   	  <input type="hidden" name="confident" id="confident" value="0">
                   	  <input type="hidden" name="emotional" id="emotional" value="0">
                   	  <input type="hidden" name="motivated" id="motivated" value="0">
                   	  <input type="hidden" name="compassionate" id="compassionate" value="0">
                   	  <label for="message">Highlight Qualities related to this Appreciation:</label></br>
                   	 	  <a class = "main-mem" id="happy_b" class="btn btn-primary">Happy</a>
                   	 	  <a class = "main-mem" id="helpful_b" class="btn btn-primary">Helpful</a>
                   	 	  <a class = "main-mem" id="easygoing_b" class="btn btn-primary">Easygoing</a>
                   	 	  <a class = "main-mem" id="fun_b" class="btn btn-primary">Fun</a>
                   	 	
                   	 	  <a class = "main-mem" id="respectful_b" class="btn btn-primary">Respectful</a>
                   	 	    <br>
                   	 	  <a class = "main-mem" id="confident_b" class="btn btn-primary">Confident</a>
                   	 	  <a class = "main-mem" id="emotional_b" class="btn btn-primary">Emotional</a>
                   	 	  <a class = "main-mem" id="motivated_b" class="btn btn-primary">Motivated</a>
                   	 	  <a class = "main-mem" id="compassionate_b" class="btn btn-primary">Compassionate</a>
                   	 	  <br>
                   	 	  <button class="btn btn-primary">Send message</button>
                   
                    </form>
                    </div>
                  </div>
                </div>
                
                <!-- Followers -->
                <div id="flow" class="tab-pane fade">
                  <div class="net-work-in">
                  
                  
                <div class="table-responsive">
				
				<table class="table table-hover">
					<tbody>
						<c:forEach items="${appreciationsPosted}" var="record" varStatus="recordIndex">
							<tr>
							<td>
							<form class="form-horizontal" name="savePost" action="savePost"
					method="GET">
					<fieldset>
							<div class="main-mem" > 
							 <label for="nameEmail">Receiver's Name:</label> <input id = "email_val" type="text" placeholder="Name or Email Address" name="nameEmail" value="${record.receiverId.fullName}<${record.receiverId.emailAddress}>" readonly>
		                      <input id = "email_val_id" type="hidden" name="userId" value = "${record.receiverId.userId}">
		                      <input id = "postId" type="hidden" name="postId" value = "${record.postId}">
		                   	 <label for="message">Message:</label><textarea id="text_message" placeholder="Your Message" name="message">${record.message}</textarea>
		                   	 	<input type="hidden" name="happy" id="happy_${recordIndex.index}"  value = "${record.happy}"> 
		                   	  <input type="hidden" name="helpful" id="helpful_${recordIndex.index}"  value = "${record.helpful}">
		                   	  <input type="hidden" name="easygoing" id="easygoing_${recordIndex.index}"  value = "${record.easygoing}">
		                   	  <input type="hidden" name="fun" id="fun_${recordIndex.index}"  value = "${record.fun}">
		                   	  <input type="hidden" name="respectful" id="respectful_${recordIndex.index}"  value = "${record.respectful}">
		                   	  <input type="hidden" name="confident" id="confident_${recordIndex.index}"  value = "${record.confident}">
		                   	  <input type="hidden" name="emotional" id="emotional_${recordIndex.index}"  value = "${record.emotional}">
		                   	  <input type="hidden" name="motivated" id="motivated_${recordIndex.index}" value = "${record.motivated}">
		                   	  <input type="hidden" name="compassionate" id="compassionate_${recordIndex.index}" value = "${record.compassionate}">
		                   	  
		                   	  <label for="message">Highlighted Qualities related to this Appreciation:</label></br>
		                   	 	  <a class = "main-mem" id="happy_b_${recordIndex.index}" class="btn btn-primary">Happy</a>
		                   	 	  <a class = "main-mem" id="helpful_b_${recordIndex.index}" class="btn btn-primary">Helpful</a>
		                   	 	  <a class = "main-mem" id="easygoing_b_${recordIndex.index}" class="btn btn-primary">Easygoing</a>
		                   	 	  <a class = "main-mem" id="fun_b_${recordIndex.index}" class="btn btn-primary">Fun</a>
		                   	 	
		                   	 	  <a class = "main-mem" id="respectful_b_${recordIndex.index}" class="btn btn-primary">Respectful</a>
		                   	 	    <br>
		                   	 	  <a class = "main-mem" id="confident_b_${recordIndex.index}" class="btn btn-primary">Confident</a>
		                   	 	  <a class = "main-mem" id="emotional_b_${recordIndex.index}" class="btn btn-primary">Emotional</a>
		                   	 	  <a class = "main-mem" id="motivated_b_${recordIndex.index}" class="btn btn-primary">Motivated</a>
		                   	 	  <a class = "main-mem" id="compassionate_b_${recordIndex.index}" class="btn btn-primary">Compassionate</a>
		                   	 	  <br>
		                   	 	  <button class="btn btn-primary" >Update Post</button>
		                   	 	 
							</div>
							</fieldset>
					</form>
							</td>
							
							</tr>
							
						</c:forEach>
					</tbody>
				</table>
				
				</div>
                  
                  
                  
                  
                  </div>
                </div>
                
                <!-- Following -->
                <div id="flowing" class="tab-pane fade">
                  <div class="net-work-in"> 
                    <div class="table-responsive">
				<!-- <form class="form-horizontal" name="saveAppreciation" action="saveAppreciation"
					method="GET">
					<fieldset> -->
				<table class="table table-hover">
					<tbody>
						<c:forEach items="${appreciationsReceived}" var="record" varStatus="recordIndex">
							<tr>
							<td>
							<div class="main-mem" > 
							 <label for="nameEmail">Sender's Name:</label> <input id = "email_val" type="text" placeholder="Name or Email Address" name="nameEmail" value="${record.senderId.fullName}<${record.senderId.emailAddress}>" readonly>
		                      <input id = "email_val_id" type="hidden" name="userId" value = "${record.senderId.userId}">
		                      <input id = "postId" type="hidden" name="postId" value = "${record.postId}">
		                   	 <label for="message">Message:</label><textarea id="text_message" placeholder="Your Message" name="message" readonly>${record.message}</textarea>
		                   	 	<input type="hidden" name="happy" id="happy_${recordIndex.index}"  value = "${record.happy}"> 
		                   	  <input type="hidden" name="helpful" id="helpful_${recordIndex.index}"  value = "${record.helpful}">
		                   	  <input type="hidden" name="easygoing" id="easygoing_${recordIndex.index}"  value = "${record.easygoing}">
		                   	  <input type="hidden" name="fun" id="fun_${recordIndex.index}"  value = "${record.fun}">
		                   	  <input type="hidden" name="respectful" id="respectful_${recordIndex.index}"  value = "${record.respectful}">
		                   	  <input type="hidden" name="confident" id="confident_${recordIndex.index}"  value = "${record.confident}">
		                   	  <input type="hidden" name="emotional" id="emotional_${recordIndex.index}"  value = "${record.emotional}">
		                   	  <input type="hidden" name="motivated" id="motivated_${recordIndex.index}" value = "${record.motivated}">
		                   	  <input type="hidden" name="compassionate" id="compassionate_${recordIndex.index}" value = "${record.compassionate}">
		                   	  
		                   	  <label for="message">Highlighted Qualities related to this Appreciation:</label></br>
		                   	 	  <a style = "pointer-events: none !important;cursor: default;color:Gray;" class = "main-mem" id="happy_b_${recordIndex.index}" class="btn btn-primary">Happy</a>
		                   	 	  <a style = "pointer-events: none !important;cursor: default;color:Gray;"class = "main-mem" id="helpful_b_${recordIndex.index}" class="btn btn-primary">Helpful</a>
		                   	 	  <a style = "pointer-events: none !important;cursor: default;color:Gray;"class = "main-mem" id="easygoing_b_${recordIndex.index}" class="btn btn-primary">Easygoing</a>
		                   	 	  <a style = "pointer-events: none !important;cursor: default;color:Gray;"class = "main-mem" id="fun_b_${recordIndex.index}" class="btn btn-primary">Fun</a>
		                   	 	
		                   	 	  <a style = "pointer-events: none !important;cursor: default;color:Gray;"class = "main-mem" id="respectful_b_${recordIndex.index}" class="btn btn-primary">Respectful</a>
		                   	 	    <br>
		                   	 	  <a style = "pointer-events: none !important;cursor: default;color:Gray;"class = "main-mem" id="confident_b_${recordIndex.index}" class="btn btn-primary">Confident</a>
		                   	 	  <a style = "pointer-events: none !important;cursor: default;color:Gray;"class = "main-mem" id="emotional_b_${recordIndex.index}" class="btn btn-primary">Emotional</a>
		                   	 	  <a style = "pointer-events: none !important;cursor: default;color:Gray;"class = "main-mem" id="motivated_b_${recordIndex.index}" class="btn btn-primary">Motivated</a>
		                   	 	  <a style = "pointer-events: none !important;cursor: default;color:Gray;"class = "main-mem" id="compassionate_b_${recordIndex.index}" class="btn btn-primary">Compassionate</a>
		                   	 	  <br>
		                   	 	 
							</div>
							
							</td>
							
							</tr>
							
						</c:forEach>
					</tbody>
				</table>
				<!-- </fieldset>
					</form> -->
				</div>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
              
              </div>
              
              <!-- PROFILE -->
              <div id="profile" class="tab-pane fade in">
                <div class="row">
                  <div class="col-md-12">
                    <div class="profile-main">
                      <h3>About</h3>
                      <div class="profile-in">
                        <div class="media-left">
                       
                          <div class="img-profile"> 
                          <img id="profile-img" class="media-object" src="/iappreciateyou/static/images/profile/" alt=""> 
                          </div>
                         
                        </div>
                        <div class="media-body">
                          <p>Background Intro</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-8"> 
                    
                    <!-- Skills -->
                    <div class="sidebar">
                      <h5 class="main-title">Skills</h5>
                      <div class="job-skills"> 
                        
                        <!-- Logo Design -->
                        <ul class="row">
                          <li class="col-sm-3">
                            <h6><i class="fa fa-plus"></i> HTML5 and Css3</h6>
                          </li>
                          <li class="col-sm-9">
                            <div class="progress">
                              <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"> </div>
                            </div>
                          </li>
                        </ul>
                        
                        <!-- Logo Design -->
                        <ul class="row">
                          <li class="col-sm-3">
                            <h6><i class="fa fa-plus"></i> Logo Design</h6>
                          </li>
                          <li class="col-sm-9">
                            <div class="progress">
                              <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"> </div>
                            </div>
                          </li>
                        </ul>
                        
                        <!-- Logo Design -->
                        <ul class="row">
                          <li class="col-sm-3">
                            <h6><i class="fa fa-plus"></i> Web Design</h6>
                          </li>
                          <li class="col-sm-9">
                            <div class="progress">
                              <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 90%;"> </div>
                            </div>
                          </li>
                        </ul>
                        
                        <!-- UI / UX -->
                        <ul class="row">
                          <li class="col-sm-3">
                            <h6><i class="fa fa-plus"></i> UI/UX</h6>
                          </li>
                          <li class="col-sm-9">
                            <div class="progress">
                              <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 80%;"> </div>
                            </div>
                            <p>Preferred languages are Arabic, French & Italian. Proin nibh augue, suscipit asce lerisque sed, lacinia in, mi.</p>
                          </li>
                        </ul>
                      </div>
                    </div>
                    
                    <!-- Professional Details -->
                    <div class="sidebar">
                      <h5 class="main-title">Similar Professionals</h5>
                      
                      <!-- Similar -->
                      <div class="similar">
                        <div class="media">
                          <div class="media-left">
                            <div class="inn-simi"> <img class="media-object" src="images/med-avatar.jpg" alt=""> <a href="#">Profile </a> </div>
                          </div>
                          <div class="media-body">
                            <h5>Media heading</h5>
                            <p>SEO Specialist - New York, USA</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit, maxime, excepturi, mollitia, 
                              voluptatibus similique aliquid a dolores autem laudantium sapiente ad enim ipsa modi laborum 
                              accusantium deleniti neque architecto vitae.</p>
                            
                            <!-- Share -->
                            <div class="share-w"><a href="#."><i class="fa fa-bookmark-o"></i></a> <a href="#."><i class="fa fa-envelope-o"></i></a> <a href="#."><i class="fa fa-eye"></i></a></div>
                          </div>
                        </div>
                        
                        <!-- Similar -->
                        <div class="media">
                          <div class="media-left">
                            <div class="inn-simi"> <img class="media-object" src="images/med-avatar.jpg" alt=""> <a href="#">Profile </a> </div>
                          </div>
                          <div class="media-body">
                            <h5>Denise Walsh</h5>
                            <p>SEO Specialist - New York, USA</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit, maxime, excepturi, mollitia, 
                              voluptatibus similique aliquid a dolores autem laudantium sapiente ad enim ipsa modi laborum 
                              accusantium deleniti neque architecto vitae.</p>
                            
                            <!-- Share -->
                            <div class="share-w"><a href="#."><i class="fa fa-bookmark-o"></i></a> <a href="#."><i class="fa fa-envelope-o"></i></a> <a href="#."><i class="fa fa-eye"></i></a></div>
                          </div>
                        </div>
                        
                        <!-- Similar -->
                        <div class="media">
                          <div class="media-left">
                            <div class="inn-simi"> <img class="media-object" src="images/med-avatar.jpg" alt=""> <a href="#">Profile </a> </div>
                          </div>
                          <div class="media-body">
                            <h5>Denise Walsh</h5>
                            <p>SEO Specialist - New York, USA</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit, maxime, excepturi, mollitia, 
                              voluptatibus similique aliquid a dolores autem laudantium sapiente ad enim ipsa modi laborum 
                              accusantium deleniti neque architecto vitae.</p>
                            
                            <!-- Share -->
                            <div class="share-w"><a href="#."><i class="fa fa-bookmark-o"></i></a> <a href="#."><i class="fa fa-envelope-o"></i></a> <a href="#."><i class="fa fa-eye"></i></a></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <!-- Col -->
                  <div class="col-md-4"> 
                    
                    <!-- Professional Details -->
                    <div class="sidebar">
                      <h5 class="main-title">Professional Details</h5>
                      <div class="sidebar-information">
                        <ul class="single-category">
                          <li class="row">
                            <h6 class="title col-xs-6">Name</h6>
                            <span class="subtitle col-xs-6">Abu Antar</span></li>
                          <li class="row">
                            <h6 class="title col-xs-6">Age</h6>
                            <span class="subtitle col-xs-6">38 Years Old</span></li>
                          <li class="row">
                            <h6 class="title col-xs-6">Location</h6>
                            <span class="subtitle col-xs-6">Jordan Amman</span></li>
                          <li class="row">
                            <h6 class="title col-xs-6">Experiance</h6>
                            <span class="subtitle col-xs-6">15 Years</span></li>
                          <li class="row">
                            <h6 class="title col-xs-6">Dgree</h6>
                            <span class="subtitle col-xs-6">MBA</span></li>
                          <li class="row">
                            <h6 class="title col-xs-6">Career Lavel</h6>
                            <span class="subtitle col-xs-6">Mid-Level</span></li>
                          <li class="row">
                            <h6 class="title col-xs-6">Phone</h6>
                            <span class="subtitle col-xs-6">(800) 123-4567</span></li>
                          <li class="row">
                            <h6 class="title col-xs-6">Fax </h6>
                            <span class="subtitle col-xs-6">(800) 123-4568</span></li>
                          <li class="row">
                            <h6 class="title col-xs-6">E-mail</h6>
                            <span class="subtitle col-xs-6"><a href="#.">example@example.com</a></span></li>
                          <li class="row">
                            <h6 class="title col-xs-6">Website</h6>
                            <span class="subtitle col-xs-6"><a href="#.">example.com </a></span></li>
                        </ul>
                      </div>
                    </div>
                    
                    <!-- Rating -->
                    <div class="sidebar">
                      <h5 class="main-title">Rating</h5>
                      <div class="sidebar-information">
                        <ul class="single-category com-rate">
                          <li class="row">
                            <h6 class="title col-xs-6">Expertise:</h6>
                            <span class="col-xs-6"><i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i></span> </li>
                          <li class="row">
                            <h6 class="title col-xs-6">Knowledge:</h6>
                            <span class="col-xs-6"><i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-half-o"></i> <i class="fa fa-star-o"></i></span> </li>
                          <li class="row">
                            <h6 class="title col-xs-6">Quality::</h6>
                            <span class="col-xs-6"><i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-o"></i></span> </li>
                          <li class="row">
                            <h6 class="title col-xs-6">Price:</h6>
                            <span class="col-xs-6"><i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i></span> </li>
                          <li class="row">
                            <h6 class="title col-xs-6">Services:</h6>
                            <span class="col-xs-6"><i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-o"></i></span> </li>
                        </ul>
                      </div>
                    </div>
                    
                    <!-- Social Profiles -->
                    <div class="sidebar">
                      <h5 class="main-title">Social Profiles</h5>
                      <ul class="socil">
                        <li><a href="#."><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#."><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#."><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#."><i class="fa fa-twitter"></i></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              
          
              <div id="Con-tab" class="tab-pane fade">
                <div class="profile-main">
                  <h3 style="color: black">People in Connections</h3>
                  <div class="profile-in">
                    <div class="folow-persons">
                      <ul>
                        <c:forEach items="${connections}" var="record" varStatus="recordIndex">
                        <!-- MEMBER -->
                        <li>
                          <div class="row">
                          <form class="form-horizontal" name="saveUser" action="saveUser"
					method="GET">
					<fieldset>
							
							 <div class="col-xs-4"> 
                              <!-- Check Box -->
                              <div class="checkbox">
                                <input id="checkbox1-1" class="styled" type="checkbox">
                                <label for="checkbox1-1"></label>
                              </div>
                              <!-- Name -->
                              <div class="fol-name">
                                <div class="avatar"> <img src="images/sm-avatar.jpg" alt=""> </div>
                                <h6 style="color: black">${record.fullName}</h6>
                                <span>${record.currentOrg}</span> </div>
                            </div>
                            <!-- Location -->
                            <div class="col-xs-3 n-p-r n-p-l"> <span>${record.city},${record.state},${record.country}</span> </div>
                            <!-- Network -->
                            <div class="col-xs-3 n-p-r"> <span>21 Followers</span> <span>10 Following</span> </div>
                            <!-- Connections -->
                            <div class="col-xs-2 n-p-r n-p-l"> <span>${record.noOfConnections} Connections</span> </div>
							
							
							</fieldset>
					</form>
                          
                          
                           
                          </div>
                        </li>
                        </c:forEach>
                       
                      </ul>
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

<!-- Scripts --> 
<script src="https://maps.googleapis.com/maps/api/js"></script> 
<script src="/iappreciateyou/static/scripts/js/jquery-2.1.3.min.js"></script> 
<script src="/iappreciateyou/static/scripts/js/bootstrap.js"></script> 
<script src="/iappreciateyou/static/scripts/js/superfish.min.js"></script> 
<script src="/iappreciateyou/static/scripts/js/jquery.ui.min.js"></script> 
<script src="/iappreciateyou/static/scripts/js/rangeslider.min.js"></script> 
<script src="/iappreciateyou/static/scripts/js/jquery.flexslider-min.js"></script> 
<script src="/iappreciateyou/static/scripts/js/uou-accordions.js"></script> 
<script src="/iappreciateyou/static/scripts/js/uou-tabs.js"></script> 
<script src="/iappreciateyou/static/scripts/js/select2.min.js"></script> 
<script src="/iappreciateyou/static/scripts/js/owl.carousel.min.js"></script> 
<script src="/iappreciateyou/static/scripts/js/gmap3.min.js"></script> 
<script src="/iappreciateyou/static/scripts/js/scripts.js"></script> 
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script>



$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

$(function(){
	if("${user.bgImageLink}" != ''){
		   $('.user-profile-bnr').css("background", "url(/iappreciateyou/static/images/profile-bg/${user.bgImageLink}.jpg) no-repeat");
		   $('.user-profile-bnr').css("background-size", "cover");
	}
	
	if("${user.profileImageLink}" == ''){
		if("${user.sex}" == 'male'){
			$("#profile-img").attr("src","/iappreciateyou/static/images/profile/male-template.png");			
		}else{
			$("#profile-img").attr("src","/iappreciateyou/static/images/profile/female-template.png");
		}
	}else{
		$("#profile-img").attr("src","/iappreciateyou/static/images/profile/${user.profileImageLink}.jpg");
	}
	
	$( "a.main-mem" ).each(function( i ) {
		  var id = $( this ).attr('id');
		  id = id.replace("_b","");
		  id = "#"+id;
		  var val = $(id).val();
		  if(val == '0'){
			  
		  }else{
			  $( this ).toggleClass( "btn btn-success" );
		  }
	  });
	
});

$('.upload').click(function(){
    $('input[type=file]').click();
    return false;
});

$('input[type=file]').change(function() {
    $('#myForm').submit();
});

$('.logout').click(function(){
	$('#logoutForm').submit();
});


$( "a.main-mem" ).click(function() {
	  $( this ).toggleClass( "btn btn-success" );
	  var id = $( this ).attr('id');
	  id = id.replace("_b","");
	  id = "#"+id;
	  var val = $(id).val();
	  if(val == '0'){
		  $(id).val('1');
	  }else{
		  $(id).val('0');
	  }
	});
	
	function loadCss(){
		$( "a.main-mem" ).each(function( i ) {
			  var id = $( this ).attr('id');
			  id = id.replace("_b","");
			  id = "#"+id;
			  var val = $(id).val();
			  if(val == '0'){
				  
			  }else{
				  
				  var class_v = $( this ).attr('class');
				  
				  if(!class_v.includes('btn btn-success')){
					  $( this ).toggleClass( "btn btn-success" );					  
				  }

			  }
		  });
		
	};
	$( "a.main-mem" ).each(function( i ) {
		  var id = $( this ).attr('id');
		  id = id.replace("_b","");
		  id = "#"+id;
		  var val = $(id).val();
		  if(val == '0'){
			  
		  }else{
			  $( this ).toggleClass( "btn btn-success" );
		  }
	  });
	
	function updateRecord(post){
		alert(post);
		window.location.href="/iappreciateyou/savePost?post="+post;
	};
	
	
$(document).ready(function () {
	
 $( "#email_val" ).autocomplete({
    source: function( request, response ) {
    	$.ajax({
    	    url: "/iappreciateyou/getAllConnections",
    	    dataType: "json",
    	    data: {
    	        term: request.term
    	    },
    	    success: function (data) {
    	        response($.map(data, function (user) {
    	            return {
    	                value: user.fullName + '<'+user.emailAddress+'>',
    	                id:user.userId
    	            };
    	        }));
    	    }
    	});
    },
    minLength: 1,
    select: function( event, ui ) {
      console.log( "Selected: " + ui.item.value + " aka " + ui.item.id );
      $('#email_val_id').val(ui.item.id);
      console.log($('#email_val_id').val());
    }
  } ); 
 
	$( "#connectEmail" ).autocomplete({
	    source: function( request, response ) {
	    	$.ajax({
	    	    url: "/iappreciateyou/getAllUsers",
	    	    dataType: "json",
	    	    data: {
	    	        term: request.term
	    	    },
	    	    success: function (data) {
	    	        response($.map(data, function (user) {
	    	            return {
	    	                value: user.fullName + '<'+user.emailAddress+'>',
	    	                id:user.userId
	    	            };
	    	        }));
	    	    }
	    	});
	    },
	    minLength: 1,
	    select: function( event, ui ) {
	      console.log( "Selected: " + ui.item.value + " aka " + ui.item.id );
	      $('#connectEmailId').val(ui.item.id);	
	      console.log($('#connectEmailId').val());
	    }
	  } ); 
	
});

 /* $(document).ready(function () {
	 $("#email_val").change(function () {
	     
	         jQuery.ajax({
	             url: "/iappreciateyou/getAllConnections?term="+ $("#email_val").val(),
	            		 
	            
	             success: function (data) {
	                 alert(data + "success");
	                 $.each(data, function(index, user) {
	                     console.log(user.fullName); //to print name of employee
	                 });  
	             },
	             error: function (data) {
	                 alert(data + "error");
	             }
	         });
	     
	 });
 }); */
	 </script>
</body>
</html>