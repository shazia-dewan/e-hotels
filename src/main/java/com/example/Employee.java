package com.example;

public class Employee {
    // Properties
    private long SSN_SIN; // Social Security Number / Social Insurance Number
    private int hotelId; // ID of the hotel where the employee works
    private int hotelChainId; // ID of the hotel chain where the hotel belongs
    private String first_name; // First name of the employee
    private String middle_name; // Middle name of the employee
    private String last_name; // Last name of the employee
    private String street; // Street address of the employee
    private String city; // City of the employee
    private String province_state; // Province or state of the employee
    private String postal_code_zip_code; // Postal code or ZIP code of the employee
    private boolean Roles_chef; // Indicates if the employee is a chef
    private boolean Roles_maintenanceTechnician; // Indicates if the employee is a maintenance technician
    private boolean Roles_receptionist; // Indicates if the employee is a receptionist
    private boolean Roles_hotelKeeper; // Indicates if the employee is a hotel keeper

    /**
     * Constructs an com.example.Employee object with the specified attributes.
     *
     * @param ssnSin                 Social Security Number / Social Insurance Number of the employee
     * @param hotelId                ID of the hotel where the employee works
     * @param hotelChainId           ID of the hotel chain where the hotel belongs
     * @param firstName              First name of the employee
     * @param middleName             Middle name of the employee
     * @param lastName               Last name of the employee
     * @param street                 Street address of the employee
     * @param city                   City of the employee
     * @param provinceState          Province or state of the employee
     * @param postalCodeZipCode      Postal code or ZIP code of the employee
     * @param Roles_chef                 Indicates if the employee is a chef
     * @param Roles_maintenanceTechnician Indicates if the employee is a maintenance technician
     * @param Roles_receptionist         Indicates if the employee is a receptionist
     * @param Roles_hotelKeeper          Indicates if the employee is a hotel keeper
     */
    public Employee(long ssnSin, int hotelId, int hotelChainId, String firstName, String middleName, String lastName,
                    String street, String city, String provinceState, String postalCodeZipCode, boolean Roles_chef,
                    boolean Roles_maintenanceTechnician, boolean Roles_receptionist, boolean Roles_hotelKeeper) {
        this.SSN_SIN = ssnSin;
        this.hotelId = hotelId;
        this.hotelChainId = hotelChainId;
        this.first_name = firstName;
        this.middle_name = middleName;
        this.last_name = lastName;
        this.street = street;
        this.city = city;
        this.province_state = provinceState;
        this.postal_code_zip_code = postalCodeZipCode;
        this.Roles_chef = Roles_chef;
        this.Roles_maintenanceTechnician = Roles_maintenanceTechnician;
        this.Roles_receptionist = Roles_receptionist;
        this.Roles_hotelKeeper = Roles_hotelKeeper;
    }

    // Getters and Setters
    public long getSsnSin() {
        return SSN_SIN;
    }

    public void setSsnSin(long ssnSin) {
        this.SSN_SIN = ssnSin;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public int getHotelChainId() {
        return hotelChainId;
    }

    public void setHotelChainId(int hotelChainId) {
        this.hotelChainId = hotelChainId;
    }

    public String getFirstName() {
        return first_name;
    }

    public void setFirstName(String firstName) {
        this.first_name = firstName;
    }

    public String getMiddleName() {
        return middle_name;
    }

    public void setMiddleName(String middleName) {
        this.middle_name = middleName;
    }

    public String getLastName() {
        return last_name;
    }

    public void setLastName(String lastName) {
        this.last_name = lastName;
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

    public void setProvinceState(String provinceState) {
        this.province_state = provinceState;
    }

    public String getPostalCodeZipCode() {
        return postal_code_zip_code;
    }

    public void setPostalCodeZipCode(String postalCodeZipCode) {
        this.postal_code_zip_code = postalCodeZipCode;
    }

    public boolean isChef() {
        return Roles_chef;
    }

    public void setChef(boolean chef) {
        Roles_chef = chef;
    }

    public boolean isMaintenanceTechnician() {
        return Roles_maintenanceTechnician;
    }

    public void setMaintenanceTechnician(boolean maintenanceTechnician) {
        Roles_maintenanceTechnician = maintenanceTechnician;
    }

    public boolean isReceptionist() {
        return Roles_receptionist;
    }

    public void setReceptionist(boolean receptionist) {
        Roles_receptionist = receptionist;
    }

    public boolean isHotelKeeper() {
        return Roles_hotelKeeper;
    }

    public void setHotelKeeper(boolean hotelKeeper) {
        Roles_hotelKeeper = hotelKeeper;
    }
}

