
<%@ page import="api.models.Event" %><%--
  Created by IntelliJ IDEA.
  User: Пользователь
  Date: 15.11.2020
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>

<link rel="stylesheet" href="https://bootstraptema.ru/plugins/2015/bootstrap3/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<script src="https://bootstraptema.ru/plugins/jquery/jquery-1.11.3.min.js"></script>
<script src="https://bootstraptema.ru/plugins/2015/b-v3-3-6/bootstrap.min.js"></script>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{background:url(https://bootstraptema.ru/images/bg/bg-1.png)}

        #main {
            background-color: #f2f2f2;
            padding: 20px;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -ms-border-radius: 4px;
            -o-border-radius: 4px;
            border-radius: 4px;
            border-bottom: 4px solid #ddd;
        }
        #real-estates-detail #author img {
            -webkit-border-radius: 100%;
            -moz-border-radius: 100%;
            -ms-border-radius: 100%;
            -o-border-radius: 100%;
            border-radius: 100%;
            border: 5px solid #ecf0f1;
            margin-bottom: 10px;
        }
        #real-estates-detail .sosmed-author i.fa {
            width: 30px;
            height: 30px;
            border: 2px solid #bdc3c7;
            color: #bdc3c7;
            padding-top: 6px;
            margin-top: 10px;
        }
        .panel-default .panel-heading {
            background-color: #fff;
        }
        #real-estates-detail .slides li img {
            height: 450px;
        }
    </style>
</head>
<body>
<%-- take a event from attribute or you can change it to take from FetchService--%>
<%
    Event event = (Event) request.getAttribute("event");

%>

<div class="container">
    <div id="main">


        <div class="row" id="real-estates-detail">
            <div class="col-lg-4 col-md-4 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <header class="panel-title">
                            <div class="text-center">
                            </div>
                        </header>
                    </div>
                    <div class="panel-body">
                        <div class="text-center" id="author">
                            <img style="width: 150px;" src="<%=event.getImage()%>">
                            <h3><%=event.getName()%></h3>
                            <small class="label label-warning">news</small>
                            <p><%=event.getDescription()%></p>
                            <p class="sosmed-author">
                                <a href="#"><i class="fa fa-facebook" title="Facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter" title="Twitter"></i></a>
                                <a href="#"><i class="fa fa-instagram" title="Instagram"></i></a>
                                <a href="#"><i class="fa fa-linkedin" title="Linkedin"></i></a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-8 col-xs-12">
                <div class="panel">
                    <div class="panel-body">
                        <ul id="myTab" class="nav nav-pills">
                            <li class="active"><a href="#detail" data-toggle="tab">Information</a></li>

                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <hr>
                            <div class="tab-pane fade active in" id="detail">
                                <h4>About event</h4>
                                <table class="table table-th-block">
                                    <tbody>
                                    <tr><td class="active">Creation date:</td><td><%=event.getCreated_at()%></td></tr>
                                    <tr><td class="active">University:</td><td>Astana IT University</td></tr>
                                    <tr><td class="active">Majors:</td><td><%=event.getMajor().getName()%></td></tr>
                                    <tr><td class="active">Club:</td><td><%=event.getClub().getName()%></td></tr>
                                    </tbody>

                                </table>

                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</div>
</body>
</html>
