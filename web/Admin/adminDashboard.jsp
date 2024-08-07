<%-- 
    Document   : adminDashboard
    Created on : Aug 3, 2024, 9:25:43 PM
    Author     : Asitha
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Classes.DBConnector"%>
<%@page import="Classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
    </head>
    <body>
        <%
            Connection con = DBConnector.getConnection();
            int id = Integer.parseInt(String.valueOf(session.getAttribute("TaskTrackerID")));
            User user = new User();
            user.setId(id);
            user.getAUser(con);
            if (!user.getRole().equals("Admin")) {
                response.sendRedirect("../index.jsp");
            } else {
        %>
        <%@include file="adminNav.jsp" %>
        <%
            }
        %>
        
        
    </body>
</html>
