package api.servlets;

import api.models.Club;
import api.services.ClubService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "AddToInboxClubServlet")
public class AddToInboxClubServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userid = Integer.parseInt(request.getParameter("studentId"));
        String clubName = request.getParameter("name");
        String  clubDescription = request.getParameter("description");
        String clubImage = request.getParameter("imageURL");
        int clubId = Integer.parseInt(request.getParameter("clubId"));
        Club newClub = new Club(clubName,clubDescription,clubImage);

        ClubService clubService = new ClubService();
        try {
            clubService.create(newClub);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("jsp/MainPage.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
