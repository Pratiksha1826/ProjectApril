package Bean;

public class AddUserBean 
{
	private int UD_Id ,PD_Id;
	
	public int getUD_Id() {
		return UD_Id;
	}
	public void setUD_Id(int uD_Id) {
		UD_Id = uD_Id;
	}
	private String name , aliesname , contact , email , password ,role; 
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public void setName( String name)
	{
		this.name = name;
	}
	public String getName()
	{
		return name;
	}
	public String getAliesname() {
		return aliesname;
	}
	public void setAliesname(String aliesname) {
		this.aliesname = aliesname;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPD_Id() {
		return PD_Id;
	}
	public void setPD_Id(int pD_Id) {
		PD_Id = pD_Id;
	}
}
