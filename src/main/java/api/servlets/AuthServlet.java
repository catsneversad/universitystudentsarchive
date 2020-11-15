package api.servlets;


import api.models.Admin;
import api.models.Student;
import api.services.AuthService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "AuthServlet")
public class AuthServlet extends HttpServlet {
    HttpSession session;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getParameter("role");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        session = request.getSession();
        AuthService authService = new AuthService();
        if (session.getAttribute("user") != null){
            session.invalidate();
            return;
        }

        if (role.equals("student")){
            try {
                Student student = authService.authenticate(email, password);
                session.setAttribute("user", student);
                System.out.println("Successfully logged");
            } catch (Exception e) {
                request.setAttribute("student_auth_error", e.getMessage());
            }

        }
        else if (role.equals("admin")){
            try {
                Admin admin = authService.admin_authenticate(email, password);
                session.setAttribute("user", admin);
                System.out.println("Successfully!");
                //TODO Add some cookies
            } catch (Exception e) {
                request.setAttribute("admin_auth_error", e.getMessage());
            }
        }
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("jsp/MainPage.jsp");
            // If user exists, you can redirect to main page (ex. response.redirect('main');)
            return;
        }
        request.getRequestDispatcher("./auth.jsp").forward(request, response);
    }
}
