import java.util.Date;

public class Renting {
    private long rentingId;
    private Date rentingDate;
    private String customerFirstName;
    private String customerMiddleName;
    private String customerLastName;
    private int roomNumber;
    private int hotelId; //The id of the hotel the room belongs to
    private int hotelChainId; //The id of the hotel chain the room belongs to
    private String payment; //The method of payment

    /**
     * Constructs a Renting object with the specified attributes
     *
     * @param rentingId             The renting id
     * @param rentingDate           The date of the renting
     * @param customerFirstName     The customer's first name
     * @param customerMiddleName    The customer's middle name
     * @param customerLastName      The customer's last name
     * @param roomNumber            The number of the room being rented
     * @param hotelId               The id of the hotel the rented room belongs to
     * @param hotelChainId          The id of the hotel chain the rented room belongs to
     * @param payment               The method of payment for the room
     */

    public Renting (long rentingId, Date rentingDate, String customerFirstName, String customerMiddleName,
                    String customerLastName, int roomNumber, int hotelId, int hotelChainId, String payment){
        this.rentingId = rentingId;
        this.rentingDate = rentingDate;
        this.customerFirstName = customerFirstName;
        this.customerMiddleName = customerMiddleName;
        this. customerLastName = customerLastName;
        this.roomNumber = roomNumber;
        this.hotelId = hotelId;
        this.hotelChainId = hotelChainId;
        this.payment = payment;
    }

    //getters and setters
    public long getRentingId() {
        return rentingId;
    }

    public void setRentingId(long rentingId) {
        this.rentingId = rentingId;
    }

    public Date getRentingDate() {
        return rentingDate;
    }

    public void setRentingDate(Date rentingDate) {
        this.rentingDate = rentingDate;
    }

    public String getCustomerFirstName() {
        return customerFirstName;
    }

    public void setCustomerFirstName(String customerFirstName) {
        this.customerFirstName = customerFirstName;
    }

    public String getCustomerMiddleName() {
        return customerMiddleName;
    }

    public void setCustomerMiddleName(String customerMiddleName) {
        this.customerMiddleName = customerMiddleName;
    }

    public String getCustomerLastName() {
        return customerLastName;
    }

    public void setCustomerLastName(String customerLastName) {
        this.customerLastName = customerLastName;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
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

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }
}