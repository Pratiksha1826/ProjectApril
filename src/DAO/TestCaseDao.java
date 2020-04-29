package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Bean.AddProjectBean;
import Bean.TestCaseBean;
import DBConnection.DbConnection;

public class TestCaseDao 
{
	static Connection con=DbConnection.getConnection();
	static PreparedStatement ps;
	
	public static int insert(TestCaseBean obj,AddProjectBean apb)
	{
		int status=0;
		try
		{
			int pname=apb.getPM_Id();
			Statement st1=con.createStatement();
			ResultSet rs1=st1.executeQuery("select PD_Id,Module_Name from project_details where PM_Id='"+pname+"'");
			int i1=0;
			String name;
			while(rs1.next())
			{
				i1  =rs1.getInt(1);
				name=rs1.getString(2);
			}
			ps=con.prepareStatement("Insert into testcase_master (PM_Id ,PD_Id,TestCase_Title,TestCase_Type,Precondition,Steps,Test_Data,Browser_Type,Expected_Result,TestCase_Status,Actual_Result )"
					+ "values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, pname);
			ps.setInt(2, i1);
			ps.setString(3, obj.getTestcase_title());
			ps.setString(4, obj.getTestcase_type());
			ps.setString(5, obj.getPrecondition());
			ps.setString(6, obj.getSteps());
			ps.setString(7, obj.getTest_data());
			ps.setString(8, obj.getBrowser_Type());
			ps.setString(9, obj.getExpected_Result());
			ps.setString(10,obj.getTestcase_Status());
			ps.setString(11,obj.getActual_Result());
			status=ps.executeUpdate();
		}
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	
	
	
		public static List<TestCaseBean> getAllInfo()
		{
			ArrayList<TestCaseBean> list=new ArrayList<TestCaseBean>();
			Statement st2,st3,st4;
			int id=0,id1=0,id2=0;
			String name = null,name1=null,testcase;
			try {
					st2 = con.createStatement();
					ResultSet rs2=st2.executeQuery("select PM_Id,PD_Id,TestCase_Title,TestCase_Id from testcase_master where Status=1");
					while(rs2.next())
					{
					id=rs2.getInt(1);
					id1=rs2.getInt(2);
					testcase=rs2.getString(3);
					id2=rs2.getInt(4);
					
						st3= con.createStatement();
						ResultSet rs3=st3.executeQuery("select Project_Name from project_master where PM_Id ="+id);
						while(rs3.next())
							{
								name=rs3.getString(1);
							}
						st4 = con.createStatement();
						ResultSet rs5=st4.executeQuery("select Module_Name from project_details where PD_Id="+id1);
						while(rs5.next())
							{
								name1=rs5.getString(1);
							}
				
						TestCaseBean tcb=new TestCaseBean();
						tcb.setProject_name(name);
						tcb.setModule_name(name1);
						tcb.setTestcase_title(testcase);
						tcb.setTestcase_id(id2);
						//System.out.println("in table function................");
						list.add(tcb);
					}
				} 
			catch (SQLException e1)
			{
				e1.printStackTrace();
			}
	
				return list;
		}
		
		public static List<TestCaseBean> getbrowserid()
		{
			
			ArrayList<TestCaseBean> list=new ArrayList<TestCaseBean>();
			try {
					int B_id=0;
					String bname;
					Statement stmt=con.createStatement();
					ResultSet rst=stmt.executeQuery("Select browser_id,browser_name from browser_list");
					while(rst.next())
					{
						TestCaseBean tcb1=new TestCaseBean();
						B_id=rst.getInt(1);
						bname=rst.getString(2);
						tcb1.setBrowser_id(B_id);																																																					
						tcb1.setBrowser_Type(bname);
						list.add(tcb1);
					}
				}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
			
		}
		
		public static List<Integer> getbrowser_ver_id(int brow_id)
		{
			List<Integer> list=new ArrayList<Integer>();
			try {
					int v_id=0;
					Statement stmt=con.createStatement();
					ResultSet rst=stmt.executeQuery("Select version_id from version_list where browser_id="+brow_id);
					while(rst.next())
					{
						v_id=rst.getInt(1);
						list.add(v_id);
					}
				}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
			
		}
	
		public static String getbrowser_ver_name(int k)
		{
			String ver_name = null;
			Statement st;
			try {
				st = con.createStatement();
				ResultSet rs1=st.executeQuery("select Version from version_list where status=1 and version_id="+k);
				while(rs1.next())
				{
					ver_name=rs1.getString(1);
					System.out.println("version are********:"+ver_name);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return ver_name;
		}
		
		public static List<TestCaseBean> getTestId()
		{
			System.out.println("in getTestId method..............................");
			ArrayList<TestCaseBean> test=new ArrayList<TestCaseBean>();
			try {
				 ps=con.prepareStatement("select * from testcase_master where status=1");
				ResultSet rst=ps.executeQuery();
				while(rst.next())
				{
					TestCaseBean tcb=new TestCaseBean();
					tcb.setTestcase_id(rst.getInt(1));
					tcb.setPM_Id(rst.getInt(2));
					tcb.setPD_Id(rst.getInt(3));
					tcb.setTestcase_title(rst.getString(4));
					tcb.setPrecondition(rst.getString(5));
					tcb.setSteps(rst.getString(6));;
					tcb.setTest_data(rst.getString(7));
					tcb.setBrowser_Type(rst.getString(8));
					tcb.setExpected_Result(rst.getString(9));
					tcb.setTestcase_Status(rst.getString(10));
					tcb.setActual_Result(rst.getString(11));
					System.out.println("in getTestId query execution..............");
					test.add(tcb);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return test;
		}
	
		public static int delete(int id)
		{
			try 
			{
				ps=con.prepareStatement("update testcase_master set status=0 where TestCase_Id=?");
				ps.setInt(1, id);
				ps.executeUpdate();
				System.out.println("After query execute.........................");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return id;
		}
		
		public static List<TestCaseBean> Collectviewdata(int id)
		{
			ArrayList<TestCaseBean> List=new ArrayList<TestCaseBean>();
			try {
				ps=con.prepareStatement("select * from testcase_master where status=1 and supplier_id="+id);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					TestCaseBean tcb=new TestCaseBean();
					tcb.setTestcase_id(rs.getInt(1));
					tcb.setProject_name(rs.getString(2));
					tcb.setModule_name(rs.getString(3));
					tcb.setTestcase_title(rs.getString(4));
					tcb.setTestcase_type(rs.getString(5));
					tcb.setPrecondition(rs.getString(6));
					tcb.setSteps(rs.getString(7));
					tcb.setTest_data(rs.getString(8));
					tcb.setBrowser_Type(rs.getString(9));;
					tcb.setExpected_Result(rs.getString(10));
					tcb.setTestcase_Status(rs.getString(11));
					tcb.setActual_Result(rs.getString(12));
					List.add(tcb);
					
					
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return List;
		}
		
}
