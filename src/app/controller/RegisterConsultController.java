package app.controller;

import app.model.Consult;
import app.model.Employee;
import app.model.Person;
import app.model.Treatment;
import app.model.dao.ConsultData;
import app.model.dao.EmployeeData;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXDatePicker;
import com.jfoenix.controls.JFXTextField;
import com.jfoenix.controls.JFXTimePicker;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.control.Alert;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.StackPane;

import java.io.IOException;
import java.net.URL;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.ResourceBundle;

public class RegisterConsultController implements Initializable {
    public JFXComboBox<Employee> cbMed;
    public JFXTextField tfDesc;
    public JFXDatePicker dpDate;
    public JFXTimePicker dbTime;
    private ObservableList<Employee> obsMed;
    private Person person;
    private Treatment treatment;
    private ConsultData dbCon = new ConsultData();
    private EmployeeData dbEmp = new EmployeeData();
    private StackPane root;

    @Override
    public void initialize(URL location, ResourceBundle resources) {

    }

    public void execute(StackPane root, Person person, Treatment treatment){
        this.root = root;
        this.person = person;
        this.treatment = treatment;
        ArrayList<Employee> allCountry = dbEmp.getAllEmployee();
        obsMed = FXCollections.observableArrayList(allCountry);
        cbMed.setItems(obsMed);
    }

    public void addCons(ActionEvent actionEvent) {
        LocalDateTime localDateTime = LocalDateTime.of(dpDate.getValue(), dbTime.getValue());
        dbCon.insert(new Consult(
                localDateTime,
                tfDesc.getText(),
                cbMed.getValue(),
                treatment
        ));
        Alert dg = new Alert(Alert.AlertType.CONFIRMATION);
        dg.setContentText("Tratamento cadastrado com sucesso");
        dg.show();
        FXMLLoader sidebar = null;
        Parent layout = null;
        try {
            sidebar = new FXMLLoader(getClass().getResource("/app/view/TreeTableView.fxml"));
            sidebar.setController(new TreeTableViewConController());
            layout = sidebar.load();
        } catch (IOException e) {
            e.printStackTrace();
        }
        TreeTableViewConController controller = sidebar.getController();
        controller.execute(person,treatment);
        root.getChildren().setAll(layout);
    }

    public void back(ActionEvent actionEvent) {
        FXMLLoader sidebar = null;
        Parent layout = null;
        try {
            sidebar = new FXMLLoader(getClass().getResource("/app/view/TreeTableView.fxml"));
            sidebar.setController(new TreeTableViewConController());
            layout = sidebar.load();
        } catch (IOException e) {
            e.printStackTrace();
        }
        TreeTableViewConController controller = sidebar.getController();
        controller.execute(person,treatment);
        root.getChildren().setAll(layout);
    }
}
