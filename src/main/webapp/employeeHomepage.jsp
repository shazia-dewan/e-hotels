<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Home Page</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="navbar.jsp"/>

    <div class="container mt-5">
        <div class="row mt-4 align-items-center">
            <div class="col-md-6 offset-md-3">
                <div class="text-center">
                    <h2>Welcome, Employee!</h2>
                    <p>Please select one of the following options:</p>
                    <a href="bookingToRenting.jsp" class="btn btn-primary btn-lg btn-block mt-4">Transfer Booking to Renting</a>
                    <a href="createNewRenting.jsp" class="btn btn-success btn-lg btn-block mt-4">Create New Renting</a>
                </div>
            </div>
        </div>
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
        })
    </script>
</body>
</html>