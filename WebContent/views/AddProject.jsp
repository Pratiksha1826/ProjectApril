
<%@ page import="Bean.AddProjectBean,java.util.List"%>
<%@ page import="DAO.AddProjectDao"%>
<% %>
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
<title>Add Project</title>
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

<link rel="stylesheet" type="text/css" href="../required/dist/css/jquery-ui.min.css" >
<link rel="stylesheet" type="text/css" href="../required/dist/css/jquery-ui.min1.css">
<link rel="stylesheet" type="text/css" href="../required/dist/css/jquery-ui11.css">
<link rel="stylesheet" type="text/css" href="../required/dist/css/jquery-ui.theme111.css">


<link href="../required/dist/css/AddUser.css" rel="stylesheet">
<link href="../required/dist/css/styleborder.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->


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
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">




			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card" align="center"></div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-body"
								style="background: linear-gradient(to bottom left, #757575, transparent);">
								<form action="../AddProject_Action" method="post"
									style="margin-left: 120px; text-align: center">
									<fieldset class="col-md-10">
										<legend class="legend_border col-sm-3"
											style="padding-right: 5px;">Add Project</legend>

									<div class="form-group row">
										<div class="col-sm-2">
										<label for="name"></label>
										</div>
										<div class="col-sm-8">
										<input type="text" class="form-control" name="Project_Name"
											maxlength="50" placeholder="PROJECT NAME"onkeypress="return alphaOnly(event);"
											style="text-transform: uppercase;" required>
										</div>
									</div>
									
									<div class="form-group row">
									    <div class="col-sm-2">
									    <label for="name"></label>
									    </div>
										<div class="col-sm-8">
										<input type="text" class="form-control" name="Soft_Tools"
											maxlength="30" placeholder="SOFTWARE PACKAGE NAME"
											onkeypress="return alphaOnly(event);"
											style="text-transform: uppercase;" required>
										</div>
										</div>
										
										<!-- <div class="form-group row">
											<div class="col-sm-2">
													<label for="name"></label>
											</div>
											<div class="col-sm-8">
											<input type="text" class="form-control mydatepicker"
												id="Start_DateID" name="Start_Date" placeholder="mm/dd/yyyy"
												style="height: 39px;">
											</div>
									    </div> -->


									<div class="form-group row">
									<div class="col-sm-2">
									<label for="name"></label>
									</div>
									<div class="col-sm-8">
										
								 <input type = "text" class="form-control mydatepicker" placeholder="DATE:YYYY MM DD" id = "datepicker-3"
								 name="Start_DateID" onkeypress="Start_Date()" value="" style="height: 39px;">
   		
									<!-- <input type="date" class="form-control mydatepicker" id="datepicker" 
									name="Start_DateID" data-date-format="YYYY MM DD" onkeypress="Start_Date()" value="" style="height: 39px;"> -->
			

										</div>
										</div>

										<div class="form-group row">
											<div class="col-sm-2">
												<label for="name"></label>
											</div>
											<div class="col-sm-8">
												<div class="field_wrapper">
													<div>
														<input type="text" name="Module_Name" id="m1"
															placeholder="Enter Module_Name"> <a
															href="javascript:void(0);" class="add_button"
															title="Add field"><img
															src="../required/assets/images/add1.png" height="20"
															width="20" /></a>&nbsp;&nbsp;
													</div>
												</div>
											</div>
											
										</div>

										<div class="border-top">
											<div class="card-body">
												<button class="btn btn-success btn-md"
													style="border-radius: 12px" type="submit">Submit</button>
												<a href="MAdmin/TeamLeader_Dash.jsp"><button class="btn btn-danger btn-md"
													style="border-radius: 12px; margin-left: 30px" type="button"
													class="btn btn-primary" value="Reset">Cancel</button></a>
											</div>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-body"
						style="background: linear-gradient(to bottom left, #757575, transparent);">
						<fieldset class="col-md-12">
							<legend class="legend_border col-sm-3"
								style="padding-right: 5px;"> Project Datatable</legend>
							<div class="table-responsive">
								<table  id="zero_config" class="table table-striped table-hover table-bordered ">
									<thead>
										<tr class="font-weight-bold">
											<th><b>Sr. No</b></th>
											<th><b>Project Name</b></th>
											<th><b>Software Tool</b></th>
											<th><b>Start_Date</b></th>
											<th><b>Actions</b></th>
										</tr>
									</thead>
									<%
										int i = 0;

										int pm_id = 0;
										List<AddProjectBean> projectlist = AddProjectDao.getProjectNames();
										for (AddProjectBean beanObj : projectlist) {

											pm_id = beanObj.getPM_Id();
											System.out.println("id in jsp " + pm_id);
									%>
									<tbody>
										<tr>
											<td><%=++i%></td>

											<td><%=beanObj.getProject_Name()%></td>
											<td><%=beanObj.getSoft_Tools()%></td>
											<td><%=beanObj.getStart_Date()%></td>
											<td>
												<button type="button"
													class="btn btn-danger btn-xs mdi mdi-delete-forever"
													onclick="getDeleteProjectId(<%=beanObj.getPM_Id()%>);"
													data-toggle="modal" data-target="#myModal"></button>&nbsp;&nbsp;
												<button type="button"
													class="btn btn-success btn-xs mdi mdi-grease-pencil"
													onclick="getUpdateProjectId(<%=beanObj.getPM_Id()%>);"
													data-toggle="modal" data-target="#myModal1"></button>
											</td>
										</tr>
										<%
											}
										%>
									</tbody>

								</table>
							</div>
						</fieldset>
					</div>
				</div>


				<!--********deleteModal view ********* -->
				<div class="modal  displayDeletecontent" id="myModal" role="dialog">
				</div>
				<!--**********update modal view******* -->
				<div class="modal displayUpdatecontent" id="myModal1" role="dialog"></div>


				<!-- ============================================================== -->
				<!-- End PAge Content -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- Right sidebar -->
				<!-- ============================================================== -->
				<!-- .right-sidebar -->
				<!-- ============================================================== -->
				<!-- End Right sidebar -->
				<!-- ============================================================== -->
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
	<script 
		src="../required/assets/libs/quill/dist/quill.min.js"></script>
	
	<script src="../required/dist/js/jquery-1.10.2.min.js"></script>
	 <script src="../required/dist/js/jquery-3.4.1.min.js"></script>
	<script src="../required/dist/js/jquery-ui.min.js"></script> 
	<script src="../required/dist/js/jquery-ui.min1.js"></script>
	
			
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
                control: $(this).attr('data-control') || 'hue',
                position: $(this).attr('data-position') || 'bottom left',

                change: function(value, opacity) {
                    if (!value) return;
                    if (opacity) value += ', ' + opacity;
                    if (typeof console === 'object') {
                        console.log(value);
                    }
                },
                theme: 'bootstrap'
            });

        });
    
        
        jQuery('.mydatepicker').datepicker();
        jQuery('#datepicker-autoclose').datepicker({
            autoclose: true,
            todayHighlight: true
        });
        var quill = new Quill('#editor', {
            theme: 'snow'
        });

    </script>
    
    	<script>
		function check()
{
  var pass1 = document.getElementById('mobile');
 var message = document.getElementById('message');
var goodColor = "#0C6";
    var badColor = "#FF9B37";

    if(mobile.value.length!=10){

        mobile.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = "required 10 digits, match requested format!"
    }}
