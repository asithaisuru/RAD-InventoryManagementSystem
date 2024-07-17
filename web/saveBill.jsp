<%-- 
    Document   : saveBill
    Created on : Jul 17, 2024, 10:45:53 PM
    Author     : Asitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
session.invalidate();
response.sendRedirect("./cashierSystem.jsp");
%>