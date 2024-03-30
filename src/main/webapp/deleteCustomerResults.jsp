<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.CustomerService" %>
<%@ page import="com.example.Customer" %>

<%
    // Retrieve form data
    long customerID = Long.parseLong(request.getParameter("customerID"));

    // Call the insertCustomer method from CustomerService
    CustomerService customerService = new CustomerService();
    boolean deleted = customerService.deleteCustomer(customerID);

    // Check if the customer was successfully inserted
    if (deleted) {
%>
        <div class="alert alert-success" role="alert">
            Customer deleted successfully!
        </div>
<%
    } else {
%>
        <div class="alert alert-danger" role="alert">
            Failed to delete customer. Please try again.
        </div>
<%
    }
%>
