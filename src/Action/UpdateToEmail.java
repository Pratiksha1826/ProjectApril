package Action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.AddUserBean;
import DAO.AddUserDao;

/**
 * Servlet implementation class UpdateToEmail
 */
@WebServlet("/UpdateToEmail")
public class UpdateToEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("updateToEmail:");
		String id=request.getParameter("TID");
		int Id=Integer.parseInt(id.toString());
		
		String email=request.getParameter("Email");
		System.out.println("Email:" +email);
		System.out.println("Id:"+id);
		
		AddUserBean rb = new AddUserBean();
		rb.setUD_Id(Id);
		rb.setEmail(email);
		
		int status = AddUserDao.UpdateToEmail(rb);
		if(status>0)
		{
			System.out.println("data update successfully");
			RequestDispatcher rd =request.getRequestDispatcher("views/EmailUserModal.jsp");
			rd.forward(request, response);
			
		}
		else
		{
			System.out.println("data not update successfully");

			response.sendRedirect("views/AddUser.jsp");
		}
	
	
	}
}
