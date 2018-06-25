package app.model;

import com.jfoenix.controls.datamodels.treetable.RecursiveTreeObject;

import java.time.LocalDate;
import java.sql.Date;
import java.time.LocalDateTime;

public class Consult extends RecursiveTreeObject<Consult> {
    private int id;
    private LocalDateTime date;
    private String history;
    private String report;
    private Employee employee;
    private Treatment treatment;
    private boolean confirm;

    public Consult() {
    }

    public Consult(LocalDateTime date, String history, Employee employee, Treatment treatment) {
        this.date = date;
        this.history = history;
        this.employee = employee;
        this.treatment = treatment;
    }

    public boolean isConfirm() {
        return confirm;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String isConfirmText(){
        return isConfirm()?"Sim":"Não";
    }

    public void setConfirm(boolean confirm) {
        this.confirm = confirm;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public String getHistory() {
        return history;
    }

    public void setHistory(String history) {
        this.history = history;
    }

    public String getReport() {
        return report;
    }

    public void setReport(String report) {
        this.report = report;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Treatment getTreatment() {
        return treatment;
    }

    public void setTreatment(Treatment treatment) {
        this.treatment = treatment;
    }
}
