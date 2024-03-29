package com.example;

import java.util.Date;

public class Booking {
    private long booking_ID;
    private Date bookingDate;
    private long customer_ID;
    private int room_number;
    private int hotelId;
    private int hotelChainId;


    /**
     * Constructs a Booking object with the specified attributes
     *
     * @param booking_ID             The booking id
     * @param bookingDate           The date of the booking
     * @param customer_ID            The customer_ID
     * @param room_number            The number of the room being booked
     * @param hotelId               The id of the hotel the booked room belongs to
     * @param hotelChainId          The id of the hotel chain the booked room belongs to
     */

    public Booking(long booking_ID, Date bookingDate, long customer_ID, int room_number, int hotelId, int hotelChainId){
        this.booking_ID = booking_ID;
        this.bookingDate = bookingDate;
        this.customer_ID = customer_ID;
        this.room_number = room_number;
        this.hotelId = hotelId;
        this.hotelChainId = hotelChainId;

    }

    //getters and setters

    public long getBookingId() {
        return booking_ID;
    }

    public void setbooking_ID(long booking_ID) {
        this.booking_ID = booking_ID;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public long getCustomerID() {
        return customer_ID;
    }

    public void setcustomer_ID(long customer_ID) {
        this.customer_ID = customer_ID;
    }

    public int getRoomNumber() {
        return room_number;
    }

    public void setroom_number(int room_number) {
        this.room_number = room_number;
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