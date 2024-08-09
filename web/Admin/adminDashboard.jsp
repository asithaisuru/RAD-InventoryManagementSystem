<%-- 
    Document   : adminDashboard
    Created on : Aug 3, 2024, 9:25:43 PM
    Author     : Asitha
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="Classes.Product"%>
<%@page import="java.sql.Connection"%>
<%@page import="Classes.DBConnector"%>
<%@page import="Classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
    </head>
    <body class="text-white bg-dark text-center">
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

        <h1 class="mb-4">Get Report</h1>
        <div class="container">
            <form action="adminDashboard.jsp" method="POST">
                <div class="row mb-4">
                    <div class="col-lg-6 mb-4">
                        <div class="form-outline">
                            <label for="from">From</label>
                            <input type="date" id="from" name="from" class="form-control" placeholder="From" required/>
                        </div>
                    </div>
                    <%
                        Date today = new Date();
                        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                        String formattedDate = formatter.format(today);
                    %>
                    <div class="col-lg-6 mb-4">
                        <div class="form-outline">
                            <label for="to">To</label>
                            <input type="date" id="to" name="to" class="form-control" placeholder="To" required value="<%= formattedDate%>">
                        </div>
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col-md-12 mb-4">
                        <input class="btn btn-primary w-100" type="submit" value="Get Report">
                    </div>
                </div>
            </form>
            <hr>
            <div class="row">
                <div class="col-lg-12">
                    <%
                        if (request.getParameter("from") != null && request.getParameter("to") != null) {
                            String fromDate = request.getParameter("from");
                            String toDate = request.getParameter("to");

                            List<Product> soldProducts = new Product().getSoldProductsByDateRange(con, fromDate, toDate);

                    %>

                    <% if (soldProducts.isEmpty()) { %>

                    <h3 class="mb-5">Report</h3>
                    <p>No products were sold between the specified dates.</p>
                    <% } else { %>

                    <h1 class="mb-3">Report</h1>
                    <div class="row">
                        <div class="col-lg-6">
                            <h3 class="mb-3">Summary</h3>
                            <%
                                // Calculate minimum and maximum sold items
                                int minQuantity = Integer.MAX_VALUE;
                                String minItemName = "";
                                int maxQuantity = Integer.MIN_VALUE;
                                String maxItemName = "";
                                for (Product product : soldProducts) {
                                    int quantity = product.getQuantity();
                                    if (quantity < minQuantity) {
                                        minQuantity = quantity;
                                        minItemName = product.getName();
                                    }
                                    if (quantity > maxQuantity) {
                                        maxQuantity = quantity;
                                        maxItemName = product.getName();
                                    }
                                }
                            %>
                            <p>Maximum Sold Item:    <%= maxItemName%> (<%= maxQuantity%>)</p>
                            <p>Minimum Sold Item: <%= minItemName%> (<%= minQuantity%>)</p>
                        </div>
                        <div class="col-lg-6">
                            <h3 class="mb-3">Sold Products</h3>
                            <table class="table table-dark table-hover">
                                <thead>
                                    <tr>
                                        <th>Item Name</th>
                                        <th>Quantity Sold</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Product product : soldProducts) {%>
                                    <tr>
                                        <td><%= product.getName()%></td>
                                        <td><%= product.getQuantity()%></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
