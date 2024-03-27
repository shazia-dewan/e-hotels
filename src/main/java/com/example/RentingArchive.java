package com.example;

import java.util.Date;

public class RentingArchive {
    private long rentingId;
    private Date rentingDate;
    private String customerFirstName;
    private String customerMiddleName;
    private String customerLastName;
    private int roomNumber;
    private int hotelId;
    private int hotelChainId;

    // Constructors, getters, and setters

    public RentingArchive(long rentingId, Date rentingDate, String customerFirstName, String customerMiddleName, String customerLastName, int roomNumber, int hotelId, int hotelChainId) {
        this.rentingId = rentingId;
        this.rentingDate = rentingDate;
        this.customerFirstName = customerFirstName;
        this.customerMiddleName = customerMiddleName;
        this.customerLastName = customerLastName;
        this.roomNumber = roomNumber;
        this.hotelId = hotelId;
        this.hotelChainId = hotelChainId;
    }

    // Getters and setters

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
}

