package api.servlets;

import api.models.*;
import api.services.BruhService;
import api.services.EventService;
import api.services.FetchService;
import api.services.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Response;
import java.io.IOException;

@WebServlet(name = "AddEventServlet")
public class AddEventServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String name = request.getParameter("name");
//        String description = request.getParameter("description");
//        String image = request.getParameter("image");
//        int club_id = Integer.parseInt(request.getParameter("club"));
//        int major_id = Integer.parseInt(request.getParameter("major"));
//
//        BruhService bruhService = new BruhService();
////        Club club = bruhService.getClub (club_id);
////        Major major = bruhService.getMajor (club_id);
//
////        Event myEvent = new Event(name, description, image, club_id, major_id);
//        EventService eventService = new EventService();
//        try {
//            Response response1 = eventService.create(myEvent);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        request.getRequestDispatcher("jsp/events.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
