
package com.example;

import java.util.Date;

public class Renting {
    private long rentingId;
    private Date rentingDate;
    private long customerID;
    private int roomNumber;
    private int hotelId; //The id of the hotel the room belongs to
    private int hotelChainId; //The id of the hotel chain the room belongs to
    private int payment; //The method of payment

    /**
     * Constructs a Renting object with the specified attributes
     *
     * @param rentingId             The renting id
     * @param rentingDate           The date of the renting
     * @param customerID            Customer ID
     * @param roomNumber            The number of the room being rented
     * @param hotelId               The id of the hotel the rented room belongs to
     * @param hotelChainId          The id of the hotel chain the rented room belongs to
     * @param payment               The method of payment for the room
     */

    public Renting (long rentingId, Date rentingDate, long customerID, int roomNumber, int hotelId, int hotelChainId, int payment){
        this.rentingId = rentingId;
        this.rentingDate = rentingDate;
        this.customerID = customerID;
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

    public long getCustomerID() {
        return customerID;
    }

    public void setCustomerID(long customerID) {
        this.customerID = customerID;
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

    public int getPayment() {
        return payment;
    }

    public void setPayment(int payment) {
        this.payment = payment;
    }
}