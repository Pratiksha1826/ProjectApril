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
import Utility.Mailer;

/**
 * Servlet implementation class Email_servlet
 */
@WebServlet("/Email_servlet")
public class Email_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("in  Email_servlet");
		
		String id=request.getParameter("TID");
		int Id=Integer.parseInt(id.toString());
		
		String to=request.getParameter("to");
		System.out.println("to :"+to);
		
		String msg=request.getParameter("message");
		System.out.println("message:"+msg);
	    try {
			Mailer.send(to,msg);
			
			AddUserBean rb = new AddUserBean();
			rb.setUD_Id(Id);
			rb.setEmail(to);
			
			int status = AddUserDao.UpdateToEmail(rb);
			if(status>0)
			{
			response.sendRedirect("views/AddUser.jsp");

			  System.out.println("message send successfuly");
			}
			else
			{
				System.out.println("ot send data for update");
			}
		} catch (Exception e) {
			System.out.println("------------------in Email_servlet");
			e.printStackTrace();
		}  
	  	    
		
	}

}
