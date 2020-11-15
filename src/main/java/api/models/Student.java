package api.models;

public class Student {
    private int id;
    private String FirstName;
    private String LastName;
    private String email;
    private String password;
    private Group group;
    private Major major;
    private int year;

    public Student(int id, String firstName, String secondName, String email, Group group, Major major, int year) {
        this.id = id;
        this.FirstName = firstName;
        this.LastName = secondName;
        this.email = email;
        this.group = group;
        this.major = major;
        this.year = year;
    }

    public Student(String firstName, String secondName, String email, Group group, Major major, int year) {
        this.FirstName = firstName;
        this.LastName = secondName;
        this.email = email;
        this.group = group;
        this.major = major;
        this.year = year;
    }

    public Student(String firstName, String secondName, String email, String password, Group group, Major major, int year) {
        this.FirstName = firstName;
        this.LastName = secondName;
        this.email = email;
        this.password = password;
        this.group = group;
        this.major = major;
        this.year = year;
    }

    public Student(int id, String firstName, String secondName, String email, String password, Group group, Major major, int year) {
        this.id = id;
        this.FirstName = firstName;
        this.LastName = secondName;
        this.email = email;
        this.password = password;
        this.group = group;
        this.major = major;
        this.year = year;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String firstName) {
        this.FirstName = firstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String secondName) {
        this.LastName = secondName;
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

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", FirstName='" + FirstName + '\'' +
                ", LastName='" + LastName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", group=" + group +
                ", major=" + major +
                ", year=" + year +
                '}';
    }
}
