package app.model;

import java.util.Date;

public class Employee extends Person {
    private float salary;
    private String specialty;

    public Employee(String firt_name, String last_name, char sex, Address address, String mail, Date date, boolean active, float salary, String specialty) {
        super(firt_name, last_name, sex, address, mail, date, active);
        this.salary = salary;
        this.specialty = specialty;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }
}
