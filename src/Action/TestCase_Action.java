package Action;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.AddProjectBean;
import Bean.TestCaseBean;
//import DAO.AddProjectDao;
import DAO.TestCaseDao;

/**
 * Servlet implementation class TestCase_Action
 */
@WebServlet("/TestCase_Action")
public class TestCase_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;
  	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String p_id=request.getParameter("project_name");
		int pid=Integer.parseInt(p_id);
	
		String test_name=request.getParameter("Test_Case_Title");
		String type=request.getParameter("Test_Case_Type");
		String module=request.getParameter("module_list");
		String condition=request.getParameter("Pre_Condition");
		String steps=request.getParameter("Steps");
		String test_data=request.getParameter("Test_Data");
		String browse=request.getParameter("Browser");
		System.out.println("browsers are:"+browse);
		int bid=Integer.parseInt(browse);
		System.out.println("browser  in servlet************:"+bid);
		
		String Expected_Result=request.getParameter("Expect_Result");
		String case_status=request.getParameter("Status");
		String actul_result=request.getParameter("Actual_Result");
	
		TestCaseBean tc=new TestCaseBean();
		tc.setBrowser_id(bid);
		tc.setPM_Id(pid);
		tc.setTestcase_title(test_name);
		tc.setTestcase_type(type);
		tc.setPrecondition(condition);
		tc.setSteps(steps);
		tc.setTest_data(test_data);
		tc.setBrowser_Type(browse);
		tc.setExpected_Result(Expected_Result);
		tc.setTestcase_Status(case_status);
		tc.setActual_Result(actul_result);
		
		AddProjectBean apb=new AddProjectBean();
		apb.setPM_Id(pid);
		apb.setModule_Name(module);
		
		System.out.println("In TestCase_Dao");
		int status=TestCaseDao.insert(tc,apb);
		
		if(status>0)
		{
			System.out.println("add data");
			response.sendRedirect("views/MAdmin/Tester.jsp");
		}
		else
		{
			response.sendRedirect("views/MAdmin/Tester.jsp");
			System.out.println("not add data");
			
		}
		
	}

}
