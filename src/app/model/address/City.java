package app.model.address;

public class City {
    private short id;
    private String city;
    private State state;

    public City(String city, State state) {
        this.city = city;
        this.state = state;
    }

    public City(short id, String city, State state) {
        this.id = id;
        this.city = city;
        this.state = state;
    }

    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return this.city;
    }
}
