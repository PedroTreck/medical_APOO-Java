package app.main;

import app.model.Employee;
import app.model.Patient;
import app.model.Treatment;
import app.model.dao.EmployeeData;
import app.model.dao.TreatmentData;

import java.util.List;

public class App {
    public App() {
        EmployeeData employeeData = new EmployeeData();
        List<Employee> employees = employeeData.getAllEmployee();
        EmployeeData patientData = new EmployeeData();
        List<Patient> patient = employeeData.getAllPatient();
        TreatmentData treatmentData = new TreatmentData();
        List<Treatment> treatments = treatmentData.getTreatmentByPatient(patient.get(0));
        System.out.println();
    }

    public static void main(String[] args) {
        new App();
    }
}
