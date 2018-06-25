package app.controller;

import app.model.Patient;
import app.model.address.Address;
import app.model.address.City;
import app.model.address.Country;
import app.model.address.State;
import app.model.dao.EmployeeData;
import com.jfoenix.controls.*;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.control.Alert;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.BorderPane;
import javafx.stage.Modality;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.sql.Date;
import java.util.ResourceBundle;

public class RegisterPatientController implements Initializable {
    public JFXTextField lbFName;
    public JFXTextField lbEmail;
    public JFXTextField lbLName;
    public JFXButton btSubmit;
    public JFXDatePicker fxDate;
    private EmployeeData employeeData = new EmployeeData();
    @FXML
    private ComboBox<Country> cbCountry;
    private ObservableList<Country> obsCountry;
    @FXML
    private ComboBox<State> cbState;
    private ObservableList<State> obsState;
    @FXML
    private ComboBox<City> cbCity;
    private ObservableList<City> obsCity;
    @FXML
    private ComboBox<String> cbSex;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        init();
    }

    public void init(){
        ObservableList<String> data = FXCollections.observableArrayList("M", "F");
        cbSex.setItems(data);
        ArrayList<Country> allCountry = employeeData.getAllCountry();
        obsCountry = FXCollections.observableArrayList(allCountry);
        cbCountry.setItems(obsCountry);
    }

    @FXML
    public void selectCountry(){
        ArrayList<State> allState = employeeData.getAllState(cbCountry.getSelectionModel().getSelectedItem());
        obsState = FXCollections.observableArrayList(allState);
        cbState.setItems(obsState);
    }

    @FXML
    public void selectState(){
        ArrayList<City> allState = employeeData.getAllCity(cbState.getSelectionModel().getSelectedItem());
        obsCity = FXCollections.observableArrayList(allState);
        cbCity.setItems(obsCity);
    }

    public void submit(ActionEvent actionEvent) {
        employeeData.insert(new Patient(
                (short)0,
                lbFName.getText(),
                lbLName.getText(),
                cbSex.getSelectionModel().getSelectedItem().charAt(0),
                new Address(),
                lbEmail.getText(),
                Date.valueOf(fxDate.getValue()))
        );
        Alert dg = new Alert(Alert.AlertType.CONFIRMATION);
        dg.setContentText("Paciente cadastrado com sucesso");
        dg.show();
        BorderPane border_pane = (BorderPane) ((Node) actionEvent.getSource()).getScene().getRoot();
        Parent contentarea = null;
        try {
            contentarea = FXMLLoader.load(getClass().getResource("/app/view/ContentArea.fxml"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        border_pane.setCenter(contentarea);
    }
}
