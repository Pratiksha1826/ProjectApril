package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.AddProjectBean;
import Bean.TestCaseBean;
import DAO.AddProjectDao;
import DAO.TestCaseDao;

/**
 * Servlet implementation class TestCase_Id
 */
@WebServlet("/TestCase_Id")
public class TestCase_Id extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in testcaseId");
		String id=request.getParameter("PID");
		int id1=Integer.parseInt(id);
		List<Integer> list= AddProjectDao.selectdata(id1);
		PrintWriter pw=response.getWriter();
		pw.println("<option selected disabled>Select Module</option>");
		for(Integer j:list)
		{
			AddProjectBean ab=new AddProjectBean();
			System.out.println("PD_Id is:"+j);
			ab.setPD_ID(j);
			int k=ab.getPD_ID();
			ab.setModule_Name(AddProjectDao.selectname(k));
			//System.out.println("////////"+k);
			String test2=ab.getModule_Name();
			System.out.println("/////////"+test2);
			pw.print("<option value="+k+">"+test2+"</option>");
		}			
		
	}

}
