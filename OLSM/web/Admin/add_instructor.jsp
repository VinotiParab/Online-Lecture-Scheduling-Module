<%-- 
    Document   : add_instructor
    Created on : Jan 26, 2021, 12:55:14 AM
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
            <h2 style="text-align: center;">ADD INSTRUCTOR</h2>
            <br>
            <form method="post" >
                <table border="0" align="center" style=" color: black; width: 80%; height: 80%;">
                    <tr>
                        <td>INSTRUCTOR NAME :</td>
                        <td><input type = "text" name = "iname" placeholder="Enter Name" style="width: 80%;" 
                                   required="required"/></td>
                    </tr>
                    <tr>
                        <td>EMAIL :</td>
                        <td><input type = "email" placeholder="Enter Email" name="email" 
                                   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" style="width: 80%;" 
                                   required="required"/></td>
                    </tr>
                    <tr>
                        <td>PASSWORD  :</td>
                        <td><input type = "password" placeholder="Enter Password" name="password" 
                                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" 
                                   title="Must contain at least one number and one uppercase 
                                   and lowercase letter, and at least 6 or more characters" 
                                   style="width: 80%;" required="required"/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="submit" value="SUBMIT"></td>
                        <td><input type="reset" name="reset" value="RESET"></td>
                    </tr>
                </table>
            </form>
        </div>
        <%
            if (request.getParameter("submit") != null) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Welcome");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/olsm", "root", "root");
                    System.out.println("Connection created");
                    Statement st = con.createStatement();
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    String name = request.getParameter("iname");
                    String email = request.getParameter("email");
                    String pass = request.getParameter("password");
                    ps = con.prepareStatement("insert into instructor(name, email, password) "
                            + "values(?,?,md5(?))");
                    ps.setString(1, name);
                    ps.setString(2, email);
                    ps.setString(3, pass);
                    int i = ps.executeUpdate();
                    if (i > 0) {
        %>
        <script type="text/javascript">
            alert("You are sucessfully added the instructor");
            window.location = "list_instructor.jsp";
        </script>
        <%
        } else {
        %>
        <script type="text/javascript">
            alert("Unable to add instructor.....");
            window.location = "add_instructor.jsp";
        </script>
        <%
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        %>
    </body>
</html>