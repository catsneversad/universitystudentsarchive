package api.servlets;

import api.models.Club;
import api.models.Event;
import api.models.Major;
import api.models.Student;
import api.services.EventService;
import api.services.NiceService;
import api.services.StudentService;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "AddToInboxEventServlet")
public class AddToInboxEventServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String image = request.getParameter("imageURL");
        Integer clubId = Integer.parseInt(request.getParameter("clubId"));
        Integer studentId = Integer.parseInt(request.getParameter("studentId"));
        StudentService studentService = new StudentService();
        try {
            Student myStudent = studentService.getStudentById(studentId);
            NiceService niceService = new NiceService();
            Event myEvent = new Event(name, description, image, null, myStudent.getMajor(), new Club (clubId));
            System.out.println(myEvent);
            EventService eventService = new EventService();
            eventService.create(myEvent);
//            niceService.createIncoming(myEvent);
//            Event curEvent = niceService.getIncomingEventByName(name);
//            System.out.println(curEvent);
//            niceService.createReviewInEvent(studentId, curEvent.getId());
            request.getRequestDispatcher("jsp/MainPage.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
