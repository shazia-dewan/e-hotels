package com.example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {

    /**
     * Method to get all customers from the database.
     *
     * @return List of customers from the database.
     * @throws Exception when an error occurs while trying to connect to the database.
     */
    public List<Customer> getCustomers() throws Exception {
        String sql = "SELECT * FROM Customer";
        ConnectionDB db = new ConnectionDB();
        List<Customer> customers = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Customer customer = new Customer(
                        rs.getLong("customer_ID"),
                        rs.getString("street"),
                        rs.getString("city"),
                        rs.getString("province_state"),
                        rs.getString("postal_code_zip_code"),
                        rs.getString("first_name"),
                        rs.getString("middle_name"),
                        rs.getString("last_name"),
                        rs.getString("DateofRegistration")
                );
                customers.add(customer);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return customers;
        } catch (Exception e) {
            throw new Exception("Error while retrieving customers: " + e.getMessage());
        }
    }

    /**
     * Method to insert a new customer into the database.
     *
     * @param customer The customer object to be inserted.
     * @return true if insertion is successful, false otherwise.
     * @throws Exception when an error occurs while trying to connect to the database.
     */
    public boolean insertCustomer(Customer customer) throws Exception {
        String sql = "INSERT INTO Customer (customer_ID, street, city, province_state, postal_code_zip_code, first_name, middle_name, last_name, DateofRegistration) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setLong(1, customer.getCustomerId());
            stmt.setString(2, customer.getStreet());
            stmt.setString(3, customer.getCity());
            stmt.setString(4, customer.getProvinceState());
            stmt.setString(5, customer.getPostalCodeZipCode());
            stmt.setString(6, customer.getFirstName());
            stmt.setString(7, customer.getMiddleName());
            stmt.setString(8, customer.getLastName());
            stmt.setString(9, customer.getDateOfRegistration());
            int rowsAffected = stmt.executeUpdate();
            stmt.close();
            con.close();
            db.close();
            return rowsAffected > 0;
        } catch (Exception e) {
            throw new Exception("Error while inserting customer: " + e.getMessage());
        }
    }

    /**
     * Method to update an existing customer in the database.
     *
     * @param customer The customer object containing updated information.
     * @return true if update is successful, false otherwise.
     * @throws Exception when an error occurs while trying to connect to the database.
     */
    public boolean updateCustomer(Customer customer) throws Exception {
        String sql = "UPDATE Customer SET street=?, city=?, province_state=?, postal_code_zip_code=?, first_name=?, middle_name=?, last_name=?, DateofRegistration=? WHERE customer_ID=?";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, customer.getStreet());
            stmt.setString(2, customer.getCity());
            stmt.setString(3, customer.getProvinceState());
            stmt.setString(4, customer.getPostalCodeZipCode());
            stmt.setString(5, customer.getFirstName());
            stmt.setString(6, customer.getMiddleName());
            stmt.setString(7, customer.getLastName());
            stmt.setString(8, customer.getDateOfRegistration());
            stmt.setLong(9, customer.getCustomerId());
            int rowsAffected = stmt.executeUpdate();
            stmt.close();
            con.close();
            db.close();
            return rowsAffected > 0;
        } catch (Exception e) {
            throw new Exception("Error while updating customer: " + e.getMessage());
        }
    }

    /**
     * Method to delete a customer from the database by customer ID.
     *
     * @param customerId The ID of the customer to be deleted.
     * @return true if deletion is successful, false otherwise.
     * @throws Exception when an error occurs while trying to connect to the database.
     */
    public boolean deleteCustomer(long customerId) throws Exception {
        String sql = "DELETE FROM Customer WHERE customer_ID=?";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setLong(1, customerId);
            int rowsAffected = stmt.executeUpdate();
            stmt.close();
            con.close();
            db.close();
            return rowsAffected > 0;
        } catch (Exception e) {
            throw new Exception("Error while deleting customer: " + e.getMessage());
        }
    }



}

