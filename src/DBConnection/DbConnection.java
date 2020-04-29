package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	public static Connection getConnection() {
		Connection con=null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver Loaded");
		con  = DriverManager.getConnection("jdbc:mysql://localhost:3306/dtt?serverTimezone=UTC", "root", "");	
		
		System.out.println("Connected");
	}catch(Exception e) {
		
		System.out.println(e);

		}
	return con;

	}

}
