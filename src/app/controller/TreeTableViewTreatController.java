package app.controller;

import app.model.Patient;
import app.model.Person;
import app.model.Treatment;
import app.model.dao.EmployeeData;
import app.model.dao.TreatmentData;
import com.jfoenix.controls.*;
import com.jfoenix.controls.datamodels.treetable.RecursiveTreeObject;
import javafx.beans.binding.Bindings;
import javafx.beans.property.IntegerProperty;
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
import javafx.scene.Parent;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;

import java.io.IOException;
import java.net.URL;
import java.text.DateFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ResourceBundle;
import java.util.function.Function;

public class TreeTableViewTreatController implements Initializable {
    private static final String PREFIX = "( ";
    private static final String POSTFIX = " )";

    // readonly table view
    @FXML
    StackPane root;
    @FXML
    private JFXTreeTableView<Treatment> treeTableView;
    @FXML
    private JFXTreeTableColumn<Treatment, String> firstNameColumn;
    @FXML
    private JFXTreeTableColumn<Treatment, String> lastNameColumn;
    @FXML
    private JFXTreeTableColumn<Treatment, String> ageColumn;
    @FXML
    private JFXTreeTableColumn<Treatment, String> sexColumn;
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
    private TreatmentData tdb = new TreatmentData();
    @FXML
    private VBox vNode;

    public void execute(Person person){
        this.person = person;
        setupReadOnlyTableView();
        ContextMenu addMenu = new ContextMenu();
        MenuItem addMenuItem = new MenuItem("Abrir");
        addMenu.getItems().add(addMenuItem);
        addMenuItem.setOnAction((EventHandler<ActionEvent>) t -> {
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
            controller.execute(person, treeTableView.getSelectionModel().getSelectedItem().getValue());
            root.getChildren().setAll(layout);

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
                sidebar = new FXMLLoader(getClass().getResource("/app/view/RegisterTreatment.fxml"));
                layout = sidebar.load();
            } catch (IOException e) {
                e.printStackTrace();
            }
            RegisterTreatmentController controller = sidebar.getController();
            controller.execute((Patient) person);
            root.getChildren().setAll(layout);
        });
        vNode.getChildren().add(bAddTreat);
    }

    private <T> void setupCellValueFactory(JFXTreeTableColumn<Treatment, T> column, Function<Treatment, ObservableValue<T>> mapper) {
        column.setCellValueFactory((TreeTableColumn.CellDataFeatures<Treatment, T> param) -> {
            if (column.validateValue(param)) {
                return mapper.apply(param.getValue().getValue());
            } else {
                return column.getComputedValue(param);
            }
        });
    }

    private void setupReadOnlyTableView() {
        setupCellValueFactory(firstNameColumn, (Treatment t) -> new SimpleStringProperty(new SimpleDateFormat("dd-MM-yyyy").format(t.getDate_start())));
        setupCellValueFactory(lastNameColumn, (Treatment t) -> new SimpleStringProperty(new SimpleDateFormat("dd-MM-yyyy").format(t.getDate_end())));
        setupCellValueFactory(ageColumn, (Treatment t) -> new SimpleStringProperty( t.getDescription()));

        ageColumn.setText("Descrição");
        firstNameColumn.setText("Inicio");
        lastNameColumn.setText("Final");
        sexColumn.setText("");

        title.setText("Tratamemtos");

        ObservableList<Treatment> dummyData = generateDummyData(100);

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

    private ChangeListener<String> setupSearchField(final JFXTreeTableView<Treatment> tableView) {
        return (o, oldVal, newVal) ->
                tableView.setPredicate(personProp -> {
                    final Treatment treatment = personProp.getValue();
                    return treatment.getDate_start().toString().contains(newVal)
                            || treatment.getDate_end().toString().contains(newVal);
                });
    }

    private ObservableList<Treatment> generateDummyData(final int numberOfEntries) {
        final ObservableList<Treatment> dummyData = FXCollections.observableArrayList();
        dummyData.addAll(tdb.getTreatmentByPatient((Patient) person));
        return dummyData;
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {

    }
}
