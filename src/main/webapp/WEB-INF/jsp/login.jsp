<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="google-signin-client_id" content="67690013470-b02t3o44sn4tg7kpon2fau36n7hba5h9.apps.googleusercontent.com">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>I-Appreciate-You Login</title>
<style type="text/css">
body { 
 background: url('/iappreaciateyou/static/background-1.jpg') no-repeat center center fixed; 
 -webkit-background-size: cover;
 -moz-background-size: cover;
 -o-background-size: cover;
 background-size: cover;
 
}
.panel-default {
 opacity: 0.9;
 margin-top:30px;
}
.form-group.last {
 margin-bottom:0px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">

    <script type="text/javascript">
	$(document).ready(function() {
		if(('${result}' == 1)){
			$('#errorMessage').hide();
		}
		
	});
	
	function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile();
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail());
		}
</script>
    
  </head>
  <body>

    <div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-7">
       
            <div class="panel panel-default">
     
                <div class="panel-heading"> <strong class="">Login to I-Appreciate-You</strong>
				
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" name="loginapp"
					action="loginapp" method="POST">
                        <div class="form-group">
                            <label for="inputusername" class="col-sm-3 control-label">Name</label>
                            <div class="input-group">
    						<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                            <input name="username" class="form-control" id="inputusername" placeholder="Enter User Name" required="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-3 control-label">Password</label>
                            <div class="input-group">
    								<span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
                                <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="Enter Password" required="">
                            </div>
                        </div>
                        <!--  
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <div class="checkbox">
                                    <label class="">
                                        <input type="checkbox" class="">Remember me</label>
                                </div>
                            </div>
                        </div>
                        -->
                        <div class="form-group last">
                            <div class="col-sm-offset-3 col-sm-9">
                                <button type="submit" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-lock"></span>Sign in</button>
                                <button type="reset" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-arrow-left"></span>Reset</button>
                            </div>
                        </div>
                    </form>
                    <br>
                    
                    <h4 style="text-align: center;">OR</h4>
                    <br>
                    <div class="g-signin2" data-onsuccess="onSignIn"></div>
                </div>
               <!-- <div class="panel-footer">Not Registered? <a href="#" class="">Register here</a>
                </div>
                 --> 
                 
                 
                 
            </div>
            <%-- 
                    <div id="errorMessage">
						<c:choose>
							<c:when test="${result == 0}">
							    <div class="alert alert-danger fade in">
					        	<a href="#" class="close" data-dismiss="alert">&times;</a>
					        	<strong>Error!</strong> Invalid Login ID or Password.
				    			</div>
				    		</c:when>
				    	</c:choose>
					</div> --%>
		
        </div>
        
    </div>
    
    
</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    
    <script src="https://apis.google.com/js/platform.js" async defer></script>
  </body>
</html>