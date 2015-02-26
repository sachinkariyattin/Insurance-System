package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.Vector;

public final class approve_005fvehicle_005fpolicies_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


      String msg="";
      String[] key;
       Vector vapproved=new Vector();
       Vector vpolicy_no=new Vector();
       Vector vtype=new Vector();
       Vector vpurchase_date=new Vector();
       Vector vnext_premium_date=new Vector();
       Vector vstart_date=new Vector();
       Vector vexpiry_date=new Vector();
       Vector vlife_cover=new Vector();
       Vector vpremium_paying_term=new Vector();
       Vector vfrequency=new Vector();
       Vector vpremium=new Vector();
       Vector vpurchase_value=new Vector();
       Vector vreg_no=new Vector();
       Vector vengine_no=new Vector();
       Vector vmake=new Vector();
       Vector vcust_id=new Vector();
       Vector vname=new Vector();
       Vector vcity=new Vector();
       
       Connection conn=null;
       PreparedStatement stmt=null;
       

       public void connect() {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc","","");
        } catch (Exception ex) {

            msg = ex.getMessage();
        }

    }
       
       public void fetch_ckb(HttpServletRequest request)
       {
         key=request.getParameterValues("ckb");
       }

      
       public void approve()
        {

        try
         {
        for(int i=0;i<key.length;i++)
            {
        stmt=conn.prepareStatement("update policy set approved='YES' where policy_no=?");
             stmt.setString(1, key[i]);  
             stmt.executeUpdate();
             stmt.clearParameters();
             stmt.close();
            }
        msg="updated..";
         }
        catch(Exception ex)
          {
            msg=ex.getMessage();
          }
        }
        
       
       public void fetch()
        {
            try
            {
                         vcust_id.clear();
                         vname.clear();
                         vcity.clear();
                         vstart_date.clear();
                         vpurchase_date.clear();
                         vexpiry_date.clear();
                         vpremium.clear();
                         vpurchase_value.clear();
                         vapproved.clear();
                         vfrequency.clear();
                         vpolicy_no.clear();
                         vtype.clear();
                         vengine_no.clear();
                         vreg_no.clear();
                         vmake.clear();
                         vnext_premium_date.clear();
                
                stmt=conn.prepareStatement("select A.policy_no,A.cust_id,type,purchase_date,premium_amt,frequency,policy_start_date,policy_exp_date,next_premium_date,approved,B.reg_no,B.engine_no,B.purchase_value,B.make,C.name,C.city from policy A,vehicle_insurance B,cust C where A.approved='NO' and C.cust_id=A.cust_id and A.policy_no=B.policy_no ");             
                ResultSet rs=stmt.executeQuery();
                while(rs.next())
                {
                    vpolicy_no.add(rs.getString("policy_no"));
                    vcust_id.add(rs.getString("cust_id"));
                    vtype.add(rs.getString("type"));
                    vpurchase_date.add(rs.getString("purchase_date"));
                    vpremium.add(rs.getString("premium_amt"));
                    vfrequency.add(rs.getString("frequency"));
                    vstart_date.add(rs.getString("policy_start_date"));
                    vexpiry_date.add(rs.getString("policy_exp_date"));
                    vnext_premium_date.add(rs.getString("next_premium_date"));
                    vapproved.add(rs.getString("approved"));
                    vreg_no.add(rs.getString("reg_no"));
                    vengine_no.add(rs.getString("engine_no"));
                    vpurchase_value.add(rs.getString("purchase_value"));
                    vmake.add(rs.getString("make"));
                    vname.add(rs.getString("name"));
                    vcity.add(rs.getString("city"));                                                   
                }    
                rs.close();
                stmt.close();
                
              conn.close();
                                                                                  
            }
            catch(Exception ex)
            {
              msg= ex.getMessage();
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("    \n");
      out.write("\n");

   connect();
   fetch();
   if(request.getParameter("btnsubmit")!=null)
     {
       connect();
       fetch_ckb(request);
       approve();
       fetch();     
     }

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Approve Vehicle Insurance Policies</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <a href=\"approved_vehicle_policies.jsp\">Click here to view approved policies</a>\n");
      out.write("        \n");
      out.write("         <h1 align=\"center\">Select policies to change approval status to YES</h1>\n");
      out.write("       \n");
      out.write("        <body bgcolor=\"grey\">\n");
      out.write("      \n");
      out.write("            <form action=\"approve_vehicle_policies.jsp\" method=\"POST\" >\n");
      out.write("         <br>\n");
      out.write("      \n");
      out.write("       \n");
      out.write("         ");

         if(vpolicy_no.size()>0)
         {
             
      out.write("\n");
      out.write("         <table bgcolor =\"white\" border=\"1\" align=\"center\" width=\"50\" height=\"50\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>SELECT</th>\n");
      out.write("                        <th>POLICY NO</th>\n");
      out.write("                        <th>APPROVED</th>\n");
      out.write("                        <th>CUSTOMER ID</th>\n");
      out.write("                        <th>NAME</th>\n");
      out.write("                        <th>CITY</th>\n");
      out.write("                        <th>POLICY TYPE</th>\n");
      out.write("                        <th>PURCHASE DATE</th>\n");
      out.write("                        <th>START DATE</th>\n");
      out.write("                        <th>EXPIRY DATE</th>\n");
      out.write("                        <th>PREMIUM AMOUNT</th>\n");
      out.write("                        <th>FREQUENCY</th>\n");
      out.write("                        <th>NEXT PREMIUM DATE</th>\n");
      out.write("                        <th>MAKE</th>\n");
      out.write("                        <th>REGISTRATION NUMBER</th>\n");
      out.write("                        <th>ENGINE NUMBER</th>\n");
      out.write("                        <th>PURCHASE VALUE</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <br>\n");
      out.write("                        ");

                            for(int i=0;i<vpolicy_no.size();i++)
                            {
                        
      out.write(" \n");
      out.write("                       <td><input type=\"checkbox\" name=\"ckb\" value=\"");
      out.print(vpolicy_no.get(i));
      out.write("\"/></td>\n");
      out.write("                        <td>");
      out.print(vpolicy_no.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vapproved.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vcust_id.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vname.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vcity.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vtype.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vpurchase_date.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vstart_date.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vexpiry_date.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vpremium.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vfrequency.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vnext_premium_date.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vmake.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vreg_no.get(i));
      out.write("</td>   \n");
      out.write("                        <td>");
      out.print(vengine_no.get(i));
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(vpurchase_value.get(i));
      out.write("</td> \n");
      out.write("                     </tr>\n");
      out.write("                     ");
 
                            } 
                     
      out.write("                    \n");
      out.write("                </tbody>\n");
      out.write("           </table>\n");
      out.write("                 <h1 align=\"center\"><input type=\"submit\" value=\"submit\" name=\"btnsubmit\"  /></h1>\n");
      out.write("                   ");
 
                            } 
                     
      out.write("  \n");
      out.write("                     ");

                     if(vpolicy_no.size()==0)
                      {
                       
      out.write("\n");
      out.write("                 <h5 align=\"center\">NO NEW GENERATED POLICIES</h5>\n");
      out.write("                 \n");
      out.write("                 ");
 
                            } 
                     
      out.write("  \n");
      out.write("                   <script>\n");
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
      out.write("         \n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
