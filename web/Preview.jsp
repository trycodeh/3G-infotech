<%@ page import="java.sql.*"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<title>User Form</title>
<link rel="stylesheet" type="text/css" href="slide_navbar_style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap"
	rel="stylesheet">
<link href="css/previewcss.css" rel="stylesheet" type="text/css"/>
</head>

<body style="background-color:hsl(218deg, 50%, 91%);">
    <nav>
  <div class="container-fluid">
      <img src="image/logoYT-removebg-preview.png"  id="logoimage" alt="Logo"  class="d-inline-block align-text-top">
   </div>
</nav>
    <div id="body">
	<div class="main">
		<input type="checkbox" id="chk" aria-hidden="true">
                <% 
                   String id = (String) session.getAttribute("userid");
                   String url = "jdbc:mysql://localhost:3306/try";
                   String user = "root";
                   String password = "password";
                   Connection conn = null;
                   ResultSet rs = null;
                   PreparedStatement pstmt = null;
                   String qid = request.getParameter("qid");

                   try {
                       Class.forName("com.mysql.cj.jdbc.Driver");
                       conn = DriverManager.getConnection(url, user, password);
                       String sql = "SELECT * FROM form WHERE question_id = ?";
                       pstmt = conn.prepareStatement(sql);
                       pstmt.setString(1, qid);
                       rs = pstmt.executeQuery();

                       while (rs.next()) {
                            String q1 = rs.getString("question1");
                            String q2 = rs.getString("question2");
                            String q3 = rs.getString("question3");
                            String q4 = rs.getString("question4");
                            String q5 = rs.getString("question5");
                            String qt1 = rs.getString("question_type1");
                            String qt2 = rs.getString("question_type2");
                            String qt3 = rs.getString("question_type3");
                            String qt4 = rs.getString("question_type4");
                            String qt5 = rs.getString("question_type5"); 

				%><div class="signup">
			<form action="user_form.jsp">
			<input  name="qid" value="<%=qid%>" style="display: none">
                        <div style="display: flex; width: 80%; margin:auto; text-align: center;" >
                        <img  src="userlogo?qid=<%=qid %>"  id="userImage" alt="User Photo">
	<label for="chk" aria-hidden="true"  style="color: black"><%=rs.getString("form_title") %></label> 
                        </div>
                                <input type="text" id="input1" name="name" placeholder="User name" required="">
				<input  id="input1" type="email" name="email" placeholder="Email" required="">
				<input id="input1"  type="number" name="contact" placeholder="Contact" required="">
                          <%  if (!"not".equals(q1)) { %>
				<p class="question">1) <%= q1 %></p>
				<% if ("rating".equals(qt1)) { %>
				  <!-- First set of star ratings -->
        <div class="rating">
            <label for="rating1"></label><br>
            <input type="radio" id="star5_1" name="rating1" value="5">
            <label for="star5_1">&#9733;</label>
            <input type="radio" id="star4_1" name="rating1" value="4">
            <label for="star4_1">&#9733;</label>
            <input type="radio" id="star3_1" name="rating1" value="3">
            <label for="star3_1">&#9733;</label>
            <input type="radio" id="star2_1" name="rating1" value="2">
            <label for="star2_1">&#9733;</label>
            <input type="radio" id="star1_1" name="rating1" value="1">
            <label for="star1_1">&#9733;</label>
        </div>
				<% } else if ("smiley".equals(qt1)) { %>
				<!-- First set of simliys -->
        <div class="simliy">
            <label for="simliy1"></label><br>
            <input type="radio" id="smiley_1" name="rating1" value="5">
            <label for="smiley_1">&#128512;</label> <!-- Smiley emoji -->
            <input type="radio" id="happy_1" name="rating1" value="4">
            <label for="happy_1">&#128515;</label> <!-- Happy emoji -->
            <input type="radio" id="neutral_1" name="rating1" value="3">
            <label for="neutral_1">&#128528;</label> <!-- Neutral emoji -->
            <input type="radio" id="sad_1" name="rating1" value="2">
            <label for="sad_1">&#128577;</label> <!-- Sad emoji -->
            <input type="radio" id="cry_1" name="rating1" value="1">
            <label for="cry_1">&#128546;</label> <!-- Cry emoji -->
        </div>
				<% } else { %>
				<input type="text" name="rating1" placeholder="Enter your answer" id="input1">
				<% }
				 }
                            if (!"not".equals(q2)) { %>
				<p class="question">2) <%= q2 %></p>
				<% if ("rating".equals(qt2)) { %>
				<!-- Second set of star ratings -->
        <div class="rating">
            <label for="rating2"></label><br>
            <input type="radio" id="star5_2" name="rating2" value="5">
            <label for="star5_2">&#9733;</label>
            <input type="radio" id="star4_2" name="rating2" value="4">
            <label for="star4_2">&#9733;</label>
            <input type="radio" id="star3_2" name="rating2" value="3">
            <label for="star3_2">&#9733;</label>
            <input type="radio" id="star2_2" name="rating2" value="2">
            <label for="star2_2">&#9733;</label>
            <input type="radio" id="star1_2" name="rating2" value="1">
            <label for="star1_2">&#9733;</label>
        </div>
				<% } else if ("smiley".equals(qt2)) { %>
				<!-- Second set of simliys -->
        <div class="simliy">
            <label for="simliy2"></label><br>
            <input type="radio" id="smiley_2" name="rating2" value="5">
            <label for="smiley_2">&#128512;</label>
            <input type="radio" id="happy_2" name="rating2" value="4">
            <label for="happy_2">&#128515;</label>
            <input type="radio" id="neutral_2" name="rating2" value="3">
            <label for="neutral_2">&#128528;</label>
            <input type="radio" id="sad_2" name="rating2" value="2">
            <label for="sad_2">&#128577;</label>
            <input type="radio" id="cry_2" name="rating2" value="1">
            <label for="cry_2">&#128546;</label>
        </div>
				<% } else { %>
				<input type="text" name="rating2" placeholder="Enter your answer" id="input1">
				<% } 
				 }
                                    if (!"not".equals(q3)) { %>
				<p class="question" >3) <%= q3 %></p>
				<% if ("rating".equals(qt3)) { %>
				<!-- Third set of star ratings -->
        <div class="rating">
            <label for="rating3"></label><br>
            <input type="radio" id="star5_3" name="rating3" value="5">
            <label for="star5_3">&#9733;</label>
            <input type="radio" id="star4_3" name="rating3" value="4">
            <label for="star4_3">&#9733;</label>
            <input type="radio" id="star3_3" name="rating3" value="3">
            <label for="star3_3">&#9733;</label>
            <input type="radio" id="star2_3" name="rating3" value="2">
            <label for="star2_3">&#9733;</label>
            <input type="radio" id="star1_3" name="rating3" value="1">
            <label for="star1_3">&#9733;</label>
        </div>
        	<% } else if ("smiley".equals(qt3)) { %>
				<!-- Third set of simliys -->
        <div class="simliy">
            <label for="simliy3"></label><br>
            <input type="radio" id="smiley_3" name="rating3" value="5">
            <label for="smiley_3">&#128512;</label>
            <input type="radio" id="happy_3" name="rating3" value="4">
            <label for="happy_3">&#128515;</label>
            <input type="radio" id="neutral_3" name="rating3" value="3">
            <label for="neutral_3">&#128528;</label>
            <input type="radio" id="sad_3" name="rating3" value="2">
            <label for="sad_3">&#128577;</label>
            <input type="radio" id="cry_3" name="rating3" value="1">
            <label for="cry_3">&#128546;</label>
        </div>	
				<% } else { %>
				<input type="text" name="rating3" placeholder="Enter your answer" id="input1">
				<% } 
				 } 

				if (!"not".equals(q4)) { %>
				<p class="question">4) <%= q4 %></p>
				<% if ("rating".equals(qt4)) { %>
				 <!-- Fourth set of star ratings -->
        <div class="rating">
            <label for="rating4"></label><br>
            <input type="radio" id="star5_4" name="rating4" value="5">
            <label for="star5_4">&#9733;</label>
            <input type="radio" id="star4_4" name="rating4" value="4">
            <label for="star4_4">&#9733;</label>
            <input type="radio" id="star3_4" name="rating4" value="3">
            <label for="star3_4">&#9733;</label>
            <input type="radio" id="star2_4" name="rating4" value="2">
            <label for="star2_4">&#9733;</label>
            <input type="radio" id="star1_4" name="rating4" value="1">
            <label for="star1_4">&#9733;</label>
        </div>
				<% } else if ("smiley".equals(qt4)) { %>
				<!-- Fourth set of simliys -->
        <div class="simliy">
            <label for="simliy4"></label><br>
            <input type="radio" id="smiley_4" name="rating4" value="5">
            <label for="smiley_4">&#128512;</label>
            <input type="radio" id="happy_4" name="rating4" value="4">
            <label for="happy_4">&#128515;</label>
            <input type="radio" id="neutral_4" name="rating4" value="3">
            <label for="neutral_4">&#128528;</label>
            <input type="radio" id="sad_4" name="rating4" value="2">
            <label for="sad_4">&#128577;</label>
            <input type="radio" id="cry_4" name="rating4" value="1">
            <label for="cry_4">&#128546;</label>
        </div>
				<% } else { %>
				<input type="text" name="rating4" placeholder="Enter your answer" id="input1">
				<% } 
				 } 
				if (!"not".equals(q5)) { %>
				<p class="question">5) <%= q5 %></p>
				<% if ("rating".equals(qt5)) { %>
				 <div class="rating">
            <label for="rating5"></label><br>
            <input type="radio" id="star5_5" name="rating5" value="5">
            <label for="star5_5">&#9733;</label>
            <input type="radio" id="star4_5" name="rating5" value="4">
            <label for="star4_5">&#9733;</label>
            <input type="radio" id="star3_5" name="rating5" value="3">
            <label for="star3_5">&#9733;</label>
            <input type="radio" id="star2_5" name="rating5" value="2">
            <label for="star2_5">&#9733;</label>
            <input type="radio" id="star1_5" name="rating5" value="1">
            <label for="star1_5">&#9733;</label>
        </div>
        <% } else if ("smiley".equals(qt5)) { %>
				<!-- Fifth set of simliys -->
        <div class="simliy">
            <label for="simliy5"></label><br>
            <input type="radio" id="smiley_5" name="rating5" value="5">
            <label for="smiley_5">&#128512;</label>
            <input type="radio" id="happy_5" name="rating5" value="4">
            <label for="happy_5">&#128515;</label>
            <input type="radio" id="neutral_5" name="rating5" value="3">
            <label for="neutral_5">&#128528;</label>
            <input type="radio" id="sad_5" name="rating5" value="2">
            <label for="sad_5">&#128577;</label>
            <input type="radio" id="cry_5" name="rating5" value="1">
            <label for="cry_5">&#128546;</label>
        </div>	<% } else { %>
				<input type="text" name="rating5" placeholder="Enter your answer" id="input1" >
				<% } 
				  } 
				 }

                   } catch (Exception e) {
                       out.println("<p>Error: " + e.getMessage() + "</p>");
                       e.printStackTrace();
                   } finally {
                       if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                       if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                       if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                   }
                %>

				<button>Submit</button>
			</form>
		</div>
	</div>
    </div>
</body>
</html>