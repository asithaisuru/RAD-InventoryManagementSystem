<%-- 
    Document   : viewAllProducts
    Created on : Jul 17, 2024, 9:49:02 PM
    Author     : Asitha
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="Classes.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Products</title>    
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    </head>
    <body class="text-white bg-dark">
        <%
            Connection con = DBConnector.getConnection();
            int userId = Integer.parseInt(String.valueOf(session.getAttribute("TaskTrackerID")));
            User user = new User();
            user.setId(userId);
            user.getAUser(con);
            if (!user.getRole().equals("Admin")) {
                response.sendRedirect("../index.jsp");
            } else {
        %>
        <%@include file="../Admin/adminNav.jsp" %>
        <%
            }
        %>
        <a href="./cashierSystem.jsp"><button class="btn btn-secondary ms-5"><i class="fas fa-chevron-left"></i></button></a>
        <div class="container text-center ">
            <h1>View All Products</h1>
            <table class="table table-dark table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Product prodcuts = new Product();
                        List<Product> allProducts = prodcuts.getAllProducts(con);
                        for (Product p : allProducts) {
                    %>
                    <tr>
                        <td><%out.println(p.getId());%></td>
                        <td><%out.println(p.getName());%></td>
                        <td><%out.println(p.getPrice());%></td>
                        <td><%out.println(p.getQuantity());%></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </body>
</html>
