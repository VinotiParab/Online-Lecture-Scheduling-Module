<%-- 
    Document   : add_lecture
    Created on : Jan 26, 2021, 11:03:01 PM
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
            input[type=text], [type=file], [type=email], 
            [type=password], [type=date], [type=time], [type=number], select {
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
        <%!
            String c_id, course, instructor_id, instructor, lec_date, lec_time;
        %>
        <div class="div_center">
            <br><br>
            <h2 style="text-align: center;">SCHEDULE LECTURE</h2>
            <br>
            <form method="post" action="schedule_lecture.jsp">
                <table border="0" align="center" style=" color: black; width: 80%; height: 80%;">
                    <tr>
                        <td>COURSE NAME:</td>
                        <td>
                            <%

                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    System.out.println("Welcome");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/olsm",
                                            "root", "root");
                                    System.out.println("Connection created");
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery("select * from course");
                            %>

                            <select name="course" id="course" style="width: 80%;" required>
                                <%  while (rs.next()) {
                                        c_id = rs.getString(1);
                                        session.setAttribute("c_id", c_id);
                                        course = rs.getString(2);
                                        session.setAttribute("course", course);
                                %>
                                <option><%= rs.getString(2)%></option>
                                <% }%>
                            </select>
                            <%
                                } catch (Exception e) {
                                    out.println("wrong entry" + e);
                                }
                            %>
                        </td>
                    </tr>
                    <tr>
                        <td>INSTRUCTOR NAME:</td>
                        <td>
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    System.out.println("Welcome");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/olsm",
                                            "root", "root");
                                    System.out.println("Connection created");
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery("select * from instructor");
                            %>

                            <select name="instructor" id="instructor" style="width: 80%;" required>
                                <%  while (rs.next()) {
                                        instructor_id = rs.getString(1);
                                        session.setAttribute("instructor_id", instructor_id);
                                        instructor = rs.getString(2);
                                        session.setAttribute("instructor", instructor);

                                %>
                                <option><%= rs.getString(2)%></option>
                                <% }%>
                            </select>
                            <%
                                } catch (Exception e) {
                                    out.println("wrong entry" + e);
                                }
                            %>
                        </td>
                    </tr>
                    <tr>
                        <td>DATE:</td>
                        <td><input type="date" id="lec_date" name="lec_date" style="width: 80%;" required="required"></td>
                    </tr>
                    <tr>
                        <td>LECTURE TIME:</td>
                        <td><input type="time" id="lec_time" name="lec_time" style="width: 80%;" required="required"></td>
                    </tr>
                    <tr>
                        <td>BATCH: </td>
                        <td><input type="text" name="batch" id="batch" style="width: 80%;" required="required"></td>
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
