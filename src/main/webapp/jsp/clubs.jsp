<%@ page import="java.util.ArrayList" %>
<%@ page import="api.models.Club" %>
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
        ArrayList<Club> clubs = new ArrayList<>();
    %>
    <form method="get" action="<%=request.getContextPath()%>/readers">
        <input class="btn btn-info mt" type="submit" value="Readers">
    </form>
    <form style="position: absolute; right: 0;top:0;" method="get" action="<%=request.getContextPath()%>/login">
        <input class="btn btn-info mt" type="submit" value="Logout">
    </form>
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

                    <label>Club description</label> <h6 style="color: red" id="regisErr3"></h6>
                    <input type="text" class="form-control" name="description" id="description">
                </div>
                <div class="col">

                    <label>Club image</label> <h6 style="color: red" id="regisErr1"></h6>
                    <input type="text" class="form-control" name="image" id="image">
                </div>

            </div>
            <button class="btn btn-info mt-2" id="btn_add">Add club</button>
        </form>
        <hr>


        <div class="row">
            <div class="col">
                <table id="user-table" class="display table-bordered nowrap" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Club name</th>
                        <th>Club description</th>
                        <th>Club created date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for(Club club : clubs){%>
                    <tr>
                        <th><%= club.getName() %></th>
                        <th><%= club.getDescription() %></th>
                        <th><%= club.getCreated_at() %></th>
                        <form method="post" action="<%=request.getContextPath()%>/clubs">
                            <th>
                                <input style="display: none;" name="book_id" value="<%=club.getId()%>">
                                <button style="width: 100%;" class="btn btn-info mt-0" id="change">Details</button>
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