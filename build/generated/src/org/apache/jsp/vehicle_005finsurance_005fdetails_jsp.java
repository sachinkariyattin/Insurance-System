package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Vector;
import java.sql.*;

public final class vehicle_005finsurance_005fdetails_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


       String msg="";
       Vector vcust_id=new Vector();
       Vector vpolicyno=new Vector();
       Vector vstart=new Vector();
       Vector vexpiry=new Vector();
       Vector vpremium=new Vector();
       Vector vpurchasedate=new Vector();
       Vector vpremiumstart=new Vector();
       Vector vregno=new Vector();
       Vector vvalue=new Vector();
       Vector vfrequency = new Vector();
       Vector vtype=new Vector();
       
       
       Connection conn=null;
       PreparedStatement stmt=null;
       

       public void connect() {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:sample","","");
        } catch (Exception ex) {

            msg = ex.getMessage();
        }

    }
       
        public void fetch()
        {
            try
            {
                stmt=conn.prepareStatement("select policyno,cust_id,policy_type,purchase_date,next_premium_date,premium_amt,frequency,start_date,expiry_date,reg_no,purchase_value from vehicle_insurance");             
                ResultSet rs=stmt.executeQuery();
                while(rs.next())
                {
                    vpolicyno.add(rs.getString("policyno"));
                    vcust_id.add(rs.getString("cust_id"));
                    vtype.add(rs.getString("policy_type"));
                    vpurchasedate.add(rs.getString("purchase_date"));
                    vpremiumstart.add(rs.getString("next_premium_date"));
                    vpremium.add(rs.getString("premium_amt"));
                    vfrequency.add(rs.getString("frequency"));
                    vstart.add(rs.getString("start_date"));
                    vexpiry.add(rs.getString("expiry_date"));
                    vregno.add(rs.getString("reg_no"));
                    vvalue.add(rs.getString("purchase_value"));
                  
                                                    
                }    
                rs.close();
                stmt.close();

                                                                                  
            }
            catch(Exception ex)
            {
                ex.getMessage();
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("\r\n");

      connect();
      fetch();

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head><marquee bgcolor=\"sky blue\">\r\n");
      out.write("        <h2>POLICY INFORMATION</h2>   \r\n");
      out.write("    </marquee>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>JSP Page</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body bgcolor=\"grey\">\r\n");
      out.write("      \r\n");
      out.write("    <form action=\"view_official.jsp\">\r\n");
      out.write("         <br>\r\n");
      out.write("        <table bgcolor =\"white\" border=\"1\" align=\"center\" width=\"50\" height=\"50\">\r\n");
      out.write("                <thead>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th>POLICY NO</th>\r\n");
      out.write("                        <th>CUSTOMER</th>\r\n");
      out.write("                        <th>POLICY TYPE</th>\r\n");
      out.write("                        <th>PURCHASE DATE</th>\r\n");
      out.write("                        <th>NEXT PREMIUM DATE</th>\r\n");
      out.write("                        <th>POLICY START DATE</th>\r\n");
      out.write("                        <th>POLICY EXPIRY DATE</th>\r\n");
      out.write("                        <th>FREQUENCY</th>\r\n");
      out.write("                        <th>REG NO</th>\r\n");
      out.write("                        <th>PURCHASE VALUE</th>\r\n");
      out.write("                       \r\n");
      out.write("                    </tr>\r\n");
      out.write("                </thead>\r\n");
      out.write("                <tbody>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <br>\r\n");
      out.write("                        ");

                            for(int i=0;i<vcust_id.size();i++)
                            {
                        
      out.write(" \r\n");
      out.write("                        <td>");
      out.print(vpolicyno.get(i));
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print(vcust_id.get(i));
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print(vtype.get(i));
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print(vpurchasedate.get(i));
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print(vpremiumstart.get(i));
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print(vstart.get(i));
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print(vexpiry.get(i));
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print(vfrequency.get(i));
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print(vregno.get(i));
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print(vvalue.get(i));
      out.write("</td>\r\n");
      out.write("                       \r\n");
      out.write("                     </tr>\r\n");
      out.write("                     ");
 }
                         vcust_id.clear();
                         vexpiry.clear();
                         vstart.clear();
                         vfrequency.clear();
                         vpremiumstart.clear();
                         vstart.clear();
                         vtype.clear();
                         vregno.clear();
                         vvalue.clear();
                         vpolicyno.clear();
                    
      out.write("                    \r\n");
      out.write("                </tbody>\r\n");
      out.write("            </table>\r\n");
      out.write("                   \r\n");
      out.write("            \r\n");
      out.write("        </form>\r\n");
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
