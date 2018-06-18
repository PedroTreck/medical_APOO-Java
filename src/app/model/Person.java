package app.model;

import app.model.address.Address;

import java.util.Date;

public abstract class Person {
    protected short id;
    protected String firt_name;
    protected String last_name;
    protected char sex;
    protected Address address;
    protected String mail;
    protected Date date;
    protected boolean active;

    public Person(short id, String firt_name, String last_name, char sex, Address address, String mail, Date date) {
        this.id = id;
        this.firt_name = firt_name;
        this.last_name = last_name;
        this.sex = sex;
        this.address = address;
        this.mail = mail;
        this.date = date;
    }

    public Person() {
    }

    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    public String getFirt_name() {
        return firt_name;
    }

    public void setFirt_name(String firt_name) {
        this.firt_name = firt_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public char getSex() {
        return sex;
    }

    public void setSex(char sex) {
        this.sex = sex;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
