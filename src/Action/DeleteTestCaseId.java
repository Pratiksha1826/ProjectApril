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
 * Servlet implementation class DeleteTestCaseId
 */
@WebServlet("/DeleteTestCaseId")
public class DeleteTestCaseId extends HttpServlet {
	private static final long serialVersionUID = 1L;
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		String tid=request.getParameter("TID");
		System.out.println("in deletetestcase id:"+tid);
		
		HttpSession session=request.getSession();
		session.setAttribute("id", tid);
		System.out.println("after setattribute..........");
		RequestDispatcher rd = request.getRequestDispatcher("views/DeleteTestCaseModal.jsp");
		rd.forward(request, response);
	}

}
