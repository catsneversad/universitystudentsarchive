<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="api.models.Club" %>
<%@ page import="api.models.Event" %>
<%@ page import="api.models.News" %>
<%@ page import="api.services.FetchService" %>
<%@ page import="api.models.Major" %>
<%@ page import="java.util.LinkedList" %><%--
  Created by IntelliJ IDEA.
  User: didef
  Date: 14.11.2020
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/MainPage_css.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Title</title>
</head>

    <%
       if(session.getAttribute("user")==null) {
            response.sendRedirect("../auth.jsp");
       }
       FetchService fetchService = new FetchService();
       ArrayList<Club> clubs = fetchService.fetchClubs();
       LinkedList<Event> events = fetchService.fetchEvents(0,0);
       ArrayList<News> news = fetchService.fetchNews(0);

              Cookie[] cookies = request.getCookies();
        Cookie cookie = null;
        String cookieName = "name";
        for(Cookie c: cookies) {
            if(cookieName.equals(c.getName())) {
                cookie = c;
                break;
            }
        }
%>
<%--AGAI SORE--%>
<body>
<% if(session.getAttribute("admin")!=null){%>
<header style="position: fixed; width: 100%; z-index: 1;">
    <nav class="navigation" style="margin-left: 10%;">
        <ul class="categories" style="font-size: 200%;">
            <li class="category-item"><a href="clubs.jsp">Clubs</a></li>
            <li class="category-item"><a href="events.jsp">Events</a></li>
            <li class="category-item"><a href="news.jsp">News</a></li>
        </ul>
    </nav>
</header>
<% } %>




<a href="createForStudent.jsp"><button style="position: absolute; right: 0;top:0;" class="btn btn-info mt">Create event or club!</button></a>

<div class="wrapper">
    <aside class="sidebar" style="position: fixed;">
        <div class="logotype">NewsApp</div>
        <ul class="sidebar-list">
            <%--            sb active        --%>
            <a id="news"><li class="sidebar-item"><img class="responsive" src='http://www.entypo.com/images/open-book.svg'>News</li></a>
            <a id="clubs"><li class="sidebar-item"><img class="responsive" src='http://www.entypo.com/images/users.svg'></i>Clubs</li></a>
            <a id="events"><li class="sidebar-item"><img class="responsive" src='http://www.entypo.com/images/megaphone.svg'></i>Events</li></a>
        </ul>
    </aside>
    <main class="content">
        <div class = "feed-grid" style="margin-top:2%;" >
            <p style=" margin-right: 200px; font-size: 2.5em">Welcome <%=cookie.getValue()%>!</p>
            <form method="get" action="<%=request.getContextPath()%>/LogoutServlet">
                <input class="btn btn-info mt" type="submit" value="Logout">
            </form>
            <div id="newsInfo">
                <% for(News paper : news){%>
                <form action="<%=request.getContextPath()%>/page" method="get">
                    <button style="border: none;">
                        <div class="card">
                            <a href="NewsPage.jsp?id=<%=paper.getId()%>">
                                <img class="card-img-top" src="<%=paper.getImage()%>" alt="Card image cap"/>
                                <div class="card-body">
                                    <h4 class="card-title"><%=paper.getName()%></h4>
                                    <p class="card-text"><%=paper.getDescription()%></p>
                                    <input type="number" style="display: none;" name="id" value="<%=paper.getId()%>">
                                    <input type="text" style="display: none;"name="type" value="news">
                                </div>
                            </a>
                        </div>
                    </button>
                </form>
                <%}%>
            </div>

            <div id="clubsInfo" >
                <% for(Club club : clubs){%>
                <form action="<%=request.getContextPath()%>/page" method="get">
                    <button style="border: none;">
                        <div class="card">
                            <img class="card-img-top" src="<%=club.getImage()%>" alt="Card image cap"/>
                            <div class="card-body">
                                <h4 class="card-title"><%=club.getName()%></h4>
                                <input type="number" style="display: none;" name="id" value="<%=club.getId()%>">
                                <input type="text" style="display: none;" name="type" value="club">
                            </div>
                        </div>
                    </button>
                </form>
                <%}%>
            </div>

            <div id="eventsInfo">
                <% for(Event event : events){%>
                <form action="<%=request.getContextPath()%>/page" method="get">
                    <button style="border: none;">
                        <div class="card">
                            <a href="EventPage.jsp?id=<%=event.getId()%>">
                                <img class="card-img-top" src="<%=event.getImage()%>" alt="Card image cap"/>
                                <div class="card-body">
                                    <h4 class="card-title"><%=event.getName()%></h4>
                                    <p class="card-text"><%=event.getDescription()%></p>
                                    <input type="number" style="display: none;" name="id" value="<%=event.getId()%>">
                                    <input type="text" style="display: none;"name="type" value="event">
                                </div>
                            </a>
                        </div>
                    </button>
                </form>
                <%}%>
            </div>
        </div>
    </main>
</div>
<script src="${pageContext.request.contextPath}/js/MainPage_js.js"></script>
</body>
