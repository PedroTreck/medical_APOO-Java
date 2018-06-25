package app.model.interfaces;

import app.model.Consult;
import app.model.Treatment;

import java.util.List;

public interface ImplementConsult {
    void insert(Consult consult);

    void update(Consult consult);

    void delete(int id);

    List<Consult> getCourseByConsult(Treatment treatment);

    List<Consult> getAllConsult();

    Consult getOneConsult(int id);
}
