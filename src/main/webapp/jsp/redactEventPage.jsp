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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Title</title>
</head>
<body>

<%
    Event event = (Event) request.getAttribute("event");
%>

<a href="http://localhost:8080/CalendarEvents_war_exploded/jsp/index.jsp">Back</a>

<div id="app" class="container">
    <div style="display: flex;">
        <h3 class="mt-3">Redact event</h3>
        <button style="margin-left: 5%; width: 20%;" class="btn btn-info mt-2" id="btn_change">Change</button>
    </div>
        <hr>
    <form>
        <div class="row">
            <div class="col">
                <label>Event name</label> <h6 style="color: red" id="regisErr2"></h6>
                <input type="text" class="form-control" name="name" id="name" value="<%=event.getName()%>">
                <label>Event description</label> <h6 style="color: red" id="regisErr3"></h6>
                <textarea style="height: 80%;" class="form-control" name="description" id="description">
                <%=event.getDescription()%>
                </textarea>
            </div>

            <div class="col">
                <label>Event image</label> <h6 style="color: red" id="regisErr1"></h6>
                <input type="text" class="form-control" name="image" id="image" value="<%=event.getImage()%>">
                <img style="width: 90%;" src="<%=event.getImage()%>" class="img-rounded" alt="Cinque Terre">
                <input type="text" class="form-control" name="id" id="id" hidden value="<%=event.getId()%>">
                <input type="text" class="form-control" name="major" id="major" hidden value="<%=event.getMajor().getId()%>">
                <input type="text" class="form-control" name="club" id="club" hidden value="<%=event.getClub().getId()%>">
            </div>

        </div>
    </form>
    <hr>
</div>



<script src="${pageContext.request.contextPath}/js/eventsPage_js.js"></script>
</body>
</html>
