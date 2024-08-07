<%-- 
    Document   : adminNav
    Created on : Aug 3, 2024, 9:32:37 PM
    Author     : Asitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    </head>
    <body class="bg-dark">
        <nav class="navbar navbar-expand-lg navbar-dark ms-5 me-5">
            <a class="navbar-brand" href="../Admin/adminDashboard.jsp">IMS</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="../Admin/adminDashboard.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../Admin/sign_up.jsp">User Management</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../Admin/addProduct.jsp">Product Management</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../CashierSystem/cashierSystem.jsp">Cashier System</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../Common/logout.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <hr class="border-white border-3">
    </body>
</html>
