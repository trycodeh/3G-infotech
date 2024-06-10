import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/signup")
public class signup extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("uname");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String cpass = request.getParameter("cpass");
        String company = "";
        String branchname = "";
        String address = "";
        String contact = "";

        // insert photo
        InputStream defaultPhotoStream = null;
        String defaultPhotoPath = "image\\logo3.jfif"; // Update this path
        File defaultPhotoFile = new File(getServletContext().getRealPath(defaultPhotoPath));
        defaultPhotoStream = new FileInputStream(defaultPhotoFile);

        if (pass.equals(cpass)) {
            String url = "jdbc:mysql://localhost:3306/try";
            String user = "root";
            String password = "password";

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            Statement stmt = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish a connection to the database
                conn = DriverManager.getConnection(url, user, password);

                String sql = "SELECT Email FROM login_data";

                // Create the Statement
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);
                boolean Cemail = true;
                while (rs.next()) {
                    String id = rs.getString("email");
                    if (email.equals(id)) {
                        Cemail = false;
                        break;
                    }
                }

                if (!Cemail) {
                    response.getWriter().println("<script>alert('Already Register');</script>");
                    request.getRequestDispatcher("Signup.html").include(request, response);
                } else {
                    String query = "INSERT INTO login_data (name, email,password , company , branch , address ,contact,photo_data) VALUES (?,?, ?,? ,?,?,?,?)";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, name);
                    pstmt.setString(2, email);
                    pstmt.setString(3, pass);
                    pstmt.setString(4, company);
                    pstmt.setString(5, branchname);
                    pstmt.setString(6, address);
                    pstmt.setString(7, contact);
                    pstmt.setBinaryStream(8, defaultPhotoStream);
                    int rows = pstmt.executeUpdate();

                    if (rows > 0) {
                        response.getWriter().println("<script>alert('Registration successful!');</script>");
                        request.getRequestDispatcher("Signup.html").include(request, response);
                    }
                }
            } catch (Exception e) {
                response.getWriter().println("<p>Error: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } finally {
                // Close resources
                try {
                    if (rs != null)
                        rs.close();
                    if (stmt != null)
                        stmt.close();
                    if (pstmt != null)
                        pstmt.close();
                    if (conn != null)
                        conn.close();
                    if (defaultPhotoStream != null)
                        defaultPhotoStream.close();
                } catch (SQLException | IOException e) {
                    e.printStackTrace();
                }
            }
        } else {
            response.getWriter().println("<script>alert('Password not same!');</script>");
            request.getRequestDispatcher("Signup.html").include(request, response);
        }
    }
}
