<%-- 
    Document   : showdat
    Created on : May 29, 2024, 12:36:11 PM
    Author     : Admin
--%>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
					String url = "jdbc:mysql://localhost:3306/y";
					String user = "root";
					String password = "@admin123";
					//String id = (String) session.getAttribute("userid");
					Connection conn = null;
					ResultSet rs = null;
					Statement stmt = null;
					int i = 1;
                                        String qid=request.getParameter("qid");
                                        out.println(qid);
                                        
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						conn = DriverManager.getConnection(url, user, password);
						String sql = "SELECT question1 , question2 , question3 , question4 , question5  FROM form WHERE question_id=?";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, qid);
						rs = pstmt.executeQuery();

						while (rs.next()) {

							String q1 = rs.getString("question1");
							String q2 = rs.getString("question2");
							String q3 = rs.getString("question3");
							String q4 = rs.getString("question4");
							String q5 = rs.getString("question5");
                                                        
                                                        out.println(q1 +" "+ q2  + " " + q3 + " " + q4 + " " + q5 );
                                                }   
                                     }
        catch (Exception e) {
					out.println("<p>Error: " + e.getMessage() + "</p>");
					e.printStackTrace();
					}
        
        
        
        
        %>
        
    </body>
</html>