<%@ page import="Bean.AddUserBean , DAO.AddUserDao , java.util.*" %>

	<form action="../DeleteUser_Servlet" method="post">
	    <div class="modal-dialog">
	
      <div class="modal-content">
        <div class="modal-header"style="background: darkkhaki;">
          <h4 class="modal-title">Delete User</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <%
        	Object Obj=session.getAttribute("pid");
			if(Obj==null){
        	System.out.println("in DeleteAddUser nullPointer exception");
        	}
        	else
        	{
        		String id=Obj.toString();
        		int id1=Integer.parseInt(id);
                System.out.println("hi----------"+id1);
	
        	    List<AddUserBean> list= AddUserDao.getUserById1(id1);
               //System.out.println("hi");
            	for(AddUserBean l :list){
             %>
             <input type="hidden" name="Id" value="<%=id1%>">
          <p>Do you want to delete <b><%=l.getRole()%> <%=l.getName()%></b> ?</p>

        </div>
      
        <div class="modal-footer" style="background: darkkhaki;">
           <button type="submit" class="btn btn-success" >Yes</button>	
          <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
        </div>
      </div>
      </div>
        <%
        	}	
    	}
       %>
      </form>
    