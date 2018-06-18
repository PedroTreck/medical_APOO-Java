package app.model.dao;

import app.config.ConfigurationsPGSQL;
import app.data.DataBaseGeneric;
import app.model.Consult;
import app.model.interfaces.ImplementConsult;

import java.util.ArrayList;
import java.util.List;

public class ConsultData extends DataBaseGeneric implements ImplementConsult {

    public ArrayList<Consult> list;

    public ConsultData() {
        super(new ConfigurationsPGSQL());
    }

    @Override
    public void insert(Consult consult) {

    }

    @Override
    public void update(Consult consult) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public List<Consult> getCourseByConsult(String name) {
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
