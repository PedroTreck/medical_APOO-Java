package app.model.dao;

import app.config.ConfigurationsPGSQL;
import app.data.DataBaseGeneric;
import app.model.Consult;
import app.model.Treatment;
import app.model.interfaces.ImplementConsult;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ConsultData extends DataBaseGeneric implements ImplementConsult {

    public ArrayList<Consult> list;
    private EmployeeData dbEmp = new EmployeeData();

    public ConsultData() {
        super(new ConfigurationsPGSQL());
    }

    @Override
    public void insert(Consult consult) {
        Map<Object, Object> mapObj = new HashMap<>();
        this.setTable("consult");
        mapObj.put("history", consult.getHistory());
        mapObj.put("date", consult.getDate());
        mapObj.put("employee_id", consult.getEmployee().getId());
        mapObj.put("treatment_id", consult.getTreatment().getId());
        this.genericInsert(mapObj);
    }

    @Override
    public void update(Consult consult) {
        Map<Object, Object> mapObj = new HashMap<>();
        Map<Object, Object> mapConditions = new HashMap<>();
        mapObj.put("confirm", !consult.isConfirm());
        mapConditions.put("consult_id", consult.getId());
        this.genericUpdate(mapObj, mapConditions);
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public List<Consult> getCourseByConsult(Treatment treatment) {
        this.list = new ArrayList<>();
        try {
            this.setTable("consult");
            ResultSet rs = this.getOne(treatment.getId(),"treatment_id");
            while (rs.next()) {
                Consult consult = new Consult();
                consult.setId(rs.getInt("consult_id"));
                consult.setDate(rs.getTimestamp("date").toLocalDateTime());
                consult.setHistory(rs.getString("history"));
                consult.setConfirm(rs.getBoolean("confirm"));
                consult.setEmployee(dbEmp.getOneEmployeee(rs.getShort("employee_id")));
                list.add(consult);
            }
            return list;
        } catch (SQLException ex){
            System.out.println("Houve um erro ao obter uma consulta: " + ex.getMessage());
        }
        return null;
    }

    @Override
    public List<Consult> getAllConsult() {
        return null;
    }

    @Override
    public Consult getOneConsult(int id) {
        return null;
    }
}
