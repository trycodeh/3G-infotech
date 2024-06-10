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
       
        
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        
     
        
             String url = "jdbc:mysql://localhost:3306/try"; 
            String user = "root"; 
            String password = "password"; 
            
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
                   String userid =rs.getString("id");
                       if(email.equals(id)){
                        login = true;
                            if(ps.equals(pass)){
                session.setAttribute("userid" , userid);
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

</html>