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
 * Servlet implementation class AssginUser_Action
 */
@WebServlet("/AssginUser_Action")
public class AssginUser_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in sevletUserActin");
		String name=request.getParameter("name");
		String contact=request.getParameter("contact");
		String email=request.getParameter("email");
		String aliesname=request.getParameter("aliesname");
		String role=request.getParameter("role");
		System.out.println(name+""+contact+""+email+""+aliesname+""+role);
		
		AddUserBean obj=new AddUserBean();

		obj.setName(name);
		obj.setContact(contact);
		obj.setEmail(email);
		obj.setAliesname(aliesname);
		obj.setRole(role);
		System.out.println("in sevletUserAction");

		int status=AddUserDao.insert(obj);
		
		if(status>0)
		{
			System.out.println("add data");
			response.sendRedirect("views/AssignProject.jsp");
		}
		else
		{
			System.out.println("not add data");
			response.sendRedirect("views/UserModal.jsp");
			
		}
	}

}
