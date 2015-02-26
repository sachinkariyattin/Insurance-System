package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class vehicle_005finsurance_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    Connection conn = null;
    PreparedStatement stmt = null;
    String custid,type,ppmm,ppdd,ppyyyy,nnmm,nndd,nnyyyy,ssmm,ssdd,ssyyyy,eemm,eedd,eeyyyy,regno,value,var_count,premium,msg,frequency = "";
    String purchase_date,next_premium_date,start_date,expiry_date="";
    int count;
    public void input(HttpServletRequest request)
    {
          custid =request.getParameter("txtcustid");
          frequency=request.getParameter("txtfrequency");
          type=request.getParameter("txttype");
          premium=request.getParameter("txtpremium");
          ppmm=request.getParameter("pmm");
          ppdd=request.getParameter("pdd");
          ppyyyy=request.getParameter("pyyyy");
          nnmm=request.getParameter("nmm");
          nndd=request.getParameter("ndd");
          nnyyyy=request.getParameter("nyyyy");
          ssmm=request.getParameter("smm");
          ssdd=request.getParameter("sdd");
          ssyyyy=request.getParameter("syyyy");
          eemm=request.getParameter("emm");
          eedd=request.getParameter("edd");
          eeyyyy=request.getParameter("eyyyy"); 
          regno=request.getParameter("txtregno");
          value=request.getParameter("txtvalue");
          purchase_date=ppmm+"-"+ppdd+"-"+ppyyyy;
          next_premium_date=nnmm+"-"+nndd+"-"+nnyyyy;
          start_date=ssmm+"-"+ssdd+"-"+ssyyyy;
          expiry_date=eemm+"-"+eedd+"-"+eeyyyy;
    }    

    public void connect() {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:sample","","");
        } catch (Exception ex) {

            msg = ex.getMessage();
        }

    }

    public void insert() {
       
            
        try {
             stmt=conn.prepareStatement("select count(slno),max(slno) from vehicle_insurance");
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
             var_count="POLICY"+var_count;
            
            
            
            stmt=conn.prepareStatement("insert into vehicle_insurance(policyno,cust_id,policy_type,purchase_date,next_premium_date,premium_amt,frequency,start_date,expiry_date,reg_no,purchase_value,slno)values(?,?,?,?,?,?,?,?,?,?,?,?)");
            stmt.setString(1,var_count);
            stmt.setString(2,custid);
            stmt.setString(3,type);
            stmt.setString(4,purchase_date);
            stmt.setString(5,next_premium_date);
            stmt.setString(6,premium);
            stmt.setString(7,frequency);
            stmt.setString(8,start_date);
            stmt.setString(9,expiry_date);
            stmt.setString(10,regno);
            stmt.setString(11,value);
            stmt.setInt(12,count);
            stmt.executeUpdate();
      
            stmt.clearParameters();
            stmt.close();
         
            conn.close();
            msg = "Data is inserted";

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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write('\n');

            if (request.getParameter("btnsubmit") != null) {
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h2><a href=\"Co.jsp\">Company Official</h2></a>\n");
      out.write("        <form name=\"frm\" method=\"post\" action=\"vehicle_insurance.jsp\" >\n");
      out.write("            <table border=\"3\" bgcolor=\"brown\" align=\"center\"  cellspacing=\"3\" cellpadding=\"5\" >\n");
      out.write("                <h2 align=\"center\"> Enter details</h2>\n");
      out.write("                <tr>\n");
      out.write("                    <td>CUSTOMER ID</td>\n");
      out.write("                    <td><input type=\"text\" name=\"txtcustid\" value=\"\" /></td>\n");
      out.write("                </tr>\n");
      out.write("                    <tr>\n");
      out.write("                    <td>Policy Type</td>\n");
      out.write("                    <td><input type=\"text\" name=\"txttype\" value=\"VehicleIn\" readonly=\"readonly\" /></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("\t\t\t<td style=\"font-size: 14pt\" align=\"left\" width=\"281\"><font face=\"cambria\">Purchase date :</font></td>\n");
      out.write("\t\t\t<td style=\"border-color: maroon\" align=\"left\" width=\"360\"><font face=\"cambria\">MM : <select name=\"pmm\">\n");
      out.write("\t\t\t\t<option value=\"-1\">MONTH</option>\n");
      out.write("\t\t\t\t<option value=\"1\">Jan</option><option value=\"2\">Feb</option><option value=\"3\">Mar</option><option value=\"4\">Apr</option><option value=\"5\">May</option><option value=\"6\">Jun</option><option value=\"7\">Jul</option><option value=\"8\">Aug</option><option value=\"9\">Sep</option><option value=\"10\">Oct</option><option value=\"11\">Nov</option><option value=\"12\">Dec</option></select> \n");
      out.write("\t\t\t\tDD:<select name=\"pdd\" id=\"dd\" value=\"\"><option value=\"-1\">DAY</option>\n");
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
      out.write("\t\t\t\tYYYY:<select name=\"pyyyy\" id=\"yyyy\" value=\"\"><option value=\"-1\">YEAR</option>\n");
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
      out.write("                <tr>\n");
      out.write("\t\t\t<td style=\"font-size: 14pt\" align=\"left\" width=\"281\"><font face=\"cambria\">Next Premium date :</font></td>\n");
      out.write("\t\t\t<td style=\"border-color: maroon\" align=\"left\" width=\"360\"><font face=\"cambria\">MM : <select name=\"nmm\">\n");
      out.write("\t\t\t\t<option value=\"-1\">MONTH</option>\n");
      out.write("\t\t\t\t<option value=\"1\">Jan</option><option value=\"2\">Feb</option><option value=\"3\">Mar</option><option value=\"4\">Apr</option><option value=\"5\">May</option><option value=\"6\">Jun</option><option value=\"7\">Jul</option><option value=\"8\">Aug</option><option value=\"9\">Sep</option><option value=\"10\">Oct</option><option value=\"11\">Nov</option><option value=\"12\">Dec</option></select> \n");
      out.write("\t\t\t\tDD:<select name=\"ndd\" id=\"dd\" value=\"\"><option value=\"-1\">DAY</option>\n");
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
      out.write("\t\t\t\tYYYY:<select name=\"nyyyy\" id=\"yyyy\" value=\"\"><option value=\"-1\">YEAR</option>\n");
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
      out.write("                <tr>\n");
      out.write("                    <td>Premium amount</td>\n");
      out.write("                    <td><input type=\"text\" name=\"txtpremium\" value=\"\" /></td>\n");
      out.write("                </tr>\n");
      out.write("             \n");
      out.write("                <tr>\n");
      out.write("                    <td>Frequency</td>\n");
      out.write("                    <td><input type=\"text\" name=\"txtfrequency\" value=\"yearly\" readonly=\"readonly\"/></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                   <td style=\"font-size: 14pt\" align=\"left\" width=\"281\"><font face=\"cambria\">Policy start date :</font></td>\n");
      out.write("\t\t\t<td style=\"border-color: maroon\" align=\"left\" width=\"360\"><font face=\"cambria\">MM : <select name=\"smm\">\n");
      out.write("\t\t\t\t<option value=\"-1\">MONTH</option>\n");
      out.write("\t\t\t\t<option value=\"1\">Jan</option><option value=\"2\">Feb</option><option value=\"3\">Mar</option><option value=\"4\">Apr</option><option value=\"5\">May</option><option value=\"6\">Jun</option><option value=\"7\">Jul</option><option value=\"8\">Aug</option><option value=\"9\">Sep</option><option value=\"10\">Oct</option><option value=\"11\">Nov</option><option value=\"12\">Dec</option></select> \n");
      out.write("\t\t\t\tDD:<select name=\"sdd\" id=\"dd\" value=\"\"><option value=\"-1\">DAY</option>\n");
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
      out.write("\t\t\t\tYYYY:<select name=\"syyyy\" id=\"yyyy\" value=\"\"><option value=\"-1\">YEAR</option>\n");
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
      out.write("                <tr>\n");
      out.write("                   <td style=\"font-size: 14pt\" align=\"left\" width=\"281\"><font face=\"cambria\">Policy expiry date :</font></td>\n");
      out.write("\t\t\t<td style=\"border-color: maroon\" align=\"left\" width=\"360\"><font face=\"cambria\">MM : <select name=\"emm\">\n");
      out.write("\t\t\t\t<option value=\"-1\">MONTH</option>\n");
      out.write("\t\t\t\t<option value=\"1\">Jan</option><option value=\"2\">Feb</option><option value=\"3\">Mar</option><option value=\"4\">Apr</option><option value=\"5\">May</option><option value=\"6\">Jun</option><option value=\"7\">Jul</option><option value=\"8\">Aug</option><option value=\"9\">Sep</option><option value=\"10\">Oct</option><option value=\"11\">Nov</option><option value=\"12\">Dec</option></select> \n");
      out.write("\t\t\t\tDD:<select name=\"edd\" id=\"dd\" value=\"\"><option value=\"-1\">DAY</option>\n");
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
      out.write("\t\t\t\tYYYY:<select name=\"eyyyy\" id=\"yyyy\" value=\"\"><option value=\"-1\">YEAR</option>\n");
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
      out.write("                \n");
      out.write("                  <tr>\n");
      out.write("                    <td>REG NO</td>\n");
      out.write("                    <td><input type=\"text\" name=\"txtregno\" value=\"\" /></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Purchase Value</td>\n");
      out.write("                    <td><input type=\"text\" name=\"txtvalue\" value=\"\" /></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"submit\" value=\"Submit\" name=\"btnsubmit\" /></td>\n");
      out.write("               \n");
      out.write("                    <td><input type=\"reset\" name=\"btncancel\" value=\"Cancel\" /></td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("         \n");
      out.write("        </form>\n");
      out.write("<script>\n");
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
