package api.servlets;

import api.models.Event;
import api.services.EventService;
import api.services.FetchService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;

@WebServlet(name = "ServletEvent")
public class ServletEvent extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        FetchService fetchService = new FetchService();
        try {
            LinkedList<Event> events = fetchService.fetchEvents(0,0);
            for(Event event : events){
                System.out.println(event.getId() + " " + id);
                if(event.getId() == Integer.parseInt(id)){
                    System.out.println("ok");
                    request.setAttribute("event",event);
                    request.getRequestDispatcher("/jsp/redactEventPage.jsp").forward(request,response);
                }
            }
        } catch (Exception e) {
            request.getRequestDispatcher("/jsp/redactEventPage.jsp").forward(request,response);
        }

    }
}
