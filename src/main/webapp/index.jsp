<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> Home Page </title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>
<body>

    <jsp:include page="navbar.jsp"/>

    <div class="container mt-5">
        <h1 class="text-center">Welcome to Java Hotels</h1>
        <h3 class="text-center mt-4">I am a:</h3>
        <div class="d-flex justify-content-center mt-3">
             <a href="customerHomepage.jsp" class="btn btn-primary mx-2">Customer</a>
             <a href="employeeHomepage.jsp" class="btn btn-success mx-2">Employee</a>
             <a href="adminHomepage.jsp" class="btn btn-danger mx-2" disabled>Admin</a>
        </div>
    </div>

    <div class="text-center mt-5">
        <h3>View Available Rooms:</h3>
        <a href="view1.jsp" class="btn btn-info mt-2">View 1</a>
        <h3 class="mt-4">Aggregated Capacity:</h3>
        <a href="view2.jsp" class="btn btn-info mt-2">View 2</a>
    </div>

    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script>
        $(document).ready(function() {
            toastr.options = {
                "closeButton": true,
                "positionClass": "toast-bottom-right",
                "preventDuplicates": false
            };
            // Add your toastr notification script here if needed
        })
    </script>
</body>
</html>
