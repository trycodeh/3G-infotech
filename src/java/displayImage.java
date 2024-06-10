import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.swing.text.html.HTML;


@WebServlet("/displayImage")
public class displayImage extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession(); // Access session within the method
       
        
        // Connect to the database
        String url = "jdbc:mysql://localhost:3306/try";
        String user = "root";
        String password = "password";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            // Establish connection to the database
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
              
            String id = (String) session.getAttribute("userid");          
            // Query to retrieve user photo data from the database based on the user ID
            String query = "SELECT photo_data FROM login_data WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                // Get the image data from the result set
                Blob photoBlob = rs.getBlob("photo_data");
                
                
                // Set response content type
                response.setContentType("image/jpeg"); // Change the content type based on the image format
                
                // Write image data to response output stream
                InputStream inputStream = photoBlob.getBinaryStream();
                OutputStream outputStream = response.getOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            } else {
                response.getWriter().println("No image found for user ID: " + id);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error occurred: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
  