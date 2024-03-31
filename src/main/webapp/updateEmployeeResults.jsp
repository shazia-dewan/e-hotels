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

    // Create a Customer object with the updated information
    EmployeeService employeeService = new EmployeeService();
    Employee updatedEmployee = employeeService.getEmployeeFromID(employeeID);
    updatedEmployee.setSsnSin(employeeID);
    updatedEmployee.setHotelId(hotelID);
    updatedEmployee.setHotelChainId(hotelChainID);
    updatedEmployee.setStreet(street);
    updatedEmployee.setCity(city);
    updatedEmployee.setProvinceState(provinceState);
    updatedEmployee.setPostalCodeZipCode(postalCode);
    updatedEmployee.setFirstName(firstName);
    updatedEmployee.setMiddleName(middleName);
    updatedEmployee.setLastName(lastName);
    updatedEmployee.setChef(Roles_chef);
    updatedEmployee.setMaintenanceTechnician(Roles_maintenanceTechnician);
    updatedEmployee.setReceptionist(Roles_receptionist);
    updatedEmployee.setHotelKeeper(Roles_hotelKeeper);

    // Update the employee in the database

       boolean success = employeeService.updateEmployee(updatedEmployee);

        // Display success or error message
        if (success) {
    %>
            <div class="container mt-5">
                <div class="alert alert-success" role="alert">
                    Employee updated successfully!
                </div>
            </div>
    <%
        } else {
    %>
            <div class="container mt-5">
                <div class="alert alert-danger" role="alert">
                    Failed to update employee. Please try again.
                </div>
            </div>
<%
    }
%>
