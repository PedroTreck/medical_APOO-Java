package app.model;

import java.util.Date;

public class Patient extends Person {

    public Patient(String firt_name, String last_name, char sex, Address address, String mail, Date date, boolean active) {
        super(firt_name, last_name, sex, address, mail, date, active);
    }
}