</script>
  
  
	<script type="text/javascript">
$(document).ready(function(){
    var maxField = 1000; //Input fields increment limitation
    var addButton = $('.add_button'); //Add button selector
   
    var wrapper = $('.field_wrapper'); //Input field wrapper
    var fieldHTML = '<div><input type="text" name="Module_Name" id="m1" value=""/><a href="javascript:void(0);" class="remove_button height="10px" width="10px""><img src="../required/assets/images/remove2.png" height="20px" width="20px"/></a></div>'; //New input field html

    var x = 1; //Initial field counter is 1
    
    //Once add button is clicked
    $(addButton).click(function(){
        //Check maximum number of input fields
        if(x < maxField){ 
            x++; //Increment field counter
            $(wrapper).append(fieldHTML); //Add field html
        }
    });
    
    //Once remove button is clicked
    $(wrapper).on('click', '.remove_button', function(e){
        e.preventDefault();
        $(this).parent('div').remove(); //Remove field html
        x--; //Decrement field counter
    });
    
});
</script>

		<script>
			$(document).ready(function()
					{
		$('#datepicker').datepicker(); 
			})
			</script>
			  
    
    
	<script type="text/javascript">
    function getDeleteProjectId(id){
    	//alert("hi" + id);
    	$.ajax({
    		type:"POST",
    		url:"../DeleteProjectByIdServlet",
    		data:{pmid : id},
    		success: function(response){
    			$(".displayDeletecontent").html(response);
    		}
    	});//alert("bye");
    }
    </script>

	<script type="text/javascript">
   function getUpdateProjectId(id)
   {
	   $.ajax({
		   type:"POST",
		   url:"../UpdateProjectByIdServlet",
		   data:{uid : id},
		   success: function(response)
		   {
			   $(".displayUpdatecontent").html(response);
		   }
	   });
   }
   </script>


 <script>
         $(function() {
            $("#datepicker-3").datepicker({
             
               dateFormat:"yyyy-mm-dd",
             
            
            });
         });
      </script>

<!-- <script type="text/javascript">
function Start_Date(){
	var today=new Date(),
    yy=today.getFullYear(),
    mm=today.getMonth()+1,
    dd=today.getDate();
		if(dd<10){
			dd='0'+dd;
		}if(mm<10){
			mm='0'+mm;
		}
		var a=yy+'/'+mm+'/'+dd;
		document.getElementById('Start_DateID').value=a;
	}
Start_Date();
</script>
 -->
 <script>
        /****************************************
         *       Basic Table                   *
         ****************************************/
        $('#zero_config1').DataTable();
       </script>
</body>

</html>