
package com.example;

import java.util.Date;

public class Renting {
    private long Renting_ID;
    private Date rentingDate;
    private long customer_ID;
    private int roomNumber;
    private int hotelId; //The id of the hotel the room belongs to
    private int hotelChainId; //The id of the hotel chain the room belongs to
    private int payment; //The card number that will be charged for the room

    /**
     * Constructs a Renting object with the specified attributes
     *
     * @param Renting_ID             The renting id
     * @param rentingDate           The date of the renting
     * @param customer_ID            Customer ID
     * @param roomNumber            The number of the room being rented
     * @param hotelId               The id of the hotel the rented room belongs to
     * @param hotelChainId          The id of the hotel chain the rented room belongs to
     * @param payment               The card number that will be charged for the room
     */

    public Renting (long Renting_ID, Date rentingDate, long customer_ID, int roomNumber, int hotelId, int hotelChainId, int payment){
        this.Renting_ID = Renting_ID;
        this.rentingDate = rentingDate;
        this.customer_ID = customer_ID;
        this.roomNumber = roomNumber;
        this.hotelId = hotelId;
        this.hotelChainId = hotelChainId;
        this.payment = payment;
    }


    //getters and setters
    public long getRentingId() {
        return Renting_ID;
    }

    public void setRenting_ID(long Renting_ID) {
        this.Renting_ID = Renting_ID;
    }

    public Date getRentingDate() {
        return rentingDate;
    }

    public void setRentingDate(Date rentingDate) {
        this.rentingDate = rentingDate;
    }

    public long getCustomerID() {
        return customer_ID;
    }

    public void setcustomer_ID(long customer_ID) {
        this.customer_ID = customer_ID;
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