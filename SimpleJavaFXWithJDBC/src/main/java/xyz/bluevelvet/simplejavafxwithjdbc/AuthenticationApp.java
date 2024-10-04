package xyz.bluevelvet.simplejavafxwithjdbc;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import jdbc.AuthenticationController;

public class AuthenticationApp extends Application {

    private AuthenticationController authenticationController; // Reference to your backend controller

    @Override
    public void start(Stage primaryStage) {
        // Create UI elements
        Label usernameLabel = new Label("Username:");
        TextField usernameField = new TextField();
        Label passwordLabel = new Label("Password:");
        PasswordField passwordField = new PasswordField();
        Button loginButton = new Button("Login");
        Label messageLabel = new Label(); // To display authentication messages

        // Set up layout
        VBox layout = new VBox(10);
        layout.setPadding(new Insets(20));
        layout.getChildren().addAll(usernameLabel, usernameField, passwordLabel, passwordField, loginButton, messageLabel);

        // Set up scene
        Scene scene = new Scene(layout, 300, 200);
        primaryStage.setScene(scene);
        primaryStage.setTitle("Authentication");

        // Set up authentication logic
        authenticationController = new AuthenticationController(); // Initialize your backend controller
        loginButton.setOnAction(event -> {
            String username = usernameField.getText();
            String password = passwordField.getText();

            try {
                String authenticationResult = authenticationController.authenticate(username, password);
                if (authenticationResult.equals("Successfully authenticated")) {
                    messageLabel.setText("Authentication successful!");
                } else {
                    messageLabel.setText("Authentication failed.");
                }
            } catch (Exception e) {
                messageLabel.setText("Error: " + e.getMessage());
            }
        });

        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
