<%-- 
    Document   : add_process
    Created on : Jan 26, 2021, 3:31:50 PM
    Author     : VINOTI
--%>

<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="javax.servlet.annotation.WebServlet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            PreparedStatement ps;
            ResultSet rs;
            File file;
            int maxSize = 5000 * 1024;
            int maxFactSize = 5000 * 1024;
            String path = "C:/Users/VINOTI/Documents/NetBeansProjects/OLSM/web/Images/";
            String str;
        %>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Welcome");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/olsm", "root", "root");
                System.out.println("Connection created");
                Statement st = con.createStatement();
                ps = null;
                rs = null;
                String coursename = null, level = null, description = null;
                String type = request.getContentType();
                System.out.println(type);
                if (type.indexOf("multipart/form-data") >= 0) {   //check is it multipart or not
                    System.out.print("its an multipart");
                    DiskFileItemFactory disFact = new DiskFileItemFactory();  //for temporary storage
                    disFact.setSizeThreshold(maxFactSize); //limitation on storage i.e threshold
                    disFact.setRepository(new File("c:\\temp")); //temporary file transfer
                    ServletFileUpload upload = new ServletFileUpload(disFact);
                    upload.setSizeMax(maxSize); //setting file size
                    List lis = upload.parseRequest(request);
                    Iterator itr = lis.iterator();
                    while (itr.hasNext()) { //for fetching data
                        FileItem item = (FileItem) itr.next();
                        if (item.isFormField()) {

                            if (item.getFieldName().equals("coursename")) {
                                coursename = item.getString();
                            }
                            if (item.getFieldName().equals("level")) {
                                level = item.getString();
                            }
                            if (item.getFieldName().equals("description")) {
                                description = item.getString();
                            }
                        } else {
                            str = item.getName();
                            str = coursename + (str.substring(str.indexOf(".")));  //for getting the extension
                            System.out.println(str);
                            file = new File(path, str);
                            item.write(file);
                        }
                    }
                }

                ps = con.prepareStatement("insert into course(name, level, description, image) "
                        + " values(?,?,?,?)");
                ps.setString(1, coursename);
                ps.setString(2, level);
                ps.setString(3, description);
                ps.setString(4, str);
                int i = ps.executeUpdate();
                if (i > 0) {
        %>
        <script type="text/javascript">
            alert("Course added sucessfully.");
            window.location = "list_course.jsp";
        </script>
        <%} else {
        %>
        <script type="text/javascript">
            alert("Course is not added successfully.");
            window.location = "add_course.jsp";
        </script>
        <%}
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        %>
    </body>
</html>