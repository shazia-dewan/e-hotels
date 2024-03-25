public class Room {
    //attributes of Room
    private int roomNumber; //the room number
    private int hotelID;  //the id of the hotel the room belongs to
    private int hotelChainID; //the id of the hotel chain the room belongs to
    private boolean isProblemsWater; //indicates if the room has water problems
    private boolean isProblemsElectrical; //indicates if the room has electrical problems
    private boolean isProblemsFurniture; //indicates if the room has furniture problems
    private String problemsOther; //other problems with the room
    private double price; //price of the room
    private boolean isAmenitiesTv; //indicates if a tv is included in the room
    private boolean isAmenitiesWifi; //indicates if Wi-fi is included in the room
    private boolean isAmenitiesAirCon; //indicates if air conditioning is included in the room
    private boolean isAmenitiesFridge; //indicates if a fridge is included in the room
    private boolean isAmenitiesToiletries; //indicates if toiletries are included in the room
    private boolean isCapacitySingle; //indicates if the capacity is single (1 bed)
    private boolean isCapacityDouble; //indicates if the capacity is double (2 beds)
    private int guestCapacity; //the guest capacity of the room
    private boolean isSeaView; //indicates if the room has a sea view
    private boolean isMountainView; //indicates if the room has a mountain view
    private boolean isExtendable; //indicates if the room can be extended (add a bed)

    /**
     * Constructs a Room object with the specified attributes
     * @param roomNumber                    The room number
     * @param hotelID                       The id of the hotel the room belongs to
     * @param hotelChainID                  The id of the hotel chain the room belongs to
     * @param isProblemsWater               Indicates if the room has water problems
     * @param isProblemsElectrical          Indicates if the room has electrical problems
     * @param isProblemsFurniture           Indicates if the room has furniture problems
     * @param problemsOther               Other problems with the room
     * @param price                         Price of the room
     * @param isAmenitiesTv                 Indicates if a tv is included in the room
     * @param isAmenitiesWifi               Indicates if Wi-fi is included in the room
     * @param isAmenitiesAirCon             Indicates if air conditioning is included in the room
     * @param isAmenitiesFridge             Indicates if a fridge is included in the room
     * @param isAmenitiesToiletries         Indicates if toiletries are included in the room
     * @param isCapacitySingle              Indicates if the capacity is single (1 bed)
     * @param isCapacityDouble              Indicates if the capacity is double (2 beds)
     * @param guestCapacity                 The guest capacity of the room
     * @param isSeaView                     Indicates if the room has a sea view
     * @param isMountainView                Indicates if the room has a mountain view
     * @param isExtendable                  Indicates if the room can be extended (add a bed)
     */

    public Room(int roomNumber, int hotelID, int hotelChainID, boolean isProblemsWater,
                boolean isProblemsElectrical, boolean isProblemsFurniture, String problemsOther,
                double price, boolean isAmenitiesTv, boolean isAmenitiesWifi, boolean isAmenitiesAirCon,
                boolean isAmenitiesFridge, boolean isAmenitiesToiletries, boolean isCapacitySingle,
                boolean isCapacityDouble, int guestCapacity, boolean isSeaView, boolean isMountainView,
                boolean isExtendable){

        this.roomNumber =roomNumber;
        this.hotelID = hotelID;
        this.hotelChainID=hotelChainID;
        this.isProblemsWater =isProblemsWater;
        this.isProblemsElectrical = isProblemsElectrical;
        this.isProblemsFurniture = isProblemsFurniture;
        this.problemsOther = problemsOther;
        this.price = price;
        this.isAmenitiesTv = isAmenitiesTv;
        this.isAmenitiesWifi = isAmenitiesWifi;
        this.isAmenitiesAirCon = isAmenitiesAirCon;
        this.isAmenitiesFridge = isAmenitiesFridge;
        this.isAmenitiesToiletries = isAmenitiesToiletries;
        this.isCapacitySingle = isCapacitySingle;
        this.isCapacityDouble = isCapacityDouble;
        this.guestCapacity = guestCapacity;
        this.isSeaView = isSeaView;
        this.isMountainView = isMountainView;
        this.isExtendable = isExtendable;
    }

    //getters and setters
    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
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
        return isProblemsWater;
    }

    public void setProblemsWater(boolean problemsWater) {
        isProblemsWater = problemsWater;
    }

    public boolean isProblemsElectrical() {
        return isProblemsElectrical;
    }

    public void setProblemsElectrical(boolean problemsElectrical) {
        isProblemsElectrical = problemsElectrical;
    }

    public boolean isProblemsFurniture() {
        return isProblemsFurniture;
    }

    public void setProblemsFurniture(boolean problemsFurniture) {
        isProblemsFurniture = problemsFurniture;
    }

    public String getProblemsOther() {
        return problemsOther;
    }

    public void setProblemsOther(String problemsOther) {
        this.problemsOther = problemsOther;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isAmenitiesTv() {
        return isAmenitiesTv;
    }

    public void setAmenitiesTv(boolean amenitiesTv) {
        isAmenitiesTv = amenitiesTv;
    }

    public boolean isAmenitiesWifi() {
        return isAmenitiesWifi;
    }

    public void setAmenitiesWifi(boolean amenitiesWifi) {
        isAmenitiesWifi = amenitiesWifi;
    }

    public boolean isAmenitiesAirCon() {
        return isAmenitiesAirCon;
    }

    public void setAmenitiesAirCon(boolean amenitiesAirCon) {
        isAmenitiesAirCon = amenitiesAirCon;
    }

    public boolean isAmenitiesFridge() {
        return isAmenitiesFridge;
    }

    public void setAmenitiesFridge(boolean amenitiesFridge) {
        isAmenitiesFridge = amenitiesFridge;
    }

    public boolean isAmenitiesToiletries() {
        return isAmenitiesToiletries;
    }

    public void setAmenitiesToiletries(boolean amenitiesToiletries) {
        isAmenitiesToiletries = amenitiesToiletries;
    }

    public boolean isCapacitySingle() {
        return isCapacitySingle;
    }

    public void setCapacitySingle(boolean capacitySingle) {
        isCapacitySingle = capacitySingle;
    }

    public boolean isCapacityDouble() {
        return isCapacityDouble;
    }

    public void setCapacityDouble(boolean capacityDouble) {
        isCapacityDouble = capacityDouble;
    }

    public int getGuestCapacity() {
        return guestCapacity;
    }

    public void setGuestCapacity(int guestCapacity) {
        this.guestCapacity = guestCapacity;
    }

    public boolean isSeaView() {
        return isSeaView;
    }

    public void setSeaView(boolean seaView) {
        isSeaView = seaView;
    }

    public boolean isMountainView() {
        return isMountainView;
    }

    public void setMountainView(boolean mountainView) {
        isMountainView = mountainView;
    }

    public boolean isExtendable() {
        return isExtendable;
    }

    public void setExtendable(boolean extendable) {
        isExtendable = extendable;
    }

}