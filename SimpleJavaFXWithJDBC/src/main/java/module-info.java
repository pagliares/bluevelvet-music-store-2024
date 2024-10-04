module xyz.bluevelvet.simplejavafxwithjdbc {
    requires javafx.controls;
    requires javafx.fxml;

    requires org.controlsfx.controls;
    requires com.dlsc.formsfx;
    requires net.synedra.validatorfx;
    requires org.kordamp.ikonli.javafx;
    requires java.sql;


    opens xyz.bluevelvet.simplejavafxwithjdbc to javafx.fxml;
    exports xyz.bluevelvet.simplejavafxwithjdbc;
}