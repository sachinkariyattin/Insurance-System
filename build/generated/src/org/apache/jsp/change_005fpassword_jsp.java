package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class change_005fpassword_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


 Connection conn = null;
    PreparedStatement stmt = null;
String var_oldpwd="",msg="",newpass="",password="",loginid="",confpass="",dsgn="",branch="",var_loginid="",oldpass="";
    void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:sample"," "," ");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }
    

public void fetch_login(HttpServletRequest request)
        {
     HttpSession obj=request.getSession(false);

        var_loginid=obj.getAttribute("session_loginid").toString();
    var_oldpwd=obj.getAttribute("session_pwd").toString();
    
    
}

public void fetch(HttpServletRequest request)
               {
    oldpass=request.getParameter("password");
     newpass=request.getParameter("newpass");
    confpass=request.getParameter("confpass");
}
public void search()
        {
    try
    {
   stmt=conn.prepareStatement("select loginid,password from login where loginid=?");
       stmt.setString(1, var_loginid);
       ResultSet rs=stmt.executeQuery();
      rs.next();
     loginid=rs.getString("loginid");
   password=rs.getString("password");
  //   dsgn=rs.getString("designation");
    // emailid=rs.getString("emailid");
    // branch=rs.getString("branch");
     rs.close();
     stmt.clearParameters();
     stmt.close();
     
    }
    catch(Exception e)
        {
         msg="NO DETAILS FOUND";
        }
    
}




public  void update()
        {
    try
        {
        if(password.equals(oldpass))
        {
        if(newpass.equals(confpass))
        {
     
       stmt=conn.prepareStatement("update login set password=? where loginid=?");

stmt.setString(1,confpass);
stmt.setString(2,var_loginid);
stmt.executeUpdate();
stmt.clearParameters();
stmt.close();
msg="updated..";

    
    } else
        msg="new password and confirm password does not match";
               }
   
   else
             {
       msg="old password and new password does not match";
    }}
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write('\n');
      out.write('\n');



    fetch(request);
       fetch_login(request); connect();
    search();
   if(request.getParameter("change")!=null)
          {
       update();
   }
    
    



    

      out.write("\n");
      out.write(" <h1 bgcolor=\"skyblue\">WELCOME:");
      out.print(var_loginid);
      out.write("</h1>\n");
      out.write(" <html>\n");
      out.write("    <head><marquee bgcolor=\"orange\">\n");
      out.write("        <h1>Change Password</h1>   \n");
      out.write("    </marquee>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <script>\n");
      out.write("    function valid(frm)\n");
      out.write("        {\n");
      out.write("            if(frm.loginid.value.trim()==\"\")\n");
      out.write("                {\n");
      out.write("                    alert(\"ENTER ID TO SEARCH\");\n");
      out.write("                    frm.loginid.value.focus();\n");
      out.write("                    return false;\n");
      out.write("                }   \n");
      out.write("         }\n");
      out.write("    </script>\n");
      out.write("    <script>    \n");
      out.write("         ");
        
       if(request.getParameter("change")!=null)
                     {
             
      out.write("               \n");
      out.write("       \n");
      out.write("             alert(\"");
      out.print(msg);
      out.write("\");\n");
      out.write("             \n");
      out.write("         ");

                 }
          
      out.write("\n");
      out.write("    </script>\n");
      out.write("    <script>\n");
      out.write("        function valid(frm)\n");
      out.write("        {\n");
      out.write("            if(frm.password.value.trim()==\"\")\n");
      out.write("                {\n");
      out.write("                    alert(\"ENTER THE OLD PASSWORD\");\n");
      out.write("                    frm.password.value.focus();\n");
      out.write("                     \n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("                if(frm.newpass.value.trim()==\"\")\n");
      out.write("                {\n");
      out.write("                    alert(\"ENTER THE NEW PASSWORD\");\n");
      out.write("                    frm.newpass.value.focus();\n");
      out.write("                     \n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("                 if(frm.confpass.value.trim()==\"\")\n");
      out.write("                {\n");
      out.write("                    alert(\"ENTER THE CONFIRM PASSWORD\");\n");
      out.write("                    frm.confpass.value.focus();\n");
      out.write("                     \n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("    <body bgcolor=\"grey\" >\n");
      out.write("        \n");
      out.write("    <form name=\"frm\" action=\"change_password.jsp\">\n");
      out.write("       \n");
      out.write("           <h1 align=\"center\">Change Password</h1>\n");
      out.write("       <table border=\"5\" size=\"500\" align=\"center\" width=\"50\" height=\"50\">\n");
      out.write("           <tbody bgcolor=\"white\">\n");
      out.write("        ");
      out.write("\n");
      out.write("            <tr>\n");
      out.write("           <td>Enter Old Password</td><td><input type=\"text\" name=\"password\" size=\"25\" /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr>\n");
      out.write("           <td>Enter New Password</td><td><input type=\"text\" name=\"newpass\" size=\"25\" /></td>\n");
      out.write("           </tr>\n");
      out.write("               <tr>\n");
      out.write("           <td>Confirm Password</td><td><input type=\"text\" name=\"confpass\" size=\"25\" /></td>\n");
      out.write("           </tr>\n");
      out.write("           <tr><td><input type=\"submit\" value=\"update\" name=\"change\" size=\"100\" onfocus=\"return valid(frm)\" align=\"center\"></td></tr>\n");
      out.write("           \n");
      out.write("           \n");
      out.write("</tbody>\n");
      out.write("     \n");
      out.write("</table>  \n");
      out.write("</form>\n");
      out.write("               </body>\n");
      out.write("\n");
      out.write("  \n");
      out.write("         \n");
      out.write("        \n");
      out.write("</html>\n");
      out.write("<a href=\"logout.jsp\">LOGOUT</a>\n");
      out.write("\n");
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
