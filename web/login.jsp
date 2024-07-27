<%-- 
    Document   : login
    Created on : Jul 27, 2024, 12:18:35 PM
    Author     : malithi
--%>

<%@page import="Classes.User"%>
<%@page import="Classes.DBConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = DBConnector.getConnection();

    String uname = request.getParameter("username");
    String psw = request.getParameter("password");

    User user = new User(psw, uname);
    int id = user.login(con);
    out.print(id);

    if (id != -1) {
        out.print(id);
        session.setAttribute("TaskTrackerID", id);
        if (request.getParameter("remember") != null) {
            Cookie ck = new Cookie("TaskTracker", String.valueOf(id));
            ck.setMaxAge(30*24*60*60);
        }
        if (user.getRole().equals("Admin")) {
            response.sendRedirect("AdminDashboard.jsp");
        } else if (user.getRole().equals("Staff")) {
            response.sendRedirect("./CashierSystem/cashierSystem.jsp");
        }
    }
%>
