package app.model;

import app.model.address.Address;

import java.util.Date;

public class Patient extends Person {

    public Patient(short id, String firt_name, String last_name, char sex, Address address, String mail, Date date) {
        super(id, firt_name, last_name, sex, address, mail, date);
    }

    public Patient() {
    }
}
