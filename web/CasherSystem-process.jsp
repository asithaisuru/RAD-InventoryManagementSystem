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
<%@page import="Classes.Product"%> <!-- Adjust the package name as needed -->
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>

<%
    Connection con = DBConnector.getConnection();
    int id = Integer.parseInt(request.getParameter("id"));
    String quantityStr = request.getParameter("quantity");
    int quantity = Integer.parseInt(quantityStr);

    Product product = new Product();
    product.setId(id);
    product.getAProduct(con);
    product.setQuantity(quantity);

    // Add the product to the session list
    if (product != null) {
        List<Product> productList = (List<Product>) session.getAttribute("productList");
        if (productList == null) {
            productList = new ArrayList<Product>();
        }
        productList.add(product);
        session.setAttribute("productList", productList);
    }

    // Redirect back to the main page
    response.sendRedirect("cashierSystem.jsp");
%>
