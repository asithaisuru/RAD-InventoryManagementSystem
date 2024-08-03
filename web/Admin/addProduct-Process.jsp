<%-- 
    Document   : addProduct-Process
    Created on : Jul 17, 2024, 4:26:14 PM
    Author     : Asitha
--%>

<%@page import="Classes.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = DBConnector.getConnection();
    String name = request.getParameter("name");
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    double price = Double.parseDouble(request.getParameter("price"));

    Product product = new Product(name, quantity, price);
    int productID = product.checkNameIfExist(con);
    out.println(productID);
    if (productID != -1) {
        response.sendRedirect("./addProduct.jsp?add=2&id=" + productID);
    } else {
        if (product.saveToDB(con)) {
            response.sendRedirect("./addProduct.jsp?add=1");
//                out.println("Product Added to Inventory");
        } else {
            response.sendRedirect("./addProduct.jsp?add=0");
//                out.println("ERROR");
        }
    }


%>