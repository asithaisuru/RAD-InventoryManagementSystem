<%-- 
    Document   : sign_up_process
    Created on : Jul 27, 2024, 11:23:41 AM
    Author     : Asitha
--%>

<%@page import="Classes.MD5"%>
<%@page import="Classes.DBConnector"%>
<%@page import="Classes.User"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = DBConnector.getConnection();

    String fname = request.getParameter("firstname");
    String lname = request.getParameter("lastname");
    String role = "Staff";
    String uname = request.getParameter("UserName");
    String psw = MD5.getMd5(request.getParameter("password"));

    User user = new User(fname, lname, uname, psw, role);
    if (user.register(con)) {
        response.sendRedirect("./sign_up.jsp?reg=1");
    } else {
        response.sendRedirect("./sign_up.jsp?reg=2");
    }
%>