package api.servlets;

import api.models.Group;
import api.models.Major;
import api.models.Student;
import api.services.FetchService;
import api.services.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Response;
import java.io.IOException;

@WebServlet(name = "AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("fname");
        String secondName = request.getParameter("sname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int group_id = Integer.parseInt(request.getParameter("group"));
        int major_id = Integer.parseInt(request.getParameter("major"));
        int year = Integer.parseInt(request.getParameter("year"));


        System.out.println(firstName + " " + secondName + " " + email + " " + password + " " + group_id + " " + major_id + " " + year);

        FetchService fetchService = new FetchService();

        Group group = null;
        try {
            group = fetchService.fetchGroupsById(group_id);
        } catch (Exception e) {
            e.printStackTrace();
        }


        Major major = null;
        try {
            major = fetchService.fetchMajorsById(group_id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Student myStudent = new Student(email, firstName, secondName, group, major, year);
        System.out.println(myStudent);
        System.out.println(myStudent.getFirstName());
        StudentService studentService = new StudentService();
        try {
            Response response1 = studentService.create(myStudent);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("jsp/students.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
