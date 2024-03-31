<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Employee</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <!-- Include any other CSS stylesheets -->
</head>
<body>
<jsp:include page="navbar.jsp"/>
        <div class="container mt-5">
            <h2>Delete Employee</h2>
      <form action="deleteEmployeeResults.jsp" method="get">
                <div class="form-group">
                    <label for="employeeID">Employee ID</label>
                    <input type="text" class="form-control" id="employeeID" name="employeeID" required>
                </div>
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>
        </div>

        <!-- Bootstrap JS -->
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <!-- Your custom JS if needed -->
        </body>
        </html>