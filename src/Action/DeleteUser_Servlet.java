package Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Bean.AddUserBean;
import DAO.AddUserDao;

/**
 * Servlet implementation class DeleteUser_Servlet
 */
@WebServlet("/DeleteUser_Servlet")
public class DeleteUser_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		String u_id=request.getParameter("Id");
		int id=Integer.parseInt(u_id.toString());
		System.out.println("id:"+id);
		
		AddUserBean rb = new AddUserBean();
		rb.setUD_Id(id);
		int status= AddUserDao.delete(id);
		if(status>0)
		{
			System.out.println("data is Deleted");
			response.sendRedirect("views/AddUser.jsp");

		}
		else
		{
			System.out.println("datais not deleted");
		}
	}

}
