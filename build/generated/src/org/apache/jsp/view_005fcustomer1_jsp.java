package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Vector;
import java.sql.*;

public final class view_005fcustomer1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


       String msg="";
       Vector vcust_id=new Vector();
       Vector vlogin_id=new Vector();
       Vector vname=new Vector();
       Vector vdob=new Vector();
       Vector vaddress=new Vector();
       Vector vphone_no=new Vector();
       Vector vemail_id=new Vector();
       Vector vgender=new Vector();
       Vector vnationality=new Vector();
       Vector vcountry=new Vector();
       Vector vstate=new Vector();
       Vector vcity=new Vector();
       Vector vpincode=new Vector();
       
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
                stmt=conn.prepareStatement("select cust_id,loginid,name,dob,address,ph_no,email_id,gender,nationality,country,state,city,pincode from cust");             
                ResultSet rs=stmt.executeQuery();
                while(rs.next())
                {
                    vcust_id.add(rs.getString("cust_id"));
                    vlogin_id.add(rs.getString("loginid"));
                    vname.add(rs.getString("name"));
                    vdob.add(rs.getString("dob"));
                    vaddress.add(rs.getString("address"));
                    vphone_no.add(rs.getString("ph_no"));
                    vemail_id.add(rs.getString("email_id"));
                    vgender.add(rs.getString("gender"));
                    vnationality.add(rs.getString("nationality"));
                    vcountry.add(rs.getString("country"));
                    vstate.add(rs.getString("state"));
                    vcity.add(rs.getString("city"));
                    vpincode.add(rs.getString("pincode"));
                                                    
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write('\n');
      out.write('\n');

      connect();
      fetch();

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head><marquee bgcolor=\"grey\">\n");
      out.write("        <h2>LIST OF CUSTOMERS</h2>   \n");
      out.write("    </marquee>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body bgcolor=\"sky blue\">\n");
      out.write("      \n");
      out.write("    <form action=\"view_official.jsp\">\n");
      out.write("         <br>\n");
      out.write("        <table bgcolor =\"white\" border=\"1\" align=\"center\" width=\"50\" height=\"50\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>CUSTOMER_ID</th>\n");
      out.write("                        <th>LOGIN_ID</th>\n");
      out.write("                        <th>NAME</th>\n");
      out.write("                        <th>DOB</th>\n");
      out.write("                        <th>ADDRESS</th>\n");
      out.write("                        <th>PHONE_NO</th>\n");
      out.write("                        <th>EMAIL_ID</th>\n");
      out.write("                        <th>GENDER</th>\n");
      out.write("                        <th>NATIONALITY</th>\n");
      out.write("                        <th>COUNTRY</th>\n");
      out.write("                        <th>STATE</th>\n");
      out.write("                        <th>CITY</th>\n");
      out.write("                        <th>PINCODE</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <br>\n");
      out.write("                        ");

                            for(int i=0;i<vcust_id.size();i++)
                            {
                        
      out.write(" \n");
      out.write("                        <td>");
      out.print(vcust_id.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vlogin_id.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vname.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vdob.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vaddress.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vphone_no.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vemail_id.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vgender.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vnationality.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vcountry.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vstate.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vcity.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vpincode.get(i));
      out.write("</td>\n");
      out.write("                                \n");
      out.write("                     </tr>\n");
      out.write("                     ");
 }
                         vcust_id.clear();
                         vlogin_id.clear();
                         vname.clear();
                         vdob.clear();
                         vaddress.clear();
                         vphone_no.clear();
                         vemail_id.clear();
                         vgender.clear();
                         vnationality.clear();
                         vcountry.clear();
                         vstate.clear();
                         vcity.clear();
                         vpincode.clear();
                    
      out.write("                    \n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("                    ");
      out.print(msg);
      out.write("\n");
      out.write("            \n");
      out.write("        </form>\n");
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
