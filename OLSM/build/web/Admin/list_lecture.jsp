<%-- 
    Document   : list_lecture
    Created on : Jan 26, 2021, 10:20:03 PM
    Author     : VINOTI
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Properties"%>
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
            <h2 style="text-align: center;">LIST OF LECTURE</h2>
            <br>
            <table border="1" align="center" style=" color: black; width: 80%; height: 80%;">
                <tr>
                    <th>Lecture id</th>
                    <th>Course Name</th>
                    <th>Instructor Name</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Batch</th>
                </tr>
                <%
                    try {
                        String lec_id, cname, iname, lec_date, lec_time, batch;
                        Class.forName("com.mysql.jdbc.Driver");
                        System.out.println("Welcome");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/olsm",
                                "root", "root");
                        System.out.println("Connection created");
                        Statement st = con.createStatement();
                        PreparedStatement ps = con.prepareStatement("select * from lecture");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                            lec_id = rs.getString("lecture_id");
                            cname = rs.getString("course_name");
                            iname = rs.getString("instructor_name");
                            lec_date = rs.getString("lec_date");
                            lec_time = rs.getString("lec_time");
                            batch = rs.getString("batch");
                %>
                <tr>
                    <td><%=lec_id%></td>
                    <td><%=cname%></td>
                    <td><%=iname%></td>
                    <td><%=lec_date%></td>
                    <td><%=lec_time%></td>
                    <td><%=batch%></td>
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
