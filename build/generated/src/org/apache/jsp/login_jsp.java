package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


   
   
    Connection conn = null;
    PreparedStatement stmt = null;
String msg="",name,password,kuser_role,cloginid,cuser_role,cpassword,user_name;

    void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insurance","db2admin","password");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }
    public void input(HttpServletRequest request) {
        name = request.getParameter("txtname");
       password = request.getParameter("txtpwd");
        HttpSession obj=request.getSession(true);
        obj.setAttribute("session_loginid", name);
        obj.setAttribute("session_pwd", password);
       //user_role=request.getParameter("txtuserrole");
          }
     public void fetch() {
        try {
            stmt = conn.prepareStatement("select user_role,name from login L,companyofficial C where L.loginid=? and password=? and L.loginid=C.loginid");
            stmt.setString(1,name);
            stmt.setString(2,password);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            //cloginid=rs.getString("loginid");
           //cpassword=rs.getString("password");
            kuser_role=rs.getString("user_role");
            user_name=rs.getString("name");
            rs.close();
            stmt.clearParameters();
            stmt.close();
         
        }

        catch (Exception ex) {
            msg ="loginid and password does not match";
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
      out.write("\n");
      out.write("   <link href=\"LoginRegistrationForm/css/style.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />\n");
      out.write("  <link rel=\"shortcut icon\" href=\"../favicon.ico\"> \n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"LoginRegistrationForm/css/demo.css\" />\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"LoginRegistrationForm/css/animate-custom.css\" />\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write(" ");
      out.write("\n");
      out.write("\n");
      out.write(" ");

 if(request.getParameter("btnLogin")!=null)
    {
connect();
input(request);
fetch();

  HttpSession obj=request.getSession(false);
  obj.setAttribute("session_user_name", user_name);

    
       if("Co".equals(kuser_role))
                 {
           response.sendRedirect("Co.jsp");
       }    
       
      else if("Admin".equals(kuser_role))
                 {
        response.sendRedirect("Admin.jsp");
       }    
        
     
      
        }
else
      {
          msg="User name and password combination does not match";
}
 kuser_role="";
 

 
 
      out.write("\n");
      out.write(" \n");
      out.write(" \n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!--[if lt IE 7 ]> <html lang=\"en\" class=\"no-js ie6 lt8\"> <![endif]-->\n");
      out.write("<!--[if IE 7 ]>    <html lang=\"en\" class=\"no-js ie7 lt8\"> <![endif]-->\n");
      out.write("<!--[if IE 8 ]>    <html lang=\"en\" class=\"no-js ie8 lt8\"> <![endif]-->\n");
      out.write("<!--[if IE 9 ]>    <html lang=\"en\" class=\"no-js ie9\"> <![endif]-->\n");
      out.write("<!--[if (gt IE 9)|!(IE)]><!--> <html lang=\"en\" class=\"no-js\"> <!--<![endif]-->\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\" />\n");
      out.write("        <!-- <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">  -->\n");
      out.write("        <title>EmployeeLogin</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"> \n");
      out.write("        <meta name=\"description\" content=\"Login and Registration Form with HTML5 and CSS3\" />\n");
      out.write("        <meta name=\"keywords\" content=\"html5, css3, form, switch, animation, :target, pseudo-class\" />\n");
      out.write("        <meta name=\"author\" content=\"Codrops\" />\n");
      out.write("      \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <B> <h1 align=\"left\"><a href=\"home.jsp\"><font color=\"blue\">HOME</font></a></h2></B>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <!-- Codrops top bar -->\n");
      out.write("            <div class=\"codrops-top\">\n");
      out.write("              <div class=\"clr\"></div>\n");
      out.write("            </div><!--/ Codrops top bar -->\n");
      out.write("            <header>\n");
      out.write("                <h1>Insurance System With Tracking Manager</h1>\n");
      out.write("\t\t\t\t<nav class=\"codrops-demos\"></nav>\n");
      out.write("            </header>\n");
      out.write("            <section>\t\t\t\t\n");
      out.write("                <div id=\"container_demo\" >\n");
      out.write("                \n");
      out.write("                    <a class=\"hiddenanchor\" id=\"tologin\"></a>\n");
      out.write("                    <div id=\"wrapper\">\n");
      out.write("                        <div id=\"login\" class=\"animate form\">\n");
      out.write("                            <form  action=\"login.jsp\" autocomplete=\"on\"> \n");
      out.write("                                <h1>Employee Log in</h1> \n");
      out.write("                                <p> \n");
      out.write("                                    <label for=\"username\" class=\"uname\" data-icon=\"u\" > Your email </label>\n");
      out.write("                                    <input id=\"txtname\" name=\"txtname\" required type=\"text\" placeholder=\"mymail@mail.com\"/>\n");
      out.write("                                </p>\n");
      out.write("                                <p> \n");
      out.write("                                    <label for=\"password\" class=\"youpasswd\" data-icon=\"p\"> Your password </label>\n");
      out.write("                                    <input id=\"txtpwd\" name=\"txtpwd\" required type=\"password\" placeholder=\"password\" /> \n");
      out.write("                                </p>\n");
      out.write("                                \n");
      out.write("                                <p class=\"login button\"> \n");
      out.write("                                    <input type=\"submit\" value=\"Login\" name=\"btnLogin\" /> \n");
      out.write("\t\t\t\t\t\t\t\t</p>\n");
      out.write("                                <p class=\"change_link\">&nbsp;</p>\n");
      out.write("                            </form>\n");
      out.write("                            \n");
      out.write("                            <script>\n");
      out.write("            ");
        
       if(request.getParameter("btnLogin")!=null)
                     {
             
      out.write("               \n");
      out.write("         alert(\"");
      out.print(msg);
      out.write("\");\n");
      out.write("         ");

                 }
 
      out.write("\n");
      out.write("         </script>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                       \n");
      out.write("\t\t\t\t\t\t\n");
      out.write("                    </div>\n");
      out.write("                </div>  \n");
      out.write("            </section>\n");
      out.write("        </div>\n");
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
