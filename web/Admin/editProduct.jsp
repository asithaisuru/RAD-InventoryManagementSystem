<%-- 
    Document   : editProduct
    Created on : Jul 25, 2024, 7:43:33 PM
    Author     : Asitha
--%>

<%@page import="Classes.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="Classes.DBConnector"%>
<%@page import="Classes.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>    
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    </head>
    <body class="bg-dark text-center text-white">
        <%
            Connection con = DBConnector.getConnection();
            if (session.getAttribute("TaskTrackerID") != null) {
                int id = Integer.parseInt(String.valueOf(session.getAttribute("TaskTrackerID")));
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
            <h1 class="h1 mb-5">Edit Product</h1>
            <%
                String id = "-1";
                if (request.getParameter("id") != null) {
                    id = request.getParameter("id");
                }
                Product product = new Product();
                product.setId(Integer.parseInt(id));
                product.getAProduct(con);
            %>

            <%
                if (request.getParameter("edit") != null) {
                    String edit = request.getParameter("edit");
                    if (edit.equals("1")) {
                        out.println("Product Edited Successfully.");
                    } else {
                        out.println("Product Edit Failed.");
                    }
                }
            %>
            <%
                if (id != "-1") {%>
            <div 
                class="">
                <form action = "editProduct-Process.jsp" method = "POST"> 
                    <table>
                        <tr> 
                            <td><label for = "name" > Name: </label ></td> 
                            <td><input type = "text" name = "name" id = "name" value ="<%=product.getName()%>"></td>
                        </tr>
                        <tr>
                            <td><label for="price">Price : </label></td>
                            <td><input type="text" name="price" id="price" value="<%=product.getPrice()%>"></td>
                        </tr>
                        <tr>
                            <td><label for="quantity">Quantity : </label></td>
                            <td><input type="text" name="quantity" id="quantity" value="<%=product.getQuantity()%>"></td>
                        </tr>
                        <tr>
                        <input type="hidden" name="id" value="<%=id%>">
                        <td colspan="2"><button type="submit" class="btn btn-success mt-3">Update</button></td>
                        </tr>
                    </table>
                </form>
            </div>
            <%} else {%>
            <br>
            <a href="./addProduct.jsp"><span class="btn btn-secondary mt-5">Go Back</span></a>
            <%}%>
        </div>
    </body>
</html>
