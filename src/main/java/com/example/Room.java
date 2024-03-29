package com.example;

public class Room {
    //attributes of com.example.Room
    private int room_number; //the room number
    private int hotelID;  //the id of the hotel the room belongs to
    private int hotelChainID; //the id of the hotel chain the room belongs to
    private boolean problems_water; //indicates if the room has water problems
    private boolean problems_electrical; //indicates if the room has electrical problems
    private boolean problems_furniture; //indicates if the room has furniture problems
    private String problems_other; //other problems with the room
    private double price; //price of the room
    private boolean amenities_tv; //indicates if a tv is included in the room
    private boolean amenities_wifi; //indicates if Wi-fi is included in the room
    private boolean amenities_air_con; //indicates if air conditioning is included in the room
    private boolean amenities_fridge; //indicates if a fridge is included in the room
    private boolean amenities_toiletries; //indicates if toiletries are included in the room
    private boolean capacities_single; //indicates if the capacity is single (1 bed)
    private boolean capacities_double; //indicates if the capacity is double (2 beds)
    private int guest_capacity; //the guest capacity of the room
    private boolean sea_view; //indicates if the room has a sea view
    private boolean mountain_view; //indicates if the room has a mountain view
    private boolean extendable; //indicates if the room can be extended (add a bed)

    /**
     * Constructs a com.example.Room object with the specified attributes
     * @param room_number                    The room number
     * @param hotelID                       The id of the hotel the room belongs to
     * @param hotelChainID                  The id of the hotel chain the room belongs to
     * @param isProblemsWater               Indicates if the room has water problems
     * @param problems_electrical          Indicates if the room has electrical problems
     * @param problems_furniture           Indicates if the room has furniture problems
     * @param problems_other               Other problems with the room
     * @param price                         Price of the room
     * @param amenities_tv                 Indicates if a tv is included in the room
     * @param amenities_wifi               Indicates if Wi-fi is included in the room
     * @param amenities_air_con             Indicates if air conditioning is included in the room
     * @param amenities_fridge             Indicates if a fridge is included in the room
     * @param amenities_toiletries         Indicates if toiletries are included in the room
     * @param capacities_single              Indicates if the capacity is single (1 bed)
     * @param capacities_double              Indicates if the capacity is double (2 beds)
     * @param guest_capacity                 The guest capacity of the room
     * @param sea_view                     Indicates if the room has a sea view
     * @param mountain_view                Indicates if the room has a mountain view
     * @param extendable                  Indicates if the room can be extended (add a bed)
     */

    public Room(int room_number, int hotelID, int hotelChainID, boolean isProblemsWater,
                boolean problems_electrical, boolean problems_furniture, String problems_other,
                double price, boolean amenities_tv, boolean amenities_wifi, boolean amenities_air_con,
                boolean amenities_fridge, boolean amenities_toiletries, boolean capacities_single,
                boolean capacities_double, int guest_capacity, boolean sea_view, boolean mountain_view,
                boolean extendable){

        this.room_number =room_number;
        this.hotelID = hotelID;
        this.hotelChainID=hotelChainID;
        this.problems_water =isProblemsWater;
        this.problems_electrical = problems_electrical;
        this.problems_furniture = problems_furniture;
        this.problems_other = problems_other;
        this.price = price;
        this.amenities_tv = amenities_tv;
        this.amenities_wifi = amenities_wifi;
        this.amenities_air_con = amenities_air_con;
        this.amenities_fridge = amenities_fridge;
        this.amenities_toiletries = amenities_toiletries;
        this.capacities_single = capacities_single;
        this.capacities_double = capacities_double;
        this.guest_capacity = guest_capacity;
        this.sea_view = sea_view;
        this.mountain_view = mountain_view;
        this.extendable = extendable;
    }

    //getters and setters
    public int getRoomNumber() {
        return room_number;
    }

    public void setRoomNumber(int room_number) {
        this.room_number = room_number;
    }

    public int getHotelID() {
        return hotelID;
    }

    public void setHotelID(int hotelID) {
        this.hotelID = hotelID;
    }


    public int getHotelChainID() {
        return hotelChainID;
    }

    public void setHotelChainID(int hotelChainID) {
        this.hotelChainID = hotelChainID;
    }

    public boolean isProblemsWater() {
        return problems_water;
    }

    public void setProblemsWater(boolean problemsWater) {
        problems_water = problemsWater;
    }

    public boolean isProblemsElectrical() {
        return problems_electrical;
    }

    public void setProblemsElectrical(boolean problemsElectrical) {
        problems_electrical = problemsElectrical;
    }

    public boolean isProblemsFurniture() {
        return problems_furniture;
    }

    public void setProblemsFurniture(boolean problemsFurniture) {
        problems_furniture = problemsFurniture;
    }

    public String getProblemsOther() {
        return problems_other;
    }

    public void setProblemsOther(String problems_other) {
        this.problems_other = problems_other;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isAmenitiesTv() {
        return amenities_tv;
    }

    public void setAmenitiesTv(boolean amenitiesTv) {
        amenities_tv = amenitiesTv;
    }

    public boolean isAmenitiesWifi() {
        return amenities_wifi;
    }

    public void setAmenitiesWifi(boolean amenitiesWifi) {
        amenities_wifi = amenitiesWifi;
    }

    public boolean isAmenitiesAirCon() {
        return amenities_air_con;
    }

    public void setAmenitiesAirCon(boolean amenitiesAirCon) {
        amenities_air_con = amenitiesAirCon;
    }

    public boolean isAmenitiesFridge() {
        return amenities_fridge;
    }

    public void setAmenitiesFridge(boolean amenitiesFridge) {
        amenities_fridge = amenitiesFridge;
    }

    public boolean isAmenitiesToiletries() {
        return amenities_toiletries;
    }

    public void setAmenitiesToiletries(boolean amenitiesToiletries) {
        amenities_toiletries = amenitiesToiletries;
    }

    public boolean isCapacitySingle() {
        return capacities_single;
    }

    public void setCapacitySingle(boolean capacitySingle) {
        capacities_single = capacitySingle;
    }

    public boolean isCapacityDouble() {
        return capacities_double;
    }

    public void setCapacityDouble(boolean capacityDouble) {
        capacities_double = capacityDouble;
    }

    public int getGuestCapacity() {
        return guest_capacity;
    }

    public void setguest_capacity(int guest_capacity) {
        this.guest_capacity = guest_capacity;
    }

    public boolean isSeaView() {
        return sea_view;
    }

    public void setSeaView(boolean seaView) {
        sea_view = seaView;
    }

    public boolean isMountainView() {
        return mountain_view;
    }

    public void setMountainView(boolean mountainView) {
        mountain_view = mountainView;
    }

    public boolean isExtendable() {
        return extendable;
    }

    public void setExtendable(boolean extendable) {
        extendable = extendable;
    }

}