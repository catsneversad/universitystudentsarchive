<%@ page import="api.services.NiceService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="api.models.IncomingEvents" %><%--
  Created by IntelliJ IDEA.
  User: magzhan
  Date: 11/18/2020
  Time: 6:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Title</title>
</head>
<body>
    <%
        NiceService niceService = new NiceService();
        ArrayList<IncomingEvents> incomingEvents = new ArrayList<>();
        incomingEvents = niceService.getIncomingEvents();
    %>

    <div id="app" class="container">
        <table class="table">
            <thead>
            <th scope="col">Status</th>
            <th scope="col">Author</th>
            <th scope="col">name</th>
            <th scope="col">description</th>
            <th scope="col">image</th>
            <th scope="col">club</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</body>
</html>
