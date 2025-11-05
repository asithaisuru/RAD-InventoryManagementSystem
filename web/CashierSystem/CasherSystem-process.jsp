<%-- 
    Document   : CasherSystem-process
    Created on : Jul 17, 2024, 10:10:09 PM
    Author     : Asitha
--%>

<%@page import="Classes.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="Classes.Product"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cashier System Process</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    </head>
    <body class="bg-dark">
        <%
            Connection con = DBConnector.getConnection();
            int id = Integer.parseInt(request.getParameter("id"));
            String quantityStr = request.getParameter("quantity");
            int quantity = Integer.parseInt(quantityStr);

            Product product = new Product();
            product.setId(id);
            product.getAProduct(con);
            product.setQuantity(quantity);

            Product dbProduct = new Product();
            dbProduct.setId(id);
            dbProduct.getAProduct(con);
            int dbProductQuantity = dbProduct.getQuantity();

            List<Product> productList = (List<Product>) session.getAttribute("productList");
            if (productList == null) {
                productList = new ArrayList<Product>();
            }

            boolean found = false;
            boolean lowStock = false;
            boolean invalidQuantity = false;

            for (Product existingProduct : productList) {
                if (existingProduct.getId() == product.getId()) {
                    int newQuantity = existingProduct.getQuantity() + product.getQuantity();

                    if (newQuantity <= 0) {
                        // Handle case where the quantity becomes zero or negative
                        invalidQuantity = true;
                        productList.remove(existingProduct);
                        break;
                    } else if (newQuantity > dbProductQuantity) {
                        lowStock = true;
                        found = true;
                        break;
                    } else {
                        existingProduct.setQuantity(newQuantity);
                        found = true;
                        break;
                    }
                }
            }

            if (!found) {
                if (product.getQuantity() > dbProductQuantity) {
                    lowStock = true;
                } else if (product.getQuantity() > 0) {
                    productList.add(product);
                } else {
                    invalidQuantity = true;
                }
            }

            session.setAttribute("productList", productList);

            if (invalidQuantity) {
                out.println("<script>document.addEventListener('DOMContentLoaded', function() { new bootstrap.Modal(document.getElementById('invalidQuantityModal')).show(); });</script>");
            } else if (lowStock) {
                out.println("<script>document.addEventListener('DOMContentLoaded', function() { new bootstrap.Modal(document.getElementById('lowStockModal')).show(); });</script>");
            } else {
                response.sendRedirect("cashierSystem.jsp");
            }
        %>

        <!-- Low Stock Modal -->
        <% if (lowStock) {%>
        <div class="modal fade" id="lowStockModal" tabindex="-1" aria-labelledby="lowStockModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-warning">
                        <h5 class="modal-title" id="lowStockModalLabel">Low Stock Alert</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p class="text-danger">ERROR: Low on Stock. Available Stock = <%= dbProductQuantity%></p>
                    </div>
                    <div class="modal-footer">
                        <a href="cashierSystem.jsp" class="btn btn-danger">Close</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-backdrop fade"></div>
        <% } %>

        <!-- Invalid Quantity Modal -->
        <% if (invalidQuantity) {%>
        <div class="modal fade" id="invalidQuantityModal" tabindex="-1" aria-labelledby="invalidQuantityModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-warning">
                        <h5 class="modal-title" id="invalidQuantityModalLabel">Invalid Quantity Alert</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p class="text-danger">ERROR: Invalid quantity. Product removed from the list.</p>
                    </div>
                    <div class="modal-footer">
                        <a href="cashierSystem.jsp" class="btn btn-danger">Close</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-backdrop fade"></div>
        <% }%>
    </body>
</html>
