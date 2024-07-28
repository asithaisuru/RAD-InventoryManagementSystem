/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Asitha
 */
public class Product {

    private int id;
    private String name;
    private int quantity;
    private double price;

    public Product() {
    }

    public Product(String name, int quantity, double price) {
        this.name = name;
        this.quantity = quantity;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Product> getAllProducts(Connection con) {
        List<Product> allProducts = new ArrayList();

        String sql = "SELECT * FROM product";

        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                Product product = new Product(name, quantity, price);
                product.setId(id);
                allProducts.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }

        return allProducts;
    }

    public void getAProduct(Connection con) {
        String sql = "SELECT * FROM product WHERE id = ?";

        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                this.name = rs.getString("name");
                this.price = rs.getDouble("price");
                this.quantity = rs.getInt("quantity");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean saveToDB(Connection con) {
        boolean a = false;
        String sql = "INSERT INTO product(name, quantity, price) VALUES (?,?,?);";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, this.name);
            pstmt.setInt(2, this.quantity);
            pstmt.setDouble(3, this.price);
            if (pstmt.executeUpdate() > 0) {
                a = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public int checkNameIfExist(Connection con) {
        int id = -1;
        String sql = "SELECT id, name FROM product WHERE name = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, this.name);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                id = rs.getInt("id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    
    public void updateQuantity(Connection con, int quantity) throws SQLException {
        String sql = "UPDATE products SET quantity = quantity - ? WHERE id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, quantity);
        ps.setInt(2, this.id);
        ps.executeUpdate();
        ps.close();
    }

}
