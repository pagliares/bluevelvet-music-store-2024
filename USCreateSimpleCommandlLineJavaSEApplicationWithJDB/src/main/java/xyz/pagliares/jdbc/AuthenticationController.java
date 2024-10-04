package xyz.pagliares.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AuthenticationController {
    private static Connection conn = ConnectionManager.getInstance().getConnection();

    public String authenticate(String userEmail, String password) throws SQLException {
        String sql = "SELECT USER_ID, EMAIL, PASSWORD FROM USER";

        try (
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
        ) {


            while (rs.next()) {
                Integer userId = rs.getInt("USER_ID");
                String email =rs.getString("EMAIL");
                String passwordTemp = rs.getString("PASSWORD");

                if (email.equals(userEmail) && password.equals(passwordTemp))
                    return "Successfully authenticated";
             }
           return "Authentication failure";
        }
    }
}
