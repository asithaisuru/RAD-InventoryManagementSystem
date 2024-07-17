<%-- 
    Document   : cashierSystem
    Created on : Jul 17, 2024, 10:01:08 PM
    Author     : Asitha
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cashier System</title>
    </head>
    <body>
        <h1>Cashier System</h1>
        <form action="CasherSystem-process.jsp" method="POST">
            <label for="id">ID : </label>
            <input type="text" name="id" value="" id="id"/>

            <label for="quantity">Quantity : </label>
            <input type="text" name="quantity" value="" id="quantity"/>

            <input type="submit" value="Add">
        </form>

        <div>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total Price</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Product> productList = (List<Product>) session.getAttribute("productList");
                        if (productList == null) {
                            productList = new ArrayList<Product>();
                        }
                        double subTotal = 0;
                        for (Product product : productList) {
                    %>
                    <tr>
                        <td><%out.println(product.getId());%></td>
                        <td><%out.println(product.getName());%></td>
                        <td><%out.println(product.getQuantity());%></td>
                        <td><%out.println(product.getPrice());%></td>
                        <td><%out.println(product.getPrice() * product.getQuantity());%></td>
                    </tr>
                    <%
                            subTotal += product.getPrice() * product.getQuantity();
                        }
                    %>
                    <tr>
                        <td colspan="4">Sub Total</td>
                        <td><%out.println(subTotal);%></td>
                    </tr>
                </tbody>
            </table>
        </div>

                    <form action="saveBill.jsp" method="POST">
            <input type="submit" value="Print">
        </form>
    </body>
</html>
