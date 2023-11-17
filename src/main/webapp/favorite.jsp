<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Favorite Crossing</title>
</head>
<body>
    <h1 style="color: pink;">FAVORITE CROSSING</h3>
    <a href="userhome.jsp">Home</a><br>
    <a href="search.jsp">Search Crossing</a><br><br>
    
    <%
        String removeId = request.getParameter("removeId");
        if (removeId != null && !removeId.isEmpty()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/railway", "root", "Rishu@170955");

                String sql = "DELETE FROM favorites WHERE id = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, removeId);
                int rowsAffected = statement.executeUpdate();

                statement.close();
                connection.close();

                response.sendRedirect("favorite.jsp");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                // Handle exceptions
            }
        }
    %>

    <sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/railway" user="root" password="Rishu@170955"
    />
    <sql:query dataSource="${snapshot}" var="favorites">
        SELECT * FROM favorites;
    </sql:query>
    <c:if test="${not empty favorites.rows}">
        <table border="1" width="100%">
            <tr>
                <th>Sr.No</th>
                <th>Name</th>
                <th>Address</th>
                <th>Landmark</th>
                <th>Time Schedule</th>
                <th>Person In-Charge</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="favorite" items="${favorites.rows}">
                <tr>
                    <td><c:out value="${favorite.id}" /></td>
                    <td><c:out value="${favorite.Name}" /></td>
                    <td><c:out value="${favorite.Address}" /></td>
                    <td><c:out value="${favorite.Landmark}" /></td>
                    <td><c:out value="${favorite.Trainschedule}" /></td>
                    <td><c:out value="${favorite.pname}" /></td>
                    <td><c:out value="${favorite.status}" /></td>
                    <td>
                        <form action="favorite.jsp" method="GET">
                            <input type="hidden" name="removeId" value="${favorite.id}" />
                            <input type="submit" value="Remove" />
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty favorites.rows}">
        <p>No favorite crossings.</p>
    </c:if>
</body>
</html>
