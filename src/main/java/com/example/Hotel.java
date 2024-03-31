package com.example;

public class Hotel {
    private long hotelID;
    private long hotelChainID;
    private Integer num_rooms;
    private String email;
    private double star_rating;
    private String street;
    private String city;
    private String province;
    private String PostalCode;

    private String phoneNumber;

    public Hotel(long hotel_ID,long hotelChainID,Integer num_rooms,String email,double star_rating,String street,String city, String province, String postal_code,String phoneNumber){
        this.hotelID = hotel_ID;
        this.hotelChainID = hotelChainID;
        this.num_rooms = num_rooms;
        this.email = email;
        this.star_rating = star_rating;
        this.street = street;
        this.city = city;
        this.province = province;
        this.PostalCode = postal_code;
        this.phoneNumber = phoneNumber;

    }

    public void setHotel_ID(long hotel_ID){
        this.hotelID = hotel_ID;
    }
    public void setHotelChainID(long hotelChainID){
        this.hotelChainID = hotelChainID;
    }

    public void setNum_rooms(Integer num_rooms){
        this.num_rooms = num_rooms;
    }

    public void setEmail(String email){
        this.email = email;
    }

    public void setStreet(String street){
        this.street = street;
    }
    public void setStar_rating(double star_rating){
        this.star_rating = star_rating;
    }

    public void setCity(String city){
        this.city = city;
    }

    public void setProvince(String province){
        this.province = province;
    }

    public void setPostal_code(String postal_code){
        this.PostalCode = postal_code;
    }

    public void setPhoneNumber(String phoneNumber){ this.phoneNumber = phoneNumber;}

    public long getHotel_ID(){
        return hotelID;
    }
    public long getHotelChainID(){
        return hotelChainID;
    }

    public Integer getNum_rooms(){
        return num_rooms;
    }

    public String getEmail(){
        return email;
    }

    public String getStreet(){
        return street;
    }
    public double getStar_rating(){
        return star_rating;
    }

    public String getCity(){
        return city;
    }

    public String getProvince(){
        return province;
    }

    public String getPostal_code(){
        return PostalCode;
    }

    public String getPhoneNumber(){
        return phoneNumber;
    }

}
