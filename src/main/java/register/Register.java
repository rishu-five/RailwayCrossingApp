package register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
* Servlet implementation class Register
*/
@WebServlet("/Register")
public class Register extends HttpServlet
{ private static final long serialVersionUID = 1L;
/**
* @see HttpServlet#HttpServlet()
*/
public Register()
{super();
// TODO Auto-generated constructorstub
}
/**
* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
*/
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
ServletException, IOException {
// TODO Auto-generated method stub
response.getWriter().append("Served at: ").append(request.getContextPath());
}
/**
* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
ServletException, IOException {
// TODO Auto-generated method stub
String uname = request.getParameter("uname");
String email = request.getParameter("email");
String password = request.getParameter("password");
Member user = new Member(uname, email, password);
RegisterDao rDao = new RegisterDao();
String result = rDao.insert(user);
response.getWriter().print(result);
}
}
