package Action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.AddProjectBean;
import DAO.AddProjectDao;

/**
 * Servlet implementation class UpdateProjectAction
 */
@WebServlet("/UpdateProjectAction")
public class UpdateProjectAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		int status = 0;
		System.out.println("in project update model");
		int PM_Id = Integer.parseInt(request.getParameter("uid"));
		String pd[] = request.getParameterValues("pdId");
		String pname = request.getParameter("Project_Name");
		String stool = request.getParameter("Soft_Tools");
		String strModule[] = request.getParameterValues("Module_Name");
		String mode = Arrays.toString(strModule);
		
		AddProjectBean pb = new AddProjectBean();
		pb.setProject_Name(pname);
		pb.setSoft_Tools(stool);
		pb.setPM_Id(PM_Id);
		status = AddProjectDao.Update_Project(pb);

		for(String module: strModule)
		{
			AddProjectBean p = new AddProjectBean();
			p.setPD_ID(AddProjectDao.returnId(pb));
			
			p.setModule_Name(module);
			AddProjectDao.returnID(p);
		}
		
	
		System.out.println("***********UPDATE PROJECT STATUS*********" + status);
		if (status > 0) {
			System.out.println("update succesfully");

			response.sendRedirect("views/AddProject.jsp");
		} else {
			System.out.println("update not succesfully");

			response.sendRedirect("views/AddProject.jsp");
		}
	}

}
