 <%@page import="java.io.InputStream"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.Cookie" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	<title>3G_INFOTECH</title>
<script src="https://cdn.tailwindcss.com"></script>
<link href="css/homeCss.css" rel="stylesheet" type="text/css"/>
<title>EGINFOTECH</title>
</head>

<body style="background-color : rgb(213, 216, 220);">
        

	<nav class="navbar navbar-expand-lg navbar-light "
		style="display: flex; background-color: rgb(94 165 237);">
		<div class="container-fluid" style="width: 90%;">
			<img alt="logo" src="./image/logoYT-removebg-preview.png"
				style="height: 150px">
		</div>
		<div>
		<form action="logout.jsp">
			<button class="bg-blue-500 text-white py-2 px-4  "
				style="margin-top: 50px; border-radius: 2cap;"
				>Logout</button>
				</form>
		</div>
	</nav>
	<div class="min-h-screen flex">
            <% String id = (String) session.getAttribute("userid");%>
            <div class="w-64 bg-dark text-white flex flex-col items-center py-4">
                
                         <img class="rounded-full mb-4" src="displayImage "  style="height: 100px; widht: 100px; backgroung-color: white;" alt="User Photo">
		       <span class="text-xl font-semibold mb-4">Test User</span>
        <nav class="flex flex-col w-full px-4">
            <a href="#" class="flex items-center py-2 px-4 bg-cyan-500 rounded" style="text-decoration: none ;color: white;">
                <span class="material-icons">grid_view</span> <span class="ml-2">Home</span>
            </a> 
            <a href="createform.jsp" class="flex items-center py-2 px-4  rounded mt-2" style="text-decoration: none;color: white;"  id="button">
                <span class="material-icons">add_circle</span> <span class="ml-2">Create Form</span>
            </a> 
            <a href="form_list.jsp" class="flex items-center py-2 px-4  rounded mt-2" style="text-decoration: none;color: white;"  id="button">
                <span class="material-icons">list</span> <span class="ml-2">List of Forms</span>
            </a>
        </nav>
    </div>

		<div class="flex-1 p-6">
        <div class="flex-1 p-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
               <div class="bg-white p-6 rounded-lg shadow-md">
        <h2 class="text-xl font-semibold mb-4">Welcome to Feedback Portal</h2>
        <img src="./image/logoYT-removebg-preview.png" alt="Your Take Logo" class="mx-auto">
      </div>
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <div class="flex justify-between items-center mb-4">
                        <h2 class="text-xl font-semibold">Company Details</h2>
                        <i class="fa-solid fa-pencil" id="pencil"></i>
                        
                    </div>
         <% 
                        Connection con = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
                        
                        try {
                            // Connect to the database
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/try", "root", "password");
                            
                            // Prepare SQL statement

                            //String id = (String) session.getAttribute("userid");
                            
                            String sql = "SELECT * FROM login_data WHERE id = ?";
                            pstmt = con.prepareStatement(sql);
                            pstmt.setString(1, id);
                            
                            // Execute the query
                            rs = pstmt.executeQuery();
                            
                            // Process the result
                            if (rs.next()) {
                                String companyName = rs.getString("company");
                                String branchName = rs.getString("branch");
                                String contact = rs.getString("contact");
                                String address = rs.getString("address");
                    %>
                      <p><strong>Company Name :</strong> <%= companyName %></p>
                                <div class="mt-4">
                                    <h3 class="text-md font-semibold">Branch Details</h3>
                                    <p><strong>Branch Name :</strong> <%= branchName %></p>
                                    <p><strong>Contact :</strong> <%= contact %></p>
                                    <p><strong>Address :</strong> <%= address %></p>
                                </div>
                    <%
                            } else {
                                // User not found in database
                                out.println("<p>User not found.</p>");
                            }
                        } catch (Exception e) {
                            // Error handling
                            out.println("<p>Error: " + e.getMessage() + "</p>");
                            e.printStackTrace();
                        } finally {
                            // Close resources
                            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    %>
                    
       
  </div>   
		</div>
	</div>
</div>
</div>
<div id="popUpForm" class="popup">
        <div class="popup-content">
            <span class="closeBtn">&times;</span>
            <form action="submit" method="post" class="space-y-4"  enctype="multipart/form-data">
                <div>
                    <label for="companyname" class="block">Company Name:</label>
                    <input type="text" id="companyname" name="companyname" class="w-full p-2 border border-gray-300 rounded" required>
                </div>
                <div>
                    <label for="branchname" class="block">Branch Name:</label>
                    <input type="text" id="branchname" name="branchname" class="w-full p-2 border border-gray-300 rounded" required>
                </div>
                <div>
                    <label for="contact" class="block">Contact:</label>
                    <input type="text" id="contact" name="contact" class="w-full p-2 border border-gray-300 rounded" required>
                </div>
                <div>
                    <label for="address" class="block">Address:</label>
                    <input type="text" id="address" name="address" class="w-full p-2 border border-gray-300 rounded" required>
                </div>
                <div>
                    <label for="image" class="block">image:</label>
                    <input type="file" name="imageFile" id="imageFile" class="w-full p-2 border border-gray-300 rounded" accept="image/*" required>
                </div>
                 
                <div class="text-center">
                    <input type="submit" id="submitbtn" value="Submit" class="bg-green-500 text-white py-2 px-4 rounded">
                </div>
            </form>
        </div>
    </div>


	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
		rel="stylesheet">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    
	<script>
	document.addEventListener('DOMContentLoaded', function () {
	    var pencilIcon = document.getElementById('pencil');
	    var popUpForm = document.getElementById('popUpForm');
	    var closeBtn = document.querySelector('.closeBtn');

	    pencilIcon.addEventListener('click', function () {
	        popUpForm.style.display = 'flex';
	    });

	    closeBtn.addEventListener('click', function () {
	        popUpForm.style.display = 'none';
	    });

	    window.addEventListener('click', function (event) {
	        if (event.target == popUpForm) {
	            popUpForm.style.display = 'none';
	        }
	    });
	});

    </script>
</body>
</html>