package app.model.address;

public class State {
    private short id;
    private String state;
    private Country country;

    public State(String state, Country country) {
        this.state = state;
        this.country = country;
    }

    public State(short id, String state, Country country) {
        this.id = id;
        this.state = state;
        this.country = country;
    }

    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    @Override
    public String toString() {
        return this.state;
    }
}
