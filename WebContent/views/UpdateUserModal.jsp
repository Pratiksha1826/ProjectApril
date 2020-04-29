<%@ page import="DAO.*"%>
<%@ page import="Bean.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.List.*"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style></head>
<body>

	<div class="modal-dialog modal-lg">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" style="background: darkkhaki;">

				<h4 class="modal-title col-sm-6">Update User</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">


				<div class="row">
					<div class="col-md-12" style="background:#9DC183;">
						<div class="card" align="center" style="background-color: inherit">
							<form action="../UpdateAddUSer" method="post">
								<%
									Object obj = session.getAttribute("id");
									int uid = Integer.parseInt(obj.toString());

									List<AddUserBean> list1 = AddUserDao.getUserById(uid);

									for (AddUserBean beanobj : list1) {
										System.out.println("in jsp" + beanobj.getRole());
								%>
								<fieldset class="col-sm-12">
									<legend class="legend_border col-sm-4"
										style="padding-right: 5px;">USER DETAILS</legend>
									<input type="hidden" name="uid" value="<%=beanobj.getUD_Id()%>">
									<div class="form-group row">

										<div class="col-sm-2 text-right">
											<label for="name">Name</label>
										</div>
										<div class="col-sm-8">
											<input type="text" class="form-control"
												placeholder="Full Name" maxlength="30" name="name"
												value="<%=beanobj.getName()%>"
												onkeypress="return alphaOnly(event);"
												style="text-transform: uppercase;" required>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-2 text-right">
											<label for="num">Contact No</label>
										</div>
										<div class="col-sm-8">
											<input type="text" class="form-control" maxlength="10"
												placeholder="PHONE NO. " name="contact"
												value="<%=beanobj.getContact()%>" 
												onkeypress="return isNumberKey(event);" required>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-2 text-right">
											<label for="email">EmailId</label>
										</div>
										<div class="col-sm-8">
											<input type="email" class="form-control" id="UserEmail"
												placeholder="EMAIL" name="email" onkeyup="ValidateEmail()"
												value="<%=beanobj.getEmail()%>"	required> 
											<span id="lblError" style="color: red"></span>

										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-2 text-right">
											<label for="aliesname">Alias Name</label>
										</div>
										<div class="col-sm-8">
											<input type="text" class="form-control" name="aliesname"
												value="<%=beanobj.getAliesname()%>"
												placeholder="Alies Name" maxlength="10"
												onkeypress="return alphaOnly(event)"
												style="text-transform: uppercase" required>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-2 text-right">
											<label for="role">Role</label>
										</div>
										<div class="col-sm-8">
											<select class="abc" name="role">
												<option><%=beanobj.getRole()%></option>
												<option value="TeamLeader">Team Leader</option>
												<option value="Developer">Developer</option>
												<option value="Tester">Tester</option>
											</select>

										</div>
									</div>
									<div class="modal-footer f">
										<button type="submit" class="btn btn-success btn-md">Update</button>
													<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
									
									</div>
								</fieldset>
								<%
									}
								%>
							</form>
								<script src="../required/dist/js/Defecttrackingtool.js"></script>
							
						</div>
					</div>
				</div>
			</div>
		
		</div>
	</div>

</body>
</html>