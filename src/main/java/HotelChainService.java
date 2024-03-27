import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HotelChainService {
    public List<HotelChain> getHotelChain() throws Exception {
        String sql = "SELECT * FROM HotelChain";
        ConnectionDB db = new ConnectionDB();
        List<HotelChain> hotelChains = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                HotelChain hotelChain = new HotelChain(

                        rs.getLong("hotelChainID"),
                        rs.getString("email"),
                        rs.getString("street"),
                        rs.getString("city"),
                        rs.getString("province"),
                        rs.getString("postal_code"),
                        rs.getInt("num_hotels"),
                        rs.getInt("phoneNumber")

                );
                hotelChains.add(hotelChain);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return hotelChains;

        } catch (Exception e) {
            throw new Exception("Error while retrieving hotelChains: " + e.getMessage());
        }
    }

    public boolean insertHotelChain(HotelChain hotelChain) throws Exception {
        String sql = "INSERT INTO HotelChain (hotelChainID,email,street,city,province,postal_code,num_hotels,phoneNumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setLong(1, hotelChain.getHotelChainID());
            stmt.setString(2, hotelChain.getEmail());
            stmt.setString(3, hotelChain.getStreet());
            stmt.setString(4, hotelChain.getCity());
            stmt.setString(5, hotelChain.getProvince());
            stmt.setString(6, hotelChain.getPostal_code());
            stmt.setInt(7, hotelChain.getNum_hotels());
            stmt.setInt(8, hotelChain.getPhoneNumber());
            int rowsAffected = stmt.executeUpdate();
            stmt.close();
            con.close();
            db.close();
            return rowsAffected > 0;
        } catch (Exception e) {
            throw new Exception("Error while inserting hotelChain: " + e.getMessage());
        }
    }

    public boolean updateHotelChain(HotelChain hotelChain) throws Exception {
        String sql = "UPDATE HotelChain hotelChainID=?,email=?,street=?,city=?,province=?,postal_code=?,num_hotels=?,phoneNumber=?";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setLong(1, hotelChain.getHotelChainID());
            stmt.setString(2, hotelChain.getEmail());
            stmt.setString(3, hotelChain.getStreet());
            stmt.setString(4, hotelChain.getCity());
            stmt.setString(5, hotelChain.getProvince());
            stmt.setString(6, hotelChain.getPostal_code());
            stmt.setInt(7, hotelChain.getNum_hotels());
            stmt.setInt(8,hotelChain.getPhoneNumber());
            int rowsAffected = stmt.executeUpdate();
            stmt.close();
            con.close();
            db.close();
            return rowsAffected > 0;
        } catch (Exception e) {
            throw new Exception("Error while updating hotelChain: " + e.getMessage());
        }
    }

    public boolean deleteHotelChain(long hotelId) throws Exception {
        String sql = "DELETE FROM HotelChain WHERE hotelChain_ID=?";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setLong(1, hotelId);
            int rowsAffected = stmt.executeUpdate();
            stmt.close();
            con.close();
            db.close();
            return rowsAffected > 0;
        }catch(Exception e){
            throw new Exception("Error while deleting hotelChain: " + e.getMessage());
        }
    }
}
