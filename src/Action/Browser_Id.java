package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.TestCaseBean;
import DAO.TestCaseDao;

/**
 * Servlet implementation class Browser_Id
 */
@WebServlet("/Browser_Id")
public class Browser_Id extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("BID");
		int id1=Integer.parseInt(id);
		System.out.println("in Browser_Id---------------");
		List<Integer> list=TestCaseDao.getbrowser_ver_id(id1);
		PrintWriter pw=response.getWriter();
		pw.println("<option selected disabled>Select Version</option>");
		for(Integer k:list)
		{
			TestCaseBean tc=new TestCaseBean();
			tc.setVer_id(k);
			int vid=tc.getVer_id();
			tc.setVersion_name(TestCaseDao.getbrowser_ver_name(vid));
			String ver_name=tc.getVersion_name();
			pw.println("<option value="+vid+">"+ver_name+"</option>");
			
		}
		
		
	}

}
