package Action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AddProjectDao;

/**
 * Servlet implementation class DeleteProjectAction
 */
@WebServlet("/DeleteProjectAction")
public class DeleteProjectAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int pmid1 = Integer.parseInt( request.getParameter("pm_id"));
		System.out.println("pm id in delete action " + pmid1);
		int status = AddProjectDao.Delete_Project(pmid1);
		if(status>0) {
			response.sendRedirect("views/AddProject.jsp");
		}
	}

}
