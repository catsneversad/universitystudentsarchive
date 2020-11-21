<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="api.models.Club" %>
<%@ page import="api.models.Student" %>
<%@ page import="api.services.FetchService" %>
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
    FetchService fetchService = new FetchService();
    ArrayList<Student> students = fetchService.fetchStudentsOfClub(Integer.parseInt(request.getParameter("id")));
%>
<a href="http://localhost:8080/CalendarEvents_war_exploded/jsp/index.jsp">Back</a>

<div id="app" class="container">
    <div style="display: flex;">
        <h3 class="mt-3">Redact club</h3>
        <button style="margin-left: 5%; width: 20%;" class="btn btn-info mt-2" id="btn_change">Change</button>
    </div>
    <hr>
    <form>
        <div class="row">
            <div class="col">
                <label>Club name</label> <h6 style="color: red" id="regisErr2"></h6>
                <input type="text" class="form-control" name="name" id="name1" id="name" value="">
                <label>Club description</label> <h6 style="color: red" id="regisErr3"></h6>
                <textarea style="height: 80%;" class="form-control" name="description" id="description1" id="description">
                </textarea>
            </div>

            <div class="col">
                <label>Club image</label> <h6 style="color: red" id="regisErr1"></h6>
                <input type="text" class="form-control" name="image" id="image1" id="image" value="">
                <img style="width: 90%;" id="club_img" src="" class="img-rounded" alt="Cinque Terre">
            </div>
        </div>
    </form>
    <hr>
    <input id="club_id_hidden" name="student_id" value="">
    <input id="club_date_hidden" name="student_id" value="">

    <% if(students != null){ %>
    <h4 class="mt-3">Students</h4>
    <div class="row">
        <div class="col">
            <table id="user-table" class="display table-bordered nowrap" cellspacing="0" width="100%">
                <thead>
                <tr>
                    <th>Student major</th>
                    <th>Student group</th>
                    <th>Student firstname</th>
                    <th>Student lastname</th>
                </tr>
                </thead>
                <tbody>
                <% for(Student student: students){%>
                <tr>
                    <th><%= student.getMajor().getName() %></th>
                    <th><%= student.getGroup().getName() %></th>
                    <th><%= student.getFirstName() %></th>
                    <th><%= student.getLastName() %></th>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
    <%}%>
</div>



<script src="${pageContext.request.contextPath}/js/clubsPage_js.js"></script>
</body>
</html>
