package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.TestCaseBean;
import DAO.DefectDao;

/**
 * Servlet implementation class Defect_id
 */
@WebServlet("/Defect_id")
public class Defect_id extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	System.out.println(" in defect servlet id");
	String d_id=request.getParameter("defect_id");
	int i = Integer.parseInt(d_id);

	HttpSession session = request.getSession();
	session.setAttribute("id", i);
	
	RequestDispatcher rd=request.getRequestDispatcher("/views/MAdmin/Defect.jsp");
	rd.forward(request, response);
	
	}

}
