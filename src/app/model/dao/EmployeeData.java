package app.model.dao;

import app.config.ConfigurationsPGSQL;
import app.data.DataBaseGeneric;
import app.model.address.Address;
import app.model.Employee;
import app.model.Patient;
import app.model.Person;
import app.model.address.City;
import app.model.address.Country;
import app.model.address.State;
import app.model.interfaces.ImplementEmployee;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class EmployeeData extends DataBaseGeneric implements ImplementEmployee {

    public ArrayList<Employee> listEmployee;
    public ArrayList<Patient> listPatient;

    public EmployeeData() {
        super(new ConfigurationsPGSQL());
    }

    @Override
    public void insert(Employee employee) {
        Map<Object, Object> mapObj = insertPerson("employee", employee.getFirt_name(), employee.getLast_name(), employee.getSex(), employee.getDate(), employee.getAddress());
        this.setTable("employee");
        mapObj.put("salary", employee.getSalary());
        mapObj.put("specialty", employee.getSpecialty());
        this.genericInsert(mapObj);
    }


    @Override
    public void insert(Patient patient) {
        Map<Object, Object> mapObj = insertPerson("patient", patient.getFirt_name(), patient.getLast_name(), patient.getSex(), patient.getDate(), patient.getAddress());
        this.genericInsert(mapObj);
    }

    private Map<Object, Object> insertPerson(String table, String firt_name, String last_name, char sex, Date date, Address address) {
        Map<Object, Object> mapObj = new HashMap<>();
        this.setTable(table);
        mapObj.put("first_name", firt_name);
        mapObj.put("last_name_name", last_name);
        mapObj.put("sex", sex);
        mapObj.put("mail", date);
        mapObj.put("create_date", Calendar.getInstance().getTime());
        mapObj.put("active", true);
        mapObj.put("address_id", insertAdress(address));
        return mapObj;
    }

    public int insertAdress(Address address) {
        Map<Object, Object> mapObj = new HashMap<>();
        this.setTable("adress");
        mapObj.put("adress1", address.getAddress1());
        mapObj.put("adress2", address.getAddress2());
        mapObj.put("district", address.getDistrict());
        mapObj.put("city_id", address.getCity_id());
        mapObj.put("phone", address.getPhone());
        mapObj.put("postal_code", address.getCity_id());
        ResultSet rs = this.genericInsertReturn(mapObj, "address_id");
        try {
            rs.next();
            return rs.getInt("address_id");
        } catch (SQLException e) {
            System.out.println("Erro ao retornar um endere~ço pelo nome: " + e.getMessage());
        }
        return 5610;
    }

    @Override
    public void update(Employee employee) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public List<Employee> getCourseByEmployee(String name) {
        return null;
    }

    @Override
    public List<Employee> getAllEmployee() {
        listEmployee = new ArrayList<Employee>();
        this.setTable("employee");
        ResultSet rs = this.getAll();
        try {
            while (rs.next()) {
                Employee employee = (Employee) getPerson(new Employee(), rs);
                employee.setSalary(rs.getFloat("salary"));
                employee.setSpecialty(rs.getString("specialty"));
                employee.setId(rs.getShort("employee_id"));
                listEmployee.add(employee);
            }
            return listEmployee;
        } catch (SQLException ex) {
            System.out.println("Erro ao retornar um funcionario pelo nome: " + ex.getMessage());
        }
        return null;
    }

    @Override
    public ArrayList<Patient> getAllPatient() {
        listPatient = new ArrayList<Patient>();
        this.setTable("patient");
        ResultSet rs = this.getAll();
        try {
            while (rs.next()) {
                Patient patient = (Patient) getPerson(new Patient(), rs);
                patient.setId(rs.getShort("patient_id"));
                listPatient.add(patient);
            }
            return listPatient;
        } catch (SQLException ex) {
            System.out.println("Erro ao retornar um paciente pelo nome: " + ex.getMessage());
        }
        return null;
    }

    public Person getPerson(Person person, ResultSet rs) {
        try {
            person.setFirt_name(rs.getString("first_name"));
            person.setLast_name(rs.getString("last_name"));
            person.setSex(rs.getString("sex").charAt(0));
            person.setMail(rs.getString("mail"));
            person.setDate(rs.getDate("date"));
            person.setActive(rs.getBoolean("active"));
            person.setAddress(getAddress(rs.getShort("address_id")));
            return person;
        } catch (SQLException e) {
            System.out.println("Erro ao retornar uma pessoa pelo id: " + e.getMessage());
        }
        return null;
    }

    public Address getAddress(int id) {
        this.setTable("address");
        ResultSet rs = this.getOne(id);
        Address address = new Address();
        try {
            rs.next();
            address.setAddress1(rs.getString("address1"));
            address.setAddress2(rs.getString("address2"));
            address.setDistrict(rs.getString("district"));
            address.setNumber(rs.getShort("number"));
            address.setPostal_code(rs.getString("postal_code"));
            address.setPhone(rs.getString("phone"));
            address.setCity(getCity(rs.getShort("city_id")));
            return address;
        } catch (SQLException ex) {
            System.out.println("Erro ao retornar um endereço pelo id: " + ex.getMessage());
        }
        return null;
    }

    public City getCity(int id){
        this.setTable("city");
        ResultSet rs = this.getOne(id);
        try {
            rs.next();
            return new City(rs.getString("city"), getState(rs.getShort("state_id")));
        } catch (SQLException ex) {
            System.out.println("Erro ao retornar uma cidade pelo id: " + ex.getMessage());
        }
        return null;
    }

    public State getState(int id){
        this.setTable("state");
        ResultSet rs = this.getOne(id);
        try {
            rs.next();
            return new State(rs.getString("state"), getCountry(rs.getShort("country_id")));
        } catch (SQLException ex) {
            System.out.println("Erro ao retornar um estado pelo id: " + ex.getMessage());
        }
        return null;
    }

    public Country getCountry(int id){
        this.setTable("country");
        ResultSet rs = this.getOne(id);
        try {
            rs.next();
            return new Country(rs.getString("country"));
        } catch (SQLException ex) {
            System.out.println("Erro ao retornar um pais pelo id: " + ex.getMessage());
        }
        return null;
    }

    @Override
    public Employee getOneEmployeee(int id) {
        this.setTable("employeee");
        ResultSet rs = this.getOne(id);
        Employee employee = new Employee();
        try {
            employee = (Employee) getPerson(new Employee(), rs);
            employee.setSalary(rs.getFloat("salary"));
            employee.setSpecialty(rs.getString("specialty"));
            employee.setId(rs.getShort("employee_id"));
            return employee;
        } catch (SQLException ex) {
            System.out.println("Erro ao retornar um curso pelo id: " + ex.getMessage());
        }
        return null;
    }
}
