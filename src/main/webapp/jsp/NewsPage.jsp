<%@ page import="api.models.News" %>
<%@ page import="api.services.FetchService" %>
<%@ page import="api.services.NewsService" %><%--
  Created by IntelliJ IDEA.
  User: didef
  Date: 15.11.2020
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if(session.getAttribute("user")==null) {
        response.sendRedirect("../auth.jsp");
    }
    NewsService newsService = new NewsService();
    News news = newsService.getNews(request.getParameter("id"));
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
                            <img style="width: 150px;" src="<%=news.getImage()%>>">
                            <h3><%=news.getName()%></h3>
                            <small class="label label-warning">news </small>
                            <p><%=news.getDescription()%></p>
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
                                <h4>About club</h4>
                                <table class="table table-th-block">
                                    <tbody>
                                    <tr><td class="active">Creation date:</td><td><%=news.getCreated_at()%></td></tr>
                                    <tr><td class="active">University:</td><td>Astana IT University</td></tr>
                                    <tr><td class="active">Majors:</td><td><%=news.getMajor()%>></td></tr>

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
