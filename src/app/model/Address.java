package app.model;

public class Address {
    private String address1;
    private String address2;
    private String district;
    private short mumber;
    private String city;
    private String state;
    private String country;
    private String postal_code;
    private String phone;

    public Address(String address1, String address2, String district, short mumber, String city, String state, String country, String postal_code, String phone) {
        this.address1 = address1;
        this.address2 = address2;
        this.district = district;
        this.mumber = mumber;
        this.city = city;
        this.state = state;
        this.country = country;
        this.postal_code = postal_code;
        this.phone = phone;
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

    public short getMumber() {
        return mumber;
    }

    public void setMumber(short mumber) {
        this.mumber = mumber;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
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
