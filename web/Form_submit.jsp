<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>3G_INFOTECH</title>
</head>
<body>

<%
    // Get form data
    String name = request.getParameter("formTitle");
    String email = request.getParameter("formDescription");
    String[] questionTexts = request.getParameterValues("question[]");
    String[] questionTypes = request.getParameterValues("questionType[]");

    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/try";
    String user = "root";
    String password = "password";
    String ids = " ";
    ids = (String) session.getAttribute("userid");

    // Initialize database resources
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish a connection to the database
        conn = DriverManager.getConnection(url, user, password);

        // Prepare SQL statement
        String query = "INSERT INTO form (id, form_title, descp, question1, question2, question3, question4, question5, question_type1, question_type2, question_type3, question_type4, question_type5) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(query);

        // Set parameters for the prepared statement
        pstmt.setString(1, ids); // Assuming user ID is stored in session
        pstmt.setString(2, name);
        pstmt.setString(3, email);

        // Set question texts and types
        for (int i = 0; i < 5; i++) {
            pstmt.setString(4 + i, (i < questionTexts.length) ? questionTexts[i] : "not");
            pstmt.setString(9 + i, (i < questionTypes.length) ? questionTypes[i] : "not");
        }

        // Execute the query
        int rows = pstmt.executeUpdate();

        // Provide feedback to the user
        if (rows > 0) {
         %>
        	<jsp:forward page="home.jsp" ></jsp:forward> 
        	<%
        } else {
            out.println("<h2>Data not Inserted Successfully!</h2>");
        }
    } catch (SQLException e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        out.println("<p>Error: MySQL JDBC Driver not found</p>");
        e.printStackTrace();
    } finally {
        // Close database resources in finally block to ensure they're always closed
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("<p>Error closing database resources: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
    }
%>

</body>
</html>
