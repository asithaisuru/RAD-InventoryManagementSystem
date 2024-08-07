<%-- 
    Document : index 
    Created on : May 6, 2024, 3:29:58 PM 
    Author : Asitha 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Welcome - Inventory Management System</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body class="text-center bg-dark text-white">
        <div class="container mt-5">
            <%
                if (request.getParameter("log") != null) {
                    String log = request.getParameter("log");
                    if (log.equals("1")) {
            %> 
            <div class="alert alert-danger alert-dismissible fade show" role="alert"> 
                <strong>Error!</strong> Username or Password Incorrect. 
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button> 
            </div> 
            <%
                    }
                }
            %>

            <h1 class="fw-bold mb-3">Inventory Management System</h1>
            <h3 class="fw-bold mb-5">Login</h3>
            <form action="./login.jsp" method="POST">
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="form-outline mb-4">
                            <input type="text" id="emailInput" name="username" class="form-control" placeholder="Username" required/>
                        </div>

                        <div class="form-outline mb-4">
                            <input type="password" id="passwordInput" name="password" class="form-control" placeholder="Password" required/>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block mb-4 w-50">
                            Login
                        </button>
                    </div>
                    <div class="col-md-3"></div>
                </div>
            </form>
        </div>
    </body>
</html>
