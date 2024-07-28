<%-- 
    Document   : viewAllBills
    Created on : Jul 25, 2024, 4:37:20 PM
    Author     : Asitha
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Classes.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Classes.Bill"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Bills</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    </head>
    <body class="bg-dark text-white text-center mt-5">
        <div class="d-flex justify-content-start ms-5">
            <a href="./cashierSystem.jsp" class="btn btn-secondary"><i class="fas fa-chevron-left"></i></a>
        </div>
        <div class="container">
            <h1>All Bills</h1>
            <div class="text-center">
                <table class="table table-dark table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Date</th>
                            <th>Total Price</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Bill> bills = null;
                            Connection con = DBConnector.getConnection();
                            try {
                                bills = Bill.getAllBills(con);
                            } catch (SQLException e) {
                                out.println("<tr><td colspan='3' class='text-danger'>Error fetching bills: " + e.getMessage() + "</td></tr>");
                            }

                            if (bills != null && !bills.isEmpty()) {
                                for (Bill bill : bills) {
                        %>
                        <tr>
                            <td><%= bill.getId()%></td>
                            <td><%= bill.getBillDate()%></td>
                            <td><%= bill.getTotalAmount()%></td>
                            <td>
                                <div class="col-1">
                                    <form action="viewABill.jsp" method="POST" style="display:inline;">
                                        <input type="hidden" name="id" value="<%=bill.getId()%>"/>
                                        <input type="hidden" name="date" value="<%=bill.getBillDate()%>"/>
                                        <button type="submit" class="btn btn-secondary"><i class="fas fa-ellipsis-v"></i></button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
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
        </div>
    </body>
</html>
