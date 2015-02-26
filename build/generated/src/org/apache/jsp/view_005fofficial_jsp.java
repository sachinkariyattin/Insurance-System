package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Vector;
import java.sql.*;

public final class view_005fofficial_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    String msg = "";
    Vector vname= new Vector();
    Vector vloginid = new Vector();
    Vector vaddress = new Vector();
    Vector vemailid = new Vector();
    Vector vdsgn = new Vector();
    Vector vdoj = new Vector();
    Vector vgender = new Vector();
    Vector vslno=new Vector();
    Vector vempid = new Vector();
    
   
   
    Connection conn = null;
    PreparedStatement stmt = null;

   public void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:sample"," "," ");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }

    public void fetch() {
        try {
            stmt = conn.prepareStatement("select slno,name,empid,emailid,designation,address,gender,doj,loginid from companyofficial");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                vslno.add(rs.getString("slno"));
                vloginid.add(rs.getString("loginid"));
                vaddress.add(rs.getString("address"));
                vemailid.add(rs.getString("emailid"));
                vempid.add(rs.getString("empid"));
                vdsgn.add(rs.getString("designation"));
                vdoj.add(rs.getString("doj"));
                vname.add(rs.getString("name"));
                vgender.add(rs.getString("gender"));
                
                


            }
            rs.close();
            stmt.close();

        } catch (Exception e) {
            msg = e.getMessage();
        }
    }


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
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");


connect();
fetch();


      out.write("\n");
      out.write("<html>\n");
      out.write("    <head><marquee bgcolor=\"sky blue\">\n");
      out.write("        <h2>LIST OF EMPLOYEES</h2>   \n");
      out.write("    </marquee>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body bgcolor=\"grey\">\n");
      out.write("        <h2><a href=\"Admin.jsp\">Admin</h2></a>\n");
      out.write("    <form action=\"view_official.jsp\">\n");
      out.write("         \n");
      out.write("        <table border=\"1\" align=\"center\" width=\"50\" height=\"50\" bgcolor=\"white\">\n");
      out.write("<thead>\n");
      out.write("<h3><th>SLNO</th>\n");
      out.write("<th>NAME</th>\n");
      out.write("<th>LOGINID</th>\n");
      out.write("<th>ADDRESS</th>\n");
      out.write("<th>EMPID</th>\n");
      out.write("<th>DOJ</th>\n");
      out.write("<th>GENDER</th>\n");
      out.write("<th>EMAILID</th>\n");
      out.write("<th>DESIGNATION</th>\n");
      out.write("</tr></h3>\n");
      out.write("\n");
      out.write("</thead>\n");
      out.write("<tbody bgcolor=\"white\">\n");
      out.write("<tr>\n");
      out.write("    ");

    
    for(int i=0;i<vaddress.size();i++)
        {
    
 
      out.write("\n");
      out.write(" <td>");
      out.print(vslno.get(i));
      out.write("</td>\n");
      out.write("<td>");
      out.print(vname.get(i));
      out.write("</td>\n");
      out.write("<td>");
      out.print(vloginid.get(i));
      out.write("</td>\n");
      out.write("<td>");
      out.print(vaddress.get(i));
      out.write("</td>\n");
      out.write("<td>");
      out.print(vempid.get(i));
      out.write("</td>\n");
      out.write("<td>");
      out.print(vdoj.get(i));
      out.write("</td>\n");
      out.write("<td>");
      out.print(vgender.get(i));
      out.write("</td>\n");
      out.write("<td>");
      out.print(vemailid.get(i));
      out.write("</td>\n");
      out.write("<td>");
      out.print(vdsgn.get(i));
      out.write("</td>\n");
      out.write("</tr>\n");
}  vname.clear();
vloginid.clear();
vaddress.clear();
vemailid.clear();
vdoj.clear();
vgender.clear();
vempid.clear();
vdsgn.clear();
vslno.clear();

      out.write("\n");
      out.write("\n");
      out.write("</tbody>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("\n");
      out.print(msg);
      out.write("\n");
      out.write("</form>\n");
      out.write("        \n");
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
