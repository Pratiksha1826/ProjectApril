package DAO;

import java.sql.*;
import java.util.*;
import Bean.DefectBean;
import Bean.TestCaseBean;
import DBConnection.DbConnection;

public class DefectDao {
	
	static PreparedStatement ps;
	static int status=0;
	static Connection con=DbConnection.getConnection();


	public static int InsertData(DefectBean db)
	{

		try
		{
		ps= con.prepareStatement("insert into defect_master( Defect_Name,Priority,Severity,UrlScreenshot,Defect_Status_Id,Developer_Id,TestCase_Id)values(?,?,?,?,?,?,?)");
		
//		ps.setInt(1, db.getDefect_id());
//		System.out.println("dao method"+db.getDefect_id());
		ps.setString(1, db.getDefect_title());
		System.out.println("defect_title"+db.getDefect_title());
		ps.setString(2, db.getSet_priority());
		System.out.println("priority"+db.getSet_priority());
		ps.setString(3, db.getSeverity());
		System.out.println("severity"+db.getSeverity());
		ps.setString(4, db.getScreenshot());
		System.out.println("screenshot"+db.getScreenshot());
		ps.setInt(5, db.getStatus_Id());
		System.out.println("status"+db.getStatus_Id());
		ps.setInt(6,db.getAssign_to());
		System.out.println("assign to"+db.getAssign_to());
		ps.setInt(7,db.getTestcase_id());
		System.out.println("testc_case_id"+db.getTestcase_id());
		status=ps.executeUpdate();
		con.close();
		
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		  
		return status;	
}
	
	 public static ArrayList<TestCaseBean> getData(int a) {
		System.out.println("in dao........."+a);
		ArrayList<TestCaseBean> list = new ArrayList<TestCaseBean>();
		
		try {
			ps= con.prepareStatement("Select PD_Id,TestCase_Title,Steps,Expected_Result,Actual_Result from testcase_master where TestCase_Id="+a);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) 
			{   
				TestCaseBean ob = new TestCaseBean();
				int id=rs.getInt(1);
				ob.setPD_Id(id);
				System.out.println("PD_Id :"+rs.getString(1));
				
				ob.setTestcase_title(rs.getString(2));
				System.out.println("Test Case :"+rs.getString(2));
				ob.setSteps(rs.getString(3));
				System.out.println("set Steps:"+rs.getString(3));

				ob.setExpected_Result(rs.getString(4));
				System.out.println("Expected Result :"+rs.getString(4));

				ob.setActual_Result(rs.getString(5));
				System.out.println("Actual Result :"+rs.getString(5));

			//	tid = rs.getInt(5);
				System.out.println("id:"+a);
				
				
				
//				ps=DbConnection.getConnection().prepareStatement("SELECT u.TestCase_Id,s.Module_Name from testcase_master AS u INNER JOIN project_details AS s ON u.TestCase_Id=s.PD_Id WHERE u.Status=1 AND s.Status=1");
				ps=DbConnection.getConnection().prepareStatement("SELECT Module_name from project_details WHERE PD_Id="+id);
				ResultSet rs1 = ps.executeQuery();
				System.out.println("hihihihhiihhi");
				while(rs1.next()) 
				{
					System.out.println("hi");
					ob.setModule_name(rs1.getString(1));
					System.out.println("Module name:"+rs1.getString(1));
					list.add(ob);

					
				}


			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	} 
	
	 
	 public static List<DefectBean> getDefectStatus()
	 {
		 ArrayList<DefectBean> al = new ArrayList<DefectBean>();
		 
		 try {
			ps = con.prepareStatement("select Status_Id , Status_name from defect_status_master");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				DefectBean db = new DefectBean();
				db.setStatus_Id(rs.getInt(1));
				db.setStatus_name(rs.getString(2));
				al.add(db);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
		 
	 }
	 
	 
	 /// Selecting the testcase id related to project
	 
	 
	 public static List<DefectBean> getTestcaseId(int id)
	 {
		 System.out.println("id:"+id);
		 
		 ArrayList<DefectBean> al = new ArrayList<DefectBean>();
		 
		 try
		 {
			 ps = con.prepareStatement("select TestCase_Id from testcase_master where PM_Id="+id);
			 ResultSet rt = ps.executeQuery();
			 while(rt.next())
			 {
				 int i = rt.getInt(1);
				 System.out.println("print i:"+i);

				 
				 ps = con.prepareStatement("Select Defect_Id , Defect_Name , Defect_Status_Id ,Developer_Id from defect_master where TestCase_Id ="+i);			
				 ResultSet rs = ps.executeQuery();

				 while(rs.next())
				 {
					 System.out.println("after defect");
					 DefectBean db = new DefectBean();
					 db.setDefect_id(rs.getInt(1));
					 db.setDefect_title(rs.getString(2));
					 db.setStatus_Id(rs.getInt(3));
					 db.setAssign_to(rs.getInt(4));
					 db.setTestcase_id(i);
					 al.add(db);
					 
				 }
			 }
		 }
		 catch (Exception e) 
		 {
				e.printStackTrace();
		 }
		return al;
	 }
	
	 
	 //selecting status_name by Status_Id
	 public static List<DefectBean> getDefectStatus(int id)
	 {
		 ArrayList<DefectBean> al = new ArrayList<DefectBean>();
		 
		 try {
			ps = con.prepareStatement("select Status_name from defect_status_master where Status_Id="+id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				DefectBean db = new DefectBean();
			//	db.setStatus_Id(rs.getInt(1));
				db.setStatus_name(rs.getString(1));
				al.add(db);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
		 
	 }
	 
	
}