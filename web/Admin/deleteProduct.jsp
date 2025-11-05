<%-- 
    Document   : deleteProduct
    Created on : Jul 29, 2024, 1:35:01 AM
    Author     : Asitha
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Classes.DBConnector"%>
<%@page import="Classes.Product"%>
<%
    Connection con = DBConnector.getConnection();

    String id = request.getParameter("id");
    Product product = new Product();
    product.setId(Integer.parseInt(id));
    if (product.deleteProduct(con)) {
        response.sendRedirect("./addProduct.jsp?delete=1");
    } else {
        response.sendRedirect("./addProduct.jsp?delete=2");
    }
%>