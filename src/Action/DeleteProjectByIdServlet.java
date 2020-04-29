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
 * Servlet implementation class DeleteProjectByIdServlet
 */
@WebServlet("/DeleteProjectByIdServlet")
public class DeleteProjectByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pmid = request.getParameter("pmid");
		System.out.println("in modal servlet " + pmid);
		HttpSession session = request.getSession();
		session.setAttribute("id", pmid);
		
		RequestDispatcher rd = request.getRequestDispatcher("views/DeleteProjectModal.jsp");
		rd.forward(request, response);

	}

}
