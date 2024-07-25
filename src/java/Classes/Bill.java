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
public class Bill {

    private int id;
    private double totalAmount;
    private java.sql.Date billDate;

    // Constructor
    public Bill(int id, double totalAmount, java.sql.Date billDate) {
        this.id = id;
        this.totalAmount = totalAmount;
        this.billDate = billDate;
    }

    // Default constructor
    public Bill() {
    }

    // Getter and Setter methods
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public java.sql.Date getBillDate() {
        return billDate;
    }

    public void setBillDate(java.sql.Date billDate) {
        this.billDate = billDate;
    }

    // Method to save a bill to the database
    public static int saveBill(List<Product> productList, Connection con) throws SQLException {
        int billId = -1;
        double totalAmount = 0.0;
        PreparedStatement psInsertBill = null;
        PreparedStatement psInsertBillItem = null;
        ResultSet rs = null;

        try {

            // Calculate total amount
            for (Product product : productList) {
                totalAmount += product.getPrice() * product.getQuantity();
            }

            // Insert into bills table
            String insertBillSQL = "INSERT INTO bills (bill_date, total_amount) VALUES (NOW(), ?)";
            psInsertBill = con.prepareStatement(insertBillSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            psInsertBill.setDouble(1, totalAmount);
            psInsertBill.executeUpdate();

            // Get generated bill ID
            rs = psInsertBill.getGeneratedKeys();
            if (rs.next()) {
                billId = rs.getInt(1);
            }

            // Insert into bill_items table
            if (billId != -1) {
                String insertBillItemSQL = "INSERT INTO bill_items (bill_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
                psInsertBillItem = con.prepareStatement(insertBillItemSQL);

                for (Product product : productList) {
                    psInsertBillItem.setInt(1, billId);
                    psInsertBillItem.setInt(2, product.getId());
                    psInsertBillItem.setInt(3, product.getQuantity());
                    psInsertBillItem.setDouble(4, product.getPrice());
                    psInsertBillItem.addBatch();
                }

                psInsertBillItem.executeBatch();
            }

            con.commit();
        } catch (SQLException e) {
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (psInsertBill != null) {
                try {
                    psInsertBill.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (psInsertBillItem != null) {
                try {
                    psInsertBillItem.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return billId;
    }

    // Method to view all bills from the database
    public static List<Bill> getAllBills(Connection con) throws SQLException {
        List<Bill> bills = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT * FROM bills";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("bill_id");
                double totalAmount = rs.getDouble("total_amount");
                java.sql.Date billDate = rs.getDate("bill_date");

                Bill bill = new Bill(id, totalAmount, billDate);
                bills.add(bill);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bills;
    }

    public ResultSet getABill(Connection con) {
        ResultSet rs = null;
        String sql = "SELECT * FROM bill_items WHERE bill_id = ?";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, String.valueOf(this.id));
            rs = pstmt.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Bill.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }
    
    public String getProductName(Connection con, String id){
        String productName = null;
        String sql = "SELECT name FROM product WHERE id = ?";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, String.valueOf(id));
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                productName = rs.getString("name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bill.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return productName;
    }
}
