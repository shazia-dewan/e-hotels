package com.example;

import java.util.Date;

public class Booking {
    private long bookingId;
    private Date bookingDate;
    private long customerID;
    private int roomNumber;
    private int hotelId;
    private int hotelChainId;


    /**
     * Constructs a Booking object with the specified attributes
     *
     * @param bookingId             The booking id
     * @param bookingDate           The date of the booking
     * @param customerID            The customerID
     * @param roomNumber            The number of the room being booked
     * @param hotelId               The id of the hotel the booked room belongs to
     * @param hotelChainId          The id of the hotel chain the booked room belongs to
     */

    public Booking(long bookingId, Date bookingDate, long customerID, int roomNumber, int hotelId, int hotelChainId){
        this.bookingId = bookingId;
        this.bookingDate = bookingDate;
        this.customerID = customerID;
        this.roomNumber = roomNumber;
        this.hotelId = hotelId;
        this.hotelChainId = hotelChainId;

    }

    //getters and setters

    public long getBookingId() {
        return bookingId;
    }

    public void setBookingId(long bookingId) {
        this.bookingId = bookingId;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
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

}