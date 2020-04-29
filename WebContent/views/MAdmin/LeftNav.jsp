<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="../required/assets/images/favicon.png">
<title>LeftNavigation</title>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/select2/dist/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/jquery-minicolors/jquery.minicolors.css">
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link href="../Required/assets/libs/flot/css/float-chart.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/quill/dist/quill.snow.css">
<link href="../required/dist/css/style.min.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style type="text/css">
.navcolor {
	background-color: #d0ec31 !important;
	font-size: 20px;
	font-style: oblique;
	    border: inset;
}

.fcol {
	color: #000;
	font-weight: 700;
}

.h:hover {
	background-color: white;
}

.sidebar-nav ul .sidebar-item .first-level .sidebar-item .sidebar-link i
	{
	font-size: 30px;
}
</style>
</head>

<body>
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
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<aside class="left-sidebar navcolor" data-sidebarbg="skin5">
			<!-- Sidebar scroll-->
			<div class="scroll-sidebar navcolor hav">
				<!-- Sidebar navigation-->
				<nav class="sidebar-nav navcolor hav">
					<ul id="sidebarnav" class="navcolor" style="padding-top: 0px">
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect navcolor sidebar-link " href="TeamLeader_Dash.jsp"
							aria-expanded="false"><i class="fas fa-th-large"></i> <span
								class="hide-menu fcol h">Dashboard</span></a></li>
						<li class="sidebar-item"><a
							class="sidebar-link has-arrow waves-effect navcolor"
							href="javascript:void(0)" aria-expanded="false"><i
								class="mdi mdi-settings"></i><span class="hide-menu fcol h">Settings
							</span></a>
							<ul aria-expanded="false" class="collapse first-level navcolor">
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="../AddUser.jsp" aria-expanded="false"><i
										class="mdi mdi-account"></i><span class="hide-menu fcol h">Add
											User</span></a></li>
								<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="../AddProject.jsp" aria-expanded="false"><i
										class="mdi mdi-file"></i><span class="hide-menu fcol h">Add
											Project</span></a></li>
											<li class="sidebar-item"><a
									class="sidebar-link waves-effect waves-dark sidebar-link"
									href="../AssignProject.jsp" aria-expanded="false"><i
										class="fas fa-box"></i><span class="hide-menu fcol h">Assign
											Project</span></a></li>

							</ul></li>
					</ul>
				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</aside>

	</div>

</body>

</html>