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
import javax.servlet.http.HttpSession;

import Bean.AddUserBean;
import Bean.AssginProjectBean;
import DAO.AssginProjectDao;

/**
 * Servlet implementation class AssginProject_Id
 */
@WebServlet("/AssginProject_Id")
public class AssginProject_Id extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	System.out.println("in aasginprojectId");
	
	PrintWriter out = response.getWriter();
	
	String id= request.getParameter("PID");
	int id1 = Integer.parseInt(id.toString());

	AssginProjectBean ap = new AssginProjectBean();
	ap.setPM_Id(id1);
	ArrayList<AddUserBean> list = AssginProjectDao.selectData(ap);

	for(AddUserBean u: list) 
	{		 
		if(list!=null) 
		{
			out.println("<tr >"+ "<td>"+u.getRole()+"</td>" +
				"<td>"+u.getName()+"</td>" +
				 "<td>"+u.getEmail()+"</td>"+
				 "<td><button type=\"button\"\n" + 
				 "	class=\"btn btn-danger btn-xs mdi mdi-close\n" + 
				 "	onclick=\"deletedata("+u.getUD_Id()+")\">\n" + 
				
				 "																</button></td>" + 
				 
				  
				  "</tr>");
				 
	
			 }
	else
	{
		RequestDispatcher rd=request.getRequestDispatcher("views/AddUser.jsp");
		rd.forward(request, response);
		

	}
	}	
	}

	}

