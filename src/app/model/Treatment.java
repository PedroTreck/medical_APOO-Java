package app.model;

import com.jfoenix.controls.datamodels.treetable.RecursiveTreeObject;

import java.sql.Date;

public class Treatment extends RecursiveTreeObject<Treatment>{
    private int id;
    private Date date_start;
    private Date date_end;
    private String description;
    private Patient patient;

    public Treatment() {
    }

    public Treatment(Date date_start, Date date_end, String description, Patient patient) {
        this.date_start = date_start;
        this.date_end = date_end;
        this.description = description;
        this.patient = patient;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate_start() {
        return date_start;
    }

    public void setDate_start(Date date_start) {
        this.date_start = date_start;
    }

    public Date getDate_end() {
        return date_end;
    }

    public void setDate_end(Date date_end) {
        this.date_end = date_end;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }
}
