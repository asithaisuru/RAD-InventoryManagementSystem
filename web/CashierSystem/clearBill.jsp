<%-- 
    Document   : clearBill
    Created on : Jul 28, 2024, 11:06:33 PM
    Author     : Asitha
--%>

<%
    session.removeAttribute("productList");
    response.sendRedirect("./cashierSystem.jsp");
%>