package Utility;

   import java.sql.PreparedStatement;
import java.util.Properties;  
      
    import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;  
    import javax.mail.internet.MimeMessage;
    //import javax.websocket.Session;  
      
    public class Mailer {  
    public static void send(String to,String msg) throws Exception
    {  
    	System.out.println("in mailer.java");
      //1st step) Get the session object    
    Properties pros = new Properties();  
   // props.put("mail.smtp.user", "user");//change accordingly 
   // props.put("mail.smtp.starttls.enable", "true");
    pros.put("mail.smtp.host","smtp.gmail.com");
    pros.put("mail.smtp.socketFactory.port", "465");    
	pros.put("mail.smtp.port","465");
	pros.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
    pros.put("mail.smtp.auth", "true");    

	String user="vertical.webmail@gmail.com";
	String password="Webmail@123";
	System.out.println(" after prosin mailer.java");
 
    Session session = Session.getInstance(pros,  new Authenticator() {
    	
    	@Override    
    	protected PasswordAuthentication getPasswordAuthentication() {
    		return new PasswordAuthentication(user , password);
    	}
	});
    
     Message message= preparemessage(session ,user,to,msg);
     //3rd step)send message  
 	System.out.println(" befor transportin mailer.java");

     Transport.send(message);  

  
 	System.out.println(" after transport in mailer.java");

    }
    //2nd step)compose message  
   
    private static Message preparemessage(Session session ,String user , String to , String msg)
    {
    	System.out.println("in message  method");
    	 Message message = new MimeMessage(session);  
         try {
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	        message.setText(msg);  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
                   
		return message;
	}
    }

 
    
      
      