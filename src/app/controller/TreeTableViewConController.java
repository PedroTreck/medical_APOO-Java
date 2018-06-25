package app.controller;

import app.model.Consult;
import app.model.Patient;
import app.model.Person;
import app.model.Treatment;
import app.model.dao.ConsultData;
import app.model.dao.TreatmentData;
import com.jfoenix.controls.*;
import com.jfoenix.controls.datamodels.treetable.RecursiveTreeObject;
import javafx.beans.binding.Bindings;
import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleBooleanProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.control.*;
import javafx.scene.control.cell.CheckBoxTreeCell;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;

import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ResourceBundle;
import java.util.function.Function;

public class TreeTableViewConController implements Initializable {
    private static final String PREFIX = "( ";
    private static final String POSTFIX = " )";

    // readonly table view
    @FXML
    StackPane root;
    @FXML
    private JFXTreeTableView<Consult> treeTableView;
    @FXML
    private JFXTreeTableColumn<Consult, LocalDateTime> firstNameColumn;
    @FXML
    private JFXTreeTableColumn<Consult, String> lastNameColumn;
    @FXML
    private JFXTreeTableColumn<Consult, String> ageColumn;
    @FXML
    private JFXTreeTableColumn<Consult, String> sexColumn;
    @FXML
    private JFXTextField searchField;

    @FXML
    private Label title;
    @FXML
    private Label treeTableViewCount;
    @FXML
    private JFXButton treeTableViewAdd;
    @FXML
    private JFXButton treeTableViewRemove;
    private Person person;
    private ConsultData dbCon = new ConsultData();
    @FXML
    private VBox vNode;
    private Treatment treatment;

    public void execute(Person person, Treatment treatment){
        this.person = person;
        this.treatment = treatment;
        setupReadOnlyTableView();
        ContextMenu addMenu = new ContextMenu();
        MenuItem addMenuItem = new MenuItem("Confirmar");
        addMenu.getItems().add(addMenuItem);
        addMenuItem.setOnAction((EventHandler<ActionEvent>) t -> {
            dbCon.update(treeTableView.getSelectionModel().getSelectedItem().getValue());
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
            root.getChildren().add(layout);
        });
        treeTableView.setContextMenu(addMenu);
        JFXButton bAddTreat = new JFXButton("Adicionar");
        bAddTreat.setButtonType(JFXButton.ButtonType.RAISED);
        bAddTreat.setStyle("-fx-background-color: #48A5EA;-fx-text-fill: white;");
        bAddTreat.setPrefSize(100, 40);
        bAddTreat.setOnAction(event -> {
            FXMLLoader sidebar = null;
            Parent layout = null;
            try {
                sidebar = new FXMLLoader(getClass().getResource("/app/view/RegisterConsult.fxml"));
                layout = sidebar.load();
            } catch (IOException e) {
                e.printStackTrace();
            }
            RegisterConsultController controller = sidebar.getController();
            controller.execute(root, person, treatment);
            root.getChildren().setAll(layout);
        });
        vNode.getChildren().add(bAddTreat);
        JFXButton bBack = new JFXButton("Voltar");
        bBack.setButtonType(JFXButton.ButtonType.RAISED);
        bBack.setStyle("-fx-background-color: #48A5EA;-fx-text-fill: white;");
        bBack.setPrefSize(100, 40);
        bBack.setOnAction(event -> {
            BorderPane border_pane = (BorderPane) ((Node) event.getSource()).getScene().getRoot();
            FXMLLoader sidebar = null;
            Parent layout = null;
            try {
                sidebar = new FXMLLoader(getClass().getResource("/app/view/ContentArea.fxml"));
                layout = sidebar.load();
            } catch (IOException e) {
                e.printStackTrace();
            }
            ContentAreaController controller = sidebar.getController();
            controller.execute((Patient) person);
            border_pane.setCenter(layout);
        });
        vNode.getChildren().add(bBack);
    }

    private <T> void setupCellValueFactory(JFXTreeTableColumn<Consult, T> column, Function<Consult, ObservableValue<T>> mapper) {
        column.setCellValueFactory((TreeTableColumn.CellDataFeatures<Consult, T> param) -> {
            if (column.validateValue(param)) {
                return mapper.apply(param.getValue().getValue());
            } else {
                return column.getComputedValue(param);
            }
        });
    }

    private void setupReadOnlyTableView() {
        setupCellValueFactory(firstNameColumn, (Consult c) -> {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
            String formatDateTime = c.getDate().format(formatter);
            return new SimpleObjectProperty(formatDateTime);
        });
        setupCellValueFactory(lastNameColumn, (Consult c) -> new SimpleStringProperty(c.getEmployee().getFirt_name() + " " + c.getEmployee().getLast_name()));
        setupCellValueFactory(ageColumn, (Consult c) -> new SimpleStringProperty(c.getHistory()));
        setupCellValueFactory(sexColumn, (Consult c) -> new SimpleStringProperty(c.isConfirmText()));

        firstNameColumn.setText("Data/Horário");
        lastNameColumn.setText("Médico");
        ageColumn.setText("Descrição");
        sexColumn.setText("Realizado");

        title.setText("Consultas");

        ObservableList<Consult> dummyData = generateDummyData(100);

        treeTableView.setRoot(new RecursiveTreeItem<>(dummyData, RecursiveTreeObject::getChildren));

        treeTableView.setShowRoot(false);
        treeTableViewCount.textProperty()
                .bind(Bindings.createStringBinding(() -> PREFIX + treeTableView.getCurrentItemsCount() + POSTFIX,
                        treeTableView.currentItemsCountProperty()));
        treeTableViewAdd.disableProperty()
                .bind(Bindings.notEqual(-1, treeTableView.getSelectionModel().selectedIndexProperty()));
        treeTableViewRemove.disableProperty()
                .bind(Bindings.equal(-1, treeTableView.getSelectionModel().selectedIndexProperty()));
        treeTableViewAdd.setOnMouseClicked((e) -> {

        });
        treeTableViewRemove.setOnMouseClicked((e) -> {
            dummyData.remove(treeTableView.getSelectionModel().selectedItemProperty().get().getValue());
            final IntegerProperty currCountProp = treeTableView.currentItemsCountProperty();
            currCountProp.set(currCountProp.get() - 1);
        });
        searchField.textProperty().addListener(setupSearchField(treeTableView));
    }

    private ChangeListener<String> setupSearchField(final JFXTreeTableView<Consult> tableView) {
        return (o, oldVal, newVal) ->
                tableView.setPredicate(personProp -> {
                    final Consult treatment = personProp.getValue();
                    return treatment.getDate().toString().contains(newVal);
                });
    }

    private ObservableList<Consult> generateDummyData(final int numberOfEntries) {
        final ObservableList<Consult> dummyData = FXCollections.observableArrayList();
        dummyData.addAll(dbCon.getCourseByConsult(treatment));
        return dummyData;
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {

    }

}
