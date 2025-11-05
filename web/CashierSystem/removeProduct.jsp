<%-- 
    Document   : removeProduct
    Created on : Jul 25, 2024, 3:27:22 PM
    Author     : Asitha
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="Classes.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Retrieve the product ID from the request
    String productIdStr = request.getParameter("id");
    int productId = Integer.parseInt(productIdStr);

    // Get the product list from the session
    List<Product> productList = (List<Product>) session.getAttribute("productList");
    if (productList == null) {
        productList = new ArrayList<Product>();
    }

    // Use an iterator to safely remove the product
    Iterator<Product> iterator = productList.iterator();
    while (iterator.hasNext()) {
        Product product = iterator.next();
        if (product.getId() == productId) {
            iterator.remove();
            break;
        }
    }

    // Update the product list in the session
    session.setAttribute("productList", productList);

    // Redirect back to the cashier system page
    response.sendRedirect("cashierSystem.jsp");
%>
