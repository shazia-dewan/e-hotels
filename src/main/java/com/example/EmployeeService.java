package com.example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmployeeService {

    /**
     * Method to get all employees from the database
     *
     * @return List of employees from the database
     * @throws Exception when trying to connect to the database or execute the query
     */
    public List<Employee> getEmployees() throws Exception {

        // SQL query to retrieve all employees
        String sql = "SELECT * FROM Employee";

        // Database connection object
        ConnectionDB db = new ConnectionDB();

        // Data structure to keep all employees retrieved from the database
        List<Employee> employees = new ArrayList<>();

        // Try to connect to the database and execute the query, catch any exceptions
        try (Connection con = db.getConnection()) {
            // Prepare the SQL statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // Execute the query and get the result set
            ResultSet rs = stmt.executeQuery();

            // Iterate through the result set
            while (rs.next()) {
                // Create a new com.example.Employee object
                Employee employee = new Employee(
                        rs.getLong("SSN_SIN"),
                        rs.getInt("hotelID"),
                        rs.getInt("hotelChainID"),
                        rs.getString("first_name"),
                        rs.getString("middle_name"),
                        rs.getString("last_name"),
                        rs.getString("street"),
                        rs.getString("city"),
                        rs.getString("province_state"),
                        rs.getString("postal_code_zip_code"),
                        rs.getBoolean("Roles_chef"),
                        rs.getBoolean("Roles_maintenanceTechnician"),
                        rs.getBoolean("Roles_receptionist"),
                        rs.getBoolean("Roles_hotelKeeper")
                );

                // Add the com.example.Employee object to the list of employees
                employees.add(employee);
            }

            // Close the result set, statement, and database connection
            rs.close();
            stmt.close();
            con.close();
            db.close();

            // Return the list of employees retrieved from the database
            return employees;
        } catch (Exception e) {
            // Throw any errors that occurred
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Method to insert an employee into the database
     *
     * @param employee the employee object to be inserted
     * @throws Exception when trying to connect to the database or execute the query
     */
    public void insertEmployee(Employee employee) throws Exception {
        // SQL query to insert employee
        String sql = "INSERT INTO Employee (SSN_SIN, hotelID, hotelChainID, first_name, middle_name, last_name, street, city, province_state, postal_code_zip_code, Roles_chef, Roles_maintenanceTechnician, Roles_receptionist, Roles_hotelKeeper) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        // Database connection object
        ConnectionDB db = new ConnectionDB();

        // Try connecting to the database and executing the query, catch any exceptions
        try (Connection con = db.getConnection()) {
            // Prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // Set parameters for the prepared statement
            stmt.setLong(1, employee.getSsnSin());
            stmt.setInt(2, employee.getHotelId());
            stmt.setInt(3, employee.getHotelChainId());
            stmt.setString(4, employee.getFirstName());
            stmt.setString(5, employee.getMiddleName());
            stmt.setString(6, employee.getLastName());
            stmt.setString(7, employee.getStreet());
            stmt.setString(8, employee.getCity());
            stmt.setString(9, employee.getProvinceState());
            stmt.setString(10, employee.getPostalCodeZipCode());
            stmt.setBoolean(11, employee.isChef());
            stmt.setBoolean(12, employee.isMaintenanceTechnician());
            stmt.setBoolean(13, employee.isReceptionist());
            stmt.setBoolean(14, employee.isHotelKeeper());

            // Execute the query
            stmt.executeUpdate();

            // Close the statement
            stmt.close();
        } catch (Exception e) {
            // Throw any errors occurred
            throw new Exception("Error while inserting employee: " + e.getMessage());
        }
    }

    /**
     * Method to delete an employee from the database by SSN/SIN
     *
     * @param ssnSin the SSN/SIN of the employee to be deleted
     * @return a string message indicating whether the employee was deleted successfully or not
     * @throws Exception when trying to connect to the database or execute the query
     */
    public String deleteEmployee(long ssnSin) throws Exception {
        Connection con = null;
        String message = "";

        // SQL query to delete employee by SSN/SIN
        String sql = "DELETE FROM Employee WHERE SSN_SIN = ?";

        // Database connection object
        ConnectionDB db = new ConnectionDB();

        // Try connecting to the database and executing the query, catch any exceptions
        try {
            con = db.getConnection();

            // Prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // Set the SSN/SIN parameter for the prepared statement
            stmt.setLong(1, ssnSin);

            // Execute the query
            int rowsAffected = stmt.executeUpdate();

            // Close the statement
            stmt.close();

            // Check if any rows were affected (employee deleted)
            if (rowsAffected > 0) {
                message = "Employee with SSN/SIN " + ssnSin + " successfully deleted!";
            } else {
                message = "Employee with SSN/SIN " + ssnSin + " not found!";
            }
        } catch (Exception e) {
            // Throw any errors occurred
            throw new Exception("Error while deleting employee: " + e.getMessage());
        } finally {
            // Close the connection
            if (con != null) con.close();
        }

        return message;
    }

    /**
     * Method to update an employee in the database
     *
     * @param employee the employee object with updated information
     * @throws Exception when trying to connect to the database or execute the query
     */
    public void updateEmployee(Employee employee) throws Exception {
        // SQL query to update employee
        String sql = "UPDATE Employee SET first_name = ?, middle_name = ?, last_name = ?, street = ?, city = ?, province_state = ?, postal_code_zip_code = ?, " +
                "Roles_chef = ?, Roles_maintenanceTechnician = ?, Roles_receptionist = ?, Roles_hotelKeeper = ? WHERE SSN_SIN = ?";

        // Database connection object
        ConnectionDB db = new ConnectionDB();

        // Try connecting to the database and executing the query, catch any exceptions
        try (Connection con = db.getConnection()) {
            // Prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // Set parameters for the prepared statement
            stmt.setString(1, employee.getFirstName());
            stmt.setString(2, employee.getMiddleName());
            stmt.setString(3, employee.getLastName());
            stmt.setString(4, employee.getStreet());
            stmt.setString(5, employee.getCity());
            stmt.setString(6, employee.getProvinceState());
            stmt.setString(7, employee.getPostalCodeZipCode());
            stmt.setBoolean(8, employee.isChef());
            stmt.setBoolean(9, employee.isMaintenanceTechnician());
            stmt.setBoolean(10, employee.isReceptionist());
            stmt.setBoolean(11, employee.isHotelKeeper());
            stmt.setLong(12, employee.getSsnSin());

            // Execute the query
            stmt.executeUpdate();

            // Close the statement
            stmt.close();
        } catch (Exception e) {
            // Throw any errors occurred
            throw new Exception("Error while updating employee: " + e.getMessage());
        }
    }
}

