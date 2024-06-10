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
         if(session != null)
         {
        	 
        	 session.setAttribute("userid" , "0");
                  %>
                  <jsp:forward page="index.html"/>
              <%
                  
         } else {
            out.println(
            "<h2> no session found </h2>");
         }
      %>
</body>
</html>