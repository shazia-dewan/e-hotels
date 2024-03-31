<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.EmployeeService" %>
<%@ page import="com.example.Employee" %>

<%
    // Retrieve form data
    long employeeID = Long.parseLong(request.getParameter("employeeID"));
    int hotelID = Integer.parseInt(request.getParameter("hotelID"));
    int hotelChainID = Integer.parseInt(request.getParameter("hotelChainID"));
    String street = request.getParameter("street");
    String city = request.getParameter("city");
    String provinceState = request.getParameter("provinceState");
    String postalCode = request.getParameter("postalCode");
    String firstName = request.getParameter("firstName");
    String middleName = request.getParameter("middleName");
    String lastName = request.getParameter("lastName");
    boolean Roles_chef = Boolean.parseBoolean(request.getParameter("Roles_chef"));
    boolean Roles_maintenanceTechnician = Boolean.parseBoolean(request.getParameter("Roles_maintenanceTechnician"));
    boolean Roles_receptionist = Boolean.parseBoolean(request.getParameter("Roles_receptionist"));
    boolean Roles_hotelKeeper = Boolean.parseBoolean(request.getParameter("Roles_hotelKeeper"));

    // Call the insertEmployee method from EmployeeService
    Employee employee = new Employee(employeeID, hotelID, hotelChainID, firstName, middleName, lastName, street, city, provinceState, postalCode, Roles_chef, Roles_maintenanceTechnician, Roles_receptionist, Roles_hotelKeeper);
    EmployeeService employeeService = new EmployeeService();
    boolean inserted = employeeService.insertEmployee(employee);

    // Check if the customer was successfully inserted
    if (inserted) {
%>
        <div class="alert alert-success" role="alert">
            Employee inserted successfully!
        </div>
<%
    } else {
%>
        <div class="alert alert-danger" role="alert">
            Failed to insert employee. Please try again.
        </div>
<%
    }
%>
