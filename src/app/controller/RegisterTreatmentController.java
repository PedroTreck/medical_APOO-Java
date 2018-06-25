package app.controller;

import app.model.Employee;
import app.model.Patient;
import app.model.Treatment;
import app.model.address.Address;
import app.model.dao.TreatmentData;
import com.jfoenix.controls.JFXDatePicker;
import com.jfoenix.controls.JFXTextField;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.control.Alert;
import javafx.scene.layout.BorderPane;

import java.io.IOException;
import java.net.URL;
import java.sql.Date;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.ResourceBundle;

public class RegisterTreatmentController implements Initializable {
    public JFXTextField tfDesc;
    public JFXDatePicker dpDateStart;
    public JFXDatePicker dpDateEnd;
    private TreatmentData dbTreat = new TreatmentData();
    private Patient patient;

    public void execute(Patient patient){
        this.patient = patient;
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {

    }

    public void addTreat(ActionEvent actionEvent) {
        dbTreat.insert(new Treatment(
                Date.valueOf(dpDateStart.getValue()),
                Date.valueOf(dpDateEnd.getValue()),
                tfDesc.getText(),
                patient)
        );
        Alert dg = new Alert(Alert.AlertType.CONFIRMATION);
        dg.setContentText("Tratamento cadastrado com sucesso");
        dg.show();
        BorderPane border_pane = (BorderPane) ((Node) actionEvent.getSource()).getScene().getRoot();
        FXMLLoader sidebar = null;
        Parent layout = null;
        try {
            sidebar = new FXMLLoader(getClass().getResource("/app/view/ContentArea.fxml"));
            layout = sidebar.load();
        } catch (IOException e) {
            e.printStackTrace();
        }
        ContentAreaController controller = sidebar.getController();
        controller.execute(patient);
        border_pane.setCenter(layout);
    }

    public void back(ActionEvent actionEvent) {
        BorderPane border_pane = (BorderPane) ((Node) actionEvent.getSource()).getScene().getRoot();
        FXMLLoader sidebar = null;
        Parent layout = null;
        try {
            sidebar = new FXMLLoader(getClass().getResource("/app/view/ContentArea.fxml"));
            layout = sidebar.load();
        } catch (IOException e) {
            e.printStackTrace();
        }
        ContentAreaController controller = sidebar.getController();
        controller.execute(patient);
        border_pane.setCenter(layout);
    }
}
