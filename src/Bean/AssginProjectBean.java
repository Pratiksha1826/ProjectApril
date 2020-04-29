package Bean;

public class AssginProjectBean
{
	private int PM_Id ,UD_Id ,PD_Id;
	private String Project_Name;
	
	public void setPM_Id(int PM_Id) 
	{
		this.PM_Id=PM_Id;
	}
	public int getPM_Id()
	{
		return PM_Id;
	}

	public String getProject_Name() {
		return Project_Name;
	}
	public void setProject_Name(String project_Name) {
		Project_Name = project_Name;
	}
	public void setUD_Id(int UD_Id)
	{
		this.UD_Id=UD_Id;
	}
	public int getUD_Id()
	{
		return UD_Id;
	}
	public int getPD_Id() {
		return PD_Id;
	}
	public void setPD_Id(int pD_Id) {
		PD_Id = pD_Id;
	}
}
