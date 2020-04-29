package DAO;

import java.sql.*;
import java.util.ArrayList;

import Bean.*;
import DBConnection.DbConnection;

public class AssginProjectDao 
{

	static PreparedStatement ps;
	static Connection con=DbConnection.getConnection();
	public static int insert(AssginProjectBean pb1)
	{
		int id=0 ;
		int status=0;
		
		try
		{
			int i = pb1.getPM_Id();
			int j = pb1.getUD_Id();
			ps = con.prepareStatement("SELECT PM_Id ,UD_Id FROM project_assign_details");
			ResultSet rt = ps.executeQuery();
			int projectid=0,userid=0;
			while(rt.next())
			{
				projectid=rt.getInt(1);
				userid=rt.getInt(2);
				if(i==projectid && j==userid)
				{
					status=1;
					System.out.println("data is already inserted");
					break;
				}
			}
			if(status==0)
			{
				ps = con.prepareStatement("INSERT into project_assign_details(PM_Id , UD_Id) values(?,?)");
				ps.setInt(1, i);
				ps.setInt(2, j);
				id = ps.executeUpdate();
				System.out.println("data inserted successfully");
			}
		}catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		
		return id;
		
	}
	
	public static ArrayList<AddUserBean> selectData(AssginProjectBean pb)
	{
		
		int j=0 ,i=0;
		ArrayList<AddUserBean>  list = new ArrayList<AddUserBean>();

		try {
			int id = pb.getPM_Id(); 
			ps = con.prepareStatement("SELECT UD_Id , PD_Id FROM project_assign_details WHERE PM_Id="+id);
		
			ResultSet rt = ps.executeQuery();
			while(rt.next()) 
			{
				AddUserBean rb = new AddUserBean();
				j= rt.getInt(1);
				rb.setUD_Id(j);
				i=rt.getInt(2);
				ps =con.prepareStatement("SELECT m.Role ,u.User_Name , u.Email FROM user_master As m INNER JOIN user_details AS u ON m.status=1 AND u.status=1 WHERE m.UD_Id="+j+" AND u.UD_Id="+j); 
				ResultSet rt1 = ps.executeQuery(); 
				while(rt1.next())
				{
					AddUserBean ub = new AddUserBean();

					ub.setRole(rt1.getString(1));
					ub.setName(rt1.getString(2));
					ub.setEmail(rt1.getString(3));
					ub.setUD_Id(j);
					ub.setUD_Id(i);
					list.add(ub);
				}
			}	
		}catch (Exception e) { e.printStackTrace(); }
			
		return list ;
		
	}
	
	public static ArrayList<AssginProjectBean> assginProject()
	{
		ArrayList<AssginProjectBean> list = new ArrayList<AssginProjectBean>();
		try
		{
			ps = DbConnection.getConnection().prepareStatement("Select PM_Id,Project_Name from project_master where status=1");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) 
			{
				AssginProjectBean s = new AssginProjectBean();
				s.setPM_Id(rs.getInt(1));
				s.setProject_Name(rs.getString(2));
				
				list.add(s);
			
			}
		}catch(Exception e) {
		e.printStackTrace();
	}
		return list;
	}
	
	public static ArrayList<AssginProjectBean> SelectProjectByRole(int a) 
	{
		System.out.println("in dao***********************"+a);
		ArrayList<AssginProjectBean> sp = new ArrayList<AssginProjectBean>();
		int pmid=0;
		try {
			ps= DbConnection.getConnection().prepareStatement("Select PM_Id from project_assign_details where UD_Id="+a);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) 
			{
				 pmid = rs.getInt(1);
				ps=DbConnection.getConnection().prepareStatement("Select Project_Name from project_master where PM_Id="+pmid);
				ResultSet rs1 = ps.executeQuery();
				while(rs1.next()) 
				{
					AssginProjectBean s = new AssginProjectBean();
					s.setProject_Name(rs1.getString(1));
					s.setPM_Id(pmid);
					sp.add(s);
				}
	
			}


		}catch(Exception e) {
			e.printStackTrace();
		}
		return sp;
	}
	
	
	
	
	

}
