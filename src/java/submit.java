import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/submit")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5)
public class submit extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(); // Access session within the method
        
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

            // Get the data file from the request
            Part filePart = request.getPart("imageFile");
            String name = request.getParameter("companyname");
            String branchname = request.getParameter("branchname"); 
            String contact = request.getParameter("contact"); 
            String address = request.getParameter("address");
            
            InputStream inputStream = filePart.getInputStream();
            
            // Insert or update the data into the database
            String id = (String) session.getAttribute("userid");
            String query = "UPDATE login_data SET company=?, branch=?, contact=?, address=?, photo_data=? WHERE id=?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, branchname);
            pstmt.setString(3, contact);
            pstmt.setString(4, address);
            pstmt.setBlob(5, inputStream);
            pstmt.setString(6, id);
            pstmt.executeUpdate();
            
            // Redirect to a success page
            pstmt = conn.prepareStatement("SELECT photo_data FROM login_data WHERE id = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                // Get the image data from the result set
                InputStream inputStream1 = rs.getBinaryStream("photo_data");
                
                // Set the image data as an attribute to be passed to the JSP page
                request.setAttribute("imageData", inputStream1);
            } else {
                // Handle case where no image data is found for the given ID
                response.getWriter().println("No image found for ID: " + id);
            }
            request.getRequestDispatcher("home.jsp").forward(request, response);
             
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error occurred: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
