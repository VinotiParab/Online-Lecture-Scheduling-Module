package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class add_005finstructor_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "admin_layout.jsp", out, false);
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <style>\n");
      out.write("            .div_center\n");
      out.write("            {\n");
      out.write("                margin-left: auto;\n");
      out.write("                margin-right: auto;\n");
      out.write("                font-size: 20px;\n");
      out.write("            }\n");
      out.write("            td \n");
      out.write("            {\n");
      out.write("                text-align: center; \n");
      out.write("                vertical-align: middle;\n");
      out.write("            }\n");
      out.write("            input[type=text], [type=file], [type=email], [type=password], select {\n");
      out.write("                width: 100%;\n");
      out.write("                padding: 12px 20px;\n");
      out.write("                margin: 8px 0;\n");
      out.write("                border: 1px solid #ccc;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("            }\n");
      out.write("            input[type=submit],[type= reset] {\n");
      out.write("                width: 5cm;\n");
      out.write("                height: 1.5cm;\n");
      out.write("                font-size : 20px;\n");
      out.write("                font-weight: bold;\n");
      out.write("                font-family: Arial,Helvetica,sans-serif;\n");
      out.write("                border-radius: 20px 20px 20px 20px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"div_center\">\n");
      out.write("            <h2 style=\"text-align: center;\">ADD INSTRUCTOR</h2>\n");
      out.write("            <br><br>\n");
      out.write("            <form method=\"post\" >\n");
      out.write("                <table border=\"0\" align=\"center\" style=\" color: black; width: 80%; height: 80%;\">\n");
      out.write("                    <tr>\n");
      out.write("                        <td>INSTRUCTOR NAME :</td>\n");
      out.write("                        <td><input type = \"text\" name = \"iname\" placeholder=\"Enter Name\" style=\"width: 80%;\" \n");
      out.write("                                   required=\"required\"/></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>EMAIL :</td>\n");
      out.write("                        <td><input type = \"email\" placeholder=\"Enter Email\" name=\"email\" \n");
      out.write("                                   pattern=\"[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,3}$\" style=\"width: 80%;\" \n");
      out.write("                                   required=\"required\"/></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>PASSWORD  :</td>\n");
      out.write("                        <td><input type = \"password\" placeholder=\"Enter Password\" name=\"password\" \n");
      out.write("                                   pattern=\"(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{6,}\" \n");
      out.write("                                   title=\"Must contain at least one number and one uppercase \n");
      out.write("                                   and lowercase letter, and at least 6 or more characters\" \n");
      out.write("                                   style=\"width: 80%;\" required=\"required\"/></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><input type=\"submit\" name=\"submit\" value=\"SUBMIT\"></td>\n");
      out.write("                        <td><input type=\"reset\" name=\"reset\" value=\"RESET\"></td>\n");
      out.write("                    </tr>\n");
      out.write("                </table>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            alert(\"You are sucessfully added the instructor\");\n");
      out.write("            window.location = \"list_instructor.jsp\";\n");
      out.write("        </script>\n");
      out.write("        ");

        } else {
        
      out.write("\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            alert(\"Unable to add instructor.....\");\n");
      out.write("            window.location = \"add_instructor.jsp\";\n");
      out.write("        </script>\n");
      out.write("        ");

                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
