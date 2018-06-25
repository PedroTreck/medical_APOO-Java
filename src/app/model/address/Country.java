package app.model.address;

public class Country {
    private short id;
    private String country;

    public Country(String country) {
        this.country = country;
    }

    public Country(short id, String country) {
        this.id = id;
        this.country = country;
    }

    @Override
    public String toString() {
        return this.country;
    }

    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
