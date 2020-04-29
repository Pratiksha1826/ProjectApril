 <style>

.a{
margin-bottom: 20px;
padding-right: 100px;
    
    }
</style>
<%@page import="DAO.AddProjectDao"%>
<%@page import="Bean.AddProjectBean,java.util.List" %>
<body>
<%
   Object obj= session.getAttribute("id");
   int PM_Id=Integer.parseInt(obj.toString());
   List<AddProjectBean> list1=AddProjectDao.ProjectDetails(PM_Id);
   for(AddProjectBean beanobj: list1)
   {
	   %>
 <div class="modal-dialog modal-lg">
    <div class="modal-content">
    	<div class="modal-header" style="background: darkkhaki;">
    		<h4 class="modal-title col-sm-6">Update User</h4>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
      	<div class="modal-body">
      		<div class="row">
				<div class="col-md-12" style="background:#9DC183;">
					<div class="card" align="center" style="background-color: inherit">
						<form action="../UpdateProjectAction" method="POST">
							<fieldset class="col-sm-12">
							<legend class="legend_border col-sm-4"
										style="padding-right: 5px;">USER DETAILS</legend>
     					<input type="hidden" name="uid" value="<%=beanobj.getPM_Id() %>">
      					<div class="form-group row">
							<div class="col-sm-4 text-right">
								<label for="name" >Project Name</label>
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control"
								placeholder="Full Name" maxlength="30" name="Project_Name"
								value="<%=beanobj.getProject_Name() %>" id="projectname" 
								onkeypress="return alphaOnly(event);"
								style="text-transform: uppercase;" required>
							</div>
						</div><br>

						<div class="form-group row">
							<div class="col-sm-4 text-right">
								<label for="name">Software Tools</label>
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control"
								placeholder="Full Name" maxlength="30" name="Soft_Tools"
								value="<%=beanobj.getSoft_Tools() %>" id="softtools"
								onkeypress="return alphaOnly(event);"
								style="text-transform: uppercase;" required>
							</div>
						</div> <br>     
      				
  						<div class="form-group row">
							<div class="col-sm-4 text-right">
								<label for="name">Start Date</label>
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control"
								name="Start_Date" placeholder="Start Date"
								id="startdate"value="<%=beanobj.getStart_Date() %>" 								
								 required>
							</div>
						</div> <br>   				
     
     					
     				<%} %>
     				 	<% List<AddProjectBean> moduleName = AddProjectDao.getModuleName(PM_Id) ;
     					for(AddProjectBean beanObj1:moduleName){
     						
     						
     						
     					 %>
     
     					<div class="form-group row">
										<div class="col-sm-4 text-right">
											<label for="num">Name Of Module</label>
											<input type="hidden" name="pdId" value="<%=beanObj1.getPD_ID()%>">
										</div>
										<div class="col-sm-6">
											<input type="text" class="form-control" maxlength="10"
												placeholder="No Of Modules" name="Module_Name" id="noofmodules"
												value="<%=beanObj1.getModule_Name()%>"
												onkeypress="return alphaOnly(event);" required>
										</div>
									</div>
     
     
     
     				
 						<%	
     						} %>
    
					    
					     <div class="modal-footer f">
							<button type="submit" class="btn btn-success btn-md">Update</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
					  
					    </fieldset> 
					    	<script src="../required/dist/js/Defecttrackingtool.js"></script>
					    
					    </form> 
    					</div>
  					</div>
  				</div>
  			</div>
  		</div>
	</div>
</body>