package com.example;

public class HotelChain {
    private long hotelChainID;
    private String email;
    private String street;
    private String city;
    private String province;
    private String postal_code;
    private Integer num_hotels;

    private Integer phoneNumber;

    public HotelChain(long hotelChainID, String email, String street, String city, String province,String postal_code,Integer num_hotels, Integer phoneNumber){
        this.hotelChainID = hotelChainID;
        this.email = email;
        this.street = street;
        this.city = city;
        this.province = province;
        this.postal_code = postal_code;
        this.num_hotels = num_hotels;
        this.phoneNumber = phoneNumber;
    }

    private void setHotelChainID(long hotelChainID){
        this.hotelChainID = hotelChainID;
    }

    private void setNum_hotels(Integer num_hotels){
        this.num_hotels = num_hotels;
    }

    private void setEmail(String email){
        this.email = email;
    }

    private void setStreet(String street){
        this.street = street;
    }

    private void setCity(String city){
        this.city = city;
    }

    private void setProvince(String province){
        this.province = province;
    }

    private void setPostal_code(String postal_code){
        this.postal_code = postal_code;
    }

    private void setPhoneNumber(Integer phoneNumber){ this.phoneNumber = phoneNumber; }

    public long getHotelChainID(){
        return hotelChainID;
    }

    public Integer getNum_hotels(){
        return num_hotels;
    }

    public String getEmail(){
        return email;
    }

    public String getStreet(){
        return street;
    }

    public String getCity(){
        return city;
    }

    public String getProvince(){
        return province;
    }

    public String getPostal_code(){
        return postal_code;
    }

    public Integer getPhoneNumber(){ return phoneNumber; }

}
