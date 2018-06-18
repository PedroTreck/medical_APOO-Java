package app.model.dao;

import app.config.ConfigurationsPGSQL;
import app.data.DataBaseGeneric;
import app.model.Patient;
import app.model.Treatment;
import app.model.interfaces.ImplementTreatment;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class TreatmentData extends DataBaseGeneric implements ImplementTreatment {

    public ArrayList<Treatment> list;

    public TreatmentData() {
        super(new ConfigurationsPGSQL());
    }

    @Override
    public void insert(Treatment treatment) {
        Map<Object, Object> mapObj = new HashMap<>();
        this.setTable("treatment");
        mapObj.put("date_start", treatment.getDate_start());
        mapObj.put("date_end", treatment.getDate_end());
        mapObj.put("description", treatment.getDescription());
        mapObj.put("patient_id", treatment.getPatient().getId());
        this.genericInsert(mapObj);
    }

    @Override
    public void update(Treatment treatment) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public List<Treatment> getTreatmentByPatient(Patient patient) {
        this.list = new ArrayList<>();
        try {
            this.setTable("treatment");
            ResultSet rs = this.getOne(patient.getId(),"patient_id");
            while (rs.next()) {
                Treatment treatment = new Treatment();
                treatment.setDate_end(rs.getDate("date_end"));
                treatment.setDate_start(rs.getDate("date_start"));
                treatment.setDescription(rs.getString("description"));
                list.add(treatment);
            }
            return list;
        } catch (SQLException ex){
            System.out.println("Houve um erro ao obter um curso: " + ex.getMessage());
        }
        return null;
    }

    @Override
    public List<Treatment> getAllTreatment() {
        return null;
    }

    @Override
    public Treatment getOneTreatment(int id) {
        return null;
    }
}
