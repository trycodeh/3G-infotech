<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import=" java.sql.*" %>
<%
    String companyName = request.getParameter("companyName");
    String branchName = request.getParameter("branchName");
    String contact = request.getParameter("contact");
    String address = request.getParameter("address");
    String name = "kk";

    Connection con = null;
    PreparedStatement pstmt = null;
    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
        // Connect to the database
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/y", "root", "@admin123");

        // Create a PreparedStatement with SQL
        pstmt = con.prepareStatement("INSERT INTO user_data (companyName, branchName, contant, address, name) VALUES (?, ?, ?, ? , ?)");

        // Set the parameters of the PreparedStatement
        pstmt.setString(1, companyName);
        pstmt.setString(2, branchName);
        pstmt.setString(3, contact);
        pstmt.setString(4, address);
        pstmt.setString(5 ,name);
        // Execute the PreparedStatement
        pstmt.executeUpdate();

        // Close the PreparedStatement and Connection
        pstmt.close();
        con.close();

        // Redirect to a success page or display a success message
        response.sendRedirect("home.jsp");
    } catch (Exception e) {
        // Handle any exceptions
        out.println("Error: " + e.getMessage());
        e.printStackTrace();
    } finally {
        // Close the PreparedStatement and Connection in case of any exceptions
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
