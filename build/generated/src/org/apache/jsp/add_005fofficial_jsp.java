package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class add_005fofficial_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    Connection conn = null;
    PreparedStatement stmt = null;
    String name, loginid, empid, emailid,dsgn,gender,doj,address,var_count,mm,dd,yyyy,msg = "";
    String user_role="Co";
    String password="123";
int count;
   
public void input(HttpServletRequest request) {
       
        name = request.getParameter("txtname");
        dd=request.getParameter("dd");
        loginid = request.getParameter("txtemail");
        emailid = request.getParameter("txtemail");
        dsgn = request.getParameter("designation");
        gender=request.getParameter("gender");
        mm=request.getParameter("mm");
        yyyy=request.getParameter("yyyy");
        address=request.getParameter("txtaddress");
          
        doj=mm+"-"+dd+"-"+yyyy;
    }

    public void connect() {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:sample"," "," ");
        } catch (Exception ex) {

            msg = ex.getMessage();
        }

    }
  

 
    public void insert() {
        try {
             stmt=conn.prepareStatement("select count(slno),max(slno) from companyofficial");
    ResultSet rs=stmt.executeQuery();
    rs.next();
    count=rs.getInt(1);
    if(count==0)
        {
    count=1;
    
        }
    else
        {
    count=rs.getInt(2);
    count+=1;
        }    
    rs.close();
    stmt.clearParameters();
    stmt.close();
    
             var_count=count+"";
             var_count="C"+var_count;
            stmt = conn.prepareStatement("insert into login(loginid,password,user_role)values(?,?,?)");
             stmt.setString(1, loginid);
            stmt.setString(2, password);
            stmt.setString(3, user_role);
        stmt.executeUpdate();
        
        stmt.close();
             
            stmt = conn.prepareStatement("insert into companyofficial(name,empid,emailid,designation,address,gender,doj,slno,loginid)values(?,?,?,?,?,?,?,?,?)");
           
            stmt.setString(1, name);
            stmt.setString(2, var_count);
            stmt.setString(3, emailid);
            stmt.setString(4, dsgn);
            stmt.setString(5, address);
            stmt.setString(6, gender);
            stmt.setString(7, doj);
            stmt.setInt(8, count);
            stmt.setString(9,loginid);
            stmt.executeUpdate();
            stmt.clearParameters();
            
            stmt.close();
        conn.close();
        msg = "Data is inserted"; 
        } 
        
        
        catch (Exception ex) {
            msg = ex.getMessage();
            
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
      out.write('\n');
      out.write('\n');


            
               if (request.getParameter("btnsubmit")!= null) 
               {
                   
                input(request);
                connect();
                insert();
                
                }
               




      out.write('\n');
 
if(request.getParameter("btnCancel")!=null)
     {
        msg=" ";
     }

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Add official</title>\n");
      out.write("    </head>\n");
      out.write("     \n");
      out.write("        <script type = \"text/javascript\">\n");
      out.write("function ValidateEmail(vmail)\n");
      out.write("{\n");
      out.write("var mailformat =/^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$/;\n");
      out.write("if(vmail.value.match(mailformat))\n");
      out.write("{\n");
      out.write("return true;\n");
      out.write("}\n");
      out.write("else\n");
      out.write("{\n");
      out.write("alert(\"You have Entered an Invalid email address!!Please Enter the valid email !!\");\n");
      out.write("\tdocument.form.email.focus();\n");
      out.write("return false;\n");
      out.write("}\n");
      out.write("}\n");
      out.write("\n");
      out.write("function validate_required(field,alerttxt) {\n");
      out.write("with (field)\n");
      out.write("{\n");
      out.write("if (value==null||value==\"\")\n");
      out.write("  {alert(alerttxt);return false}\n");
      out.write("else {return true}\n");
      out.write("}\n");
      out.write("}\n");
      out.write("\n");
      out.write("\t\n");
      out.write("function validate_form(thisform)\n");
      out.write("{\n");
      out.write("with (thisform)\n");
      out.write("{\n");
      out.write("    \n");
      out.write("if (ValidateEmail(txtemail)==false)\n");
      out.write("  {txtemail.focus();return false}\n");
      out.write("if (validate_required(txtname,\"UserName must be filled out!\")==false)\n");
      out.write("  {txtname.focus();return false}\n");
      out.write("  \n");
      out.write(" if (validate_required(designation,\"Designation must be filled out!\")==false)\n");
      out.write("  {designation.focus();return false}\n");
      out.write(" \n");
      out.write("  if (validate_required(txtaddress,\"address must be filled out!\")==false)\n");
      out.write("  {txtaddress.focus();return false}\n");
      out.write("\n");
      out.write("if(document.form.dd.selectedIndex<1)\n");
      out.write("\t\t\t\t{\n");
      out.write("\t\t\t\t\talert(\"Please select the Day!\");\n");
      out.write("\t\t\t\t\tdocument.form.dd.focus();\n");
      out.write("\t\t\t\t\treturn false;\n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t\t\n");
      out.write("  \tif(document.form.mm.selectedIndex<1)\n");
      out.write("\t\t\t\t{\n");
      out.write("\t\t\t\t\talert(\"Please select the Month!\");\n");
      out.write("\t\t\t\t\tdocument.form.mm.focus();\n");
      out.write("\t\t\t\t\treturn false;\n");
      out.write("\t\t\t\t}\n");
      out.write("\tif(document.form.yyyy.selectedIndex<1)\n");
      out.write("\t\t\t\t{\n");
      out.write("\t\t\t\t\talert(\"Please select the Year!\");\n");
      out.write("\t\t\t\t\tdocument.form.yyyy.focus();\n");
      out.write("\t\t\t\t\treturn false;\n");
      out.write("\t\t\t\t}\n");
      out.write("             if ( ( document.form.gender[0].checked == false ) && ( document.form.gender[1].checked == false ) )\n");
      out.write("                         {\n");
      out.write("                          alert ( \"Please choose your Gender: Male or Female\" );\n");
      out.write("                           return false;\n");
      out.write("                           }\n");
      out.write("\n");
      out.write("   \n");
      out.write("  \n");
      out.write(" }\n");
      out.write("}\n");
      out.write("        </script>\n");
      out.write("    <body bgcolor=\"grey\">\n");
      out.write("        <h2><a href=\"Admin.jsp\">Admin</h2></a>\n");
      out.write("        <form name=\"form\" action=\"add_official.jsp\" method=\"POST\" >\n");
      out.write("            <table border=\"3\" bgcolor=\"white\" align=\"center\"  cellspacing=\"3\" cellpadding=\"5\" >\n");
      out.write("                <h2 align=\"center\"> Enter Employee details details</h2>\n");
      out.write("              <tr>\n");
      out.write("                   <td>Email ID</td>\n");
      out.write("                   <td><input type=\"text\" name=\"txtemail\" width=\"50\" size=\"60\"  /></td></tr>\n");
      out.write("                \n");
      out.write("                <tr><td>Gender<td>Male<input type=\"radio\" name=\"gender\" value=\"M\"  size=\"60\" />\n");
      out.write("                 Female<input type=\"radio\" name=\"gender\" value=\"F\"  size=\"60\"/></td></tr>\n");
      out.write("                <tr>\n");
      out.write("                <td>User Role</td>\n");
      out.write("                <td><input type=\"text\" name=\"txtuser_role\" value=\"Co\" disabled=\"disabled\" width=\"50\" size=\"60\" /><td>\n");
      out.write("                \n");
      out.write("                <tr>\n");
      out.write("                    <td>Name</td>\n");
      out.write("                    <td><input type=\"text\" name=\"txtname\" value=\"\"  width=\"50\" size=\"60\"/></td></tr>\n");
      out.write("               <tr>\n");
      out.write("\t\t\t<td style=\"font-size: 14pt\" align=\"left\" width=\"281\"><font face=\"cambria\">Date of Joining :</font></td>\n");
      out.write("\t\t\t<td style=\"border-color: maroon\" align=\"left\" width=\"360\"><font face=\"cambria\">MM : <select name=\"mm\">\n");
      out.write("\t\t\t\t<option value=\"-1\">MONTH</option>\n");
      out.write("\t\t\t\t<option value=\"1\">Jan</option><option value=\"2\">Feb</option><option value=\"3\">Mar</option><option value=\"4\">Apr</option><option value=\"5\">May</option><option value=\"6\">Jun</option><option value=\"7\">Jul</option><option value=\"8\">Aug</option><option value=\"9\">Sep</option><option value=\"10\">Oct</option><option value=\"11\">Nov</option><option value=\"12\">Dec</option></select> \n");
      out.write("\t\t\t\tDD:<select name=\"dd\" id=\"dd\" value=\"\"><option value=\"-1\">DAY</option>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<script type=\"text/javascript\">\n");
      out.write("\t\t\t\t\t\t\t\tvar i=0\n");
      out.write("\t\t\t\t\t\t\t\tfor (i=01;i<=31;i++)\t\n");
      out.write("\t\t\t\t\t\t\t\t\t{\n");
      out.write("\t\t\t\t\t\t\t\t\tdocument.write(\"<option value=\"+i+\">\"+i+\"</option>\");\n");
      out.write("\t\t\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t</script></select>\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\n");
      out.write("\t\t\t\tYYYY:<select name=\"yyyy\" id=\"yyyy\" value=\"\"><option value=\"-1\">YEAR</option>\n");
      out.write("\t\t\t<script type=\"text/javascript\">\n");
      out.write("\t\t\t\t\t\t\t\tvar i=0\n");
      out.write("\t\t\t\t\t\t\t\tfor (i=1905;i<=2011;i++)\t\n");
      out.write("\t\t\t\t\t\t\t\t\t{\n");
      out.write("\t\t\t\t\t\t\t\t\tdocument.write(\"<option value=\"+i+\">\"+i+\"</option>\");\n");
      out.write("\t\t\t\t\t\t\t\t\t}\n");
      out.write("\t\t\t\t\t\t\t</script>\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</select>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\t\t</font></tr>\n");
      out.write("               \n");
      out.write("                 <tr>\n");
      out.write("                     <td>Designation</td>\n");
      out.write("                     <td><input type=\"text\" name=\"designation\" value=\"\"  width=\"50\" size=\"60\"/></td></tr>\n");
      out.write("                  <tr>\n");
      out.write("                    <td>City</td>\n");
      out.write("                    <td><input type=\"text\" name=\"txtaddress\" value=\"\"  width=\"50\" size=\"60\"/></td></tr>\n");
      out.write("                 \n");
      out.write("                 \n");
      out.write("                  <tr>\n");
      out.write("                        <td><input type=\"submit\" value=\"Submit\" name=\"btnsubmit\" onfocus=\"return validate_form(form)\" /></td>\n");
      out.write("                        <td><input type=\"submit\" value=\"Cancel\" name=\"btnCancel\"/></td>\n");
      out.write("                    </tr>\n");
      out.write("                \n");
      out.write("                 </table>\n");
      out.write("        </form>\n");
      out.write("      <script>\n");
      out.write("            ");
        
       if(request.getParameter("btnsubmit")!=null)
                     {
             
      out.write("               \n");
      out.write("         alert(\"");
      out.print(msg);
      out.write("\");\n");
      out.write("         ");

                 }
 
      out.write("\n");
      out.write("         </script>\n");
      out.write("    </body>\n");
      out.write("    \n");
      out.write("       \n");
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
