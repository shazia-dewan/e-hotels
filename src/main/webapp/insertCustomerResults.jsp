<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.CustomerService" %>
<%@ page import="com.example.Customer" %>

<%
    // Retrieve form data
    long customerID = Long.parseLong(request.getParameter("customerID"));
    String street = request.getParameter("street");
    String city = request.getParameter("city");
    String provinceState = request.getParameter("provinceState");
    String postalCode = request.getParameter("postalCode");
    String firstName = request.getParameter("firstName");
    String middleName = request.getParameter("middleName");
    String lastName = request.getParameter("lastName");
    String registrationDate = request.getParameter("registrationDate");

    // Call the insertCustomer method from CustomerService
    Customer customer = new Customer(customerID, street,city, provinceState,postalCode, firstName, middleName, lastName, registrationDate);
    CustomerService customerService = new CustomerService();
    boolean inserted = customerService.insertCustomer(customer);

    // Check if the customer was successfully inserted
    if (inserted) {
%>
        <div class="alert alert-success" role="alert">
            Customer inserted successfully!
        </div>
<%
    } else {
%>
        <div class="alert alert-danger" role="alert">
            Failed to insert customer. Please try again.
        </div>
<%
    }
%>
