<%@ page import="Bean.AddProjectBean,Bean.AddUserBean,Bean. AssginProjectBean,java.util.*"%>
<%@ page import="DAO.AddProjectDao"%>
<%@ page import="DAO.AssginProjectDao"%>

<%@ page import="DAO.AddUserDao"%>
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
<title>Assgin Project</title>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/select2/dist/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/jquery-minicolors/jquery.minicolors.css">
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/quill/dist/quill.snow.css">
<link href="../required/dist/css/style.min.css" rel="stylesheet">
<link href="../required/dist/css/styleborder.css" rel="stylesheet">
<link href="../required/dist/css/AddUser.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<style type="text/css">
label {
	font-size: px;
	font-family: "Times New Roman", Times, serif;
	font-weight: bold;
	color: black;
}

.button {
	background-color: #008CBA; /* Blue */
	border: none;
	color: white;
	padding: 15px 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}
.button2 {
	background-color: #f44336;
} /* Red */
.not-allowed {cursor: not-allowed;}


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
		<%@ include file="Header.jsp"%>
		<%@ include file="LeftNav.jsp"%>
		<div class="page-wrapper">
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
					<div class="row">
					<div class="col-md-12" >
						<div class="card"  align="center" ></div>
					</div>
						</div>
						<div class="row">
						<div class="col-md-12">
						<div class="card" align="center">
						<div class="card-body" style="background: linear-gradient(to bottom left,#757575, transparent);">
						<h5 class="card-title"></h5>
							<form  onsubmit="clearSupp();">
								<fieldset  class="col-sm-10">
									<legend class="legend_border  col-sm-3" style="padding-right:5px;">Assign Details</legend>
								
									<div class="form-group row ">
										<div class="col-md-5 text-right">
											<label for="orgName"
												class=" text-left control-label col-form-label ">Select Project</label>
										</div>
										
										
											<div class="col-md-5 text-left ">
												<select class="select2 form-control custom-select"
													name="projectname" id="proid"
													style="width: 100%; height: 36px;"  onchange="setId(this.value)">
 													<option value="" selected disabled>Search</option>
													<%
													 int pid=0;
													List<AddProjectBean> rb =AddProjectDao.getProjectNames();
													 String projectname="";
					
													 for(AddProjectBean objpro:rb)
													{
														 projectname = objpro.getProject_Name();
														 pid= objpro.getPM_Id();
                                                  %>
											    	<option value="<%=pid%>"><%=projectname%></option>

												<%} %>
												</select>
													
												
												
											</div>
                                   			<div>
											<button type="button" class="btn btn-primary"  onclick="addProject()" data-toggle="modal" data-target="#assignProject">
															<i class="fas fa-plus" ></i>
													</button>
											
										</div>
						
									</div>
									
									
									
									
									
									
									
									
									
									
								<div class="form-group row text-right" id="personid" >
									<div class="col-md-5">
										<label for="orgName"
											class=" text-left control-label col-form-label">Resourse Person</label>
									</div>
									<div class="col-md-5 text-left ">
										<div class="input-group md-form form-sm form-2 pl-0 ">
											
									
											
										<select class="select2 form-control custom-select show"
													name="username" id="userid"
													style="width: 100%; height: 36px;" multiple="multiple" disabled>
<!--                                    				<option value="Search" selected disabled>Search</option>
 -->                                            
											    	<%

													List<AddUserBean> ab = AddUserDao.getUserDetail();
												int uid= 0;
													for(AddUserBean ub:ab)
													{
														String name = ub.getName();
														//int uid[] =
														uid=ub.getUD_Id();
                                                      %>
												<option value="<%=uid%>"><%=name%></option>
												<% //System.out.println("uid:"+uid);
													}%>
                                         
                                        </select> 
													
													</div>
												</div>
											
												<div>
													<button type="button"  class="btn btn-primary" id="selectuserid" onclick="addUser()" data-toggle="modal" data-target="#userProject" disabled>
															<i class="fas fa-plus" ></i>
															
														</button>
