package xyz.pagliares.jdbc;

import java.sql.*;

public class Main {

	public static void main(String[] args) throws SQLException {

		AuthenticationController authenticationController = new AuthenticationController();

		try {
			String response = authenticationController.authenticate("florentino@gmail.com", "ariza000");
			System.out.println(response);
 		} catch (SQLException e) {
			DatabaseUtility.processException(e);
		}
	}
}










