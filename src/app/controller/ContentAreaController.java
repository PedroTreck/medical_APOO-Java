package app.controller;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import app.model.Person;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;

public class ContentAreaController implements Initializable {

    public Label lbName;
    public HBox contentPane;
    public VBox vNode;
    @FXML
    private VBox content_area;
    @FXML
    private HBox menubar;

    /**
     * Initializes the controller class.
     */
    boolean flag = false;
    private Person person;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }

    public void execute(Person person){
        this.person = person;
        lbName.setText(person.getFirt_name() + " " + person.getLast_name());
        content_area.getChildren().remove(contentPane);
        FXMLLoader sidebar = null;
        Parent layout = null;
        try {
            sidebar = new FXMLLoader(getClass().getResource("/app/view/TreeTableView.fxml"));
            sidebar.setController(new TreeTableViewTreatController());
            layout = sidebar.load();
        } catch (IOException e) {
            e.printStackTrace();
        }
        TreeTableViewTreatController t = sidebar.getController();
        t.execute(person);
        content_area.getChildren().add(layout);
    }
    
    @FXML
    private void open_sidebar(ActionEvent event) throws IOException {
        BorderPane border_pane = (BorderPane) ((Node) event.getSource()).getScene().getRoot();
        if (flag == true) {
            Parent sidebar = FXMLLoader.load(getClass().getResource("/app/view/Sidebar.fxml"));
            border_pane.setLeft(sidebar);
            flag = false;
        } else {
            border_pane.setLeft(null);
            flag = true;
        }
        
    }

    @FXML
    private void exit(ActionEvent event){
        System.exit(0);
    }
    
}
