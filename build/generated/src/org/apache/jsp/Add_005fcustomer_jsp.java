package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Add_005fcustomer_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    Connection conn = null;
    PreparedStatement stmt = null,stmt1=null;
    String var_dob,var_count,var_pwd="123",var_login_id,var_role,var_name,var_cust_id,dd,mm,yyyy,var_address,var_phone_no,var_email_id,var_gender,var_nationality,var_country,var_state,var_city,var_pincode,msg = "";
    int count;
    public void input(HttpServletRequest request)
    {
          var_name=request.getParameter("txtcustname");
          var_login_id=request.getParameter("txtemail");
          var_role=request.getParameter("txtrole");
          var_cust_id=request.getParameter("txtcustid");
          dd=request.getParameter("txtdd");
          mm=request.getParameter("txtmm");
          yyyy=request.getParameter("txtyyyy");
          var_address=request.getParameter("txtaddress");
          var_phone_no=request.getParameter("txtphno");
          var_email_id=request.getParameter("txtemail");
          var_gender=request.getParameter("gender");
          var_nationality=request.getParameter("txtnationality");
          var_country=request.getParameter("txtcountry");
          var_state=request.getParameter("txtstate");
          var_city=request.getParameter("txtcity");
          var_pincode=request.getParameter("txtpincode"); 
          
          var_dob=dd+'/'+mm+'/'+yyyy;
    }    
     
    public void connect() {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:sdmcse","","");
        } catch (Exception ex) {

            msg = ex.getMessage();
        }

    }

    public void insert() {
       
            
        try {
             stmt1=conn.prepareStatement("select count(slno),max(slno) from cust");
    ResultSet rs=stmt1.executeQuery();
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
    stmt1.clearParameters();
    stmt1.close();
    
             var_count=count+"";
             var_count="CUST"+var_count;
            
            
            stmt = conn.prepareStatement("insert into login(loginid,password,user_role)values(?,?,?)");
            stmt.setString(1,var_login_id);
            stmt.setString(2, var_pwd);
            stmt.setString(3,var_role);
            stmt1=conn.prepareStatement("insert into cust(cust_id,loginid,name,dob,address,ph_no,email_id,gender,nationality,country,state,city,pincode,slno)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            stmt1.setString(1,var_count);
            stmt1.setString(2,var_login_id);
            stmt1.setString(3,var_name);
            stmt1.setString(4,var_dob);
            stmt1.setString(5,var_address);
            stmt1.setString(6,var_phone_no);
            stmt1.setString(7,var_email_id);
            stmt1.setString(8,var_gender);
            stmt1.setString(9,var_nationality);
            stmt1.setString(10,var_country);
            stmt1.setString(11,var_state);
            stmt1.setString(12,var_city);
            stmt1.setString(13,var_pincode);
            stmt1.setInt(14,count);
            stmt.executeUpdate();
            stmt1.executeUpdate();
            stmt.clearParameters();
            stmt.close();
            stmt1.clearParameters();
            stmt1.close();
            conn.close();
            msg = "Data is inserted";

        } catch (Exception ex) {
            msg = ex.getMessage();
        }

    }


  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write('\r');
      out.write('\n');

            if (request.getParameter("btnsubmit") != null) {
                input(request);
                connect();
                insert();
            }




      out.write('\r');
      out.write('\n');

if(request.getParameter("btnCancel")!=null)
     {
        msg=" ";
     }



      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head><marquee bgcolor=\"sky blue\">\r\n");
      out.write("        <h2>ADD CUSTOMER</h2>\r\n");
      out.write("    </marquee>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>JSP Page</title>\r\n");
      out.write("    </head>\r\n");
      out.write("  <script type = \"text/javascript\">\r\n");
      out.write("function ValidateEmail(vmail)\r\n");
      out.write("{\r\n");
      out.write("var mailformat =/^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$/;\r\n");
      out.write("if(vmail.value.match(mailformat))\r\n");
      out.write("{\r\n");
      out.write("return true;\r\n");
      out.write("}\r\n");
      out.write("else\r\n");
      out.write("{\r\n");
      out.write("alert(\"You have Entered an Invalid email address!!Please Enter the valid email !!\");\r\n");
      out.write("\tdocument.form.txtemail.focus();\r\n");
      out.write("return false;\r\n");
      out.write("}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function validate_required(field,alerttxt) {\r\n");
      out.write("with (field)\r\n");
      out.write("{\r\n");
      out.write("if (value==null||value==\"\")\r\n");
      out.write("  {alert(alerttxt);return false}\r\n");
      out.write("else {return true}\r\n");
      out.write("}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("function validate_form(thisform)\r\n");
      out.write("{\r\n");
      out.write("with (thisform)\r\n");
      out.write("{\r\n");
      out.write("    if (validate_required(txtcustname,\"CustName must be filled out!\")==false)\r\n");
      out.write("  {txtcustname.focus();return false}\r\n");
      out.write("   if (ValidateEmail(txtemail)==false)\r\n");
      out.write("  {txtemail.focus();return false}\r\n");
      out.write("  \tif(document.form.txtdd.selectedIndex<1)\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\talert(\"Please select the Day!\");\r\n");
      out.write("\t\t\t\t\tdocument.form.txtdd.focus();\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("  \tif(document.form.txtmm.selectedIndex<1)\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\talert(\"Please select the Month!\");\r\n");
      out.write("\t\t\t\t\tdocument.form.txtmm.focus();\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\tif(document.form.txtyyyy.selectedIndex<1)\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\talert(\"Please select the Year!\");\r\n");
      out.write("\t\t\t\t\tdocument.form.txtyyyy.focus();\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("  if (validate_required(txtaddress,\"address must be filled out!\")==false)\r\n");
      out.write("  {txtaddress.focus();return false}\r\n");
      out.write("if (validate_required(txtphno,\"Phone Number must be filled out!\")==false)\r\n");
      out.write("  {txtphno.focus();return false}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("  \r\n");
      out.write("  if (validate_required(txtnationality,\"Nationality must be filled out!\")==false)\r\n");
      out.write("  {txtnationality.focus();return false}\r\n");
      out.write("  if (validate_required(txtcountry,\"Country must be filled out!\")==false)\r\n");
      out.write("  {txtcountry.focus();return false}\r\n");
      out.write("    if (validate_required(txtstate,\"State must be filled out!\")==false)\r\n");
      out.write("  {txtstate.focus();return false}\r\n");
      out.write("   if (validate_required(txtcity,\"City must be filled out!\")==false)\r\n");
      out.write("  {txtcity.focus();return false}\r\n");
      out.write("  if (validate_required(txtpincode,\"Pincode must be filled out!\")==false)\r\n");
      out.write("  {txtpincode.focus();return false}\r\n");
      out.write("    if ( ( document.form.gender[0].checked == false ) && ( document.form.gender[1].checked == false ) )\r\n");
      out.write("{\r\n");
      out.write("alert ( \"Please choose your Gender: Male or Female\" );\r\n");
      out.write("return false;\r\n");
      out.write("}\r\n");
      out.write("  \r\n");
      out.write("  var digits = \"0123456789\";\r\n");
      out.write("\tvar j=0;\r\n");
      out.write("\tfor (var i = 0; i < thisform.txtpincode.value.length; i++)\r\n");
      out.write("  \t{\r\n");
      out.write("    \ttemp = thisform.txtpincode.value.substring(i, i+1)\r\n");
      out.write("\t\tj++;\r\n");
      out.write("    \tif (digits.indexOf(temp) == -1 &&\r\n");
      out.write("   \t\tthisform.txtpincode.value != \"\")\r\n");
      out.write("    \t{\r\n");
      out.write("      \t\talert(\"Pincode should have digits only\\n\");\r\n");
      out.write("      \t\ttxtpincode.focus();\r\n");
      out.write("      \t\treturn false;\r\n");
      out.write("    \t}\r\n");
      out.write("    }\t\r\n");
      out.write("    \tif (j<6 || j>6)\r\n");
      out.write("    \t{\r\n");
      out.write("      \t\talert(\"Pincode should have 6-digits only\\n\");\r\n");
      out.write("      \t\ttxtpincode.focus();\r\n");
      out.write("      \t\treturn false;\r\n");
      out.write("    \t}\r\n");
      out.write("    \t\r\n");
      out.write("  \t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" var m=0;\r\n");
      out.write("  for (var i = 0; i < thisform.txtphno.value.length; i++)\r\n");
      out.write("  \t{\r\n");
      out.write("    \ttemp = thisform.txtphno.value.substring(i, i+1)\r\n");
      out.write("    \tm++;\r\n");
      out.write("    \tif (digits.indexOf(temp) == -1)\r\n");
      out.write("    \t{\r\n");
      out.write("      \t\talert(\"Phone Number should have digits only\\n\");\r\n");
      out.write("      \t\ttxtphno.focus();\r\n");
      out.write("      \t\treturn false;\r\n");
      out.write("    \t}\r\n");
      out.write("  \t}\r\n");
      out.write(" \r\n");
      out.write(" if (m<10 || m>10)\r\n");
      out.write("    \t{\r\n");
      out.write("      \t\talert(\"Phone Number should have 10-digits only\\n\");\r\n");
      out.write("      \t\ttxtphno.focus();\r\n");
      out.write("      \t\treturn false;\r\n");
      out.write("    \t}\r\n");
      out.write("        \r\n");
      out.write("         \r\n");
      out.write("}\r\n");
      out.write("        \r\n");
      out.write("}\r\n");
      out.write("        </script>\r\n");
      out.write("    \r\n");
      out.write("    <body bgcolor=\"grey\">\r\n");
      out.write("        <h3><a href=\"Co.jsp\">COMPANY OFFICIAL HOME</a></h3>\r\n");
      out.write("        \r\n");
      out.write("        <form name=\"form\" method=\"post\" action=\"Add_customer.jsp\">\r\n");
      out.write("            <table border=\"3\" bgcolor=\"white\" align=\"center\"  cellspacing=\"3\" cellpadding=\"5\" >\r\n");
      out.write("                <h2 align=\"center\"> Enter details</h2>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>CUSTOMER NAME</td>\r\n");
      out.write("                    <td><input type=\"text\" name=\"txtcustname\" value=\"\" width=\"60\" size=\"60\"/></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                    <td>EMAIL ID</td>\r\n");
      out.write("                    <td><input type=\"text\" name=\"txtemail\" value=\"\" width=\"50\" size=\"60\"/></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>ROLE</td>\r\n");
      out.write("                    <td><input type=\"text\" name=\"txtrole\" value=\"Cust\" readonly=\"readonly\" width=\"50\" size=\"60\" /></td>\r\n");
      out.write("        <tr>\r\n");
      out.write("            <td style=\"font-size: 14pt\" align=\"left\" width=\"281\"><font face=\"cambria\">Date of Birth :</font></td>\r\n");
      out.write("            <td style=\"border-color: maroon\" align=\"left\" width=\"360\"><font face=\"cambria\">MM : <select name=\"txtmm\">\r\n");
      out.write("\t\t\t\t<option value=\"-1\">MONTH</option>\r\n");
      out.write("\t\t\t\t<option value=\"1\">Jan</option><option value=\"2\">Feb</option><option value=\"3\">Mar</option><option value=\"4\">Apr</option><option value=\"5\">May</option><option value=\"6\">Jun</option><option value=\"7\">Jul</option><option value=\"8\">Aug</option><option value=\"9\">Sep</option><option value=\"10\">Oct</option><option value=\"11\">Nov</option><option value=\"12\">Dec</option></select> \r\n");
      out.write("\t\t\t\tDD:<select name=\"txtdd\" id=\"dd\"value=\"\"><option value=\"-1\">DAY</option>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\t\t\t\t\tvar i=0;\r\n");
      out.write("                                                                   \r\n");
      out.write("\t\t\t\t\t\t\t\t        for (i=01;i<=31;i++)\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\t  document.write(\"<option value=\"+i+\">\"+i+\"</option>\");\r\n");
      out.write("\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("                                                                \r\n");
      out.write("\t\t\t\t\t\t\t</script></select>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\r\n");
      out.write("\t\t\t\tYYYY:<select name=\"txtyyyy\" id=\"yyyy\" value=\"\"><option value=\"-1\">YEAR</option>\r\n");
      out.write("\t\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\t\t\t\t\tvar i=0;\r\n");
      out.write("\t\t\t\t\t\t\t\tfor (i=1905;i<=2013;i++)\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\t\t\t\tdocument.write(\"<option value=\"+i+\">\"+i+\"</option>\");\r\n");
      out.write("\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t\t</font></tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>ADDRESS</td>\r\n");
      out.write("                    <td><input type=\"text\" name=\"txtaddress\" value=\"\" width=\"50\" size=\"60\"/></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>PHONE NO.</td>\r\n");
      out.write("                    <td><input type=\"text\" name=\"txtphno\" value=\"\" width=\"50\" size=\"60\"/></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("             \r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>NATIONALITY</td>\r\n");
      out.write("                    <td><input type=\"text\" name=\"txtnationality\" value=\"\" width=\"50\" size=\"60\"/></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>COUNTRY</td>\r\n");
      out.write("                    <td><input type=\"text\" name=\"txtcountry\" value=\"\" width=\"50\" size=\"60\"/></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>STATE</td>\r\n");
      out.write("                    <td><input type=\"text\" name=\"txtstate\" value=\"\" width=\"50\" size=\"60\"/></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>CITY</td>\r\n");
      out.write("                    <td><input type=\"text\" name=\"txtcity\" value=\"\" width=\"50\" size=\"60\"/></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>PINCODE</td>\r\n");
      out.write("                    <td><input type=\"text\" name=\"txtpincode\" value=\"\" width=\"50\" size=\"60\"/></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>GENDER</td>\r\n");
      out.write("                    <td>MALE<input type=\"radio\" name=\"gender\" value=\"M\"  size=\"60\"/>\r\n");
      out.write("                \r\n");
      out.write("                    FEMALE<input type=\"radio\" name=\"gender\" value=\"F\"  size=\"60\"/>\r\n");
      out.write("                    \r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td><input type=\"submit\" value=\"Submit\" name=\"btnsubmit\" onfocus=\"return validate_form(form);\" size=\"60\"/></td>\r\n");
      out.write("               \r\n");
      out.write("                    <td><input type=\"reset\" name=\"btncancel\" value=\"Cancel\" size=\"60\"/></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("            \r\n");
      out.write("        </form>\r\n");
      out.write("         <script>\r\n");
      out.write("            ");
        
       if(request.getParameter("btnsubmit")!=null)
                     {
             
      out.write("               \r\n");
      out.write("         alert(\"");
      out.print(msg);
      out.write("\");\r\n");
      out.write("         ");

                 }
 
      out.write("\r\n");
      out.write("         </script>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
