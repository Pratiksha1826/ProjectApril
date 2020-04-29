package Bean;

public class TestCaseBean {
	
	private int testcase_id,PM_Id,PD_Id,browser_id,ver_id;
	public int getVer_id() {
		return ver_id;
	}
	public String getVersion_name() {
		return Version_name;
	}
	public void setVersion_name(String version_name) {
		Version_name = version_name;
	}
	public void setVer_id(int ver_id) {
		this.ver_id = ver_id;
	}
	public int getBrowser_id() {
		return browser_id;
	}
	public void setBrowser_id(int browser_id) {
		this.browser_id = browser_id;
	}
	private String Testcase_title,Testcase_type,precondition,steps,test_data,Browser_Type,Expected_Result,Testcase_Status,Actual_Result;
	private String project_name,Module_name,Version_name;
	
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getModule_name() {
		return Module_name;
	}
	public void setModule_name(String module_name) {
		Module_name = module_name;
	}
	public int getTestcase_id() {
		return testcase_id;
	}
	public void setTestcase_id(int testcase_id) {
		this.testcase_id = testcase_id;
	}
	public int getPM_Id() {
		return PM_Id;
	}
	public void setPM_Id(int pM_Id) {
		PM_Id = pM_Id;
	}
	public int getPD_Id() {
		return PD_Id;
	}
	public void setPD_Id(int pD_Id) {
		PD_Id = pD_Id;
	}
	public String getTestcase_title() {
		return Testcase_title;
	}
	public void setTestcase_title(String testcase_title) {
		Testcase_title = testcase_title;
	}
	public String getTestcase_type() {
		return Testcase_type;
	}
	public void setTestcase_type(String testcase_type) {
		Testcase_type = testcase_type;
	}
	public String getPrecondition() {
		return precondition;
	}
	public void setPrecondition(String precondition) {
		this.precondition = precondition;
	}
	public String getSteps() {
		return steps;
	}
	public void setSteps(String steps) {
		this.steps = steps;
	}
	public String getTest_data() {
		return test_data;
	}
	public void setTest_data(String test_data) {
		this.test_data = test_data;
	}
	public String getBrowser_Type() {
		return Browser_Type;
	}
	public void setBrowser_Type(String browser_Type) {
		Browser_Type = browser_Type;
	}
	public String getExpected_Result() {
		return Expected_Result;
	}
	public void setExpected_Result(String expected_Result) {
		Expected_Result = expected_Result;
	}
	public String getTestcase_Status() {
		return Testcase_Status;
	}
	public void setTestcase_Status(String testcase_Status) {
		Testcase_Status = testcase_Status;
	}
	public String getActual_Result() {
		return Actual_Result;
	}
	public void setActual_Result(String actual_Result) {
		Actual_Result = actual_Result;
	}
	
	

}
