package Bean;

import java.sql.Date;

public class AddProjectBean {
	private int PD_ID;
	public int getPD_ID() {
		return PD_ID;
	}
	public void setPD_ID(int pD_ID) {
		PD_ID = pD_ID;
	}
	private String Project_Name,Soft_Tools;
	private String Module_Name;
	public String getModule_Name() {
		return Module_Name;
	}
	public void setModule_Name(String module_Name) {
		Module_Name = module_Name;
	}
	private Date Start_Date;
	private int PM_Id;
	
	public String getProject_Name() {
		return Project_Name;
	

	}
	public void setProject_Name(String project_Name) {
		Project_Name = project_Name;
		//System.out.println("in bean :"+project_Name);
	}
	public String getSoft_Tools() {
		return Soft_Tools;
	}
	public void setSoft_Tools(String soft_Tools) {
		Soft_Tools = soft_Tools;
	}
	
	public Date getStart_Date() {
		return Start_Date;
	}
	public void setStart_Date(Date start_Date) {
		Start_Date = start_Date;
	}
	public int getPM_Id() {
		return PM_Id;
	}
	public void setPM_Id(int pM_Id) {
		PM_Id = pM_Id;
	}

	
	

}
