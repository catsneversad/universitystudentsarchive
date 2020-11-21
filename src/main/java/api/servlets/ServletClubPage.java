package api.servlets;

import api.models.Club;
import api.models.Event;
import api.models.News;
import api.models.Student;
import api.services.BruhService;
import api.services.ClubService;
import api.services.EventService;
import api.services.NewsService;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ClubServlet")
public class ServletClubPage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String id = request.getParameter("id");
        if(type.equals("club")) {
            BruhService bruhService = new BruhService();
            ClubService clubService = new ClubService();
            try {
                request.setAttribute("students",clubService.getStudentsOfClub(Integer.parseInt(id)));
            } catch (Exception e) {
                request.setAttribute("students",new ArrayList<Student>());
            }
            Club club = bruhService.getClub(id);
            try {
                System.out.println(clubService.isStudentOfClub((int)request.getSession().getAttribute("user_id"),Integer.parseInt(id)));
                request.setAttribute("isStudentOfClub",clubService.isStudentOfClub((int)request.getSession().getAttribute("user_id"),Integer.parseInt(id)));
            } catch (SQLException throwables) {
                request.setAttribute("isStudentClub",false);
            }
            request.setAttribute("club", club);
            request.getRequestDispatcher("jsp/ClubPage.jsp").forward(request, response);
        }
        if (type.equals("event")) {
            EventService eventService = new EventService();
            try {
                Event event = eventService.read2(Integer.parseInt(request.getParameter("id")));

                request.setAttribute("event", event);
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("jsp/EventPage.jsp").forward(request, response);
        }

        if (type.equals("news")) {
            NewsService newsService = new NewsService();
            try {
                News news = newsService.read2(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("news",news);
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("jsp/NewsPage.jsp").forward(request, response);
        }
    }
}
