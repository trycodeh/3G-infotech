<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>3G_INFOTECH</title>
    </head>
    <body>
         <body>
        <%
       
        
        String form_title = request.getParameter("");
        String desc = request.getParameter("pass");
        String q1 = request.getParameter("pass");
        String qt1 =request.getParameter();
        String q2 = request.getParameter("pass");
        String qt2 =request.getParameter();
        String q3 = request.getParameter("pass");
        String qt3 =request.getParameter();
        String q4 = request.getParameter("pass");
        String qt4 =request.getParameter();
        String q5 = request.getParameter("pass");
        String qt5 =request.getParameter();
     
        
             String url = "jdbc:mysql://localhost:3306/y"; 
            String user = "root"; 
            String password = "@admin123"; 
            
            Connection conn = null;
            ResultSet rs = null;
             Statement stmt = null;
             
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
                
                // Establish a connection to the database
                conn = DriverManager.getConnection(url, user, password);
               
                String sql = "SELECT id,Email,password FROM login_data";

                // Create the Statement
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);
                boolean login  = false;
                  while (rs.next()){
                    String id = rs.getString("email");
                    String ps = rs.getString("password");
                   // String userid =rs.getString("id");
                       if(email.equals(id)){
                        login = true;
                            if(ps.equals(pass)){
                           
        Cookie cookie = new Cookie("userid",rs.getString("id"));
        cookie.setMaxAge(24 * 60 * 60); // Cookie will expire in 24 hours
        response.addCookie(cookie);
                            
                            %>
        <jsp:include page="home.jsp" ></jsp:include>
<% 
                             }else{
                             %><script>
        alert("Wrong Password");
        </script>
        <jsp:include page="login.html" ></jsp:include>
<% 
                            }
                       }
                 }
               if(!login){
                %><script>
        alert("Email Not found!");
        </script>
        <jsp:include page="login.html" ></jsp:include>
<% 
                }
            }
             catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
                e.printStackTrace();
            }
            
                       %>

    </body>
    </body>
</html>