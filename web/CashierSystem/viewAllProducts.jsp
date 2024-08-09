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
            int userId = Integer.parseInt(String.valueOf(session.getAttribute("IMS")));
            User user = new User();
            user.setId(userId);
            user.getAUser(con);
            if (user.getRole().equals("Admin")) {
        %>
        <%@include file="../Admin/adminNav.jsp" %>
        <%
            }
        %>
        <div class=" ms-5 mt-5">
            <a href="./cashierSystem.jsp"><button class="btn btn-secondary"><i class="fas fa-chevron-left"></i></button></a>
        </div>
        <div class="container text-center ">
            <h1>View All Products</h1>
            <div class="input-group mb-3">
                <input type="text" class="form-control" id="productName" placeholder="Enter Product Name" aria-label="Product Name" aria-describedby="productFilter">
            </div>
            <table class="table table-dark table-hover" id="productTable">
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
            <script>
                const productInput = document.getElementById('productName');
                const productTable = document.getElementById('productTable');

                productInput.addEventListener('keyup', function () {
                    const searchTerm = productInput.value.toLowerCase();
                    const productRows = productTable.querySelectorAll('tbody tr');

                    for (const row of productRows) {
                        const productNameCell = row.querySelector('td:nth-child(2)');
                        const productName = productNameCell.textContent.toLowerCase();

                        if (productName.includes(searchTerm)) {
                            row.style.display = '';
                        } else {
                            row.style.display = 'none';
                        }
                    }
                });
            </script>
        </div>
    </body>
</html>