<%@ page import="java.util.ArrayList" %>
<%@ page import="api.models.Club" %>
<%@ page import="api.models.Student" %>
<%@ page import="api.services.FetchService" %>
<%@ page import="api.models.Group" %>
<%@ page import="api.models.Major" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<link href="https://fonts.googleapis.com/css?family=Julius+Sans+One&display=swap" rel="stylesheet">
<div class="lib">
        <%
//        if(session.getAttribute("username")==null) {
//            response.sendRedirect("../auth.jsp");
//        }
    %>

<%--    <form method="get" action="<%=request.getContextPath()%>/readers">--%>
<%--        <input class="btn btn-info mt" type="submit" value="Readers">--%>
<%--    </form>--%>


    <form style="position: absolute; right: 0;top:0;" method="get" action="<%=request.getContextPath()%>/logout">
        <input class="btn btn-info mt" type="submit" value="Logout">
    </form>

    <div id="app" class="container">
        <h3 class="mt-3">Add student</h3>
        <hr>
        <form method="post" action="<%=request.getContextPath()%>/AddStudentServlet">
            <div class="row">
                <div class="col">
                    <label>First Name</label> <h6 style="color: red" id="regisErr2"></h6>
                    <input type="text" class="form-control" name="fname" id="fname">
                </div>

                <div class="col">
                    <label>Second Name</label> <h6 style="color: red" id="regisErr3"></h6>
                    <input type="text" class="form-control" name="sname" id="sname">
                </div>

                <div class="col">
                    <label>Email</label> <h6 style="color: red" id="regisErr1"></h6>
                    <input type="email" class="form-control" name="email" id="email">
                </div>

                <div class="col">
                    <label>Password</label> <h6 style="color: red" id="regisErr4"></h6>
                    <input type="text" class="form-control" name="password" id="password">
                </div>
            </div>
            <br>
            <div class="row">
                <%
                    FetchService fetchService = new FetchService();
                    ArrayList<Group> groups = new ArrayList<>();
                    groups = fetchService.fetchGroups();
                %>

                <div class="col">
                    <label>Group</label> <h6 style="color: red" id="regisErr5"></h6>
                    <select class="form-control" name="group" id="group">
                        <%for (int i = 0; i < groups.size(); i ++) {%>
                        <option value="<%=groups.get(i).getId()%>"><%=groups.get(i).getName()%></option>
                        <%}%>
                    </select>
                </div>

                <%
                    ArrayList<Major> majors = new ArrayList<>();
                    majors = fetchService.fetchMajors();
                %>

                <div class="col">
                    <label>Major</label> <h6 style="color: red" id="regisErr6"></h6>
                    <select class="form-control" name="major" id="major">
                        <%for (int i = 0; i < majors.size(); i ++) {%>
                        <option value="<%=majors.get(i).getId()%>"><%=majors.get(i).getName()%></option>
                        <%}%>
                    </select>
                </div>

                <div class="col">
                    <label>Year</label> <h6 style="color: red" id="regisErr7"></h6>
                    <input type="text" class="form-control" name="year" id="year">
                </div>

            </div>
            <button class="btn btn-info mt-2" id="btn_add">Add student</button>
        </form>
        <hr>
    </div>
</body>
</html>