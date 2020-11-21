<%-- 
    Document   : index
    Created on : 18 sept. 2020, 14:34:48
    Author     : remyc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    
    <%-- include header 
    <%@ include file = "WEB-INF\header.jsp"%>--%>
    
    
    <body>
        <h1>Welcome to our JEE project</h1>
        <%
            String errMsg = (String) request.getAttribute("keyErrMsg");
            if(errMsg != null) out.println(errMsg);
        %>
        <form name="frm_index" action="Controller">
            <label>Login : </label><input type="text" name="loginForm" /><br />
            <label>Password : </label><input type="text" name="passForm" /><br />
            <input type="submit" name="btn_Send" value="Send" />
        </form>
    </body>
    
    
    <%-- include header 
    <%@ include file = "WEB-INF\footer.jsp"%>--%>
    
    
</html>
