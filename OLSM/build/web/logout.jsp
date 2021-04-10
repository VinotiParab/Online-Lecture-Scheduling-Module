<%-- 
    Document   : logout
    Created on : Jan 25, 2021, 11:39:34 PM
    Author     : VINOTI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            session.invalidate();

        %>
        <script type="text/javascript">
            alert("You have successfully logged out.");
            window.location = "main.jsp";
        </script>
    </body>
</html>