<!-- 														 <button type="button" class="btn btn-danger btn-xs mdi mdi-close"  onclick="deletedata1()" data-target="#myModal" data-toggle="modal"></button>
 -->														
													</div>
												</div>
								
										
							
							
									<div class="form-group row">
                                    <div class="col-md-12"> 
								    <button class="  btn  btn-md  button float-center"  id="assbtn" class="register" type="button"  style="border-radius: 12px" value="Assign" disabled>Assign</button>&nbsp;&nbsp;
                                     <a href="MAdmin/TeamLeader_Dash.jsp"><button class="btn btn-md btn-warning float-center"  class="cancel" type="button" style="border-radius: 12px"  value="Cancel">Cancel</button></a>
									
                  				  
              
                                    </div>
                                </div>
								</fieldset>
								
								</form>
							</div>
						</div>
					</div>
				</div>
			<div class="card " align="center"  id="tableid">
		<div class="card-body" style="background: linear-gradient(to bottom left,#757575, transparent);">
		<fieldset  class=" col-sm-10"  >
			<legend class="legend_border col-sm-6"style="padding-right: 5px;">ASSIGN PROJECT DATATABLE</legend>	
			<div class="table-responsive">
		
			<table id="zero_config"
				 class="table table-striped table-hover table-bordered">
					<thead>
					<tr>
						<th>Role</th>
						<th>Name</th>
						<th>Email</th>
						<th>Action</th>
					</tr>
					</thead>
					<tbody  id="tableda">
							
				       </tbody> 
				
				</table>
				
				
			</div>
			</fieldset>
		</div>
		</div>
		

	

		<div class="modal projectContent" id="assignProject" role="dialog"></div>
		
		<div class="modal userContent" id="userProject" role="dialog"></div>

	<div class="modal  displayDeletecontent" id="myModal" role="dialog">
					
				 <div class="modal-dialog">
	
      			<div class="modal-content">
       		 <div class="modal-header"style="background: darkkhaki;">
     		     <h4 class="modal-title">Test Case Id</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
        	</div>
        	<div class="modal-body">
        		<%
        			
        		
        		%>
       			<p>Your Test want to delete this user?<b></b> </p>
			</div>
      
      	  <div class="modal-footer" style="background: darkkhaki;">
       	 	<button type="button" class="btn btn-success" data-dismiss="modal">ok</button>
          </div>
     	 </div>
      </div>
   </div>
     
    
 	<!-- ============================================================== -->
		<!-- End Container fluid  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- footer -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- End footer -->
		<!-- ============================================================== -->

	</div>
	
	
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
</div>
</div>
	
		<!-- ============================================================== -->
		<!-- End Wrapper -->
		<!-- ============================================================== -->
	

		<!-- ============================================================== -->
		<!-- All Jquery -->
		<!-- ============================================================== -->
		<script src="../required/dist/js/Defecttrackingtool.js"></script>
	
		<script src="../required/assets/libs/jquery/dist/jquery.min.js"></script>
		<!-- Bootstrap tether Core JavaScript -->
		<script src="../required/assets/libs/popper.js/dist/umd/popper.min.js"></script>
		<script
			src="../required/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
		<!-- slimscrollbar scrollbar JavaScript -->
		<script
			src="../required/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
		<script src="../required/assets/extra-libs/sparkline/sparkline.js"></script>
		<!--Wave Effects -->
		<script src="../required/dist/js/waves.js"></script>
		<!--Menu sidebar -->
		<script src="../required/dist/js/sidebarmenu.js"></script>
		<!--Custom JavaScript -->
		<script src="../required/dist/js/custom.min.js"></script>
		<!-- This Page JS -->
		<script
			src="../required/assets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
		<script src="../required/dist/js/pages/mask/mask.init.js"></script>
		<script
			src="../required/assets/libs/select2/dist/js/select2.full.min.js"></script>
		<script src="../required/assets/libs/select2/dist/js/select2.min.js"></script>
		<script
			src="../required/assets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
		<script
			src="../required/assets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
		<script
			src="../required/assets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
		<script
			src="../required/assets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
		<script
			src="../required/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
		<script src="../required/assets/libs/quill/dist/quill.min.js"></script>

		<script>
			//***********************************//
			// For select 2
			//***********************************//
			$(".select2").select2();
			/*colorpicker*/
			$('.demo').each(function() {
				//
				// Dear reader, it's actually very easy to initialize MiniColors. For example:
				//
				//  $(selector).minicolors();
				//
				// The way I've done it below is just for the demo, so don't get confused
				// by it. Also, data- attributes aren't supported at this time...they're
				// only used for this demo.
				//
				$(this).minicolors({
					control : $(this).attr('data-control') || 'hue',
					position : $(this).attr('data-position') || 'bottom left',
					change : function(value, opacity) {
						if (!value)
							return;
						if (opacity)
							value += ', ' + opacity;
						if (typeof console === 'object') {
							console.log(value);
						}
					},
					theme : 'bootstrap'
				});
			});
			/*datwpicker*/
			jQuery('.mydatepicker').datepicker();
			jQuery('#datepicker-autoclose').datepicker({
				autoclose : true,
				todayHighlight : true
			});
			var quill = new Quill('#editor', {
				theme : 'snow'
			});
		</script>
	
		<script type="text/javascript">
		$('.flexdatalist').flexdatalist({
		     selectionRequired: 1,
		     minLength: 1
		});
		</script>
		
