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
 * Servlet implementation class EmailUserById
 */
@WebServlet("/EmailUserById")
public class EmailUserById extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String eid=request.getParameter("eid");
		System.out.println("email id:"+eid);
		
		HttpSession session = request.getSession();
		session.setAttribute("EID", eid);
		
		RequestDispatcher rd = request.getRequestDispatcher("views/EmailUserModal.jsp");
		rd.forward(request, response);
	}

}
