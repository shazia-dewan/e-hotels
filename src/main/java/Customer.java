public class Customer {
    private long customerId;
    private String street;
    private String city;
    private String provinceState;
    private String postalCodeZipCode;
    private String firstName;
    private String middleName;
    private String lastName;
    private String dateOfRegistration;

    /**
     * Constructs a new Customer object with the specified attributes.
     *
     * @param customerId         The unique identifier for the customer.
     * @param street             The street address of the customer.
     * @param city               The city of the customer.
     * @param provinceState      The province or state of the customer.
     * @param postalCodeZipCode  The postal code or zip code of the customer.
     * @param firstName          The first name of the customer.
     * @param middleName         The middle name of the customer.
     * @param lastName           The last name of the customer.
     * @param dateOfRegistration The date of registration of the customer.
     */
    public Customer(long customerId, String street, String city, String provinceState, String postalCodeZipCode, String firstName, String middleName, String lastName, String dateOfRegistration) {
        this.customerId = customerId;
        this.street = street;
        this.city = city;
        this.provinceState = provinceState;
        this.postalCodeZipCode = postalCodeZipCode;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.dateOfRegistration = dateOfRegistration;
    }

    // Getters and setters
    public long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(long customerId) {
        this.customerId = customerId;
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

    public String getDateOfRegistration() {
        return dateOfRegistration;
    }

    public void setDateOfRegistration(String dateOfRegistration) {
        this.dateOfRegistration = dateOfRegistration;
    }
}

