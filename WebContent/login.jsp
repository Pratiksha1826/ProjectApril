<!DOCTYPE html>
<html dir="ltr">

<head>
    <meta charset="utf-8"> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width --> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content=""> 
    <!-- Favicon icon --> 
   	<link rel="icon" type="image/png" sizes="16x16" href="required/assets/images/favicon.png">
    <title>Defect Tracking Tools</title>
 	<!-- Custom CSS -->
    <link href="required/dist/css/style.min.css" rel="stylesheet">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
	
  <!-- ***************************************** background image body tag Style tag**************************
 -->
 
 <style>
 body {

    background: url("required/assets/images/defect.jpg");
        background-size:cover;
        height: 100%;
        background-repeat: no-repeat;
	background-size:cover;
	background-position:center;
	font-family:sans-serif;
        
        
}
::placeholder{
	
	color:white;
}
#snackbar {

  margin-left: -125px; /* Divide value of min-width by 2 */
  color: #fff; /* White text color */
  background-color:red;
  text-align: center; /* Centered text */
  border-radius: 2px; /* Rounded borders */
  padding: 16px; /* Padding */
  position: fixed; /* Sit on top of the screen 
  z-index: 1; /* Add a z-index if needed */
  left: 50%; /* Center the snackbar */
  top: 30px; /* 30px from the bottom */
  
}

.messageBox {
    opacity: 1;
    animation: fade 2s linear;
}



@keyframes fade {
  0%,100% { opacity: 0 }
  50% { opacity: 1 }
}

 </style>
 <script type="text/javascript">

 history.pushState(null, null, location.href);
	window.onpopstate = function () {
	   history.go(1);
	};
 </script>
<!-- *****************************************background image body tag Style tag closed**************************
 -->
<body class="img">
     <div class="main-wrapper">
 		<!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Login box.scss -->
        <!-- ============================================================== -->
        <div class="auth-wrapper d-flex no-block justify-content-center align-items-center">
            <div class="auth-box bg-light border-top border-secondary">
                    <div id="loginform">
                    
                    <div class="text-center p-t-20 p-b-20">
                    
                        <!-- <span class="db"><img src="Required/assets/images/logo.png" alt="logo" /></span>-->
                        <h2><span  class="text-center" style="font-family: times, serif; font-style:italic">Defect Tracking Tool</span></h2>
                    </div>
                   <%--  <%
						if(session.getAttribute("error")!=null){
	 
					%>
                   <div id="snackbar" class="messageBox"><%=session.getAttribute("error") %></div>
                   <%} %> --%>
                    <%
						if(session.getAttribute("error")!=null){
	 
					%>
                   <div id="snackbar" class="messageBox"><%=session.getAttribute("error") %></div>
                   <%}   session.removeAttribute("error"); %>
                    <form action="LoginAction" method="post" class="form-horizontal m-t-20" id="loginform">
                        <div class="row p-b-30">
                            <div class="col-12">
                                <div class="input-group mb-3">
                                	<div class="input-group-prepend">
                                        <span class="input-group-text bg-success text-white" id="basic-addon1"><i class="ti-user"></i></span>
                                    </div>
                                    <input type="text" class="form-control form-control-lg" placeholder="Username" name="Uname" id="userName" aria-label="Username" aria-describedby="basic-addon1" required>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                    
                                        <span class="input-group-text bg-warning text-white" id="basic-addon2"><i class="ti-pencil"></i></span>
                                    </div>
                                    <input type="password" class="form-control form-control-lg" placeholder="Password" name="Password" id="pass" aria-label="Password" aria-describedby="basic-addon1" required>
                                    
                                </div>
                            </div>
                           </div>
                        <div class="row border-top border-secondary">
                            <div class="col-12">
                                <div class="form-group">
                                    <div class="p-t-20"> 
                                       <button class="btn btn-info" id="to-recover" type="button"><i class="fa fa-lock m-r-5"></i> Forgot Password?</button>
                                       <button class="btn btn-success float-right" type="submit">Login</button>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    
                </div>
                <div id="recoverform">
                    <div class="text-center">
                        <span class="text-green">Please Contact Your Admin To Change Password.</span>
                    </div>
                                              
                            <div class="row m-t-20 p-t-20 border-top border-secondary">
                                <div class="col-12">
                                    <a class="btn btn-success" href="#" id="to-login">Back To Login</a>
                                </div>
                            </div>
                        
                        </div>
                    </div>
                </div>
            </div>
            
        </body>
        <!-- ============================================================== -->
        <!-- Login box.scss -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper scss in scafholding.scss -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper scss in scafholding.scss -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Right Sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Right Sidebar -->
        <!-- ============================================================== -->
    
    <!-- ============================================================== -->
    <!-- All Required js -->
    <!-- ============================================================== -->
       <script src="required/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="required/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="required/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- ============================================================== -->
    <!-- This page plugin js -->
    <!-- ============================================================== -->
    <script>
	$('[data-toggle="tooltip"]').tooltip();
    $(".preloader").fadeOut();
    // ============================================================== 
    // Login and Recover Password 
    // ============================================================== 
    $('#to-recover').on("click", function() {
        $("#loginform").slideUp();
        $("#recoverform").fadeIn();
    });
    $('#to-login').click(function(){
        
        $("#recoverform").hide();
        $("#loginform").fadeIn();
    });
    
    </script>
    <%
		if(session.getAttribute("error")!=null){
	%>
	<script type="text/javascript">
	
		$('#snackbar').show();
		setTimeout(function(){
			$('#snackbar').hide();
		},5000);
		
		
	</script>
<% } %>
</html>