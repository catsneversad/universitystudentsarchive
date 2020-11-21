<%@ page import="api.services.FetchService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="api.models.Club" %>
<%@ page import="api.models.Student" %>
<%@ page import="api.services.StudentService" %><%--
  Created by IntelliJ IDEA.
  User: magzhan
  Date: 11/18/2020
  Time: 1:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%
    FetchService fetchService = new FetchService();
    StudentService studentService = new StudentService();
    int userId = (int) request.getSession().getAttribute("user_id");
    Student myStudent = studentService.getStudentById(userId);
    ArrayList<Club> myClubs = fetchService.getClubsOfStudent(userId);
    int newCLubId = myClubs.get(myClubs.size() - 1).getId();
    newCLubId ++;
%>
<div id="app" class="container">
    <div class="row">
        <div class="col card p-5 m-5">
            <h3 class="mt-3">Create club</h3>
            <hr>
            <form action="<%=request.getContextPath()%>/AddToInboxClubServlet" method="post">
                <label>Name</label>
                <input type="text" name="name"><br>

                <label>Description</label>
                <input type="text" name="description"><br>

                <label>Image (URL from internet)</label>
                <input type="text" name="imageURL"><br>

                <label>Date of creating</label>
                <input type="date" name="date"><br>

                <input type="text" value="<%=newCLubId%>" name = "clubId" hidden>
                <input type="text" value="<%=myStudent.getId()%>"  name = "studentId" hidden>

                <button class="btn btn-info mt-2" id="btn_addClub">Send to review</button>
            </form>
        </div>

        <div class="col card p-5 m-5">
            <h3 class="mt-3">Create event</h3>
            <hr>
            <form action="<%=request.getContextPath()%>/AddToInboxEventServlet" method="post">
                <label>Name</label>
                <input type="text" name="name"><br>

                <label>Description</label>
                <input type="text" name="description"><br>

                <label>Image (URL from internet)</label>
                <input type="text" name="imageURL"><br>
                <%--                <%request.getSession().getAttribute('user')%>--%>
                <label>Choose your club</label>
                <select name="clubId" >
                    <%for (int i = 0; i < myClubs.size(); i++) {%>
                    <option value="<%=myClubs.get(i).getId()%>"><%=myClubs.get(i).getName()%>
                    </option>
                    <%}%>
                </select>
                <br>
                <input type="text" name="studentId" value="<%=myStudent.getId()%>" hidden>
                <button class="btn btn-info mt-2" id="btn_addEvent">Send to review</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
