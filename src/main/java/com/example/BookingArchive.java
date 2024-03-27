package com.example;

import java.util.Date;

public class BookingArchive {
    private long bookingId;
    private Date bookingDate;
    private String customerFirstName;
    private String customerMiddleName;
    private String customerLastName;
    private int roomNumber;
    private int hotelId;
    private int hotelChainId;

    public BookingArchive(long bookingId, Date bookingDate, String customerFirstName, String customerMiddleName, String customerLastName, int roomNumber, int hotelId, int hotelChainId) {
        this.bookingId = bookingId;
        this.bookingDate = bookingDate;
        this.customerFirstName = customerFirstName;
        this.customerMiddleName = customerMiddleName;
        this.customerLastName = customerLastName;
        this.roomNumber = roomNumber;
        this.hotelId = hotelId;
        this.hotelChainId = hotelChainId;
    }

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
}

