package app.model.address;

public class Address {
    private String address1;
    private String address2;
    private String district;
    private short number;
    private short city_id;
    private City city;
    private String postal_code;
    private String phone;

    public Address(String address1, String address2, String district, short number, short city_id, City city, String postal_code, String phone) {
        this.address1 = address1;
        this.address2 = address2;
        this.district = district;
        this.number = number;
        this.city_id = city_id;
        this.city = city;
        this.postal_code = postal_code;
        this.phone = phone;
    }

    public Address() {
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public short getNumber() {
        return number;
    }

    public void setNumber(short number) {
        this.number = number;
    }

    public short getCity_id() {
        return city_id;
    }

    public void setCity_id(short city_id) {
        this.city_id = city_id;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public String getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(String postal_code) {
        this.postal_code = postal_code;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
