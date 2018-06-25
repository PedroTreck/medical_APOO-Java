package app.model;

import app.model.address.Address;

import java.sql.Date;

public class Employee extends Person {
    private float salary;
    private String specialty;

    public Employee(short id, String firt_name, String last_name, char sex, Address address, String mail, Date date, float salary, String specialty) {
        super(id, firt_name, last_name, sex, address, mail, date);
        this.salary = salary;
        this.specialty = specialty;
    }

    public Employee() {
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

    @Override
    public String toString() {
        return firt_name + " " + last_name;
    }
}
