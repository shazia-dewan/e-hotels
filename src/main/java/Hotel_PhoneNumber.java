public class Hotel_PhoneNumber {
    private long hotel_ID;
    private long hotelChainID;
    private Integer phoneNumber;

    public Hotel_PhoneNumber(long hotelID,long hotelChainID, Integer phoneNumber){
        this.hotel_ID = hotelID;
        this.hotelChainID = hotelChainID;
        this.phoneNumber = phoneNumber;
    }

    private void setHotel_ID(long hotel_ID){
        this.hotel_ID = hotel_ID;
    }
    private void setHotelChainID(long hotelChainID){
        this.hotelChainID = hotelChainID;
    }

    private void setPhoneNumber(Integer phoneNumber){
        this.phoneNumber = phoneNumber;
    }

    public long getHotel_ID(){
        return hotel_ID;
    }
    public long getHotelChainID(){
        return hotelChainID;
    }

    public Integer getPhoneNumber(){
        return phoneNumber;
    }


}
