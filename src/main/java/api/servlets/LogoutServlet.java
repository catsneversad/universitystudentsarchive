package api.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        session.removeAttribute("user_id");
        session.invalidate();

        Cookie[] cookies = request.getCookies();
        String cookieName = "name";
        for(Cookie c: cookies) {
            if(cookieName.equals(c.getName())) {
                c.setMaxAge(0);
                response.addCookie(c);
                break;
            }
        }
        request.getRequestDispatcher("auth.jsp").forward(request,response);
    }
}