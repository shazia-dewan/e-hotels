public class Hotel {
    private long hotel_ID;
    private long hotelChainID;
    private Integer num_rooms;
    private String email;
    private double star_rating;
    private String street;
    private String city;
    private String province;
    private String postal_code;

    private Integer phoneNumber;

    public Hotel(long hotel_ID,long hotelChainID,Integer num_rooms,String email,double star_rating,String street,String city, String province, String postal_code,Integer phoneNumber){
        this.hotel_ID = hotel_ID;
        this.hotelChainID = hotelChainID;
        this.num_rooms = num_rooms;
        this.email = email;
        this.star_rating = star_rating;
        this.street = street;
        this.city = city;
        this.province = province;
        this.postal_code = postal_code;
        this.phoneNumber = phoneNumber;

    }

    private void setHotel_ID(long hotel_ID){
        this.hotel_ID = hotel_ID;
    }
    private void setHotelChainID(long hotelChainID){
        this.hotelChainID = hotelChainID;
    }

    private void setNum_rooms(Integer num_rooms){
        this.num_rooms = num_rooms;
    }

    private void setEmail(String email){
        this.email = email;
    }

    private void setStreet(String street){
        this.street = street;
    }
    private void setStar_rating(double star_rating){
        this.star_rating = star_rating;
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

    private void setPhoneNumber(Integer phoneNumber){ this.phoneNumber = phoneNumber;}

    public long getHotel_ID(){
        return hotel_ID;
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
        return postal_code;
    }

    public Integer getPhoneNumber(){
        return phoneNumber;
    }

}
