package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Vector;
import java.sql.*;

public final class view_005fhealth_005finsurance_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {



   
       
     String type,cust_id,premium,msg, premium_paying_term,frequency,name,dob= "";
     String purchase_date,next_premium_date,start_date,expiry_date,email,policy_no,sum_insured="";
     String var_policy_no;
       Connection conn=null;
       PreparedStatement stmt=null;
       

       public void connect() {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc","","");
        } catch (Exception ex) {

             msg= ex.getMessage();
        }

    }
       public void fetch(HttpServletRequest request)
       {
           try
            {
                stmt=conn.prepareStatement("select A.cust_id,A.name,A.dob,A.email_id,B.policy_no,B.frequency,B.premium_amt,B.policy_start_date,B.policy_exp_date,B.next_premium_date,C.sum_insured from cust A,policy B,health_insurance C where B.policy_no=? and B.cust_id=A.cust_id and B.policy_no=C.policy_no");             
                stmt.setString(1,var_policy_no);
                ResultSet rs=stmt.executeQuery();
                rs.next();
                
               cust_id=rs.getString("cust_id");
                name=rs.getString("name");
                dob =rs.getString("dob");
                email=rs.getString("email_id");
                policy_no=rs.getString("policy_no");
                frequency=rs.getString("frequency");
                premium=rs.getString("premium_amt");
               start_date=rs.getString("policy_start_date");
               expiry_date=rs.getString("policy_exp_date");
               next_premium_date=rs.getString("next_premium_date");
               sum_insured=rs.getString("sum_insured");
               rs.close();
        stmt.clearParameters();
        stmt.close();
                msg="POLICY GENERATED";  
               
                 HttpSession obj=request.getSession(false);
                 obj.setAttribute("session_premium", premium);
       }    
  catch(Exception ex)
            {
            msg=ex.getMessage();
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
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write('\n');
      out.write('\n');

    HttpSession obj=request.getSession(false);
    
    var_policy_no=obj.getAttribute("session_policy_no").toString();    //Session variable created in health_insurance.jsp

           connect();
           fetch(request);
           obj.setAttribute("session_next_premium_date",next_premium_date);
    

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("           <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("         <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("          <meta name=\"keywords\" content=\"\" />\n");
      out.write("<meta name=\"description\" content=\"\" />\n");
      out.write("<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("<link href=\"http://fonts.googleapis.com/css?family=Abel\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("<link href=\"Template/style.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />\n");
      out.write("<script type=\"text/javascript\" src=\"Template/jquery-1.7.1.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"Template/jquery.slidertron-1.0.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"Template/jquery.dropotron-1.0.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"Template/jquery.poptrox-1.0.js\"></script>\n");
      out.write("\n");
      out.write("        <title>House Insurance Policy Details</title>\n");
      out.write("    </head>\n");
      out.write("    <form action=\"view_health_insurance.jsp\" method=\"POST\" >\n");
      out.write("         <div id=\"wrapper\">\n");
      out.write("\t<div id=\"header-wrapper\">\n");
      out.write("\t\t<div id=\"header\">\n");
      out.write("\t\t\t<div id=\"logo\">\n");
      out.write("\t\t\t\t<h1><span> INSURANCE SYSTEM WITH </span></h1>\n");
      out.write("\t\t\t\t<h1><span>TRACKING MANAGER</span>\t\t  </h1>\n");
      out.write("\t\t  </div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("        <div id=\"menu-wrapper\">\n");
      out.write("\t\t<ul id=\"menu\">\n");
      out.write("                    <li class=\"current_page_item\"><a href=\"Cust.jsp\"><span> Customer Home  </span></a></li>\n");
      out.write("        <li> <span>   My Account  </span>\n");
      out.write("\n");
      out.write("\t\t\t  <ul>\n");
      out.write("                           <li><a href=\"view_cust_profile.jsp\"> View Profile </a></li>\n");
      out.write("                           <li><a href=\"change_password.jsp\" target=\"_blank\"> Change Password </a></li>\n");
      out.write("\t\t\t  <li><a href=\"logout.jsp\"> logout </a></li>\n");
      out.write("                                         \n");
      out.write("\t\t\t\t\t <li class=\"last\"></li>\n");
      out.write("\t\t\t  </ul>\n");
      out.write("           \n");
      out.write("        <li><a href=\"disscussionforum.jsp\" target=\"_blank\"> <span>Discussion Forum </span></a></li>\n");
      out.write("         <li><a href=\"#\"><span>About</span></a></li>\n");
      out.write("\t\t\t\n");
      out.write("\t\t</ul>\n");
      out.write("\t\t<script type=\"text/javascript\">\n");
      out.write("\t\t\t$('#menu').dropotron();\n");
      out.write("\t\t</script>\n");
      out.write("\t</div>\n");
      out.write("             <ul>\n");
      out.write("                 <li><h4><a href=\"payment.jsp \">click here to pay premium</a></h4></li>    \n");
      out.write("       <li><h4><a href=\"view_policy_details.jsp\">VIEW ANOTHER POLICY DETAILS</a></h4></li>  \n");
      out.write("       </ul>\n");
      out.write("    <body>\n");
      out.write("        <br>\n");
      out.write("        <h3 align=\"center\"> CUSTOMER DETAILS</h3>\n");
      out.write("        <table border=\"1\" align=\"center\">\n");
      out.write("            <tr>\n");
      out.write("                <th>Customer ID</th>       \n");
      out.write("                <td>");
      out.print(cust_id);
      out.write("</td>\n");
      out.write("           </tr> \n");
      out.write("           <tr>\n");
      out.write("                <th>Customer Name</th>       \n");
      out.write("                <td>");
      out.print(name);
      out.write("</td>\n");
      out.write("           </tr> \n");
      out.write("           <tr>\n");
      out.write("                <th>Email ID</th>       \n");
      out.write("                <td>");
      out.print(email);
      out.write("</td>\n");
      out.write("           </tr> \n");
      out.write("           <tr>\n");
      out.write("                <th>Date Of Birth</th>       \n");
      out.write("                <td>");
      out.print(dob);
      out.write("</td>\n");
      out.write("           </tr> \n");
      out.write("           </table>\n");
      out.write("           \n");
      out.write("          <br>\n");
      out.write("          <br>\n");
      out.write("           <h3 align=\"center\"> POLICY DETAILS</h3>\n");
      out.write("          <table border=\"1\" align=\"center\">\n");
      out.write("              <tr>\n");
      out.write("                <th>Policy No</th>       \n");
      out.write("                <td>");
      out.print(policy_no);
      out.write("</td>\n");
      out.write("           </tr> \n");
      out.write("        <tr>\n");
      out.write("                <th>Frequency</th>       \n");
      out.write("                <td>");
      out.print(frequency);
      out.write("</td>\n");
      out.write("           </tr> \n");
      out.write("           <tr>\n");
      out.write("                <th>Premium Amount</th>       \n");
      out.write("                <td>₹");
      out.print(premium);
      out.write("</td>\n");
      out.write("           </tr> \n");
      out.write("           <tr>\n");
      out.write("                <th>Policy Start Date</th>       \n");
      out.write("                <td>");
      out.print(start_date);
      out.write("</td>\n");
      out.write("           </tr> \n");
      out.write("           <tr>\n");
      out.write("                <th>Policy Expiry Date</th>       \n");
      out.write("                <td>");
      out.print(expiry_date);
      out.write("</td>\n");
      out.write("           </tr> \n");
      out.write("           <tr>\n");
      out.write("                <th>Next Premium Date</th>       \n");
      out.write("                <td>");
      out.print(next_premium_date);
      out.write("</td>\n");
      out.write("           </tr> \n");
      out.write("            <tr>\n");
      out.write("                <th>Sum Insured</th>       \n");
      out.write("                <td>₹");
      out.print(sum_insured);
      out.write("</td>\n");
      out.write("           </tr> \n");
      out.write("          </table>\n");
      out.write("                       \n");
      out.write("            </tbody>   \n");
      out.write("        \n");
      out.write("        </form>\n");
      out.write("                   \n");
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
