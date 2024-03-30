<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.CustomerService" %>
<%@ page import="com.example.Customer" %>

<%
    // Retrieve parameters from the request
    long customerID = Long.parseLong(request.getParameter("customerID"));
    String firstName = request.getParameter("firstName");
    String middleName = request.getParameter("middleName");
    String lastName = request.getParameter("lastName");
    String street = request.getParameter("street");
    String city = request.getParameter("city");
    String provinceState = request.getParameter("provinceState");
    String postalCode = request.getParameter("postalCode");
    String registrationDate = request.getParameter("registrationDate");

    // Create a Customer object with the updated information
    CustomerService customerService = new CustomerService();
    Customer updatedCustomer = customerService.getCustomerFromID(customerID);
    updatedCustomer.setCustomerID(customerID);
    updatedCustomer.setFirstName(firstName);
    updatedCustomer.setMiddleName(middleName);
    updatedCustomer.setLastName(lastName);
    updatedCustomer.setStreet(street);
    updatedCustomer.setCity(city);
    updatedCustomer.setProvinceState(provinceState);
    updatedCustomer.setPostalCodeZipCode(postalCode);
    updatedCustomer.setDateOfRegistration(registrationDate);

    // Update the customer in the database

    boolean success = customerService.updateCustomer(updatedCustomer);

    // Display success or error message
    if (success) {
%>
        <div class="container mt-5">
            <div class="alert alert-success" role="alert">
                Customer updated successfully!
            </div>
        </div>
<%
    } else {
%>
        <div class="container mt-5">
            <div class="alert alert-danger" role="alert">
                Failed to update customer. Please try again.
            </div>
        </div>
<%
    }
%>
