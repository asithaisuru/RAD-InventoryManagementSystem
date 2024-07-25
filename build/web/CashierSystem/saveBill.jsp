<%-- 
    Document   : saveBill
    Created on : Jul 17, 2024, 10:45:53 PM
    Author     : Asitha
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Classes.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Classes.Bill"%>
<%@page import="java.util.List"%>
<%@page import="Classes.Product"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Save Bill</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-dark text-white">
        <div class="container mt-5">
            <%
                Connection con = DBConnector.getConnection();
                List<Product> productList = (List<Product>) session.getAttribute("productList");
                if (productList != null && !productList.isEmpty()) {
                    try {
                        int billId = Bill.saveBill(productList, con);
                        if (billId > 0) {
                            session.invalidate();
                            response.sendRedirect("./cashierSystem.jsp");
                        } else {
                            out.println("<p class='text-danger'>An error occurred while saving the bill. Please try again later.</p>");
                        }
                    } catch (Exception e) {
                        out.println("<p class='text-danger'>An error occurred: " + e.getMessage() + "</p>");
                    }
                } else {
                    out.println("<p class='text-warning'>No products to save.</p>");
                    response.sendRedirect("./cashierSystem.jsp");
                }
            %>
        </div>
    </body>
</html>
