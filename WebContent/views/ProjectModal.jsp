 <head>
 
 <link rel="stylesheet" type="text/css"
	href="../required/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/quill/dist/quill.snow.css">
 </head>
 <style>

.a{
margin-bottom: 20px;
padding-right: 100px;
    
    }
</style>

 <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header f "style="background: darkkhaki;">
        <h5 class="modal-title">Add Project</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    	<div class="row">
			<div class="col-md-12" style="background:#9DC183;">
				<div class="card" align="center" style="background-color: inherit">
					<form action="../AssginProject_Modal" method="POST">
						<fieldset class="col-sm-12">
							<legend class="legend_border col-sm-4"
							style="padding-right: 5px;">PROJECT DATA</legend>
							
							
								<div class="form-group row text-right">
										<div class="col-sm-4">
									<label for="name">Project Name</label>
										</div>
										<div class="col-sm-8">
										<input type="text" class="form-control" name="Project_Name"
											maxlength="50" placeholder="PROJECT NAME"onkeypress="return alphaOnly(event);"
											style="text-transform: uppercase;" required>
										</div>
									</div>
									
									
															
									<div class="form-group row text-right">
									    <div class="col-sm-4">
									    <label for="name">Software Tools</label>
									    </div>
										<div class="col-sm-8">
										<input type="text" class="form-control" name="Soft_Tools"
											maxlength="30" placeholder="SOFTWARE PACKAGE NAME"
											onkeypress="return alphaOnly(event);"
											style="text-transform: uppercase;" required>
										</div>
										</div>
										
								<div class="form-group row text-right">
									<div class="col-sm-4">
									<label for="name">Start Date</label>
									</div>
									<div class="col-sm-8">
										
								 <input type = "text" class="form-control mydatepicker" placeholder="DATE:YYYY MM DD" id="Start_DateID"
								 name="Start_Date" onkeypress="Start_Date()" value="" style="height: 39px;">
   		
										</div>
							</div>

										<div class="form-group row text-right">
											<div class="col-sm-4">
												<label for="name">Name Of Module</label>
											</div>
											<div class="col-sm-8 text-left">
												<div class="field_wrapper">
													<div>
														<input type="text" name="Module_Name" id="noofmodules"
															placeholder="Enter Module_Name"> <a
															href="javascript:void(0);" class="add_button"
															title="Add field"><img
															src="../required/assets/images/add1.png" height="20"
															width="20" /></a>&nbsp;&nbsp;
													</div>
												</div>
											</div>
											
										</div>
							
						
		     		<div class="modal-footer f">
						<button type="submit" class="btn btn-success btn-md">Add</button>
					 	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						
					</div>
					 </fieldset>
				 </form>
						<script src="../required/dist/js/Defecttrackingtool.js"></script>
						<script src="../required/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
						<script src="../required/assets/libs/quill/dist/quill.min.js"></script> 				
						<script src="../required/dist/js/jquery-1.10.2.min.js"></script>
						<script src="../required/dist/js/jquery-3.4.1.min.js"></script>
						<script src="../required/dist/js/jquery-ui.min.js"></script> 
						<script src="../required/dist/js/jquery-ui.min1.js"></script>
  
		   		</div>
		   	</div>
		 </div>
		
    </div>
  </div>
</div> 
<script type="text/javascript">
function Start_Date(){
		var today=new Date(),
		      dd=today.getDate(),
		      mm=today.getMonth()+1,
		      yy=today.getFullYear();
		if(dd<10){
			dd='0'+dd;
		}if(mm<10){
			mm='0'+mm;
		}
		var a=mm+'/'+dd+'/'+yy;
		document.getElementById('Start_DateID').value=a;
	}
	
Start_Date();
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
	