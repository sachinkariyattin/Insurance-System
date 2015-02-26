package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class search_005fofficial_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


 Connection conn = null;
    PreparedStatement stmt = null;
String msg="",empid="",loginid="",address="",doj="",dsgn="",gender="",name="",txtempid="",empidfetched="";
    void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:sample"," "," ");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }
    
public void fetch_name(HttpServletRequest request)
        {
empid=request.getParameter("empid");
        }
public void fetch_empid(HttpServletRequest request)
        {
empidfetched=request.getParameter("txtempid");
        }

public void search()
        {
    try
    {
   stmt=conn.prepareStatement("select name,empid,loginid,address,designation,doj,gender from companyofficial where empid=?");
       stmt.setString(1, empid);
       ResultSet rs=stmt.executeQuery();
      rs.next();
     txtempid=rs.getString("empid");
     loginid=rs.getString("loginid");
     address=rs.getString("address");
     dsgn=rs.getString("designation");
     doj=rs.getString("doj");
     gender=rs.getString("gender");
     name=rs.getString("name");
     rs.close();
     stmt.clearParameters();
     stmt.close();
     msg="search successfull";
    }
    catch(Exception e)
        {
         msg="NO DETAILS FOUND";
        }
    
}
public  void delete()
        {
    try
            {
        
            stmt=conn.prepareStatement("delete from login where loginid in (select loginid from companyofficial where empid=?)");
           
            stmt.setString(1, empidfetched );
            stmt.executeUpdate();
            stmt.clearParameters();
            stmt.close();
            msg="DATA IS DELETED";
                       }
    catch(Exception e)
        {
        msg=e.getMessage();
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
      out.write("<!DOCTYPE html>\n");
      out.write('\n');
      out.write('\n');


if(request.getParameter("btnsearch")!=null)
    {
    connect();
    fetch_name(request);
    search();
    }
if(request.getParameter("btndelete")!=null)
    {
connect();
fetch_empid(request);
delete();
txtempid="";
dsgn="";
address="";
doj="";
gender="";
name="";
loginid="";
    }

if(request.getParameter("btncancel")!=null)
    {
    msg="";
    }
if(request.getParameter("cancel")!=null)
    {
    msg="";
    txtempid="";
   dsgn="";
address="";
doj="";
gender="";
name="";
loginid="";
    }

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head><marquee bgcolor=\"sky blue\">\n");
      out.write("        <h1>Search and Delete employee</h1>   \n");
      out.write("    </marquee>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <script>\n");
      out.write("    function valid(frm)\n");
      out.write("        {\n");
      out.write("            if(frm.empid.value.trim()==\"\")\n");
      out.write("                {\n");
      out.write("                    alert(\"ENTER EMPLOYEE ID TO SEARCH\");\n");
      out.write("                    frm.empid.value.focus();\n");
      out.write("                    return false;\n");
      out.write("                }   \n");
      out.write("         }\n");
      out.write("    </script>\n");
      out.write("    <body bgcolor=\"grey\" >\n");
      out.write("        <h2><a href=\"Admin.jsp\">Admin</h2></a>\n");
      out.write("    <form name=\"frm\" action=\"search_official.jsp\">\n");
      out.write("       \n");
      out.write("   <table align=\"center\" border=\"8\" height=\"100\" width=\"100\" bgcolor=\"white\">\n");
      out.write("       <tr><td>EMPLOYEE ID</td><td><input type=\"text\" name=\"empid\"  placeholder=\"Enter employee Id\" /></td></tr> \n");
      out.write("\n");
      out.write("\n");
      out.write("       <tr><td><input name=\"btnsearch\" type=\"submit\" value=\"Search\" onfocus=\"return valid(frm)\"/></td>\n");
      out.write("    <td><input name=\"btncancel\" type=\"submit\" value=\"Cancel\"/></td></tr> \n");
      out.write("</table>\n");
      out.write("        <h2 align=\"center\">Employee details</h2>\n");
      out.write("       <table border=\"1\" align=\"center\" width=\"50\" height=\"50\">\n");
      out.write("           <tbody bgcolor=\"white\">\n");
      out.write("             <tr>\n");
      out.write("           <td>Name</td><td><input type=\"text\" name=\"Name\" value=\"");
      out.print(name);
      out.write("\" readonly=\"readonly\" /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>Employee ID</td><td><input type=\"text\" name=\"txtempid\" value=\"");
      out.print(txtempid);
      out.write("\" readonly=\"readonly\" /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>Login ID</td><td><input type=\"text\" name=\"loginid\" value=\"");
      out.print(loginid);
      out.write("\" readonly=\"readonly\" /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>City</td><td><input type=\"text\" name=\"address\" value=\"");
      out.print(address);
      out.write("\" readonly=\"readonly\" /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>DOJ</td><td><input type=\"text\" name=\"doj\" value=\"");
      out.print(doj);
      out.write("\" readonly=\"readonly\"/></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>Gender</td><td><input type=\"text\" name=\"gender\" value=\"");
      out.print(gender);
      out.write("\"readonly=\"readonly\"  /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("               <td><input type=\"submit\" value=\"delete\" name=\"btndelete\"  /></td>\n");
      out.write("                <td><input type=\"submit\" value=\"cancel\" name=\"cancel\" /></td>\n");
      out.write("                </tr>\n");
      out.write("</tbody>\n");
      out.write("     \n");
      out.write("</table>  \n");
      out.write("</form>\n");
      out.write("               </body>\n");
      out.write("\n");
      out.write("  <script>\n");
      out.write("            ");
        
       if(request.getParameter("btndelete")!=null)
                     {
             
      out.write("               \n");
      out.write("         alert(\"");
      out.print(msg);
      out.write("\");\n");
      out.write("         ");

                 }
         
      out.write("\n");
      out.write("             ");

             if(request.getParameter("btnsearch")!=null)
                     {
             
      out.write("               \n");
      out.write("         alert(\"");
      out.print(msg);
      out.write("\");\n");
      out.write("         ");

                 }
         
      out.write("\n");
      out.write("         </script>\n");
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
