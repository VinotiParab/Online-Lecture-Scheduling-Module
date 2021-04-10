package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Properties;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class list_005flecture_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("            <br><br>\n");
      out.write("            <h2 style=\"text-align: center;\">LIST OF LECTURE</h2>\n");
      out.write("            <br><br>\n");
      out.write("            <table border=\"1\" align=\"center\" style=\" color: black; width: 80%; height: 80%;\">\n");
      out.write("                <tr>\n");
      out.write("                    <th>Lecture id</th>\n");
      out.write("                    <th>Course Name</th>\n");
      out.write("                    <th>Instructor Name</th>\n");
      out.write("                    <th>Date</th>\n");
      out.write("                    <th>Time</th>\n");
      out.write("                    <th>Batch</th>\n");
      out.write("                </tr>\n");
      out.write("                ");

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
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print(lec_id);
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(cname);
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(iname);
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(lec_date);
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(lec_time);
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(batch);
      out.write("</td>\n");
      out.write("                </tr>\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("            </table>\n");
      out.write("            ");

                } catch (Exception e) {
                    System.out.println("Error: " + e.getMessage());
                }
            
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
