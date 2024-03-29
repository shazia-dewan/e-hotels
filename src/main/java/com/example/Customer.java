package com.example;

public class Customer {
    private long customer_ID;
    private String street;
    private String city;
    private String province_state;
    private String  postal_code_zip_code;
    private String first_name;
    private String middle_name;
    private String last_name;
    private String dateofRegistration;

    /**
     * Constructs a new com.example.Customer object with the specified attributes.
     *
     * @param customer_ID         The unique identifier for the customer.
     * @param street             The street address of the customer.
     * @param city               The city of the customer.
     * @param province_state      The province or state of the customer.
     * @param  postal_code_zip_code  The postal code or zip code of the customer.
     * @param first_name          The first name of the customer.
     * @param middle_name         The middle name of the customer.
     * @param last_name           The last name of the customer.
     * @param dateOfRegistration The date of registration of the customer.
     */
    public Customer(long customer_ID, String street, String city, String province_state, String  postal_code_zip_code, String first_name, String middle_name, String last_name, String dateOfRegistration) {
        this.customer_ID = customer_ID;
        this.street = street;
        this.city = city;
        this.province_state = province_state;
        this. postal_code_zip_code =  postal_code_zip_code;
        this.first_name = first_name;
        this.middle_name = middle_name;
        this.last_name = last_name;
        this.dateofRegistration = dateOfRegistration;
    }

    // Getters and setters
    public long getCustomerId() {
        return customer_ID;
    }

    public void setCustomerID(long customer_ID) {
        this.customer_ID = customer_ID;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getProvinceState() {
        return province_state;
    }

    public void setProvinceState(String province_state) {
        this.province_state = province_state;
    }

    public String getPostalCodeZipCode() {
        return  postal_code_zip_code;
    }

    public void setPostalCodeZipCode(String  postal_code_zip_code) {
        this. postal_code_zip_code =  postal_code_zip_code;
    }

    public String getFirstName() {
        return first_name;
    }

    public void setFirstName(String first_name) {
        this.first_name = first_name;
    }

    public String getMiddleName() {
        return middle_name;
    }

    public void setMiddleName(String middle_name) {
        this.middle_name = middle_name;
    }

    public String getLastName() {
        return last_name;
    }

    public void setLastName(String last_name) {
        this.last_name = last_name;
    }

    public String getDateOfRegistration() {
        return dateofRegistration;
    }

    public void setDateOfRegistration(String dateOfRegistration) {
        this.dateofRegistration = dateOfRegistration;
    }
}

