package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class life_005finsurance_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {




    Connection conn = null;
    PreparedStatement stmt = null;
    String life_cover,type,var_count,premium,msg, premium_paying_term,frequency= "";
    String purchase_date,next_premium_date,start_date,expiry_date="";
    String var_cust_id="";
    int count;
   
    public void input(HttpServletRequest request)
    {
          HttpSession obj=request.getSession(false);
          var_cust_id=obj.getAttribute("session_cust_id").toString();   
          frequency=request.getParameter("frequency");
          type=request.getParameter("txttype");
          premium=request.getParameter("premium_amt");
          purchase_date=request.getParameter("purchase_date");
          next_premium_date=request.getParameter("next_premium_date");
          start_date=request.getParameter("policy_start_date");
          expiry_date=request.getParameter("policy_exp_date");
          life_cover=request.getParameter("life_cover");
          premium_paying_term=request.getParameter("premium_term");
    }    

    public void connect() 
    {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:sample","","");
        } catch (Exception ex) {

            msg = ex.getMessage();
        }

    }

    public void insert() {
       
            
        try {
             stmt=conn.prepareStatement("select count(slno),max(slno) from policy");
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
                  var_count="LIFE_INSU"+var_count;
            
            
            
            stmt=conn.prepareStatement("insert into policy(policy_no,cust_id,type,purchase_date,premium_amt,frequency,policy_start_date,policy_exp_date,next_premium_date,slno)values(?,?,?,?,?,?,?,?,?,?)");
            stmt.setString(1,var_count);
            stmt.setString(2,var_cust_id);
            stmt.setString(3,type);
            stmt.setString(4,purchase_date);
            stmt.setString(5,premium);
            stmt.setString(6,frequency);
            stmt.setString(7,start_date);
            stmt.setString(8,expiry_date);
            stmt.setString(9,next_premium_date);
            stmt.setInt(10,count);
         
            stmt.executeUpdate();
      
            stmt.clearParameters();
            stmt.close();
         
             stmt=conn.prepareStatement("insert into life_insurance(policy_no,life_cover,premium_paying_term) values(?,?,?)");
             stmt.setString(1,var_count);
            stmt.setString(2,life_cover);
            stmt.setString(3,premium_paying_term);
            
            stmt.executeUpdate();
      
            stmt.clearParameters();
            stmt.close();
            
            conn.close();
           
            msg = "Policy Generated!!!";

        } catch (Exception ex) {
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
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write('\n');

            if (request.getParameter("btnsubmit") != null) {
                input(request);
                connect();
                insert();
            }




      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Policy Details</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <form name=\"frm\" method=\"post\" action=\"life_insurance.jsp\" >\n");
      out.write("            <table border=\"1\" bgcolor=\"white\" align=\"center\"  cellspacing=\"3\" cellpadding=\"5\" >\n");
      out.write("                <h2 align=\"center\"> Enter Policy Details</h2>\n");
      out.write("               \n");
      out.write("                    <tr>\n");
      out.write("                    <td>Policy Type</td>\n");
      out.write("                    <td><input type=\"text\" name=\"txttype\" value=\"Life Insurance\" readonly=\"readonly\" /></td>\n");
      out.write("                </tr>\n");
      out.write("                    <tr>\n");
      out.write("                    <td>Purchase Date</td>\n");
      out.write("                    <td><input type=\"text\" name=\"purchase_date\" /></td>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                 <tr>\n");
      out.write("                    <td>Premium Amount</td>\n");
      out.write("                    <td><input type=\"text\" name=\"premium_amt\"  /></td>\n");
      out.write("                 </tr>\n");
      out.write("                 \n");
      out.write("                 <tr>\n");
      out.write("                       <td>Frequency</td>\n");
      out.write("                 <td><select name=\"frequency\">\n");
      out.write("                     <option>Yearly</option>\n");
      out.write("                     <option>Quarterly</option>\n");
      out.write("                     <option>Monthly</option>\n");
      out.write("                 </select></td>\n");
      out.write("                  </tr>\n");
      out.write("                  \n");
      out.write("                  <tr>\n");
      out.write("                    <td>Policy Start Date</td>\n");
      out.write("                    <td><input type=\"text\" name=\"policy_start_date\" /></td>\n");
      out.write("                </tr>\n");
      out.write("                  <tr>\n");
      out.write("                    <td>Policy Expiry Date</td>\n");
      out.write("                    <td><input type=\"text\" name=\"policy_exp_date\" /></td>\n");
      out.write("                </tr>\n");
      out.write("                  <tr>\n");
      out.write("                       <td>Life Cover</td>\n");
      out.write("                 <td><select name=\"life_cover\">\n");
      out.write("                     <option>500000</option>\n");
      out.write("                     <option>1000000</option>\n");
      out.write("                     <option>2000000</option>\n");
      out.write("                      <option>3000000</option>\n");
      out.write("                      <option>4000000</option>\n");
      out.write("                \n");
      out.write("                 </select> </td>\n");
      out.write("                  </tr>\n");
      out.write("                   <tr>\n");
      out.write("                       <td>Premium Paying Term</td>\n");
      out.write("                 <td><select name=\"premium_term\">\n");
      out.write("                    \n");
      out.write("                     <option>1 Year</option>\n");
      out.write("                     <option>2 Years </option>\n");
      out.write("                     <option>3 Years</option>\n");
      out.write("                     <option>Till policy expiry</option>\n");
      out.write("                 </select>\n");
      out.write("                 </td>\n");
      out.write("                  </tr>\n");
      out.write("                  <tr>\n");
      out.write("                    <td>Next Premium Date</td>\n");
      out.write("                    <td><input type=\"text\" name=\"next_premium_date\" /></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                <td><input type=\"submit\" value=\"Submit\" name=\"btnsubmit\" /></td>\n");
      out.write("                <tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("         <script>\n");
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
