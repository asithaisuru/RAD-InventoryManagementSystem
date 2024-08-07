<%-- 
    Document   : logout
    Created on : Aug 7, 2024, 10:03:47 PM
    Author     : Asitha
--%>

<%
    session.invalidate();
    response.sendRedirect("../index.jsp");
%>