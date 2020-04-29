
<!DOCTYPE html>
<%@ page import="Bean.DefectBean,Bean.AssginProjectBean, Bean.AddUserBean ,java.util.*"%>
<%@ page import="DAO.AddUserDao , DAO.AssginProjectDao, DAO.DefectDao " %>
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
<title>Tester DashBoard</title>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="../../required/assets/libs/select2/dist/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="../../required/assets/libs/jquery-minicolors/jquery.minicolors.css">
<link rel="stylesheet" type="text/css"
	href="../../required/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" type="text/css"
	href="../../required/assets/libs/quill/dist/quill.snow.css">
<link href="../../required/dist/css/style.min.css" rel="stylesheet">


<link href="../../required/dist/css/AddUser.css" rel="stylesheet">
<link href="../required/dist/css/styleborder.css">

<!-- HTML5 Shim and Respond.js IE8 support o2f HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style type="text/css">
.m {
	margin: 600px;
	padding: 0px;
	background: url("../required/assets/images/img1.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	font-family: sans-serif;
}

.grey_color {
	color: #ccc;
	font-size: 14px;
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
		<%@ include file="Header.jsp"%>
		<%@ include file="LeftNavTs.jsp"%>

		<div class="page-wrapper">
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-md-12">
						<div class="card" align="center"></div>
					</div>

				</div>
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body"
								style="background: linear-gradient(to bottom left,#757575, transparent);">
								<div class="row">
								<%
									Object obj=session.getAttribute("id");
									String Id = obj.toString();
									int id =Integer.parseInt(Id);
									int pmid = 0;
									System.out.println("????????????????"+Id);
									ArrayList<AssginProjectBean> list = AssginProjectDao.SelectProjectByRole(id);
									for(AssginProjectBean as:list)
									{
										String str = as.getProject_Name();
											pmid = as.getPM_Id();
										//int id = as.getPM_Id(); 
											System.out.println("project id:"+pmid);
									%>
								
									<div class="col-md-6 col-lg-3 col-xlg-4"> 
										<div class="card card-hover " > 
											<div class="box bg-warning text-center" id="projectid" onclick="data()" > 
												<h1 class="font-light text-white"> 
												<!--	<a type="button" class="showSingle bg-info" target="1"><i class="fas fa-building"></i></a> -->
												</h1> 
											<h6 class="text-white"><%=str%></h6>
											</div> 
										</div> 
									</div>   
								<% } %>
								</div>
							</div>
						</div>
						
						
						<div class="card"  id="projecttable">
							<div class="card-body"
								style="background: linear-gradient(to bottom left,#757575, transparent);">
							<fieldset class="col-md-12">
								<div class="table-responsive">
								
								<table 
									class="table table-striped table-hover table-bordered ">
							
								<thead>
								<tr>
								<th>Defect Id</th>
								<th>Defect Name</th>
								<th>Assgin TO</th>
								<th>Status</th>
								<th>Action</th>
								</tr>
								</thead>
								 		
								<%
								int did=0 , sid=0;
								System.out.println("after select:"+pmid);

								 List<DefectBean> l = DefectDao.getTestcaseId(pmid); 
								 for(DefectBean db : l)
									{ 
									 did = db.getAssign_to();
										System.out.println("Developer Id:"+did);
										sid = db.getStatus_Id(); 
									
								%>
								<tbody>
								<tr>
							
								
								<td><%= db.getDefect_id()%></td>
								<td><%=db.getDefect_title() %></td>
								<%
								
								 List<AddUserBean> l1 =AddUserDao.getUserName(did); 
								 for(AddUserBean d : l1)
									{ 
								
								%>
								<td><%=d.getName()%></td>
								<%} 
								

								 List<DefectBean> l2 = DefectDao.getDefectStatus(sid); 
								 for(DefectBean b : l2)
									{ 
								%>
								<td><%=b.getStatus_name()%></td>  
								<%} %>
								<td><%=1 %></td> 
								</tr>
							 
								</tbody>
								<% 
								}
									%>
								</table>
									</div>
								</fieldset>
							</div>
						</div>
					</div>

				</div>


				

			</div>
		</div>
	</div>
	<!--**********end modal -->
	<script src="../../required/dist/js/Defecttrackingtool.js"></script>

	<script src="../../required/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="../../required/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="../../required/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="../../required/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script src="../required/assets/extra-libs/sparkline/sparkline.js"></script>
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
	<script src="../../required/assets/libs/quill/dist/quill.min.js"></script>
	    <script src="../../../../Required/assets/extra-libs/DataTables/datatables.min.js"></script>
	
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
        /*datwpicker*/
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
       $(document).ready(function(){
    		
    	   // $("#tableid").prop("disabled", true);
//    		document.getElementById("tableid").disabled = true;
    		//document.getElementById("personid").disabled = true;
    		//document.getElementById("assbtn").disabled = true;
    		/* $("#tableid").hide();
    		$("#personid").hide();*/
    		$("#projecttable").hide(); 
       });
       
       function data()
       {
			  alert("hihi");

		    $("#projecttable").show();

       }
    		/*   $("#projectid").click(function(){
    			  alert("hihi");
    		  }); */ 
    		
    
      
      
       </script>
        </body>
 </html>
