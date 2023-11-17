<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Home</title>
<style>
.header {
text-align: center;
margin-bottom: 20px;
}
.link
{ display:
block;
margin-bottom: 10px;
}
</style>
</head>
<body>
<h1 style="color: Green;">USER HOME</h3>
<button onclick="window.location.href='userhome.jsp'" style="color: blue;">User Home</button>
<button onclick="window.location.href='search.jsp'" style="color: blue;">Search Crossing</button>
<button onclick="window.location.href='favorite.jsp'" style="color: blue;">Favorite Crossing</button>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
url="jdbc:mysql://localhost:3306/railway" user="root" password="Rishu@170955"
/>
<sql:query dataSource="${snapshot}" var="result">
SELECT * FROM adminhome;
</sql:query>
<c:forEach var="row" items="${result.rows}">
<div>
<h4>Name: <c:out value="${row.Name}" /></h4>
<p>Address: <c:out value="${row.Address}" /></p>
<p>Landmark: <c:out value="${row.Landmark}" /></p>
<p>Time Schedule: <c:out value="${row.Trainschedule}" /></p>
<p>Person In-Charge: <c:out value="${row.pname}" /></p>
<p>Status: <c:out value="${row.status}" /></p>
<form action="AddToFavorite" method="POST">
<input type="hidden" name="itemId" value="${row.id}" />
<input type="submit" value="Add to Favorite" />
</form>
</div>
<hr />
</c:forEach>
<button onclick="window.location.href='login.jsp'" style="color: orange;">logout</button>
   <%-- Script to display the "Added to Favorite" message and redirect to favorites table --%>
    <%
        String addedToFav = request.getParameter("addedToFav");
        if (addedToFav != null && addedToFav.equals("true")) {
            out.println("<script>alert('Added to Favorite'); window.location='favorite.jsp';</script>");
        }
    %>
</body>
</html>