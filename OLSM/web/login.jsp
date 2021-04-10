<%-- 
    Document   : login
    Created on : Jan 25, 2021, 11:35:45 PM
    Author     : VINOTI
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
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
    <body style="font-size:25px; align-content: center; background-color: #FA8072">
        <h1  align="center" style=" align-self: center; color: aquamarine;text-shadow: 2px 2px #ff0000;"><b>
                ONLINE LECTURE SCHEDULING MODULE
            </b></h1><br><br>
        <h1  align="center" style=" align-self: center; color: aquamarine;text-shadow: 2px 2px #ff0000;">
            <b>LOGIN</b></h1>
        <br>
        <form method="post">
            <div align="center">
                <table border="0" align="center" style=" color: black; width: 70%; height: 80%;">
                    <tr>
                        <td>EMAIL :</td>
                        <td><input type="email" placeholder="Enter Username" name="email" style="width: 80%;" 
                                   required="required"></td>
                    </tr>
                    <tr>
                        <td>PASSWORD :</td>
                        <td><input type="password" placeholder="Enter Password" name="password" style="width: 80%;" 
                                   required="required"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="SIGN IN" name="submit"></td>
                    </tr>
                </table>
                <br><br>
            </div>
        </form>
    <center>
        <a href="${pageContext.request.contextPath}/main.jsp" style="color:white;">HOME</a>
    </center>
</body>
</html>

<%
    if (request.getParameter("submit") != null) {
        String email = request.getParameter("email");

        String password = request.getParameter("password");
        System.out.println(password);
        if (email.equals("admin@gmail.com") && password.equals("Admin@123")) {
            session.setAttribute("email", "admin@gmail.com");
%>
<script>
    alert("You have successfully login!");
    window.location = "Admin/main_admin.jsp";
</script>
<%} else {
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/olsm", "root", "root");
        System.out.println("Connection created");
        Statement st = con.createStatement();
        PreparedStatement ps = con.prepareStatement("select name,email,password from instructor where "
                + "email=? and password=md5(?)");
        ps.setString(1, email);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            session.setAttribute("email", email);
            String name = rs.getString("name");
            session.setAttribute("name", name);
%>
<script>
    alert("You have successfully login!");
    window.location = "Instructor/main_instructor.jsp";
</script>
<%}
            } catch (Exception se) {
                se.printStackTrace();
            }
        }
    }
%>