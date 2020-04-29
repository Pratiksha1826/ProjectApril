<%@page import="DAO.AddProjectDao"%>
<%@page import="Bean.AddProjectBean,java.util.List" %>
<form action="../DeleteProjectAction" method="post">
 <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"style="background: darkkhaki;">
        <h5 class="modal-title">Delete Project</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <%
       Object obj = session.getAttribute("id");
      	int pmid = Integer.parseInt(obj.toString());
      	 List<AddProjectBean> list1=AddProjectDao.SelectPname(pmid);
         for(AddProjectBean beanobj: list1)
         {
      	
      
     	%>
      <input type="hidden" name="pm_id" value="<%=pmid%>">
        <p>Do you really want to delete the <b><%=beanobj.getProject_Name() %></b> Project ?</p>
      </div>
      <div class="modal-footer"style="background: darkkhaki;">
        <button type="submit" class="btn btn-success">Yes</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
      </div>
    </div>
  </div>
 <%} %>
  </form>