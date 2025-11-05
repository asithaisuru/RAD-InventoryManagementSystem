<%-- 
    Document   : login
    Created on : Jul 27, 2024, 12:18:35 PM
    Author     : Asitha
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

    if (id != -1) {     
        session.setAttribute("IMS", id);
        if (user.getRole().equals("Admin")) {
            response.sendRedirect("./Admin/adminDashboard.jsp");
        } else if (user.getRole().equals("Staff")) {
            response.sendRedirect("./CashierSystem/cashierSystem.jsp");
        }
    } else {
        response.sendRedirect("./index.jsp?log=1");
    }
%>
