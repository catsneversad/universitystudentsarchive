<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="api.models.Club" %>
<%@ page import="api.models.Student" %>
Created by IntelliJ IDEA.
  User: didef
  Date: 02.11.2020
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Title</title>
</head>
<body>
<%
    if(session.getAttribute("username")==null) {
        response.sendRedirect("login.jsp");
    }
    Club club = (Club) request.getAttribute("club");
    ArrayList<Student> students = (ArrayList<Student>) request.getAttribute("students");
%>
<a href="http://localhost:8080/CalendarEvents_war_exploded/jsp/index.jsp">Back</a>

<div id="app" class="container">
    <h3 class="mt-3">Add club</h3>
    <hr>
    <form>
        <div class="row">

            <div class="col">
                <label>Club name</label> <h6 style="color: red" id="regisErr2"></h6>
                <input type="text" class="form-control" name="name" id="name">
            </div>

            <div class="col">
                <label>Club image</label> <h6 style="color: red" id="regisErr1"></h6>
                <input type="text" class="form-control" name="image" id="image" value="<%=club.getImage()%>">
                <img src="<%=club.getImage()%>" class="img-rounded" alt="Cinque Terre">
            </div>

            <div class="col">
                <label>Club description</label> <h6 style="color: red" id="regisErr3"></h6>
                <input type="text" class="form-control" name="description" id="description" value="<%=club.getDescription()%>">
            </div>

        </div>
        <button class="btn btn-info mt-2" id="btn_change">Change</button>
    </form>
    <hr>


    <h4 class="mt-3">Students</h4>
    <div class="row">
        <div class="col">
            <table id="user-table" class="display table-bordered nowrap" cellspacing="0" width="100%">
                <thead>
                <tr>
                    <th>Student major</th>
                    <th>Student group</th>
                    <th>Student name</th>
                    <th>Student lastname</th>
                </tr>
                </thead>
                <tbody>
                <% for(Student student: students){%>
                <tr>
                    <th><%= student.getMajor() %></th>
                    <th><%= student.getGroup() %></th>
                    <th><%= student.getFirstName() %></th>
                    <th><%= student.getLastName() %></th>
                    <form method="get" action="<%=request.getContextPath()%>/removeStudent">
                        <th>
                            <input style="display: none;" name="club_id" value="<%=club.getId()%>">
                            <input style="display: none;"  name="student_id" value="<%=student.getId()%>">
                            <button style="width: 100%;" class="btn btn-danger" id="remove">Remove</button>
                        </th>
                    </form>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>



<script src="${pageContext.request.contextPath}/js/clubsPage_js.js"></script>
</body>
</html>
