 <%@ page import="Bean.AddProjectBean,java.util.List,Bean.TestCaseBean"%>
<%@ page import="DAO.AddProjectDao,DBConnection.DbConnection,DAO.TestCaseDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

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
	href="../../required/assets/images/favicon.png">
<title>Tester</title>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="../../required/assets/libs/select2/dist/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="../../required/assets/libs/jquery-minicolors/jquery.minicolors.css">
<link rel="stylesheet" type="text/css"
	href ="../../required/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" type="text/css"
	href="../../required/assets/libs/quill/dist/quill.snow.css">
<link href="../../required/dist/css/style.min.css" rel="stylesheet">

<link href="../../required/dist/css/AddUser.css" rel="stylesheet">
<link href="../../required/dist/css/styleborder.css">

<!-- <link href="../required/dist/css/testpage.css"> -->
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<style>
#text1
{
	 width: 440px;
  height: 50px;
}

#text2
{
	width: 285px;
	height:50px;

}
#B
{
	width:475px;
}

#project
{
	width:700px;
}

<%--#module
{
	width:475px;
}--%>
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
		<%@ include file="LeftNavTs.jsp"%>
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
								<form action="../../TestCase_Action" method="post"
									style="margin-left: 120px; text-align: center">
									<fieldset class="col-md-10">
										<legend class="legend_border col-sm-3"
										style="padding-right: 5px;">Tester</legend>
											<%									
												int tid=0,tid1=0;
										
										try
										{
											
											Connection conn=DbConnection.getConnection();
											PreparedStatement ps=conn.prepareStatement("Select max(TestCase_Id) from testcase_master where status=1 ");
											ResultSet rs=ps.executeQuery();
											while(rs.next())
											{
												
												 tid1=rs.getInt(1);
												 tid1++;
												System.out.println("Testcase Id are..............:"+tid1);
										%>

							
							 <div class="form-group row">
											<div class="col-sm-2">
												<label for="testid"></label>
											</div>
											<div class="col-sm-8">
												<input type="hidden" class="form-control"
													placeholder="Test_Case_Id" maxlength="30" name="Test_Case_Id" value="<%=tid+1%>"
													id="idtext"  onkeypress="return isNumberKey(event);"
													style="text-transform: uppercase;" >
											</div>
										</div>
					
											<%					
															}
											}
											catch(Exception e)
											{
												e.printStackTrace();	
											}
											%>						
																					
						
                                 <div class="form-group row">
										<label for="ProjectName"
											class="col-md-2  control-label col-form-label">
										</label>
											<div class="text-left col-md-8">
                                        <select class=" select2 form-control m-t-15"  name="project_name" style="height: 36px;width: 100%;" onchange="selectID(this.value)" id="project">
                                            <!--  <optgroup label="project_name">-->
											<option value="select project_name" selected disabled> select project_name </option>
											
												<%
											    	List<AddProjectBean> rb=AddProjectDao.getProjectNames();
													String project_name="";
													int pid=0;
													for(AddProjectBean option:rb)
													{
														project_name=option.getProject_Name();
														pid=option.getPM_Id();
														
											    	%>
															<option value="<%= pid %>"><%= project_name%></option>
													
													<%} %>
													
													</select>
													</div>
												</div>
									
												
										<div class="form-group row">
											<div class="col-sm-2">
												<label for="testtitle"></label>
											</div>
											<div class="col-sm-8">
												<input type="text" class="form-control"
													placeholder="Test_Case_Title" maxlength="30" name="Test_Case_Title"
													onkeypress="return alphaOnly(event);">
											</div>
										</div>
										
										   <div class="form-group row">
											<div class="col-sm-2">
												<label for="testcasetype"></label>
											</div>
											<div class="col-md-12">
													<div>
													<label>Test Case Type</label>
													<label>
													<input type="radio" name="Test_Case_Type" value="Positive">Positive
													<input type="radio" name="Test_Case_Type" value="Negative">Negative</label>
												</div>
												</div>
											<!-- <div class="col-sm-8">
												<div class="col-md-4">
												
													<label for="testcasetype">Test Case Type</label>
													<div class="col-sm-4">
																										
												</div>
												</div>
												 <div class="col-sm-4">
													<label> <input type="radio" name="Test_Case_Type" value="Positive"/>  Positive</label>
													</div>
												
												<div class="col-sm-4">
													<label> <input type="radio" name="Test_Case_Type" value="Negative"/>  Negative</label>
												</div>
											</div>
											 -->
													
												
											</div>
											
										
											
										<div class="form-group row">
											<label for="ModuleName"
												class="col-md-2 text-right control-label col-form-label">
											</label>
											<div class="text-left col-md-8">
											<div class="input-group md-form form-sm form-2 pl-0">
											<select class="select2 form-control custom-select" name="Module_Name"
													id="module" style="width: 100%; height: 36px;">
													<option value="select Module_name" selected disabled> select Module_Name </option>
											</select>
											
											</div>
											</div>
										</div>
								
								
										<div class="form-group row">
											<div class="col-sm-2">
												<label for="Precondition"></label>
											</div>
											<div class="col-md-8">
												<input type="text" class="form-control"
													placeholder=" Pre_Condition " name="Pre_Condition" maxlength="30">
											</div>
										</div>


										<div class="form-group row">
											<div class="col-sm-2">
												<label for="Steps"></label>
											</div>
											<div class="col-sm-8">
												<!--  <input type="text" class="form-control" name="Steps"
													placeholder="Steps">-->
													<textarea  placeholder="Steps" name="Steps" id="text1"></textarea> 
											</div>
										</div>

										<div class="form-group row">
											<div class="col-sm-2">
												<label for="TestData"></label>
											</div>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="Test_Data"
													placeholder="Test_Data">
											</div>
										</div>
										
										
									 	<div class="form-group row">
											<div class="col-sm-2">
												<label for="Browser"></label>
											</div>
											<div class=" text-left col-md-8">
												  <select class="select2 form control my-0 py-1 line-border" name="Browser" id="B" 
												  onchange="select_browser(this.value)" style="width: 100%; height: 36px;">
													  	<option value="select version" selected disabled> select Browser_Name </option>
													
													<% 
													List<TestCaseBean> lst=TestCaseDao.getbrowserid();
													String bname;
													int bid;
													for(TestCaseBean k:lst)
													{	
														bid=k.getBrowser_id();
														bname=k.getBrowser_Type();
														
													%>
														
														<option value="<%= bid %>"><%= bname%></option>
													<%
													}
													%>
													</select>
											</div>
											
										</div>
										
										<div class="form-group row">
											<label for="ModuleName"
												class="col-md-2 text-right control-label col-form-label">
											</label>
											<div class="text-left col-md-8">
											<div class="input-group md-form form-sm form-2 pl-0">
											<select class="select2 form-control custom-select" name="version_Name"
													id="version" style="width: 100%; height: 36px; text-transform: uppercase;">
													<option value="select version" selected disabled> select version </option>
													
 													
												
											</select>
											
											</div>
											</div>
										</div>
								

									
											<div class="form-group row">
											<div class="col-sm-2">
												<label for="Expectresult"></label>
											</div>
											<div class="col-sm-8">
												
													<textarea  placeholder="Expected Result" name="Expect_Result" id="text1" ></textarea>
											</div>
										</div>
										
											<div class="form-group row">
											<div class="col-sm-2">
												<label for="Status"></label>
											</div>
											<div class="col-sm-8 text-left">
												<select class="abc select2" name="Status">
													<option value="">Select Status</option>
													<option value="Positive">Pass</option>
													<option value="Negative">Fail</option>
													<option value="Positive">Not Applicable</option>
													<option value="Negative">Pending</option>
													<option value="Negative">Block</option>

												</select>

											</div>
										</div>
										
											<div class="form-group row">
											<div class="col-sm-2">
												<label for="Actualresult"></label>
											</div>
											<div class="col-sm-8">
												
													<textarea  placeholder="Actual Result" name="Actual_Result" onkeypress= "return alphaOnly(event);" id="text1"></textarea>
											</div>
										</div>
										
										
										
											<div class="border-top">
											<div class="card-body">
												
												<button class="btn btn-success btn-md"
													style="border-radius: 12px" type="submit" id="pass" data-target="#myModal" data-toggle="modal">Pass</button>
													<button class="btn btn-success btn-md"
													style="border-radius: 12px" type="submit" id="pass" onclick="">Save and Next</button>
												

											</div>
										</div>
										
										
				</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>

		
			<div class="card">
					<div class="card-body" style="background: linear-gradient(to bottom left,#757575, transparent);">
						<fieldset class="col-md-12">
							<legend class="legend_border col-sm-5" style="padding-right: 5px;">TestCase Datatable</legend>
								<div class="table-responsive">
										<table id="zero_config" class="table table-striped table-hover table-bordered ">
											<thead>
												<tr>
													<th>Sr.No</th>
													<th>Project Name</th>
													<th>TestCase Name</th>
													<th>Module Name</th>
													<th>Action</th>
												</tr>
											</thead>
											<%
												int i=0 ,testid=0; 
												String proj_name,module_name,testcase;
												List<TestCaseBean> pr_list=TestCaseDao.getAllInfo();
												for(TestCaseBean opt:pr_list)
												{
													testid = opt.getTestcase_id();

													proj_name=opt.getProject_name();
													module_name=opt.getModule_name();
													testcase=opt.getTestcase_title();
											%>
											<tbody>
													<tr>
														<td><%=++i %></td>
														<td><%=proj_name%></td>
														<td><%=testcase%></td>
														<td><%=module_name%></td>
														<td>
															<button type="button" class="btn btn-danger btn-xs mdi mdi-delete-forever"
															onclick="" data-toggle="modal" data-target="#deleteModal"></button>
														
															<button type="button" class="btn btn-sm btn-warning" onclick="defectid(<%=testid%>)" data-toggle="modal" 
														data-target="#defectmodule"  id="selectuserid" style="background-color: darkmagenta" >
													<i class="fas fa-plus" ></i></button> 
														
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
				

					<!--********ShowModal view ********* -->
				<div class="modal  displayDeletecontent" id="myModal" role="dialog">
					
				 <div class="modal-dialog">
	
      			<div class="modal-content">
       		 <div class="modal-header"style="background: darkkhaki;">
     		     <h4 class="modal-title">Test Case Id</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
        	</div>
        	<div class="modal-body">
       			<p>Your Test Case Id is: <b><%=tid1%> </b> </p>
			</div>
      
      	  <div class="modal-footer" style="background: darkkhaki;">
       	 	<button type="button" class="btn btn-success" data-dismiss="modal">ok</button>
          </div>
     	 </div>
      </div>
   </div>
     
    
					
					
				
				
				


				<!-- *************************************************************** -->
				<datalist id="datalist" style="-webkit-appearance: none;-moz-appearance: none">
				<%
					List<AddProjectBean> list=AddProjectDao.Projectest();
					for(AddProjectBean ap:list)
					{
				%>
				<option ><%= ap.getProject_Name()%></option>
				<%} %>
				</datalist>

				
				<datalist id="datalist1" style="-webkit-appearance: none;-moz-appearance: none">
				<%
					List<AddProjectBean> list1=AddProjectDao.ModuleTest();
					for(AddProjectBean ap:list1)
					{
						
						int id2=ap.getPD_ID();
		    			String mod_name=ap.getModule_Name();
				%>
				<option><%= ap.getModule_Name()%></option>
				<%
					}
					%>
				</datalist>
				
				
				 <div class="modal defectformcontent" id="defectmodule" role="dialog">
            	 
            	
            	 </div>



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
		
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->

			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->

</div>

</div>
</div>


	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script src="../../required/dist/js/Defecttrackingtool.js"></script>
	<script src="../../required/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="../../required/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="../../required/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="../../required/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script src="../../required/assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<script src="../../required/dist/js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="../../required/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="../../required/dist/js/custom.min.js"></script>
	<!-- This Page JS -->
	<script
		src="../../required/assets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
	<script src="../../required/dist/js/pages/mask/mask.init.js"></script>
	<script
		src="../../required/assets/libs/select2/dist/js/select2.full.min.js"></script>
	<script src="../../required/assets/libs/select2/dist/js/select2.min.js"></script>
	<script
		src="../../required/assets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
	<script
		src="../../required/assets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
	<script
		src="../../required/assets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
	<script
		src="../../required/assets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
	<script
		src="../../required/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
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

		/*datepicker*/
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
	function selectID(a)
	{
		
	//	alert("hi....................."+a);

		$.ajax({
			
			type: "POST",
			url: "../../TestCase_Id",
			data: {PID:a},
			success: function(response){
				
			//	alert("after name");
				$('#module').html(response);
				
			}
			
		});
		
	}
	</script> 
	
		<script type="text/javascript">
	function select_browser(a1)
	{
		
		//alert("hi.....................");

		$.ajax({
			
			type: "POST",
			url: "../../Browser_Id",
			data: {BID:a1},
			success: function(response){
				//alert("hello.....................");
				$('#version').html(response);
				//alert("by.....................");
				
			}
			
		});
		
	}
	</script> 
	
	
	
	
	
	
	
	
	
	<script type="text/javascript">
	/* 	$(document)
				.ready(
						function() {
							var maxField = 1000; //Input fields increment limitation
							var addButton = $('.add_button'); //Add button selector

							var wrapper = $('.field_wrapper'); //Input field wrapper
							var fieldHTML = '<div><input type="text" name="Module_Name" value=""/><a href="javascript:void(0);" class="remove_button"><img src="../required/assets/images/remove.png" height="20" width="20"/></a></div>'; //New input field html

							var x = 1; //Initial field counter is 1

							//Once add button is clicked
							$(addButton).click(function() {
								//Check maximum number of input fields
								if (x < maxField) {
									x++; //Increment field counter
									$(wrapper).append(fieldHTML); //Add field html
								}
							});

							//Once remove button is clicked
							$(wrapper).on('click', '.remove_button',
									function(e) {
										e.preventDefault();
										$(this).parent('div').remove(); //Remove field html
										x--; //Decrement field counter
									});

						});
		
		 */
		
		function CheckListed( txtSearch  ) 
		{
			var status;
		    var objList = document.getElementById("datalist");
		    for (var i = 0; i < objList.options.length; i++) {
		     if ( objList.options[i].value.trim().toUpperCase() == txtSearch.trim().toUpperCase() ) {
		    	  status=true;
		        }
		     
		     }
		     
		 }
		
		
		function CheckListed1( txtSearch  ) 
		{
			var status;
		    var objList = document.getElementById("datalist1");
		    for (var i = 0; i < objList.options.length; i++) {
		     if ( objList.options[i].value.trim().toUpperCase() == txtSearch.trim().toUpperCase() ) {
		    	  status=true;
		        }
		     
		     }
		}
		
		
	</script>
	
	<script type="text/javascript">
	 function defectid(id)
	 {
		
		//var e = document.getElementById("iddefect");
	//	alert("hie"+id);
		   $.ajax({
			   
			   type:"POST",
			   url:"../../Defect_id",
			   data:{defect_id : id},
			   success: function(response)
			   {
				 ///  alert("hihihhihiihihihhihhihi");
				   $(".defectformcontent").html(response);
				 //  alert("ddddd");
			   }
		   });
		   //alert("bye");
	   }	
	</script>

</body>

</html>