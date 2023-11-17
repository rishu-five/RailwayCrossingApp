<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="java.io.*, java.util.*, java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
url="jdbc:mysql://localhost:3306/railway" user="root" password="Rishu@170955" />

<c:set var="keyword" value="${param.keyword}" />
<sql:query dataSource="${snapshot}" var="result">
    SELECT * FROM adminhome WHERE Name LIKE CONCAT('%', ?, '%') OR Address LIKE CONCAT('%', ?, '%')
    <sql:param value="${keyword}" />
    <sql:param value="${keyword}" />
</sql:query>

<c:choose>
    <c:when test="${empty result.rows}">
        <%-- If no results found, generate noResult.jsp --%>
        <%@ include file="noResult.jsp" %>
    </c:when>
    <c:otherwise>
        <%-- Display search results --%>
        <table border="1" width="100%">
            <tr>
                <th>Sr.No</th>
                <th>Name</th>
                <th>Address</th>
                <th>Landmark</th>
                <th>Time Schedule</th>
                <th>Person In-Charge</th>
                <th>Status</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.id}" /></td>
                    <td><c:out value="${row.Name}" /></td>
                    <td><c:out value="${row.Address}" /></td>
                    <td><c:out value="${row.Landmark}" /></td>
                    <td><c:out value="${row.Trainschedule}" /></td>
                    <td><c:out value="${row.pname}" /></td>
                    <td><c:out value="${row.status}" /></td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>
  <button onclick="window.location.href='search.jsp'" style="color: blue;">Go back to Search</button>
    <button onclick="window.location.href='userhome.jsp'" style="color: red;">Go to Home Page</button>
