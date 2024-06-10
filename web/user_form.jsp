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
String url = "jdbc:mysql://localhost:3306/try";
                   String user = "root";
                   String password = "password";
                   Connection conn = null;
                   ResultSet rs = null;
                   PreparedStatement pstmt = null;
                   String qid = request.getParameter("qid");
                   
                String name = request.getParameter("name");
                  String email =  request.getParameter( "email");
                  String contact =  request.getParameter("contact");
                   String a1=request.getParameter("rating1");
                  String a2 = request.getParameter("rating2");
                  String a3 = request.getParameter("rating3");
                  String a4 = request.getParameter("rating4");
                  String a5 = request.getParameter("rating5");
                   try {
                       Class.forName("com.mysql.cj.jdbc.Driver");
                       conn = DriverManager.getConnection(url, user, password);
                       String sql = "insert into answer(name , email , contact , qid , a1 , a2 , a3 , a4 , a5) values(?,?,?,?,?,?,?,?,?)";
                       pstmt = conn.prepareStatement(sql);
                       pstmt.setString(1, name);
                       pstmt.setString(2, email);
                       pstmt.setString(3, contact);
                       pstmt.setString(4, qid);
                       pstmt.setString(5, a1);
                       pstmt.setString(6, a2);
                       pstmt.setString(7, a3);
                       pstmt.setString(8, a4);
                       pstmt.setString(9, a5);
                       
                       int rows = pstmt.executeUpdate();

                       if(rows >0){
 					%>
                    	   <jsp:forward page="home.jsp" ></jsp:forward>
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