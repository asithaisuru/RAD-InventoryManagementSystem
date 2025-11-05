package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class User {

    private int id;
    private String firstName;
    private String lastName;
    private String password;
    private String username;
    private String role;

    // Default constructor
    public User() {
    }

    public User(String password, String username) {
        this.password = password;
        this.username = username;
    }

    public String getRole() {
        return role;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Parameterized constructor
    public User(String firstName, String lastName, String username, String password, String role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public boolean register(Connection con) {
        boolean a = false;
        try {
            String query = "INSERT INTO user(firstName, lastName, username, password, role) VALUES(?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, this.firstName);
            pstmt.setString(2, this.lastName);
            pstmt.setString(3, this.username);
            pstmt.setString(4, this.password);
            pstmt.setString(5, this.role);
            if (pstmt.executeUpdate() > 0) {
                a = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);

        }
        return a;
    }

    public int login(Connection con) {
        int id = -1;
        String sql = "SELECT * FROM user WHERE username=?";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, this.username);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String dbPsw = rs.getString("password");
                if (MD5.getMd5(this.password).equals(dbPsw)) {
                    this.id = rs.getInt("id");
                    id = this.id;
                    this.firstName = rs.getString("firstname");
                    this.lastName = rs.getString("lastname");
                    this.role = rs.getString("role");
                    this.password = rs.getString("password");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public void getAUser(Connection con) {
        String sql = "SELECT * FROM user WHERE id=?;";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, this.id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                this.firstName = rs.getString("firstname");
                this.lastName = rs.getString("lastname");
                this.role = rs.getString("role");
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
