<%-- 
    Document   : list_course
    Created on : Jan 26, 2021, 11:55:37 PM
    Author     : VINOTI
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="admin_layout.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .div_center
            {
                position: absolute; text-align: center;
                top: 30%;
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
            <h2 style="text-align: center;">LIST OF COURSES</h2>
            <br>
            <table border="1" align="center" style=" color: black; width: 80%; height: 80%;">
                <tr>
                    <th>Course Name</th>
                    <th>Level</th>
                    <th>Description</th>
                </tr>
                <%
                    try {
                        String course, level, description;
                        Class.forName("com.mysql.jdbc.Driver");
                        System.out.println("Welcome");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/olsm",
                                "root", "root");
                        System.out.println("Connection created");
                        Statement st = con.createStatement();
                        PreparedStatement ps = con.prepareStatement("select * from course");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                            course = rs.getString("name");
                            level = rs.getString("level");
                            description = rs.getString("description");
                %>
                <tr>
                    <td><%=course%></td>
                    <td><%=level%></td>
                    <td><%=description%></td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
                } catch (Exception e) {
                    System.out.println("Error: " + e.getMessage());
                }
            %>
        </div>
    </body>
</html>

