package Action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateProjectByIdServlet
 */
@WebServlet("/UpdateProjectByIdServlet")
public class UpdateProjectByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String uid1 = request.getParameter("uid");
		System.out.println("inside update by id.." +uid1);
		HttpSession session = request.getSession();
		session.setAttribute("id", uid1);
		RequestDispatcher rd = request.getRequestDispatcher("views/UpdateProjectModal.jsp");
		rd.forward(request, response);
	}

}
