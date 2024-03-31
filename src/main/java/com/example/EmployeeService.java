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
    public boolean insertEmployee(Employee employee) throws Exception {
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

            int rowsAffected = stmt.executeUpdate();
            stmt.close();
            con.close();
            db.close();
            return rowsAffected > 0;


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
    public boolean deleteEmployee(long SSN_SIN) throws Exception {
        String sql = "DELETE FROM Employee WHERE SSN_SIN=?";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setLong(1, SSN_SIN);
            int rowsAffected = stmt.executeUpdate();
            stmt.close();
            con.close();
            db.close();
            return rowsAffected > 0;
        } catch (Exception e) {
            throw new Exception("Error while deleting employee: " + e.getMessage());
        }
    }
    /**
     * Method to update an employee in the database
     *
     * @param employee the employee object with updated information
     * @throws Exception when trying to connect to the database or execute the query
     */
    public boolean updateEmployee(Employee employee) throws Exception {
        StringBuilder sql = new StringBuilder("UPDATE Employee SET ");
        List<Object> parameters = new ArrayList<>();
        // SQL query to update employee

        // Database connection object
        ConnectionDB db = new ConnectionDB();

        // Try connecting to the database and executing the query, catch any exceptions
        try (Connection con = db.getConnection()) {


            if (!employee.getStreet().isEmpty()) {
                sql.append("street=?, ");
                parameters.add(employee.getStreet());
            }
            if (!employee.getCity().isEmpty()) {
                sql.append("city=?, ");
                parameters.add(employee.getCity());
            }
            if (!employee.getProvinceState().isEmpty()) {
                sql.append("province_state=?, ");
                parameters.add(employee.getProvinceState());
            }
            if (!employee.getPostalCodeZipCode().isEmpty()) {
                sql.append("postal_code_zip_code=?, ");
                parameters.add(employee.getPostalCodeZipCode());
            }
            if (!employee.getFirstName().isEmpty()) {
                sql.append("first_name=?, ");
                parameters.add(employee.getFirstName());
            }
            if (!employee.getMiddleName().isEmpty()) {
                sql.append("middle_name=?, ");
                parameters.add(employee.getMiddleName());
            }
            if (!employee.getLastName().isEmpty()) {
                sql.append("last_name=?, ");
                parameters.add(employee.getLastName());
            }


            sql.append("hotelChainID=?, ");
            parameters.add(employee.getHotelChainId());
            sql.append("hotelID=?, ");
            parameters.add(employee.getHotelId());
            sql.append("Roles_chef=?, ");
            parameters.add(employee.isChef());
            sql.append("Roles_maintenanceTechnician=?, ");
            parameters.add(employee.isMaintenanceTechnician());
            sql.append("Roles_receptionist=?, ");
            parameters.add(employee.isReceptionist());
            sql.append("Roles_hotelKeeper=?, ");
            parameters.add(employee.isHotelKeeper());


            // Remove the last comma and space
            sql.setLength(sql.length() - 2);

            // Add the WHERE clause
            sql.append(" WHERE SSN_SIN=?");

            // Add the employee ID parameter
            parameters.add(employee.getSsnSin());

            // Prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql.toString());

            // Set parameter values
            int index = 1;
            for (Object parameter : parameters) {
                stmt.setObject(index++, parameter);
            }

            // Execute the update
            int rowsAffected = stmt.executeUpdate();

            // Close resources
            stmt.close();
            con.close();
            db.close();

            return rowsAffected > 0;

        } catch (Exception e) {
            // Throw any errors occurred
            throw new Exception("Error while updating employee: " + e.getMessage());
        }
    }

    public Employee getEmployeeFromID(long SSN_SIN) throws Exception {
        String sql = "SELECT * FROM Employee WHERE SSN_SIN=?";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setLong(1, SSN_SIN);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Employee employee = new Employee(
                        rs.getLong("SSN_SIN"),
                        rs.getInt("hotelID"),
                        rs.getInt("hotelChainID"),
                        rs.getString("street"),
                        rs.getString("city"),
                        rs.getString("province_state"),
                        rs.getString("postal_code_zip_code"),
                        rs.getString("first_name"),
                        rs.getString("middle_name"),
                        rs.getString("last_name"),
                        rs.getBoolean("Roles_chef"),
                        rs.getBoolean("Roles_maintenanceTechnician"),
                        rs.getBoolean("Roles_receptionist"),
                        rs.getBoolean("Roles_hotelKeeper")

                );
                return employee;
            }

            else {
                return null; // Or handle this case as you see fit
            }

        } catch (Exception e) {
            throw new Exception("Error while fetching employee: " + e.getMessage());
        } finally {
            db.close(); // Ensure the database connection is closed
        }
    }
}

