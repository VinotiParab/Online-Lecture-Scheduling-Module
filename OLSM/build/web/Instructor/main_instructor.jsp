<%-- 
    Document   : main_instructor
    Created on : Jan 25, 2021, 11:39:00 PM
    Author     : VINOTI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="instructor_layout.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body style="font-family:Verdana;">

        <div style="position: absolute; text-align: center;
             top: 50%;
             left: 50%;
             margin-right: -50%;
             transform: translate(-50%, -50%)">
            <br><br>
            <h1>Welcome <%=session.getAttribute("name")%></h1>
            <br>
            <p>The instructor can view list of all lectures assigned with dates and course names.  
            </p>
        </div>

        <br>

    </body>
</html>

