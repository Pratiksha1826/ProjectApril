package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Bean.AddProjectBean;
import Bean.AddUserBean;
import Bean.AssginProjectBean;
import DBConnection.DbConnection;

public class AddProjectDao {

	static Connection con = DbConnection.getConnection();
	static PreparedStatement ps;
	public static int save(AddProjectBean beanObj) 
	{
		int status = 0;
		try 
		{

			ps = con.prepareStatement("insert into project_master(Project_Name,Soft_Tools, Start_Date) values(?,?,?)");
			ps.setString(1, beanObj.getProject_Name());
			ps.setString(2, beanObj.getSoft_Tools());
			ps.setDate(3, beanObj.getStart_Date());
			status = ps.executeUpdate();

			if (status != 0)
				System.out.println("Success");
			else
				System.out.println("Unsuccess");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	public static List<AddProjectBean> getProjectNames() 
	{
		List<AddProjectBean> list = new ArrayList<AddProjectBean>();
		try 
		{
			
			PreparedStatement ps = con.prepareStatement("select * from project_master where Status=1");
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				AddProjectBean beanObj = new AddProjectBean();
				beanObj.setPM_Id(rs.getInt(1));
				beanObj.setProject_Name(rs.getString(2));
				beanObj.setSoft_Tools(rs.getString(3));
				beanObj.setStart_Date(rs.getDate(4));
				list.add(beanObj);
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return list;
	}

	public static List<AddProjectBean> ProjectDetails(int uid) 
	{
		List<AddProjectBean> list = new ArrayList<AddProjectBean>();
		try
		{
			ps = con.prepareStatement(
					"select m.PM_Id ,m.Project_Name ,m.Soft_Tools ,m.Start_Date from project_master AS m INNER JOIN project_details AS d ON m.Status=1 AND d.Status=1 WHERE m.PM_Id="
							+ uid + " and d.PD_Id=" + uid);

			ResultSet rs1 = ps.executeQuery();
			while (rs1.next()) {
				AddProjectBean beanObj1 = new AddProjectBean();
				beanObj1.setPM_Id(rs1.getInt(1));
				beanObj1.setProject_Name(rs1.getString(2));
				beanObj1.setSoft_Tools(rs1.getString(3));
				beanObj1.setStart_Date(rs1.getDate(4));
				list.add(beanObj1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<AddProjectBean> getModuleName(int pm_ID)
	{
		List<AddProjectBean> list = new ArrayList<AddProjectBean>();
		try 
		{
			ps = con.prepareStatement("select PD_Id, Module_Name FROM project_details WHERE PM_Id=" + pm_ID);
			ResultSet rs1 = ps.executeQuery();
			while (rs1.next())
			{
				AddProjectBean beanObj1 = new AddProjectBean();
				beanObj1.setPD_ID(rs1.getInt(1));
				beanObj1.setModule_Name(rs1.getString(2));
				list.add(beanObj1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static int Delete_Project(int id)
	{
		int status = 0;
		try 
		{
			ps = con.prepareStatement("update project_details set Status=0 where PM_Id=?");
			ps.setInt(1, id);
			status = ps.executeUpdate();

			ps = con.prepareStatement("update project_master set Status=0 where PM_Id=?");
			ps.setInt(1, id);
			status = ps.executeUpdate();

		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}

	public static int Update_Project(AddProjectBean beanObj)
	{
		int id = beanObj.getPM_Id();
		System.out.println("in update");
		int status = 0;
		try
		{
			ps = con.prepareStatement("update project_master set Project_Name=?,Soft_Tools=?  where PM_Id=" + id);
			ps.setString(1, beanObj.getProject_Name());
			ps.setString(2, beanObj.getSoft_Tools());
			status= ps.executeUpdate();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status;
	}
	public static int UpdateModule(AddProjectBean beanObj)
	{
		int Id = beanObj.getPD_ID();
		int id = beanObj.getPM_Id();
		System.out.println("pro details"+Id+"pro master"+id);
		System.out.println("in update");
		int status = 0;
		try 
		{
			ps = con.prepareStatement("select PD_Id , Module_Name from project_details");
			ResultSet rt = ps.executeQuery();
			while(rt.next())
			{
				int pdid = rt.getInt(1);
				rt.getString(2);
				if(pdid == Id)
				{
					ps = con.prepareStatement("update project_details set Module_Name=?  where PD_Id="+Id);
					ps.setString(1, beanObj.getModule_Name());
					status= ps.executeUpdate();
				}
			}
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return status;
	}

	public static List<AddProjectBean> SelectPname(int id) 
	{
		List<AddProjectBean> list = new ArrayList<AddProjectBean>();
		try 
		{
			ps = con.prepareStatement("select Project_Name from project_master where Status=1 and PM_Id=" + id);
			ResultSet rs1 = ps.executeQuery();
			while (rs1.next()) 
			{
				AddProjectBean beanObj1 = new AddProjectBean();
				beanObj1.setProject_Name(rs1.getString(1));
				list.add(beanObj1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static int returnMaxID() {
		int i = 0;
		try 
		{
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select max(PM_Id) from project_master");
			while (rs.next()) 
			{
				i = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;

	}

	public static void saveModuleNames(AddProjectBean beanObj) 
	{
		System.out.println("inside savemodule method");
		try 
		{
			ps = con.prepareStatement("insert into project_details(PM_Id,Module_Name) values(?,?)");
			ps.setInt(1, beanObj.getPM_Id());
			ps.setString(2, beanObj.getModule_Name());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static int returnID(AddProjectBean pb) 
	{
		int i = 0;
		int Id =pb.getPD_ID();

		try
		{
			ps = con.prepareStatement("update project_details set Module_Name=?  where PD_Id="+Id);
			ps.setString(1, pb.getModule_Name());
			ps.setInt(1, i);
			i=ps.executeUpdate();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return i;

	}
	public static int returnId(AddProjectBean p)
	{
		int id = p.getPM_Id();

		int i=0;
		Statement stmt;
		try 
		{
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select PD_Id from project_details where PM_Id="+id);

			while (rs.next())
			{
				i = rs.getInt(1);
				System.out.println("@#$@$#$#@$ "+i);
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return i;
		
	}

	public static int Update_ProjectMN(AddProjectBean beanObj) 
	{
		int id = beanObj.getPM_Id();

		int status = 0;
		try
		{
				ps=con.prepareStatement("update project_details set Module_Name=? where PM_Id="+id);
				ps.setString(1, beanObj.getModule_Name());
				status=ps.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	
	}
	
	public static List<AddProjectBean> projectName()
	  {
		  List<AddProjectBean> l= new ArrayList<AddProjectBean>();
		  try 
		  {
			ps = con.prepareStatement("SELECT PM_Id , Project_Name FROM project_master");
			ResultSet rt =ps.executeQuery();
			while(rt.next())
			{
				AddProjectBean rb=new AddProjectBean();
				rb.setPM_Id(rt.getInt(1));
				rb.setProject_Name(rt.getString(2));
				System.out.println("id:"+rt.getString(2));
				l.add(rb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return l;
		  
	  }

	
	public static int selectId(String name)
	{
		PreparedStatement ps;
		int id=0;
		try 
		{
			ps =con.prepareStatement("SELECT PM_Id FROM project_master WHERE Project_Name="+"'"+name+"'");
			ResultSet rt = ps.executeQuery();
			System.out.println("query executed");
			while(rt.next())
			{
				AddProjectBean rb = new AddProjectBean();
				 id=rt.getInt(1);
				 rb.setPM_Id(id);
			}

		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
		
	}

	public static List<AddProjectBean> Projectest()
	{
		List<AddProjectBean> list=new ArrayList<AddProjectBean>();
		try
		{
			ps = con.prepareStatement("select PM_Id,Project_Name from project_master where Status=1");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				AddProjectBean beanObj1 = new AddProjectBean();
				beanObj1.setPM_Id(rs.getInt(1));
				beanObj1.setProject_Name(rs.getString(2));
				list.add(beanObj1);
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<AddProjectBean> ModuleTest()
	{
		List<AddProjectBean> list=new ArrayList<AddProjectBean> ();
		try
		{
			ps=con.prepareStatement("Select PD_Id,Module_Name from project_details where status=1");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				AddProjectBean beanObj1 = new AddProjectBean();
				beanObj1.setPD_ID(rs.getInt(1));
				beanObj1.setModule_Name(rs.getString(2));
				list.add(beanObj1);
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}
	

	public static List<Integer> selectdata(int pname)
	{
		List <Integer> list=new ArrayList<Integer>();
		try
		{
			Statement stmt = con.createStatement();
			ResultSet rs1=stmt.executeQuery("select PD_Id from project_details where Status=1 and PM_Id="+pname);
			int i1=0;
			while(rs1.next())
			{
				i1  =rs1.getInt(1);
				list.add(i1);
				
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		
	
		return list;
		
	}
	
	public static String selectname(int k) 
	{
		String	i2=null;

		try
		{
			Statement stmt = con.createStatement();
			ResultSet rs1=stmt.executeQuery("select Module_Name from project_details  where Status=1 and PD_Id="+k);
			while(rs1.next())
			{
				 i2  =rs1.getString(1);

			}
			
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return i2;
	
		
	}
	

}
