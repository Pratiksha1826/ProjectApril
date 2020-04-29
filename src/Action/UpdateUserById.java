package Action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateUserById")
public class UpdateUserById extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		String uid1 = request.getParameter("uid");
		HttpSession session = request.getSession();
		session.setAttribute("id", uid1);
		RequestDispatcher rd = request.getRequestDispatcher("views/UpdateUserModal.jsp");
		rd.forward(request, response);
	}

}