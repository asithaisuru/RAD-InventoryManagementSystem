<%-- 
    Document   : viewABill
    Created on : Jul 25, 2024, 5:02:37 PM
    Author     : Asitha
--%>

<%@page import="Classes.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="Classes.DBConnector"%>
<%@page import="Classes.Bill"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Info</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    </head>
    <body class="text-center text-white bg-dark">
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
        <div class="d-flex justify-content-between ms-5 mt-5 me-5 mb-3">
            <a href="./viewAllBills.jsp" class="btn btn-secondary"><i class="fas fa-chevron-left"></i></a>
            <a href="./cashierSystem.jsp" class="btn btn-primary">Cashier System</i></a>
        </div>

        <div class="container">
            <%
                int bill_id = Integer.parseInt(request.getParameter("id"));
                String bill_date = (request.getParameter("date"));
                float tot = 0;
            %>
            <h1>Bill Info</h1>
            <div class="row mt-5 mb-5">
                <div class="col-6">
                    <h3>Bill ID : <span><%=bill_id%></span></h3>
                </div>
                <div class="col-6">
                    <h3>Date : <sapn><%=bill_date%></sapn></h3>
                </div>
            </div>

            <table class="table table-dark table-hover">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Bill bill = new Bill();
                        bill.setId(bill_id);
                        ResultSet rs = bill.getABill(con);
                        if (rs != null) {
                            while (rs.next()) {
                                float total = ((Integer.parseInt(rs.getString("quantity"))) * (Float.parseFloat(rs.getString("price"))));
                                tot += total;
                                String name = bill.getProductName(con, rs.getString("product_id"));
                    %>
                    <tr>
                        <td><%= name%></td>
                        <td><%= rs.getString("quantity")%></td>
                        <td><%= rs.getString("price")%></td>
                        <td><%=total%></td>
                    </tr>                
                    <%
                        }
                    %>
                    <tr>
                        <td colspan="3">Sub Total</td>
                        <td class="bg-success"><%=tot%></td>
                    </tr>
                    <%
                    } else {
                    %>
                    <tr>
                        <td colspan="3">No bills found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
