package app.model.interfaces;

import app.model.Patient;
import app.model.Treatment;

import java.util.List;

public interface ImplementTreatment {
    void insert(Treatment treatment);

    void update(Treatment treatment);

    void delete(int id);

    public List<Treatment> getTreatmentByPatient(Patient patient);

    List<Treatment> getAllTreatment();

    Treatment getOneTreatment(int id);
}
