package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.AddProjectBean;
import Bean.AddUserBean;
import Bean.AssginProjectBean;
import DAO.AddProjectDao;
import DAO.AddUserDao;
import DAO.AssginProjectDao;

/**
 * Servlet implementation class AssginProject_Action
 */
@WebServlet("/AssginProject_Action")
public class AssginProject_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		int status=0; 
		System.out.println("hi**************");
		PrintWriter out = response.getWriter();
		String name=request.getParameter("PID"); 
		int i =Integer.parseInt(name);
		System.out.println("project_id"+i);
		AssginProjectBean p = new AssginProjectBean(); 
		p.setPM_Id(i);
		String n[]=request.getParameterValues("UID");
		
		for(String da : n)
		{
			int d =Integer.parseInt(da);
			
			System.out.println("user data in id"+d);
			AssginProjectBean ap = new AssginProjectBean(); 
			ap.setPM_Id(i);
			ap.setUD_Id(d);
			status=AssginProjectDao.insert(ap);
		
			if(status>0) 
			{
			
				ArrayList<AddUserBean> sid =AssginProjectDao.selectData(p);
				System.out.println("after insert");
				if(sid!=null)
				{
					for(AddUserBean u:sid) 
					{
							out.println("<tr >"+
						  	"<td>"+u.getRole()+"</td>" +
							"<td>"+u.getName()+"</td>" +
							 "<td>"+u.getEmail()+"</td>"+
							 "<td><button type=\"button\" "
							 + "class=\"btn btn-danger btn-xs mdi mdi-close\" "
							 + " onclick=\"deletedata1("+u.getPD_Id()+")\" data-target=\"#myModal\""
							 + " data-toggle=\"modal\"></button>\n" + 
							
							 "</td>" + 
							 
							 "</tr>");
						

					}
			   }
				
		}
		else
		{
			RequestDispatcher rb = request.getRequestDispatcher("views/AssginProject.jsp");
			rb.forward(request, response);
			
		}
	}
}
}
		 
		



