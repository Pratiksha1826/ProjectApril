package Action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.AddUserBean;
import Bean.AssginProjectBean;
import DAO.AddUserDao;
import DAO.AssginProjectDao;

@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String uname=request.getParameter("Uname");
		String pass=request.getParameter("Password");
		System.out.println("in login action");
		boolean status = false;
		ArrayList<AddUserBean> i = (ArrayList<AddUserBean>)AddUserDao.signIn(uname, pass);
		
		for(AddUserBean st:i)
		{
			String s = st.getRole().toString();	
			int a = st.getUD_Id();
			System.out.println("id*****************"+a);
			
			
			if(s.equals("Developer"))
			{
				
				session.setAttribute("id", a);
	
			System.out.println("Developer");
			response.sendRedirect("views/MAdmin/Developer_Dash.jsp");
			status=true;

		}
		else if(s.equals("Tester")) 
		{
			session.setAttribute("id", a);
			
			System.out.println("Tester");
			response.sendRedirect("views/MAdmin/Tester_Dash.jsp");
			status=true;

		}
		else if(s.equals("TeamLeader"))
		{
			ArrayList<AssginProjectBean> l = (ArrayList<AssginProjectBean>)AssginProjectDao.assginProject();
			for(AssginProjectBean as:l)
			{
				String p = as.getProject_Name();
				System.out.println("Project Name:"+p);
			} 
			System.out.println("Team Leader");
			response.sendRedirect("views/MAdmin/TeamLeader_Dash.jsp");
			status=true;
		}
		}
		if(status==false)
		{
			System.out.println("Invalid Login");
			session.setAttribute("error", "Invalid login Credentials");

			response.sendRedirect("login.jsp");
		}
		
		
		
	}

}