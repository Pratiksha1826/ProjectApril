 <%@page import="java.util.*, Bean.TestCaseBean , Bean.AddUserBean ,Bean.DefectBean" %>
 <%@page import="DAO.TestCaseDao,DAO.DefectDao,DBConnection.DbConnection ,  DAO.AddUserDao" %>
 <%@page import="java.sql.*"%>
   <div class="modal-dialog">
   
      <div class="modal-content">
         <div class="modal-header"style="background: darkkhaki;">
        <h5 class="modal-title">Defect Page</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        </div>
        
        <div class="modal-body">
                  <div class="row">
					<div class="col-md-12" style="background: linear-gradient(to bottom left, #757575, transparent);">
						<div class="card" align="center" style="background-color: inherit">
							<form action="../../Defect_Action" method="post">
								
								
								<fieldset class="col-sm-12">
									<legend class="legend_border col-sm-4"
										style="padding-right: 5px;">Defect</legend>
	 <%--  <%
	  int did=0,did1=0;
		try{
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("Select max(TestCase_Id) from testcase_master where status=1");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				did1=rs.getInt(1);
				did1++;
				System.out.println("Defect id.........."+did1);
	  %>								
									
          
										 <div class="form-group row">
											<div class="col-sm-2">
												<label for="Defectid"></label>
											</div>
											<div class="col-sm-8">
												<input type="text" class="form-control"
													placeholder="Defect_Id" maxlength="30" name="Test_Case_Id" value="<%= did+1 %>"
													id="iddefect">
											</div>
										</div>
	<%
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		} --%>
	<% 	
		String step , aresult , exresult ,modulename;
		Object ob = session.getAttribute("id");
		int s = Integer.parseInt(ob.toString());
		System.out.println("id in defect page"+s);
		ArrayList<TestCaseBean> list =(ArrayList<TestCaseBean>) DefectDao.getData(s);
		for(TestCaseBean t:list)
		{
	%>
										
							<div class="form-group row">
											<div class="col-sm-2">
												<label for="Titlename" ></label>
											</div>
											<div class="col-sm-8">
												<input type="text" class="form-control"
													name="Defect_name" placeholder="Defect_Title" maxlength="30" value="<%= t.getTestcase_title() %>">
											</div>
										</div>
																	
										<div class="form-group row">
											<div class="col-sm-2 text-right">
												<label for="Steps" ></label>
											</div>
											<div class="col-md-8">
												
													<textarea name="Steps" placeholder="Steps"  id="text2"><%=t.getSteps()%></textarea> 
											</div>
										</div>
										
										
										<div class="form-group row">
											<div class="col-sm-2 text-right">
												<label for="Excepted_result" ></label>
											</div>
											<div class="col-sm-6">
												<textarea name="Excepted_result" placeholder="Expected Result" id="text2"><%=t.getExpected_Result() %></textarea> 
											</div>
										</div>

										<div class="form-group row">
											<div class="col-sm-2  text-right">
												<label for="Actual_result" ></label>
											</div>
											<div class="col-sm-8">
												<textarea name="Actual_result" placeholder="Actual Result" id="text2" ><%=t.getActual_Result() %></textarea> 
										</div>
										</div>
	
	
                                         <div class="form-group row">
											<div class="col-sm-2 text-right">
												<label for="Module" ></label>
											</div>
											<div class="col-sm-8" >
												<input type="text" class="form-control" value="<%=t.getModule_name() %>"
													placeholder="Module" maxlength="30" name="Module_Name" 
													id="module" >
	
											</div>
										
									</div>
									<%} %>
								
						
										
										<div class="form-group row">
											<div class="col-sm-2 text-right">
												<label  class="dropdown"></label>
											</div>
											<div class="col-sm-8 text-left">
												  <select class="select2 dropdown-content" id="severity" name="Severity" style="width: 100%; height: 36px;">
													
													<option value="Severity" selected disabled>Severity</option> 
													<option value="Critical">Critical</option>
													<option value="Major">Major</option>
													<option value="Moderate">Moderate</option>
													<option value="Miner">Miner</option>
													<option value="Cosmetic">Cosmetic</option>
													</select>
											</div>
										</div>
										
										
											<div class="form-group row">
											<div class="col-sm-2 text-right">
												<label for="Setpriority"> Set Priority:</label>
											</div>
											<div class="col-sm-8">
												<label><input type="radio" name="Set_priority" value="Low"> Low</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<label><input type="radio" name="Set_priority" value="medium"> Medium</label>&nbsp;&nbsp;&nbsp;&nbsp;
												<label><input type="radio"  name="Set_priority" value="high"> High</label>
											</div>
										</div>
										
										
										<div class="form-group row">
											<div class="col-sm-2 text-right">
												<label for="Screenshot" >Screenshot</label>
											</div>
											<div class="col-sm-8">
												<input type="file" name="Sceeenshot" value="Choose file" maxlength="25" style="height: 25px; width:100%">
											</div>
										</div>
										
										
										
										
									
										<div class="form-group row">
								<div class="col-sm-2 text-right">
									<label for="Status"></label>
										</div>
											<div class="col-sm-8 text-left">
													  <select class="select2 dropdown-content" id="status" name="Status" style="width: 100%; height: 36px;">
													
													<option value="Severity" selected disabled>Status</option> 
													<% 
													List<DefectBean> l = DefectDao.getDefectStatus();
													for(DefectBean d : l)
														{
													%>
													<option value="<%=d.getStatus_Id()%>"><%=d.getStatus_name() %></option>
													<%
														}
													%>
													</select>
											</div>
									</div>
										
										
								<div class="form-group row">
								<div class="col-sm-2 text-right">
									<label for="orgName"></label>
										</div>
											<div class="col-sm-8 text-left">
 												<select class="select2 form control my-0 py-1 line-border" name="Assign_to" id="assgintoid"  style="width: 100%; height: 36px;">
													  	<option value="select version" selected disabled>Assign To</option>
													
													<% 
													List<AddUserBean> lst=AddUserDao.getUserDetail();
													for(AddUserBean k:lst)
													{	
													%>
														<option value="<%=k.getUD_Id()%>"><%=k.getName()%></option>
													<%
													}
													%>
													</select>
											</div>
											
									</div>
									
												<input type="hidden" name="testcase_id" id="tcbid" value="<%= s %>">	
				
											
											<div class="border-top">
											<div class="card-body">
												<button class="btn btn-success btn-md"
													style="border-radius: 12px" type="submit">Submit</button>
												          <button type="button" class="btn btn-default btn-md" style="border-radius: 13px" data-dismiss="modal">Close</button>
												
											</div>
										</div>
									</fieldset>
								</form>
	</div>
	</div>
	</div>
        </div>
        
      </div>
      
</div>
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

