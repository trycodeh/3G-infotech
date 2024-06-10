<%@ page import="java.sql.*, java.io.*, javax.servlet.http.*, javax.servlet.*, org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<!DOCTYPE html>
<%
String username = request.getParameter("username");
String email = request.getParameter("email");

// Database connection
String url = "jdbc:mysql://localhost:3306/try";
String user = "root";
String password = "password";

Connection conn = null;
PreparedStatement pstmt = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Establish a connection to the database
    conn = DriverManager.getConnection(url, user, password);

    // Prepare SQL statement
    String sql = "INSERT INTO users (username, email, photo) VALUES (?, ?, ?)";
    pstmt = conn.prepareStatement(sql);

    // Get photo data
    Part photoPart = request.getPart("photo");
    
    if (photoPart != null) {
        InputStream photoStream = photoPart.getInputStream();

        // Set parameters
        pstmt.setString(1, username);
        pstmt.setString(2, email);
        pstmt.setBinaryStream(3, photoStream, (int) photoPart.getSize());

        // Execute SQL statement
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            out.println("New record created successfully");
        } else {
            out.println("Failed to create new record");
        }
    } else {
        out.println("Please select a photo.");
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
}
%>
