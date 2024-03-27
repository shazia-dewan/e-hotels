package com.example;

public class Employee {
    // Properties
    private long ssnSin; // Social Security Number / Social Insurance Number
    private int hotelId; // ID of the hotel where the employee works
    private int hotelChainId; // ID of the hotel chain where the hotel belongs
    private String firstName; // First name of the employee
    private String middleName; // Middle name of the employee
    private String lastName; // Last name of the employee
    private String street; // Street address of the employee
    private String city; // City of the employee
    private String provinceState; // Province or state of the employee
    private String postalCodeZipCode; // Postal code or ZIP code of the employee
    private boolean isChef; // Indicates if the employee is a chef
    private boolean isMaintenanceTechnician; // Indicates if the employee is a maintenance technician
    private boolean isReceptionist; // Indicates if the employee is a receptionist
    private boolean isHotelKeeper; // Indicates if the employee is a hotel keeper

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
     * @param isChef                 Indicates if the employee is a chef
     * @param isMaintenanceTechnician Indicates if the employee is a maintenance technician
     * @param isReceptionist         Indicates if the employee is a receptionist
     * @param isHotelKeeper          Indicates if the employee is a hotel keeper
     */
    public Employee(long ssnSin, int hotelId, int hotelChainId, String firstName, String middleName, String lastName,
                    String street, String city, String provinceState, String postalCodeZipCode, boolean isChef,
                    boolean isMaintenanceTechnician, boolean isReceptionist, boolean isHotelKeeper) {
        this.ssnSin = ssnSin;
        this.hotelId = hotelId;
        this.hotelChainId = hotelChainId;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.street = street;
        this.city = city;
        this.provinceState = provinceState;
        this.postalCodeZipCode = postalCodeZipCode;
        this.isChef = isChef;
        this.isMaintenanceTechnician = isMaintenanceTechnician;
        this.isReceptionist = isReceptionist;
        this.isHotelKeeper = isHotelKeeper;
    }

    // Getters and Setters
    public long getSsnSin() {
        return ssnSin;
    }

    public void setSsnSin(long ssnSin) {
        this.ssnSin = ssnSin;
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
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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
        return provinceState;
    }

    public void setProvinceState(String provinceState) {
        this.provinceState = provinceState;
    }

    public String getPostalCodeZipCode() {
        return postalCodeZipCode;
    }

    public void setPostalCodeZipCode(String postalCodeZipCode) {
        this.postalCodeZipCode = postalCodeZipCode;
    }

    public boolean isChef() {
        return isChef;
    }

    public void setChef(boolean chef) {
        isChef = chef;
    }

    public boolean isMaintenanceTechnician() {
        return isMaintenanceTechnician;
    }

    public void setMaintenanceTechnician(boolean maintenanceTechnician) {
        isMaintenanceTechnician = maintenanceTechnician;
    }

    public boolean isReceptionist() {
        return isReceptionist;
    }

    public void setReceptionist(boolean receptionist) {
        isReceptionist = receptionist;
    }

    public boolean isHotelKeeper() {
        return isHotelKeeper;
    }

    public void setHotelKeeper(boolean hotelKeeper) {
        isHotelKeeper = hotelKeeper;
    }
}

