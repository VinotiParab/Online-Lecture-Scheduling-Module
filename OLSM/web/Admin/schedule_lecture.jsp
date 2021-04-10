<%-- 
    Document   : schedule_lecture
    Created on : Jan 26, 2021, 12:57:14 AM
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
    </head>
    <body>
        <%
            try {
                Connection con;
                PreparedStatement ps1 = null;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/olsm", "root", "root");
                Statement st = con.createStatement();
                System.out.println("Connection created");
                String c_id = (String) session.getAttribute("c_id");
                String course = request.getParameter("course");
                String instructor_id = (String) session.getAttribute("instructor_id");
                String instructor = request.getParameter("instructor");
                System.out.println(instructor);
                String lec_date = request.getParameter("lec_date");
                String lec_time = request.getParameter("lec_time");
                String batch = request.getParameter("batch");
                PreparedStatement ps = con.prepareStatement("select * from lecture where instructor_id="
                        + "'" +instructor_id + "' AND  lec_date='" + lec_date + "'");
                ResultSet rs = ps.executeQuery();
                if (rs.next() == false) {
                    ps1 = con.prepareStatement("insert into lecture (cid, course_name, instructor_id, instructor_name, "
                            + "lec_date, lec_time, batch) values(?,?,?,?,?,?,?)");
                    ps1.setString(1, c_id);
                    ps1.setString(2, course);
                    ps1.setString(3, instructor_id);
                    ps1.setString(4, instructor);
                    ps1.setString(5, lec_date);
                    ps1.setString(6, lec_time);
                    ps1.setString(7, batch);
                    int i = ps1.executeUpdate();
                    if (i > 0) {

        %>
        <script type="text/javascript">
            alert("You have successfully scheduled the lecture.");
            window.location = "list_lecture.jsp";
        </script>
        <%        } else {
        %>
        <script type="text/javascript">
            alert("Unable to schedule lecture......");
            window.location = "add_lecture.jsp";
        </script>
        <%
            }
        } else {
        %>
        <script type="text/javascript">
            alert("Sorry already the lecture is scheduled.");
            window.location = "list_lecture.jsp";
        </script>
        <%
                }
            } catch (Exception se) {
                se.printStackTrace();
            }
        %>
    </body>
</html>
