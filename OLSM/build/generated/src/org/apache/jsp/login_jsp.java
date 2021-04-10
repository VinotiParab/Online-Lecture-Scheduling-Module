package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <style>\n");
      out.write("            td \n");
      out.write("            {\n");
      out.write("                text-align: center; \n");
      out.write("                vertical-align: middle;\n");
      out.write("            }\n");
      out.write("            input[type=text], [type=file], [type=email], [type=password], select {\n");
      out.write("                width: 100%;\n");
      out.write("                padding: 12px 20px;\n");
      out.write("                margin: 8px 0;\n");
      out.write("                display: inline-block;\n");
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
      out.write("    <body style=\"font-size:25px; align-content: center; background-color: #FA8072\">\n");
      out.write("        <h1  align=\"center\" style=\" align-self: center; color: aquamarine;text-shadow: 2px 2px #ff0000;\"><b>\n");
      out.write("                ONLINE LECTURE SCHEDULING MODULE\n");
      out.write("            </b></h1><br><br>\n");
      out.write("        <h1  align=\"center\" style=\" align-self: center; color: aquamarine;text-shadow: 2px 2px #ff0000;\">\n");
      out.write("            <b>LOGIN</b></h1>\n");
      out.write("        <br>\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <div align=\"center\">\n");
      out.write("                <table border=\"0\" align=\"center\" style=\" color: black; width: 70%; height: 80%;\">\n");
      out.write("                    <tr>\n");
      out.write("                        <td>EMAIL :</td>\n");
      out.write("                        <td><input type=\"email\" placeholder=\"Enter Username\" name=\"email\" style=\"width: 80%;\" \n");
      out.write("                                   required=\"required\"></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>PASSWORD :</td>\n");
      out.write("                        <td><input type=\"password\" placeholder=\"Enter Password\" name=\"password\" style=\"width: 80%;\" \n");
      out.write("                                   required=\"required\"></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td colspan=\"2\" align=\"center\"><input type=\"submit\" value=\"SIGN IN\" name=\"submit\"></td>\n");
      out.write("                    </tr>\n");
      out.write("                </table>\n");
      out.write("                <br><br>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("    <center>\n");
      out.write("        <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/main.jsp\" style=\"color:white;\">HOME</a>\n");
      out.write("    </center>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");

    if (request.getParameter("submit") != null) {
        String email = request.getParameter("email");

        String password = request.getParameter("password");
        System.out.println(password);
        if (email.equals("admin@gmail.com") && password.equals("Admin@123")) {
            session.setAttribute("email", "admin@gmail.com");

      out.write("\n");
      out.write("<script>\n");
      out.write("    alert(\"You have successfully login!\");\n");
      out.write("    window.location = \"Admin/main_admin.jsp\";\n");
      out.write("</script>\n");
} else {
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

      out.write("\n");
      out.write("<script>\n");
      out.write("    alert(\"You have successfully login!\");\n");
      out.write("    window.location = \"Instructor/main_instructor.jsp\";\n");
      out.write("</script>\n");
}
            } catch (Exception se) {
                se.printStackTrace();
            }
        }
    }

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
