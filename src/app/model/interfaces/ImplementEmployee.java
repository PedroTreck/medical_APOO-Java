package app.model.interfaces;

import app.model.Employee;
import app.model.Patient;

import java.util.ArrayList;
import java.util.List;

public interface ImplementEmployee {
    void insert(Employee employee);

    void insert(Patient patient);

    void update(Employee employee);

    void delete(int id);

    List<Employee> getCourseByEmployee(String name);

    List<Employee> getAllEmployee();

    ArrayList<Patient> getAllPatient();

    Employee getOneEmployeee(int id);
}
