<%-- 
    Document   : editProduct-Process
    Created on : Jul 29, 2024, 12:50:01 AM
    Author     : Asitha
--%>

<%@page import="Classes.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="Classes.Product"%>
<%
    Connection con = DBConnector.getConnection();

    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String price = request.getParameter("price");
    String quantity = request.getParameter("quantity");
    Product product = new Product(name, Integer.parseInt(quantity), Double.parseDouble(price));
    product.setId(Integer.parseInt(id));
    if (product.editProduct(con)) {
        response.sendRedirect("./editProduct.jsp?edit=1");
    } else {
        response.sendRedirect("./editProduct.jsp?edit=2");
    }
%>