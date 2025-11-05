<%-- 
    Document   : addProduct
    Created on : Jul 17, 2024, 4:17:19 PM
    Author     : Asitha
--%>

<%@page import="Classes.User"%>
<%@page import="java.util.List"%>
<%@page import="Classes.DBConnector"%>
<%@page import="Classes.Product"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>        
    </head>
    <body>
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
        <div  class="container bg-dark text-center text-white mt-5">
            <%
                String name = null;
                String quantity = null;
                String price = null;
                if (request.getParameter("name") != null) {
                    name = request.getParameter("name");
                    quantity = request.getParameter("quantity");
                    price = request.getParameter("price");
                }

            %>
            <div class="mb-5">
                <h1>Product Management</h1>
            </div>
            <div class="row">
                <div class="col-4">                    
                    <form action="editProduct-Process.jsp" method="POST">
                        <table>
                            <tr>
                                <td><label for="name">Name : </label></td>
                                <td><input type="text" name="name" id="name"></td>
                            </tr>
                            <tr>
                                <td><label for="price">Price : </label></td>
                                <td><input type="text" name="price" id="price"></td>
                            </tr>
                            <tr>
                                <td><label for="quantity">Quantity : </label></td>
                                <td><input type="text" name="quantity" id="quantity"></td>
                            </tr>
                            <tr>
                                <td colspan="2"><button type="submit" class="btn btn-success mt-3">Add</button></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <%                                    if (request.getParameter("add") != null) {
                                            if (request.getParameter("add").equals("1")) {
                                                out.println("Product Added to Inventory.");
                                            } else if (request.getParameter("add").equals("0")) {
                                                out.println("ERROR : Unable to save to database.");
                                            } else if (request.getParameter("add").equals("2")) {
                                                String id = request.getParameter("id");
                                                out.println("ERROR : Product name exists in the product id : " + id);
                                            }
                                        }
                                        if (request.getParameter("delete") != null) {
                                            if (request.getParameter("delete").equals("1")) {
                                                out.println("Product Removed.");
                                            } else {
                                                out.println("ERROR : Unable to Remove Product.");
                                            }
                                        }
                                    %>
                                </td>
                            </tr>

                        </table>
                    </form>
                </div>

                <div class="col-8">     
                    <table class="table table-dark table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Price<br>(Rs)</th>
                                <th>Quantity<br>Available</th>
                                <th></th>
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
                                <td>
                                    <form action="editProduct.jsp" method="POST" style="display:inline;">
                                        <input type="hidden" name="id" value="<%=p.getId()%>"/>
                                        <button type="submit" class="btn btn-primary"><i class="far fa-edit"></i></button>
                                    </form>
                                    <form action="deleteProduct.jsp" method="POST" style="display:inline;">
                                        <input type="hidden" name="id" value="<%=p.getId()%>"/>
                                        <button type="submit" class="btn btn-danger"><i class="fas fa-trash"></i></button>
                                    </form>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
