<%@ page import="api.models.Event" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="api.services.EventService" %><%--
  Created by IntelliJ IDEA.
  User: didef
  Date: 15.11.2020
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    if(session.getAttribute("username")==null) {
        response.sendRedirect("../auth.jsp");
    }
    Event event = new Event();
%>

<a href="http://localhost:8080/CalendarEvents_war_exploded/jsp/index.jsp">Back</a>

<div id="app" class="container">
    <h3 class="mt-3">Redact event</h3>
    <hr>
    <form>
        <div class="row">
            <div class="col">
                <label>Event name</label> <h6 style="color: red" id="regisErr2"></h6>
                <input type="text" class="form-control" name="name" id="name">
            </div>

            <div class="col">
                <label>Event image</label> <h6 style="color: red" id="regisErr1"></h6>
                <input type="text" class="form-control" name="image" id="image" value="<%=event.getImage()%>">
                <img src="<%=event.getImage()%>" class="img-rounded" alt="Cinque Terre">
            </div>

            <div class="col">
                <label>Event description</label> <h6 style="color: red" id="regisErr3"></h6>
                <input type="text" class="form-control" name="description" id="description" value="<%=event.getDescription()%>">
            </div>

            <div class="col">
                <label>Event club</label> <h6 style="color: red"></h6>
                <input type="text" class="form-control" name="description" id="club" value="<%=event.getDescription()%>">
            </div>

            <div class="col">
                <label>Event major</label> <h6 style="color: red"></h6>
                <input type="text" class="form-control" name="description" id="major" value="<%=event.getDescription()%>">
            </div>

        </div>
        <button class="btn btn-info mt-2" id="btn_change">Change</button>
    </form>
    <hr>
</div>



<script src="${pageContext.request.contextPath}/js/clubsPage_js.js"></script>
</body>
</html>
