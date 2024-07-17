<%-- 
    Document   : addProduct
    Created on : Jul 17, 2024, 4:17:19 PM
    Author     : Asitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
    </head>
    <body>
        <div>
            <h1>Add Product</h1>
        </div>
        <div>
            <form action="addProduct-Process.jsp" method="POST">
                <table>
                    <tr>
                        <td><label for="name">Name : </label></td>
                        <td><input type="text" name="name" id="name"></td>
                    </tr>
                    <tr>
                        <td><label for="price">Price : </label></td>
                        <td><input type="text" name="price" id="price"></td>
                    </tr>
                    <tr>
                        <td><label for="quantity">Quantity : </label></td>
                        <td><input type="text" name="quantity" id="quantity"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Submit"></td>
                    </tr>

                </table>
            </form>
        </div>
        
        <div>
            <%
            if(request.getParameter("add") != null){
                if(request.getParameter("add").equals("1")){
                    out.println("Product Added to Inventory.");
                }else if (request.getParameter("add").equals("0")){
                    out.println("ERROR : Unable to save to database.");
                }else if (request.getParameter("add").equals("2")){
                    String id = request.getParameter("id");
                    out.println("ERROR : Product name exists in the product id : "+id);
                }
            }
            %>
        </div>
    </body>
</html>
