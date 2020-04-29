<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<style>
.navbar-right {
	margin-left: 5px;
	width: 100%;
}

.navcolor {
	background-color: #d0ec31 !important;
	border: inset;
}

.header {
	background-color: black;
}

.dtt {
	color: #0a0a0a;
}

.
{
color


:

 

#0a0a0a


;
}
.rightNav {
	list-style-type: none;
}

ul.rightNav li {
	display: inline-block;
}

.logo-text {
	font-family: times, serif;
	font-style: italic;
	font-size: 25px;
	margin-left: 200px;
}

.linecolor {
	color: #fbfcff;
}
</style>
<script src="../required/assets/libs/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
	function DynamicTime() {
		var today = new Date();
		var h = today.getHours();
		var m = today.getMinutes();
		var s = today.getSeconds();
		var ampm = h >= 12 ? 'PM' : 'AM';
		h = h % 12;
		h = h ? h : 12;
		m = checkTime(m);
		s = checkTime(s);
		document.getElementById('ct').innerHTML = today.toDateString() + " "
				+ h + ":" + m + ":" + s + ' ' + ampm;
		var t = setTimeout(DynamicTime, 500);
	}
	function checkTime(i) {
		if (i < 10) {
			i = "0" + i
		}
		; // add zero in front of numbers < 10
		return i;
	}
</script>
</head>
<body onload="DynamicTime()">

	<header class="topbar" data-navbarbg="skin2">
		<nav class="navbar navbar-expand-sm navcolor">
			<div class="navbar-header" data-logobg="skin5">
				<a class="nav-toggler waves-effect waves-light d-block d-md-none"
					href="javascript:void(0)"><i class="ti-menu ti-close"></i></a> <a
					class="navbar-brand dtt" href="index.html"> <b
					class="logo-icon p-l-10"> <i class="wi wi-sunset"></i> <img
						src="../../required/assets/images/Logo.jpg"
						alt="Defect Tracking Tool" class="light-logo" />
				</b> 
				
				</a>
			</div>

			<div class="navbar-right"
				class="navbar navbar-expand-sm bg-dark navbar-dark">
				<ul class="navbar-nav float-left mr-auto">
					<li class="nav-item d-none d-md-block"><a
						class="nav-link sidebartoggler waves-effect linecolor"
						href="javascript:void(0)" data-sidebartype="mini-sidebar"> <i
							class="mdi mdi-menu font-24"></i></a></li>
				</ul>
				<ul class="navbar-nav float-right">
					<li style="color: black"><h4>
							<span id='ct'></span>
						</h4></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic"
						href="" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><img
							src="../required/assets/images/users/1.jpg" alt="user"
							class="rounded-circle" width="31"></a>
						<div class="dropdown-menu dropdown-menu-right user-dd animated">
							<a class="dropdown-item" href="javascript:void(0)"><i
								class="ti-user m-r-5 m-l-5"></i> My Profile</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="javascript:void(0)"><i
								class="ti-settings m-r-5 m-l-5"></i> Account Setting</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="../login.jsp"><i
								class="btn btn-danger btn-sm"><span class="fa fa-power-off"></span></i>
								Logout</a>
							<div class="dropdown-divider"></div>
							<div class="p-l-30 p-10">
								<a href="javascript:void(0)"
									class="btn btn-sm btn-success btn-rounded">View Profile</a>
							</div>
						</div></li>
				</ul>
			</div>
		</nav>
	</header>
</body>
</html>
