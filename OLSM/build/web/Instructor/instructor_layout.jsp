<%-- 
    Document   : instructor_layout
    Created on : Jan 26, 2021, 12:17:49 AM
    Author     : VINOTI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            .sidenav {
                float: left;
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #111;
                overflow-x: hidden;
                transition: 0.5s;
                padding-top: 60px;
            }

            .sidenav a {
                padding: 8px 8px 8px 32px;
                text-decoration: none;
                font-size: 20px;
                color: #ffffff;
                display: block;
                transition: 0.3s;
            }

            .sidenav a:hover {
                color: #ffffff;
            }

            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }

            .topnav {
                overflow: hidden;
                background-color: #00cccc;
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
            }

            .topnav a {
                float: left;
                display: block;
                color: #f2f2f2;
                text-align: center; 
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }

            .topnav .icon {
                display: none;
            }

            td 
            {
                text-align: center; 
                vertical-align: middle;
            }

        </style>

        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "250px";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }
        </script>

    </head>

    <body style="font-family:Verdana; background-color: #e5e5e5;">

        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="main_instructor.jsp">Home</a>
            <a href="lecture_assign.jsp">Lecture</a>
        </div>


        <div class="topnav" id="myTopnav">
            <table  style="width: 100%;">
                <tr>
                    <td>
                        <a href="#OLSM | Online Lecture Scheduling Module" >
                            <span style="font-size:3vw;color:#ffffff;cursor:pointer" onclick="openNav()">&#9776; 
                                OLSM | Online Lecture Scheduling Module</a></span> 
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/logout.jsp" style="color:white;">LOGOUT</a>
                    </td>
                </tr>
            </table>
        </div>

    </body>
</html>

