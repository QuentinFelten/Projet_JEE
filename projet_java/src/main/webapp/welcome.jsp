<%-- 
    Document   : welcome
    Created on : 18 sept. 2020, 14:42:14
    Author     : remyc
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!--Display current user's name
            and password, for debugging resons-->
        <%
            User myUser = (User)request.getAttribute("keyUser");
            String login = myUser.getUsername();
            String password = myUser.getPassword();
        %>
        <h1>Your login is: <%= login %></h1>
        <h1>Your password is: <%= password %></h1>
    </body>
</html>
