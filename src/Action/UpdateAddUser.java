package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.AddUserBean;
import DAO.AddUserDao;

@WebServlet("/UpdateAddUSer")
public class UpdateAddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		int UD_Id = Integer.parseInt(request.getParameter("uid"));
		String name = request.getParameter("name");
		String contact = request.getParameter("contact");
		String email = request.getParameter("email");
		String aliesname = request.getParameter("aliesname");
		String role = request.getParameter("role");
		System.out.println(name + "" + contact + "" + email + "" + aliesname + "" + role);

		AddUserBean obj = new AddUserBean();
		obj.setUD_Id(UD_Id);
		obj.setName(name);
		obj.setContact(contact);
		obj.setEmail(email);
		obj.setAliesname(aliesname);
		obj.setRole(role);
		System.out.println("in Update sevletActin");

		int status = AddUserDao.UpdateAddUser(obj);

		if (status > 0) {
			System.out.println("in U Actin Serv if statement");
			response.sendRedirect("views/AddUser.jsp");
		} else {
			out.println("Sorry! unable to update record");

		}

		out.close();
	}

}