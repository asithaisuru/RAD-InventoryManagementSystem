<%-- 
    Document   : login-Process
    Created on : Jul 26, 2024, 10:31:07 PM
    Author     : malithi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="Classes.DBConnector"%>
<%@page import="Classes.User"%>

<%
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String role = "customer";

    User user = new User(firstname, lastname, username, password, role);
    if (user.register(DBConnector.getConnection())) {
        response.sendRedirect("sign_up.jsp?s=1");
    } else {
        response.sendRedirect("sign_up.jsp?s=0");
    }
%>
