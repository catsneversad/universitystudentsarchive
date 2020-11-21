<%@ page import="java.util.ArrayList" %>
<%@ page import="api.models.Club" %>
<%@ page import="api.models.Student" %>
<%@ page import="api.services.FetchService" %>
<%@ page import="api.models.Group" %>
<%@ page import="api.models.Major" %>
<%@ page import="java.lang.reflect.Array" %>
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
    <style>
        .input-group.md-form.form-sm.form-1 input {
            border: 1px solid #bdbdbd;
            border-top-right-radius: 0.25rem;
            border-bottom-right-radius: 0.25rem;
        }

        .input-group.md-form.form-sm.form-2 input {
            border: 1px solid #bdbdbd;
            border-top-left-radius: 0.25rem;
            border-bottom-left-radius: 0.25rem;
        }

        .input-group.md-form.form-sm.form-2 input.red-border {
            border: 1px solid #ef9a9a;
        }

        .input-group.md-form.form-sm.form-2 input.lime-border {
            border: 1px solid #cddc39;
        }

        .input-group.md-form.form-sm.form-2 input.amber-border {
            border: 1px solid #ffca28;
        }
    </style>
</head>
<body>
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
                    <input type="text" class="form-control" name="fname" id="fname" value="">
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
                    ArrayList<Student> students = fetchService.fetchStudents(0, 0, 0, null, null);
                %>

                <div class="col">
                    <label>Group</label> <h6 style="color: red" id="regisErr5"></h6>
                    <select class="form-control" name="group" id="group">
                        <%for (int i = 0; i < groups.size(); i++) {%>
                        <option value="<%=groups.get(i).getId()%>"><%=groups.get(i).getName()%>
                        </option>
                        <%}%>
                    </select>
                </div>

                <%
                    ArrayList<Major> majors = new ArrayList<>();
                    majors = fetchService.fetchMajors();
                %>

                <div class="col">
                    <label>Major</label> h6 style="color: red" id="regisErr6"></h6>
                    <select class="form-control" name="major" id="major">
                        <%for (int i = 0; i < majors.size(); i++) {%>
                        <option value="<%=majors.get(i).getId()%>"><%=majors.get(i).getName()%>
                        </option>
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

        <div class="row">
            <button class="btn btn-info mt-2" id="show_all_students">Show all students</button>&nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-info mt-2" id="show_searchbar">Search student by name</button>&nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-info mt-2" id="show_by_group">Show students of group</button>&nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-info mt-2" id="show_by_major">Show students of major</button>&nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-info mt-2" id="show_by_year">Show students of year</button>
        </div>

        <div id="all_students" style="display: none">
            <h3 class="mt-3">All students</h3>
            <hr>

            <table class="table">
                <thead>
                <tr>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Email</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (int i = 0; i < students.size(); i++) {
                        Student curStudent = students.get(i);
                        System.out.println(curStudent);
                %>

                <form action="editStudent.jsp" method="get">

                    <tr>
                        <td><%=curStudent.getFirstName()%>
                        </td>
                        <td><%=curStudent.getLastName()%>
                        </td>
                        <td><%=curStudent.getEmail()%>
                        </td>
                        <td>
                            <input type="text" name="id" style="display: none"
                                   id="id<%=Integer.toString(curStudent.getId())%>"
                                   value="<%=Integer.toString(curStudent.getId())%>">

                            <button class="btn btn-info mt-2" id="edit<%=Integer.toString(curStudent.getId())%>">Edit
                                student
                            </button>
                        </td>
                    </tr>

                </form>
                <%}%>
                </tbody>
            </table>
        </div>
        <br>
        <div id="searchbar_students" style="display: none">
            <div class="input-group md-form form-sm form-1 pl-0">
                <div class="input-group-prepend">
                <span class="input-group-text cyan lighten-2" id="basic-text1"><i class="fa fa-search"
                                                                                  aria-hidden="true"></i></span>
                </div>
                <input class="form-control my-0 py-1" type="text" placeholder="Search..." aria-label="Search"
                       id="searchBar"
                       name="searchBar">
            </div>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Email</th>
                    </tr>
                    </thead>
                    <tbody id="studentsList">

                    </tbody>
                </table>

                <script src="../js/searchBar.js">
                </script>
        </div>

        <div id="groupSearch" style="display: none">
            <label>Group</label> <h6 style="color: red"></h6>
            <select class="form-control" name="group" id="selectBar">
                <%
                    for (int i = 0; i < groups.size(); i++) {
                %>
                <option value="<%=groups.get(i).getName()%>"><%=groups.get(i).getName()%>
                </option>
                <%}%>
            </select>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Email</th>
                    </tr>
                    </thead>
                    <tbody id="studentsListGroup">

                    </tbody>
                </table>

                <script src="../js/searchByGroup.js">
                </script>
        </div>

        <div id="majorSearch" style="display:none;">
            <label>Major</label> <h6 style="color: red"></h6>
            <select class="form-control" name="group" id="selectBarMajor">
                <%
                    for (int i = 0; i < majors.size(); i++) {
                %>
                <option value="<%=majors.get(i).getName()%>"><%=majors.get(i).getName()%>
                </option>
                <%}%>
            </select>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Email</th>
                    </tr>
                    </thead>
                    <tbody id="studentsListMajor">

                    </tbody>
                </table>

                <script src="../js/searchByMajor.js">
                </script>
        </div>

        <div id="yearSearch" style="display: none">
            <label>Year</label> <h6 style="color: red"></h6>
            <select class="form-control" name="group" id="selectBarYear">
                <%
                    ArrayList<Integer> years = fetchService.fetchYears();
                    for (int i = 0; i < years.size(); i++) {
                %>
                <option value="<%=years.get(i)%>"><%=years.get(i)%>
                </option>
                <%}%>
            </select>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Available years</th>
                </tr>
                </thead>
                <tbody id="studentsListYear">

                </tbody>
            </table>

            <script src="../js/searchByYear.js">
            </script>
        </div>


        <script>
            $(document).ready(function () {
                var kek1 = document.getElementById('all_students');
                var kek2 = document.getElementById('searchbar_students');
                var kek3 = document.getElementById('groupSearch');
                var kek4 = document.getElementById('majorSearch');
                var kek5 = document.getElementById('yearSearch');

                $('#show_all_students').click(function () {
                    kek1.style.display = "block";
                    kek2.style.display = "none";
                    kek3.style.display = "none";
                    kek4.style.display = "none";
                    kek5.style.display = "none";
                })
                $('#show_searchbar').click(function () {
                    kek1.style.display = "none";
                    kek2.style.display = "block";
                    kek3.style.display = "none";
                    kek4.style.display = "none";
                    kek5.style.display = "none";
                })
                $('#show_by_group').click(function () {
                    kek1.style.display = "none";
                    kek2.style.display = "none";
                    kek3.style.display = "block";
                    kek4.style.display = "none";
                    kek5.style.display = "none";
                })
                $('#show_by_major').click(function () {
                    kek1.style.display = "none";
                    kek2.style.display = "none";
                    kek3.style.display = "none";
                    kek4.style.display = "block";
                    kek5.style.display = "none";
                })
                $('#show_by_year').click(function () {
                    kek1.style.display = "none";
                    kek2.style.display = "none";
                    kek3.style.display = "none";
                    kek4.style.display = "none";
                    kek5.style.display = "block";
                })

            });
        </script>

    </div>
</body>
</html>