<script>

function addProject(){

	
	
	$.ajax({
		url:"ProjectModal.jsp",
		success: function(response){
			$(".projectContent").html(response);
		}
	
		
	});
}

function addUser(){

	$.ajax({
		url:"UserModal.jsp",
		success: function(response){
			$(".userContent").html(response);
		}
	
		
	});
}


</script>
<script>
function SelectProject(txtSearch)
{
	alert("in selectproject")
	var status;
	var r = document.getElementById("projectlist");
	for(var i=0; i<r.options.length;i++){
		if(r.options[i].value.trim().toUpperCase()==txtSearch.trim().toUpperCase())
			{
			 status=true;
			}
	}
	}
</script>
<script>
//$("#proid").onkeypress(function setId(event) {
	//if(event.val==13){
	//alert("in event");
   // $.ajax({
      //  type: "POST",
      //  url: "../AssginProject_Id
      //  data: {PID:pid },
        //success: function (result, status, xhr) {
          //  $("#data").append(result.d);
       /// },
   // }
   // });
	
//});

function clearSupp(){                                      //clear for supplier
  			
  		document.getElementById("userid").value="";
  		document.getElementById("proid").value="";
 } 
 </script>
 <script>
 
function setId(pid){
	alert("hiiiiiiiiiii"+pid);
	//var r = document.getElementById("userid").value;
	//alert("Sudhir ==="+r);
		document.getElementById("selectuserid").disabled = false;
		document.getElementById("userid").disabled = false;
		document.getElementById("assbtn").disabled = false;
		   /*  $("#tableid").show();
		    $("#personid").show();
		    $("#assbtn").show();
		     */

	$.ajax({
	        	type: "POST",
	      		url: "../AssginProject_Id",
	      		data: {PID:pid },
	       		success: function(response)
	       		{
	       			$("#tableda").html(response);	
	       			
	       		}
	 
	   });
}

  
 $('#assbtn').click(function(){
    
    	var pid = document.getElementById("proid").value;
		var m=0;
 		if( $('#userid :selected').length > 0)
 		{
        //build an array of selected values
        	var s = [];
        	$('#userid :selected').each(function(i, selected) 
        	{
            	s[i] = $(selected).val();
            	//alert("%%%%%%%%%%"+s[i]);
        	});
 		}   //post data to handler script. note the JSON.stringify call
        for(var i=0 ; i<s.length;i++)
        { 
    	  
    	   m=s[i];
    	 //alert("m"+m+"pid"+pid); 
       	   $.ajax
       	   ({
       		   
                 type: "POST",
                 data: {UID:m ,PID:pid},
				 url: "../AssginProject_Action",
                 success: function(response) 
                 {
            	  //	alert("hi");
            	  
       				$("#tableda").html(response);	
       				document.getElementById("proid").value="";
       		  		document.getElementById("userid").value="";
              		//alert('Success!');
            	 }
        	});
       	  }
    
      
}); 
 

 
 
</script >
<script >
$/* (document).ready(function(){
	$('#tableda').onclick(function()
			{ 	
      
			var cell5=newRow.insertCell(3);
			    cell5.style.padding="2px";
					
						var btn=document.createElement('BUTTON');
						cell5.appendChild(btn);
						btn.setAttribute("type","button");
						btn.setAttribute("class","btn btn-danger btn-xs mdi mdi-delete");
						//btn.setAttribute("data-toggle","modal");
						//btn.setAttribute("data-target","#returnDeleteModal");
						btn.setAttribute("onclick","deletedata1()");
					
	 	
	});
}); */
function deletedata1(id)
{
	alert("hiiiiiiiiiii"+id);
	//var pid = document.getElementById("proid").value;
	//alert("Sudhir ==="+pid);
	 $.ajax({
	        
	       		success: function () {
	       			$(".displayDeletecontent").html(response);	

	       			
	       		},
	  
	   });
	   
}

</script>
<script>
$(document).ready(function(){
	
    $("#tableid").prop("disabled", true);
//	document.getElementById("tableid").disabled = true;
	//document.getElementById("personid").disabled = true;
	//document.getElementById("assbtn").disabled = true;
	/* $("#tableid").hide();
	$("#personid").hide();
	$("#assbtn").hide(); */
	
	 /*  $("#assbtn").onclick(function(){
	    $("#tableid").show();
	  }); */
	});
</script>
</body>
</html>