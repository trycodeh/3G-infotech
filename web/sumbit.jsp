<%@page import="javax.servlet.RequestDispatcher"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3G_INFOTECH</title>
</head>
<body>
  
  <%
  String name = request.getParameter("companyname");
  String branchname = request.getParameter("branchname"); 
  String contact = request.getParameter("contact"); 
  String address = request.getParameter("address");
  
  String id = "";
 id = (String) session.getAttribute("userid");
  
  String url = "jdbc:mysql://localhost:3306/y"; 
  String user = "root"; 
  String password = "@admin123"; 

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  try {
      Class.forName("com.mysql.cj.jdbc.Driver");

      // Establish a connection to the database
      conn = DriverManager.getConnection(url, user, password);
      
      String query = "UPDATE login_data SET companyname=?, branchname=?, contact=?, address=? WHERE id=?";
      pstmt = conn.prepareStatement(query);
      pstmt.setString(1, name);
      pstmt.setString(2, branchname);
      pstmt.setString(3, contact);
      pstmt.setString(4, address);
      pstmt.setString(5, id);
      
      int rows = pstmt.executeUpdate();
      if (rows > 0) {
  %>
      <jsp:forward page="home.jsp"/>
  <%
      } else {
  %>
      <jsp:forward page="home.jsp"/>
  <%
      }
  } catch(Exception e) {
      e.printStackTrace();
  } finally {
      // Close resources in finally block
      try {
          if (rs != null) rs.close();
          if (pstmt != null) pstmt.close();
          if (conn != null) conn.close();
      } catch (SQLException e) {
          e.printStackTrace();
      }
  }
  %>

</body>
</html>
