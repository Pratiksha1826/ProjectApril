<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="Bean.AddUserBean , DAO.AddUserDao ,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/select2/dist/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/jquery-minicolors/jquery.minicolors.css">
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" type="text/css"
	href="../required/assets/libs/quill/dist/quill.snow.css">
<link href="../required/dist/css/style.min.css" rel="stylesheet">


<link href="../required/dist/css/AddUser.css" rel="stylesheet">
<link href="../required/dist/css/styleborder.css">
</head>

<body>
<div class="modal-dialog">
<div class="modal-content">
		<div class="modal-header" style="background: darkkhaki;">
 		<h4 class="modal-title" ><b>Email</b></h4>
        <button type="button" class="close btn btn-md" style="color: black" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body" style="background:#9DC183;">
        <form action="../Email_servlet" method="post">
        <fieldset class="col-sm-12">
      	<legend class="legend_border col-sm-4"  style="padding-right:4px;">User Mail</legend>
        <% 
        //System.out.println("in emailUserModal");
        Object obj=session.getAttribute("EID");
        System.out.println("EID:"+obj);
        System.out.println("EmailUserModal");
        if(obj==null)
       	{
        	System.out.println("not getting an data");
        }
        else
        {
        	String str= obj.toString();
        	int id= Integer.parseInt(str);
        	List<AddUserBean> li=AddUserDao.getUserById(id);
        	for(AddUserBean rb:li)
        	{
        		String s=rb.getEmail();
        		System.out.println("s"+s);
        	%>
        	
        		<input type="hidden" name="TID" value="<%=id%>">
        		
        		<div class="form-group row">
        		<div class=" text-right col-sm-10"><i><label for="email">VERTICAL SOFTWARE PVT. LTD.</label></i></div>
        			<div class="form-group row ">
        			<input type="hidden"  name="from" class="form-control text-right" value="vertical.webmail@gmail.com" disabled>
        			</div>
        			</div>
        		
        		
        		<div class="from-group row">
        			 <div class="col-sm-2"><label for="email"></label></div>
        		<label for="orgName" class=" text-left control-label col-form-label">To</label><br>
        			</div>
        		<div class="from-group row">
        			 <div class="col-sm-2"><label for="email"></label></div>
        					<div class="col-md-6">
        				<!-- input For update button  -->
        			<input type="email"  name="to" class="form-control"  disabled="disabled"  id="uemail" value="<%=rb.getEmail()%>"  required>
           			</div>
           			
           			<div class="col-md-2">
					<button type="button" class="btn btn-warning  btn-xs mdi mdi-grease-pencil" id="bemail"   onclick="enable()"  >
					</button>
					</div>
					</div>
				<br>
        		
        		
        		 <div class="from-group row"> 
        			 <div class="col-sm-2"><label for="email"></label></div>
        		<label for="orgName" class=" text-left control-label col-form-label">Text</label><br>
        			</div>
        		 <div class="form-group row">
                      <div class="col-sm-2"><label for="email"></label></div>
                            <div class="col-sm-6">
                               <textarea  name="message" class="form-control"  required></textarea>
                      </div>
                 </div>
                 
                <!--   input for the servlet use  -->
                 <input type="hidden"  name="to" class="form-control"  id="uemail" value="<%=rb.getEmail()%>"  required>
           			
                 
               	<div class="form-group row" >
					<div class="col-md-6">
						<button class="btn btn-success btn-md float-right" style="border-radius: 3px" type="submit"
						value="Send" >Submit</button>
						
					</div>
					
					
			
				</div>
        		
        		
        <% 	}
        }
       %>
       </fieldset>
       </form>
        </div>
       
        					<div class="modal EmailModalContent" id="emailModal" role="dialog"></div>
        
</div>

</div>
	<script src="../required/assets/libs/jquery/dist/jquery.min.js"></script>
<script>
/* $(document).ready(function(){
    $('#bemail').click(function(){
    if($('#uemail').prop('disabled'))
    {
     $('#uemail').prop('disabled', false)
    }
    else{
         $('#uemail').prop('disabled', true)
      }
    });
}) */
</script>
<script>
function enable()
{
	document.getElementById("uemail").disabled=false;
	} 
function updateEmail(event)
{
	alert("hi in email update" + tid);
   
	var email=document.getElementById("uemail").value;
		alert(email);
       /* 
        $('#uemail').attr('disabled', 'false');
      $( "#uemail" ).keypress(function( event ) {
			  if ( event.which == 13 ) { */
	$.ajax({
		type:"POST",
		url:"../UpdateToEmail",
		data: {TID:tid , Email:email},
		success: function(response)
		{
			$(".EmailModalContent").html(response);
		}
	});//alert("bye");

}
</script>

<script>
</script>
<script>
			//$(document).ready(function(){	
			///$.('input[id="uemail"]').attr('disabled', true);
			//if($.('button[id="bemail"]').on('keyup',function())
			//		{
			//	$.('input[id="uemail"]').prop('disabled', false);
				//	}
	
//});
			
			
			
		//	function clickOnButton{
		  //       document.getElementById("uemail").disabled  = false;
		///	}
</script>
</body>
</html>