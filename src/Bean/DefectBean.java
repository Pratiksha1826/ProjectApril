package Bean;

public class DefectBean {
private int defect_id,testcase_id ,Status_Id ,Assign_to ;
private String Defect_title,Steps,Excepted_result,Actual_result,Module,Severity,Set_priority,Screenshot,Status_name;
public int getDefect_id() {
	return defect_id;
}
public void setDefect_id(int defect_id) {
	this.defect_id = defect_id;
}
public int getStatus_Id() {
	return Status_Id;
}
public void setStatus_Id(int status_Id) {
	Status_Id = status_Id;
}
public String getStatus_name() {
	return Status_name;
}
public void setStatus_name(String status_name) {
	Status_name = status_name;
}
public int getTestcase_id() {
	return testcase_id;
}
public void setTestcase_id(int testcase_id) {
	this.testcase_id = testcase_id;
}

public String getDefect_title() {
	return Defect_title;
}
public void setDefect_title(String defect_title) {
	Defect_title = defect_title;
}
public String getSteps() {
	return Steps;
}
public void setSteps(String steps) {
	Steps = steps;
}
public String getExcepted_result() {
	return Excepted_result;
}
public void setExcepted_result(String excepted_result) {
	Excepted_result = excepted_result;
}
public String getActual_result() {
	return Actual_result;
}
public void setActual_result(String actual_result) {
	Actual_result = actual_result;
}
public String getModule() {
	return Module;
}
public void setModule(String module) {
	Module = module;
}
public String getSeverity() {
	return Severity;
}
public void setSeverity(String severity) {
	Severity = severity;
}
public String getSet_priority() {
	return Set_priority;
}
public void setSet_priority(String set_priority) {
	Set_priority = set_priority;
}
public String getScreenshot() {
	return Screenshot;
}
public void setScreenshot(String screenshot) {
	Screenshot = screenshot;
}

public int getAssign_to() {
	return Assign_to;
}
public void setAssign_to(int assign_to) {
	Assign_to = assign_to;
}
	
}
