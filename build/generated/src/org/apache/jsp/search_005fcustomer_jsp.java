package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class search_005fcustomer_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


 Connection conn = null;
    PreparedStatement stmt = null;
String txtcustid="",custidfetched="",loginid="",user_role="",name="",cust_id="",dob="",address="",phone_no="",email_id="",gender="",nationality="",country="",state="",city="",pincode="",msg = "";
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
cust_id=request.getParameter("custid");
        }
public void fetch_empid(HttpServletRequest request)
        {
custidfetched=request.getParameter("txtcustid");
        }

public void search()
        {
    try
    {
   stmt=conn.prepareStatement("select name,cust_id,loginid,address,ph_no,dob,gender,nationality,country,state,city,pincode,email_id from cust where cust_id=?");
       stmt.setString(1, cust_id);
       ResultSet rs=stmt.executeQuery();
      rs.next();
     txtcustid=rs.getString("cust_id");
     loginid=rs.getString("loginid");
     address=rs.getString("address");
     name=rs.getString("name");
     dob=rs.getString("dob");
     gender=rs.getString("gender");
     phone_no=rs.getString("ph_no");
     country=rs.getString("country");
     nationality=rs.getString("nationality");
     state=rs.getString("state");
     city=rs.getString("city");
     pincode=rs.getString("pincode");
     email_id=rs.getString("email_id");
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
        
            stmt=conn.prepareStatement("delete from login where loginid in (select loginid from cust where cust_id=?)");
           
            stmt.setString(1, custidfetched );
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
txtcustid="";
name="";
address="";
dob="";
gender="";
nationality="";
loginid="";
country="";
state="";
city="";
pincode="";
email_id="";
phone_no="";
    }

if(request.getParameter("btncancel")!=null)
    {
    msg="";
    }
if(request.getParameter("cancel")!=null)
    {
txtcustid="";
name="";
address="";
dob="";
gender="";
nationality="";
loginid="";
country="";
state="";
city="";
pincode="";
email_id="";
phone_no="";

    }

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head><marquee bgcolor=\"sky blue\">\n");
      out.write("        <h2>Search and Delete Customer</h2>   \n");
      out.write("    </marquee>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body bgcolor=\"grey\" >\n");
      out.write("    <form name=\"frm\" action=\"search_customer.jsp\">\n");
      out.write("       \n");
      out.write("   <table align=\"center\" border=\"8\" height=\"100\" width=\"100\" bgcolor=\"white\">\n");
      out.write("       <tr><td>CUSTOMER ID</td><td><input type=\"text\" name=\"custid\"  placeholder=\"Enter Customer Id\" /></td></tr> \n");
      out.write("\n");
      out.write("\n");
      out.write("       <tr><td><input name=\"btnsearch\" type=\"submit\" value=\"Search\" /></td>\n");
      out.write("    <td><input name=\"btncancel\" type=\"submit\" value=\"Cancel\"/></td></tr> \n");
      out.write("</table>\n");
      out.write("        <h2 align=\"center\">Customer details</h2>\n");
      out.write("       <table border=\"1\" align=\"center\" width=\"50\" height=\"50\">\n");
      out.write("           <tbody bgcolor=\"white\">\n");
      out.write("             <tr>\n");
      out.write("           <td>Name</td><td><input type=\"text\" name=\"Name\" value=\"");
      out.print(name);
      out.write("\" readonly=\"readonly\" /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>Customer ID</td><td><input type=\"text\" name=\"txtcustid\" value=\"");
      out.print(txtcustid);
      out.write("\" readonly=\"readonly\" /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>Login ID</td><td><input type=\"text\" name=\"loginid\" value=\"");
      out.print(loginid);
      out.write("\" readonly=\"readonly\" /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>Address</td><td><input type=\"text\" name=\"address\" value=\"");
      out.print(address);
      out.write("\" readonly=\"readonly\" /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>DOB</td><td><input type=\"text\" name=\"dob\" value=\"");
      out.print(dob);
      out.write("\" readonly=\"readonly\"/></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>Gender</td><td><input type=\"text\" name=\"gender\" value=\"");
      out.print(gender);
      out.write("\"readonly=\"readonly\"  /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>Nationality</td><td><input type=\"text\" name=\"nationality\" value=\"");
      out.print(nationality);
      out.write("\"readonly=\"readonly\"  /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>Country</td><td><input type=\"text\" name=\"country\" value=\"");
      out.print(country);
      out.write("\"readonly=\"readonly\"  /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>State</td><td><input type=\"text\" name=\"state\" value=\"");
      out.print(state);
      out.write("\"readonly=\"readonly\"  /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>City</td><td><input type=\"text\" name=\"city\" value=\"");
      out.print(city);
      out.write("\"readonly=\"readonly\"  /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>Pincode</td><td><input type=\"text\" name=\"pincode\" value=\"");
      out.print(pincode);
      out.write("\"readonly=\"readonly\"  /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>Phone NO.</td><td><input type=\"text\" name=\"phno\" value=\"");
      out.print(phone_no);
      out.write("\"readonly=\"readonly\"  /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>Email id</td><td><input type=\"text\" name=\"emailid\" value=\"");
      out.print(email_id);
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
