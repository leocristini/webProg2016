<%-- 
    Document   : signup_page
    Created on : 28-set-2016, 14.42.04
    Author     : gianma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%!User userin; %>
        <%!String fullname; %>
        <%@page import="db_classes.User" %>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="media/css/styles.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>

    
        <nav id="nav-lato">
            <c:if test="${sessionScope.user == null}">
                <ul class="menu">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="login_page.jsp">Sign in</a></li>
                    <li><a href="signup_page.jsp">Sign up</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </c:if>
            <c:if test="${sessionScope.user != null}">
                <ul class="menu">
                    <li>Welcome back <c:out value="${sessionScope.user.firstname}"></c:out></li>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="#">My profile</a></li>
                    <li><a href="#">My notifications</a></li>
                    <li><a href="#">My restaurants</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a></li>
                </ul>
            </c:if>
        </nav>
        
        <nav class="navbar navbar-custom navbar-fixed-top">
                <div class="col-md-2">
                    <div id="mobile-nav"></div>
                </div>
                <div class="col-md-8">
                    <div class="input-group" id="barra-ricerca">
                        <input type="text" class="form-control" placeholder="Search">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">Advanced <span class="caret"></span></button>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
        </nav>
        
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="container-fluid">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-heading">Register</h3>
                    </div>
                    <div class="panel-body">
                        <form action="SignupServlet" method="POST">
                            <div class="container-fluid">
                                <div class="form-group">
                                    <div class="row">
                                        <label for="firstname">Firstname:</label>
                                        <input type="text" id="firstname" name="firstname" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label for="lastname">Lastname:</label>
                                        <input type="text" id="lastname" name="lastname" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label for="username">E-mail:</label>
                                        <input type="email" id="username" name="username" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label for="pwd">Password:</label>
                                        <input type="password" id="pwd" name="password1" 
                                               pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                                               title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" 
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label for="pwd">Re-write password:</label>
                                        <input type="password" id="pwd" name="password2" class="form-control">
                                    </div>
                                </div>
                                <p><c:out value="${requestScope.message}"></c:out></p>
                                <div class="form-group">
                                    <div class="row">
                                        <button class="btn btn-primary" type="submit">Register</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            </div>
            <div class="col-md-4"></div>
        </div>
        <script src="media/js/jquery-3.1.1.min.js"></script>
        <script src="media/js/scripts.js"></script>

</body>
</html>
