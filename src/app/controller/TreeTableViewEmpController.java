package app.controller;

import app.model.Person;
import app.model.dao.EmployeeData;
import com.jfoenix.controls.*;
import com.jfoenix.controls.datamodels.treetable.RecursiveTreeObject;
import javafx.beans.binding.Bindings;
import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ContextMenu;
import javafx.scene.control.Label;
import javafx.scene.control.MenuItem;
import javafx.scene.control.TreeTableColumn;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import java.util.function.Function;

public class TreeTableViewEmpController implements Initializable {

    private static final String PREFIX = "( ";
    private static final String POSTFIX = " )";
    private final EmployeeData employeeData = new EmployeeData();


    // readonly table view
    @FXML
    StackPane root;
    @FXML
    private JFXTreeTableView<Person> treeTableView;
    @FXML
    private JFXTreeTableColumn<Person, String> firstNameColumn;
    @FXML
    private JFXTreeTableColumn<Person, String> lastNameColumn;
    @FXML
    private JFXTreeTableColumn<Person, String> ageColumn;
    @FXML
    private JFXTreeTableColumn<Person, String> sexColumn;
    @FXML
    private JFXTextField searchField;

    // editable table view
    @FXML
    private JFXTreeTableView<Person> editableTreeTableView;
    @FXML
    private JFXTreeTableColumn<Person, String> firstNameEditableColumn;
    @FXML
    private JFXTreeTableColumn<Person, String> lastNameEditableColumn;
    @FXML
    private JFXTreeTableColumn<Person, Integer> ageEditableColumn;
    @FXML
    private Label treeTableViewCount;
    @FXML
    private JFXButton treeTableViewAdd;
    @FXML
    private JFXButton treeTableViewRemove;
    @FXML
    private Label editableTreeTableViewCount;
    @FXML
    private JFXTextField searchField2;
    @FXML
    private Label title;

    public void execute(){
        setupReadOnlyTableView();
        ContextMenu addMenu = new ContextMenu();
        MenuItem addMenuItem = new MenuItem("Abrir");
        addMenu.getItems().add(addMenuItem);
        addMenuItem.setOnAction((EventHandler<javafx.event.ActionEvent>) t -> {
            FXMLLoader sidebar = null;
            Parent layout = null;
            try {
                sidebar = new FXMLLoader(getClass().getResource("/app/view/ContentArea.fxml"));
                layout = sidebar.load();
            } catch (IOException e) {
                e.printStackTrace();
            }
            ContentAreaController controller = sidebar.getController();
            controller.execute(treeTableView.getSelectionModel().getSelectedItem().getValue());
            root.getChildren().setAll(layout);

        });
        treeTableView.setContextMenu(addMenu);


    }

    private <T> void setupCellValueFactory(JFXTreeTableColumn<Person, T> column, Function<Person, ObservableValue<T>> mapper) {
        column.setCellValueFactory((TreeTableColumn.CellDataFeatures<Person, T> param) -> {
            if (column.validateValue(param)) {
                return mapper.apply(param.getValue().getValue());
            } else {
                return column.getComputedValue(param);
            }
        });
    }

    private void setupReadOnlyTableView() {
        setupCellValueFactory(firstNameColumn, (Person person) -> new SimpleStringProperty( person.getFirt_name()));
        setupCellValueFactory(lastNameColumn, (Person person) -> new SimpleStringProperty(person.getLast_name()));
        setupCellValueFactory(ageColumn, (Person person) -> new SimpleStringProperty(String.valueOf(person.getAge())));
        setupCellValueFactory(sexColumn, (Person person) -> new SimpleStringProperty(String.valueOf(person.getSex())));
        title.setText("Pacientes");

        ObservableList<Person> dummyData = generateDummyData(100);

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
            /*dummyData.add(createNewRandomPerson());
            final IntegerProperty currCountProp = treeTableView.currentItemsCountProperty();
            currCountProp.set(currCountProp.get() + 1);*/
        });
        treeTableViewRemove.setOnMouseClicked((e) -> {
            dummyData.remove(treeTableView.getSelectionModel().selectedItemProperty().get().getValue());
            final IntegerProperty currCountProp = treeTableView.currentItemsCountProperty();
            currCountProp.set(currCountProp.get() - 1);
        });
        searchField.textProperty().addListener(setupSearchField(treeTableView));
    }

    /*private void setupEditableTableView() {
        setupCellValueFactory(firstNameEditableColumn, Person::firstNameProperty);
        setupCellValueFactory(lastNameEditableColumn, Person::lastNameProperty);
        setupCellValueFactory(ageEditableColumn, p -> p.age.asObject());

        // add editors
        firstNameEditableColumn.setCellFactory((TreeTableColumn<Person, String> param) -> {
            return new GenericEditableTreeTableCell<>(
                    new TextFieldEditorBuilder());
        });
        firstNameEditableColumn.setOnEditCommit((CellEditEvent<Person, String> t) -> {
            t.getTreeTableView()
                    .getTreeItem(t.getTreeTablePosition()
                            .getRow())
                    .getValue().firstName.set(t.getNewValue());
        });
        lastNameEditableColumn.setCellFactory((TreeTableColumn<Person, String> param) -> {
            return new GenericEditableTreeTableCell<>(
                    new TextFieldEditorBuilder());
        });
        lastNameEditableColumn.setOnEditCommit((CellEditEvent<Person, String> t) -> {
            t.getTreeTableView()
                    .getTreeItem(t.getTreeTablePosition()
                            .getRow())
                    .getValue().lastName.set(t.getNewValue());
        });
        ageEditableColumn.setCellFactory((TreeTableColumn<Person, Integer> param) -> {
            return new GenericEditableTreeTableCell<>(
                    new IntegerTextFieldEditorBuilder());
        });
        ageEditableColumn.setOnEditCommit((CellEditEvent<Person, Integer> t) -> {
            t.getTreeTableView()
                    .getTreeItem(t.getTreeTablePosition()
                            .getRow())
                    .getValue().age.set(t.getNewValue());
        });

        final ObservableList<Person> dummyData = generateDummyData(200);
        editableTreeTableView.setRoot(new RecursiveTreeItem<>(dummyData, RecursiveTreeObject::getChildren));
        editableTreeTableView.setShowRoot(false);
        editableTreeTableView.setEditable(true);
        editableTreeTableViewCount.textProperty()
                .bind(Bindings.createStringBinding(() -> PREFIX + editableTreeTableView.getCurrentItemsCount() + POSTFIX,
                        editableTreeTableView.currentItemsCountProperty()));
        searchField2.textProperty()
                .addListener(setupSearchField(editableTreeTableView));
    }*/

    private ChangeListener<String> setupSearchField(final JFXTreeTableView<Person> tableView) {
        return (o, oldVal, newVal) ->
                tableView.setPredicate(personProp -> {
                    final Person person = personProp.getValue();
                    return person.getFirt_name().contains(newVal)
                            || person.getLast_name().contains(newVal);
                });
    }

    private ObservableList<Person> generateDummyData(final int numberOfEntries) {
        final ObservableList<Person> dummyData = FXCollections.observableArrayList();
        dummyData.addAll(employeeData.getAllPatient());
        return dummyData;
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {

    }

}