<%-- 
    Document   : cashierSystem
    Created on : Jul 17, 2024, 10:01:08 PM
    Author     : Asitha
--%>

<%@page import="Classes.User"%>
<%@page import="Classes.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cashier System</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    </head>
    <body class="text-center bg-dark text-white">
        <%
            Connection con = DBConnector.getConnection();
            if (session.getAttribute("IMS") != null) {
                int id = Integer.parseInt(String.valueOf(session.getAttribute("IMS")));
                User user = new User();
                user.setId(id);
                user.getAUser(con);
                if (!user.getRole().equals("Admin")) {
                    response.sendRedirect("../index.jsp");
                } else {
        %>
        <%@include file="adminNav.jsp" %>
        <%
                }
            } else {
                response.sendRedirect("../index.jsp");
            }
        %>

        <div class="container mt-5">
            <%
                if (request.getParameter("reg") != null) {
                    String reg = request.getParameter("reg");
                    if (reg.equals("1")) {
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>Success!</strong> User Registration Successful.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
            } else if (reg.equals("2")) {
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Error!</strong> Unable to register User.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                    }
                }
            %>
            <h1 class="h1 mb-4">Register</h1>
            <form action="sign_up_process.jsp" method="POST">
                <div class="row mb-4">
                    <div class="col-md-6 mb-4">
                        <div class="form-outline">
                            <input type="text" id="firstnameInput" name="firstname" class="form-control" placeholder="First name" required/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-outline">
                            <input type="text" id="lastnameInput" name="lastname" class="form-control" placeholder="Last name" required/>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-outline">
                            <input type="text" id="UserName" name="UserName" class="form-control" placeholder="Username" required/>
                        </div>
                    </div>
                </div>
                <div class="form-outline mb-4">
                    <input type="password" id="passwordInput" name="password" class="form-control" placeholder="Password" required/>
                </div>
                <button type="submit" class="btn btn-primary btn-block mb-4">Sign Up</button>                
            </form>            
        </div>
    </body>
</html>
