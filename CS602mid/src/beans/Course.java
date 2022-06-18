
package beans;
public class Course {
	private String courseID;
	private String courseSemester;
	private String courseName;
	
    public String getID() {
        return courseID;
    }
    public void setID(String id) {
        this.courseID = id;
    }
    public String getSemester() {
        return courseSemester;       
    }
    public void setSemester(String semester) {
        this.courseSemester = semester;
    }
    public String getName() {
        return courseName;        
    }
    public void setName(String name) {
        this.courseName = name;
    }
	
}
