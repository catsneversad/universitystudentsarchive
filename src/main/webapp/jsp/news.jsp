<%--
  Created by IntelliJ IDEA.
  User: didef
  Date: 18.11.2020
  Time: 08:44
  To change this template use File | Settings | File Templates.
--%>
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

    <form style="position: absolute; right: 0;top:0;" method="get" action="<%=request.getContextPath()%>/logout">
        <input class="btn btn-info mt" type="submit" value="Logout">
    </form>

    <div id="app" class="container">
        <h3 class="mt-3">Add news</h3>
        <hr>
            <div class="row">

                <div class="col">
                    <label>News name</label> <h6 style="color: red" id="regisErr2"></h6>
                    <input type="text" class="form-control" name="name" id="name">
                </div>

                <div class="col">
                    <label>News description</label> <h6 style="color: red" id="regisErr3"></h6>
                    <input type="text" class="form-control" name="description" id="description">
                </div>

                <div class="col">
                    <label>News image</label> <h6 style="color: red" id="regisErr1"></h6>
                    <input type="text" class="form-control" name="image" id="image">
                </div>

            </div>
            <button class="btn btn-info mt-2" id="btn_add">Add news</button>
        <hr>



        <div class="row">
            <div class="col">
                <table id="user-table" class="display table-bordered nowrap" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>News name</th>
                        <th>News description</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/newsPage_js.js"></script>
</body>
</html>
