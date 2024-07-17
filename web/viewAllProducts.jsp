<%-- 
    Document   : viewAllProducts
    Created on : Jul 17, 2024, 7:30:37 PM
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
    </head>
    <body>
        <h1>View All Products</h1>


        <table border="1">
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
                    Connection con = DBConnector.getConnection();
                    Product product = new Product();
                    List<Product> allProducts = product.getAllProducts(con);
                    for (Product p : allProducts) {
                %>
                <tr>
                    <td><%out.println(p.getId());%></td>
                    <td><%out.println(p.getName());%></td>
                    <td><%out.println(p.getPrice());%></td>
                    <td><%out.println(p.getQuantity());%></td>
                </tr>
                <% } %>
            </tbody>
        </table>

    </body>
</html>
