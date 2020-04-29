package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Bean.AddUserBean;
import DBConnection.DbConnection;


public class AddUserDao 
{ 
	static Connection con =  DbConnection.getConnection();
	static PreparedStatement ps;

	public static int insert(AddUserBean obj) 
	{
		int status=0;
		

		try 
		{
			System.out.println("in insert function");
			ps=con.prepareStatement("INSERT INTO user_details(User_Name,Contact_Number,Email,Alias_Name) VALUES(?,?,?,?)");
			ps.setString(1,obj.getName());
			ps.setString(2,obj.getContact());
			ps.setString(3,obj.getEmail());
			ps.setString(4,obj.getAliesname());
			status=ps.executeUpdate();
		
			System.out.println("for selecting id");
			Statement  st = con.createStatement(); 
			ResultSet rt = st.executeQuery("select UD_Id from user_details");
			int i=0;
			while(rt.next())
			{
				i=rt.getInt(1);
			}
			
			System.out.println("for insert value in login table");
			PreparedStatement ps1=con.prepareStatement("insert into user_master(UD_Id ,User_Name , Password,Role) values(?,?,?,?)");
			ps1.setInt(1, i);
			ps1.setString(2,obj.getEmail());
			ps1.setString(3,obj.getContact());
			ps1.setString(4,obj.getRole());
			status = ps1.executeUpdate();
			
		
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	public static List<AddUserBean> getUserDetail()
	{
		ArrayList<AddUserBean> ls = new ArrayList<AddUserBean>();
		try
		{
			ps = DbConnection.getConnection().prepareStatement("SELECT u.UD_Id ,s.Role , u.User_Name , u.Contact_Number  FROM user_details AS u INNER JOIN user_master AS s  ON u.UD_Id = s.UD_Id WHERE (u.Status=1 AND s.Status=1)");
			ResultSet rt = ps.executeQuery();
			while(rt.next())
			{
				AddUserBean a = new AddUserBean();
				a.setUD_Id(rt.getInt(1));
				a.setRole(rt.getString(2));
				a.setName(rt.getString(3));
				a.setContact(rt.getString(4));
				ls.add(a);
			}
		} 
		catch(Exception e) 
		{
		
			e.printStackTrace();
		}
		
		return ls;
		
	}
	
	
	public static int delete(int id)
	{
		con=DbConnection.getConnection();
		try
		{
			PreparedStatement ps1=con.prepareStatement("Update user_details set Status=0 where UD_Id=?");
			ps1.setInt(1,id);
			ps1.executeUpdate();
			
			PreparedStatement ps2=con.prepareStatement("update user_master set Status=0 where UD_Id=?");
			ps2.setInt(1,id);
			ps2.executeUpdate();
			
		
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return id;
		
	}

	public static int UpdateAddUser(AddUserBean obj) {
		int id=obj.getUD_Id();
		int status=0;
		try {
			Connection con=DbConnection.getConnection();
			PreparedStatement ps1=con.prepareStatement("UPDATE  user_details SET User_Name=? ,Contact_Number=? ,Email=? , Alias_Name=? ,UD_Id=? WHERE UD_id="+id);
			ps1.setString(1,obj.getName());
			ps1.setString(2,obj.getContact());
			ps1.setString(3,obj.getEmail());
			ps1.setString(4,obj.getAliesname());
			ps1.setInt(5,obj.getUD_Id());
			status=ps1.executeUpdate();
			
			ps=con.prepareStatement("UPDATE user_master SET UD_Id=?, Role=? WHERE UD_Id="+id);
			ps.setInt(1,obj.getUD_Id());
			ps.setString(2,obj.getRole());
			
			status=ps.executeUpdate();
			
		}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return status;
			 
			

		}
	public static List<AddUserBean> getUserById(int uid) 
	{
		System.out.println("in Dao id:"+uid);

	List<AddUserBean> list=new ArrayList<AddUserBean>();
		try {
			System.out.println("in Dao id:"+uid);
			ps=con.prepareStatement("SELECT u.UD_Id , u.User_Name , u.Contact_Number ,u.Email , u.Alias_Name,s.Role from user_details AS u INNER JOIN user_master AS s ON u.UD_Id = s.UD_Id WHERE u.Status=1 AND u.UD_Id="+uid);
	        ResultSet rs=ps.executeQuery();  
	        
	        while(rs.next())
	        {  
	        	AddUserBean obj=new AddUserBean();
	        	obj.setUD_Id(rs.getInt(1));
				obj.setName(rs.getString(2));
				obj.setContact(rs.getString(3));
				obj.setEmail(rs.getString(4));
				obj.setAliesname(rs.getString(5));
				obj.setRole(rs.getString(6));
				System.out.println("After pre statement setrole"+rs.getString(6));
				list.add(obj);
	        }
		}
	        
		catch(Exception ex)
		{
	        	ex.printStackTrace();
	    }  
	        
	        return list;  
	    }  
	public static List<AddUserBean> getUserById1(int id)
	{
		System.out.println("delete page:"+id);
		ArrayList<AddUserBean> l=new ArrayList<AddUserBean>();
		try {
			String sql="select user_details.User_Name ,user_master.Role, user_details.Email from user_details inner join user_master on "
					+ "user_details.UD_Id=user_master.UD_Id where user_details.Status=1 and user_master.Status=1 and "
					+ "user_details.UD_Id="+id;
			PreparedStatement ps2=con.prepareStatement(sql);
			ResultSet rt = ps2.executeQuery();
			System.out.println("print");
			while(rt.next())
				{
				AddUserBean rb= new AddUserBean();
				rb.setName(rt.getString(1));
				System.out.println("*********Name:"+rt.getString(1));
				rb.setRole(rt.getString(2));
				System.out.println("**** Role:"+rt.getString(2));
				rb.setEmail(rt.getString(3));
				l.add(rb);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return l;
		
	}	
	
	public static int UpdateToEmail(AddUserBean beanObj)
	{
		int status=0;
		System.out.println("in updateEmail to method");
		try 
		{
			System.out.println("in updateEmail to method try block");
			ps = DbConnection.getConnection().prepareStatement("UPDATE user_details SET Email=? where UD_Id = ?");
			System.out.println("email in dao " + beanObj.getEmail());
			ps.setString(1,beanObj.getEmail());
			ps.setInt(2, beanObj.getUD_Id());
			status = ps.executeUpdate();
			
			PreparedStatement ps1 = DbConnection.getConnection().prepareStatement("UPDATE user_master SET User_Name=? where UD_Id = ?");
			System.out.println("email in dao " + beanObj.getEmail());
			ps1.setString(1,beanObj.getEmail());
			ps1.setInt(2, beanObj.getUD_Id());
			status = ps1.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return status;
		
	}
	

	public static List<AddUserBean> signIn(String uname, String pass){
		System.out.println("UserName:"+uname+"Password:"+pass);
		ArrayList<AddUserBean>list = new ArrayList<AddUserBean>();
		try {
		
			System.out.println("In Sign Method");
			ps = con.prepareStatement("Select UD_Id,User_Name,Password from user_master");
			ResultSet rs = ps.executeQuery();
			System.out.println("Query Executed");
			while(rs.next()) 
			{
				int id = rs.getInt(1);
				String name =rs.getString(2);
				String password = rs.getString(3);
				System.out.println("after while");
				
				if(name.equals(uname)&& password.equals(pass)) 
				{
					System.out.println("Data Match");
					PreparedStatement ps1 = con.prepareStatement("Select Role from user_master where UD_Id="+id);
					ResultSet rs1 = ps1.executeQuery();
					while(rs1.next()) 
					{
						AddUserBean ob = new AddUserBean();
						ob.setRole(rs1.getString(1));
						ob.setUD_Id(id);
						System.out.println("Role:"+rs1.getString(1)+"Id:"+id);
						list.add(ob);
						break;
					
					}
					break;
				}
				else {
					System.out.println("Invalid Login");

				}
				
					}
		}catch(SQLException e){
		e.printStackTrace();
	}
		return list;
	}
	
	
	//getting user for AssginProject
	public static List<AddUserBean> getUser()
	{	
		int i=0;
		AddUserBean a = new AddUserBean();

		ArrayList<AddUserBean> ls = new ArrayList<AddUserBean>();
		try
		{
			
			ps=	DbConnection.getConnection().prepareStatement("SELECT UD_Id from project_assign_details where status=1");
			ResultSet rt1 = ps.executeQuery();
			while(rt1.next())
			{
				//AddUserBean ab = new AddUserBean();
				i=rt1.getInt(1);
		
			ps = DbConnection.getConnection().prepareStatement("SELECT UD_Id , User_Name  FROM user_details WHERE UD_Id !="+i);
			ResultSet rt = ps.executeQuery();
			while(rt.next())
			{
				a.setUD_Id(rt.getInt(1));
				a.setName(rt.getString(2));
			//	a.setEmail(rt.getString(4));

			}
			ls.add(a);

			}
		} 
		catch(Exception e) 
		{
		
			e.printStackTrace();
		}
		
		return ls;
		
	}
	
	
	///  selecting username from userid
	
	public static List<AddUserBean> getUserName(int did)
	{
		ArrayList<AddUserBean> l = new ArrayList<AddUserBean>();
		try 
		{
			ps = con.prepareStatement("SELECT User_Name  from user_details WHERE UD_Id="+did);
			ResultSet rt = ps.executeQuery();
			while(rt.next())
			{
				AddUserBean ab = new AddUserBean();
				ab.setName(rt.getString(1));
				//ab.setUD_Id(did);
				l.add(ab);
			
			}
			
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return l;
		
	}
	
	
	
	
	}