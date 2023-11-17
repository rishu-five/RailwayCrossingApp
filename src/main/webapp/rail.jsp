<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*, java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<!-- HTML head and title -->
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Rail Crossing Form</title>
</head>
<body>

    <h2>Rail Crossing Form</h2>

    <form action="RailCrossing" method="POST">
        <!-- Your form inputs for rail crossing data -->
        Name: <input type="text" name="Name"><br>
        Address: <input type="text" name="Address"><br>
        Landmark: <input type="text" name="Landmark"><br>
        Time Schedule: <input type="text" name="Trainschedule"><br>
        Person In-Charge: <input type="text" name="pname"><br>
        Status: <input type="text" name="status"><br>

        <!-- Submit button to trigger data insertion -->
        <input type="submit" value="Submit Rail Crossing Data" />
    </form>

    <!-- Button to redirect to another JSP -->
    <button onclick="redirectToAnotherPage()">Go to Admin Home Page</button>

    <script>
        function redirectToAnotherPage() {
            // Redirect to another JSP page after data insertion
            window.location.href = 'adminhome.jsp';
        }
    </script>

</body>
</html>
