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

//    out.println(id);
//    out.println(name);
//    out.println(price);
//    out.println(quantity);
    Product product = new Product(name, Integer.parseInt(quantity), Double.parseDouble(price));
    product.setId(Integer.parseInt(id));
//    out.println(product.getId());
//    out.println(product.getName());
//    out.println(product.getPrice());
//    out.println(product.getQuantity());
    if (product.editProduct(con)) {
//        out.print("OK");
        response.sendRedirect("./editProduct.jsp?edit=1");
    } else {
//        out.print("error");
        response.sendRedirect("./editProduct.jsp?edit=2");
    }
%>