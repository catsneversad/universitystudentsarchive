<%--
  Created by IntelliJ IDEA.
  User: didef
  Date: 18.11.2020
  Time: 08:47
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
<a href="http://localhost:8080/CalendarEvents_war_exploded/jsp/index.jsp">Back</a>

<div id="app" class="container">
    <div style="display: flex;">
        <h3 class="mt-3">Redact news</h3>
        <button style="margin-left: 5%; width: 20%;" class="btn btn-info mt-2" id="btn_change">Change</button>
    </div>
    <hr>
    <form>
        <div class="row">
            <div class="col">
                <label>News name</label> <h6 style="color: red" id="regisErr2"></h6>
                <input type="text" class="form-control" name="name" id="name1" id="name" value="">
                <label>News description</label> <h6 style="color: red" id="regisErr3"></h6>
                <textarea style="height: 80%;" class="form-control" name="description" id="description1" id="description">
                </textarea>
            </div>

            <div class="col">
                <label>News image</label> <h6 style="color: red" id="regisErr1"></h6>
                <input type="text" class="form-control" name="image" id="image1" id="image" value="">
                <img style="width: 90%;" id="club_img" src="" class="img-rounded" alt="Cinque Terre">
            </div>
        </div>
    </form>
    <hr>
    <input style="display: none;"  id="club_id_hidden" name="student_id" value="">
    <input style="display: none;" id="club_date_hidden" name="student_id" value="">
</div>



<script src="${pageContext.request.contextPath}/js/newsPage_js.js"></script>
</body>
</html>
