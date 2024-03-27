package com.example;

public class HotelChain_PhoneNumber {

    private long hotelChainID;
    private Integer phoneNumber;

    public HotelChain_PhoneNumber(long hotelChainID, Integer phoneNumber){

        this.hotelChainID = hotelChainID;
        this.phoneNumber = phoneNumber;
    }

    private void setHotelChainID(long hotelChainID){
        this.hotelChainID = hotelChainID;
    }

    private void setPhoneNumber(Integer phoneNumber){
        this.phoneNumber = phoneNumber;
    }

    public long getHotelChainID(){
        return hotelChainID;
    }

    public Integer getPhoneNumber(){
        return phoneNumber;
    }
}
