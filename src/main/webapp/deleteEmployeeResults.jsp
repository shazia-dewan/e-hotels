<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.EmployeeService" %>
<%@ page import="com.example.Employee" %>

<%
    // Retrieve form data
    long employeeID = Long.parseLong(request.getParameter("employeeID"));

    // Call the DeleteEmployee method from EmployeeService
    EmployeeService employeeService = new EmployeeService();
    boolean deleted = employeeService.deleteEmployee(employeeID);

    // Check if the employee was successfully inserted
    if (deleted) {
%>
        <div class="alert alert-success" role="alert">
            Employee deleted successfully!
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
