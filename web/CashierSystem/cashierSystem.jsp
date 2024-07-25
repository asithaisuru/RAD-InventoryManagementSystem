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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    </head>
    <body class="text-center bg-dark text-white mt-5">
        <div class="container">
            <h1 class="h1 mb-4">Cashier System</h1>
            <form action="CasherSystem-process.jsp" method="POST">
                <div class="row mb-4">
                    <label for="id" class="col-lg-1">ID : </label>
                    <input type="text" name="id" value="" id="id" class="col-lg-4" required/>

                    <label for="quantity" class="col-lg-1">Quantity : </label>
                    <input type="number" name="quantity" value="" id="quantity" class="col-lg-4" required=""/>

                    <input type="submit" value="Add" class="btn btn-success col-lg-1 ms-4">
                </div>
            </form>

            <div class="text-center">
                <table class="table table-dark table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total Price</th>
                            <th></th>
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
                            <td>
                                <form action="removeProduct.jsp" method="POST" style="display:inline;">
                                    <input type="hidden" name="id" value="<%= product.getId() %>"/>
                                    <button type="submit" class="btn btn-danger"><i class="fas fa-trash"></i></button>
                                </form>
                            </td>
                        </tr>
                        <%
                                subTotal += product.getPrice() * product.getQuantity();
                            }
                        %>
                        <tr>
                            <td colspan="4">Sub Total</td>
                            <td class="bg-success"><%out.println(subTotal);%></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <form action="saveBill.jsp" method="POST">
                <input type="submit" value="Print" class="btn btn-warning col-lg-1">
            </form>
        </div>
    </body>
</html>
