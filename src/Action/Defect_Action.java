package Action;

import java.io.IOException;
import java.util.Arrays;

import javax.mail.SendFailedException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.DefectBean;
import DAO.DefectDao;

/**
 * Servlet implementation class Defect_Action
 */
@WebServlet("/Defect_Action")
public class Defect_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String defect_title = request.getParameter("Defect_name");
		String defect_step = request.getParameter("Steps");
		String expected_result = request.getParameter("Excepted_result");
		String actual_Result  = request.getParameter("Actual_result");
		String module = request.getParameter("Module_Name");
		String defect_severity = request.getParameter("Severity");
		String defect_priority = request.getParameter("Set_priority");
		String screenshot = request.getParameter("Sceeenshot");
		String defect_status = request.getParameter("Status");
		int status_id = Integer.parseInt(defect_status);
		String defect_assgin_to = request.getParameter("Assign_to");
		int user_id = Integer.parseInt(defect_assgin_to);
		String tc_id = request.getParameter("testcase_id");
		int test_case_id = Integer.parseInt(tc_id);
		
		DefectBean ob = new DefectBean();
		
		ob.setDefect_title(defect_title);
		ob.setSteps(defect_step);
		ob.setExcepted_result(expected_result);
		ob.setActual_result(actual_Result);
		ob.setModule(module);
		ob.setSeverity(defect_severity);
		ob.setSet_priority(defect_priority);
		ob.setScreenshot(screenshot);
		ob.setStatus_Id(status_id);
		ob.setAssign_to(user_id);
		ob.setTestcase_id(test_case_id);		
		
		
		int status = DefectDao.InsertData(ob);
		if(status>0) {
			System.out.println("Record Added Successfully");
		
			
			response.sendRedirect("views/MAdmin/Tester.jsp");
		}
		else {
			System.out.println("Unable to add Records");
		}
		
	}

}
