<%-- 
    Document   : add_course
    Created on : Jan 26, 2021, 12:56:46 AM
    Author     : VINOTI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="admin_layout.jsp" />

<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .div_center
            {
                position: absolute; text-align: center;
                top: 50%;
                left: 50%;
                margin-right: -50%;
                width: 80%;
                transform: translate(-50%, -50%);
                font-size: 20px;
            }
            td 
            {
                text-align: center; 
                vertical-align: middle;
            }
            input[type=text], [type=file], [type=email], [type=password], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type=submit],[type= reset] {
                width: 5cm;
                height: 1.5cm;
                font-size : 20px;
                font-weight: bold;
                font-family: Arial,Helvetica,sans-serif;
                border-radius: 20px 20px 20px 20px;
            }
        </style>
    </head>
    <body>
        <div class="div_center">
            <br><br>
            <h2 style="text-align: center;">ADD COURSE</h2>
            <br>
            <form method="post" action="add_process.jsp" enctype = "multipart/form-data">
                <table border="0" align="center" style=" color: black; width: 80%; height: 80%;">
                    <tr>
                        <td>COURSE NAME:</td>
                        <td><input type="text" name="coursename" id="cname" style="width: 80%;" required="required"></td>
                    </tr>
                    <tr>
                        <td>LEVEL:</td>
                        <td><select name="level" id="level" style="width: 80%;" required>
                                <option value="">-Choose a level-</option>
                                <option value="Beginner">Beginner</option>
                                <option value="Intermediate">Intermediate</option>
                                <option value="Advanced">Advanced</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>DESCRIPTION:</td>
                        <td><input type="text" name="description" id="description" style="width: 80%;" 
                                   required="required"></td>
                    </tr>
                    <tr>
                        <td>IMAGE:</td>
                        <td><input type = "file" name = "image" id="image" style="width: 80%;" required="required"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="SUBMIT"></td>
                        <td><input type="reset" value="RESET"></td>
                    </tr>
                </table>
            </form>
        </div>


    </body>
</html>
