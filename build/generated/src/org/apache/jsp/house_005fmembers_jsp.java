package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class house_005fmembers_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {




    Connection conn = null;
    PreparedStatement stmt = null;
    String[] txtmemid=new String[5];
    String[] txtgender=new String[5];
    String[] txtname=new String[5];
    String[] txtdob=new String[5];
    String[] txtoccupation=new String[5];
    String[] txtsuminsured=new String[5]; //txtmemid2,txtgender2,txtname2,txtdob2,txtoccupation2,txtsuminsured2,txtmemid3,txtgender3,txtname3,txtdob3,txtoccupation3,txtsuminsured3,txtmemid4,txtgender4,txtname4,txtdob4,txtoccupation4,txtsuminsured4= "";
    String var_members,var_policy,var_cust_id,mname,mdob,moccupation,msuminsured,mmemid,mgender,var_count,msg,x="";
    int n,i;
   
         
    public void input(HttpServletRequest request)
    {
         
     
          txtmemid[0]=request.getParameter("memberid");
          txtname[0]=request.getParameter("name");
          txtdob[0]=request.getParameter("date_of_birth");
          txtgender[0]=request.getParameter("gender");
          txtoccupation[0]=request.getParameter("occupation");
          txtsuminsured[0]=request.getParameter("sum_insured");
          
          txtmemid[1]=request.getParameter("memberid2");
          txtname[1]=request.getParameter("name2");
          txtdob[1]=request.getParameter("date_of_birth2");
          txtgender[1]=request.getParameter("gender2");
          txtoccupation[1]=request.getParameter("occupation2");
          txtsuminsured[1]=request.getParameter("sum_insured2");
          
          txtmemid[2]=request.getParameter("memberid3");
          txtname[2]=request.getParameter("name3");
          txtdob[2]=request.getParameter("date_of_birth3");
          txtgender[2]=request.getParameter("gender3");
          txtoccupation[2]=request.getParameter("occupation3");
          txtsuminsured[2]=request.getParameter("sum_insured3");
          
          txtmemid[3]=request.getParameter("memberid4");
          txtname[3]=request.getParameter("name4");
          txtdob[3]=request.getParameter("date_of_birth4");
          txtgender[3]=request.getParameter("gender4");
          txtoccupation[3]=request.getParameter("occupation4");
          txtsuminsured[3]=request.getParameter("sum_insured4");
     }
    public void print()
               {
        try{
            
           
                 x=txtname[0];
            }
        catch (Exception ex) {
            msg = ex.getMessage();
        }
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
      public void insert()
      {
          
        try{
             
             
            for(i=0;i<n;i++)
           {
          
           stmt=conn.prepareStatement("insert into house_members(memberid,name,occupaion,gender,date_of_birth,sum_insured,policy_no) values(?,?,?,?,?,?,?)");
             stmt.setString(1,txtmemid[i]);
             stmt.setString(2,txtname[i]);
             stmt.setString(3,txtoccupation[i]);
             stmt.setString(4,txtgender[i]);
             stmt.setString(5,txtdob[i]);
             stmt.setString(6,txtsuminsured[i]);
             stmt.setString(7,var_policy);
            stmt.executeUpdate();
      
            stmt.clearParameters();
            stmt.close();
            }
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("  \n");
      out.write(" ");

            HttpSession obj=request.getSession(false);
          var_cust_id=obj.getAttribute("session_cust_id").toString(); 
          var_members=obj.getAttribute("session_members").toString();
          var_policy=obj.getAttribute("session_policy").toString();
          
          n=Integer.parseInt(obj.getAttribute("session_members").toString());
       
           if (request.getParameter("btnsubmit") != null) {
               input(request);
               connect();
               insert();
               print();
            }

      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Member Details</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.print(var_cust_id);
      out.write(' ');
      out.write(' ');
      out.print(n);
      out.write(' ');
      out.print(var_policy);
      out.write(' ');
      out.print(x);
      out.write("\n");
      out.write("        <form name=\"frm\" method=\"post\" action=\"house_members.jsp\" >\n");
      out.write("            <table border=\"1\" bgcolor=\"white\" align=\"center\"  cellspacing=\"1\" cellpadding=\"5\" >\n");
      out.write("                <h2 align=\"center\"> Enter Member Details</h2>\n");
      out.write("                \n");
      out.write("                <thead>\n");
      out.write("                  <tr>\n");
      out.write("                     <th>Member ID</th>\n");
      out.write("                     <th> Name</th>\n");
      out.write("                     <th>Date of Birth</th>\n");
      out.write("                     <th>Occupation</th>\n");
      out.write("                     <th>Gender</th>\n");
      out.write("                     <th>Sum Insured</th>     \n");
      out.write("                  </tr>\n");
      out.write("                  \n");
      out.write("                </thead>\n");
      out.write("               \n");
      out.write("                    \n");
      out.write("                <tr>\n");
      out.write("                     <td><input type=\"text\" name=\"memberid\" value=\"1\" readonly=\"readonly\"/></td>\n");
      out.write("\n");
      out.write("                    <td><input type=\"text\" name=\"name\" /></td>\n");
      out.write("           \n");
      out.write("                    <td><input type=\"text\" name=\"date_of_birth\" /></td>\n");
      out.write("            \n");
      out.write("                    <td><input type=\"text\" name=\"occupation\"  /></td>\n");
      out.write("            \n");
      out.write("                 <td>Male<input type=\"radio\" name=\"gender\" value=\"M\" />\n");
      out.write("                     Female<input type=\"radio\" name=\"gender\" value=\"F\" />\n");
      out.write("               \n");
      out.write("                  <td><select name=\"sum_insured\">\n");
      out.write("                      <option>20000</option>\n");
      out.write("                      <option>30000</option>\n");
      out.write("                      <option>40000</option>\n");
      out.write("                      <option>50000</option>\n");
      out.write("                      </select></td>\n");
      out.write("                \n");
      out.write("                                \n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("               \n");
      out.write("\n");
      out.write("\n");
      out.write("                  <tr>\n");
      out.write("                      <td><input type=\"text\" name=\"memberid2\" value=\"2\" readonly=\"readonly\" /></td>\n");
      out.write("                    <td><input type=\"text\" name=\"name2\" /></td>\n");
      out.write("           \n");
      out.write("                    <td><input type=\"text\" name=\"date_of_birth2\" /></td>\n");
      out.write("            \n");
      out.write("                    <td><input type=\"text\" name=\"occupation2\"  /></td>\n");
      out.write("            \n");
      out.write("                 <td>Male<input type=\"radio\" name=\"gender2\" value=\"M\" />\n");
      out.write("                     Female<input type=\"radio\" name=\"gender2\" value=\"F\" />\n");
      out.write("               \n");
      out.write("                  <td><select name=\"sum_insured2\">\n");
      out.write("                      <option>20000</option>\n");
      out.write("                      <option>30000</option>\n");
      out.write("                      <option>40000</option>\n");
      out.write("                      <option>50000</option>\n");
      out.write("                      </select></td></li>\n");
      out.write("                   </tr>\n");
      out.write("                   \n");
      out.write("                   \n");
      out.write("                   <tr> \n");
      out.write("                       <td><input type=\"text\" name=\"memberid3\" value=\"3\" readonly=\"readonly\" /></td>\n");
      out.write("                    <td><input type=\"text\" name=\"name3\" /></td>\n");
      out.write("           \n");
      out.write("                    <td><input type=\"text\" name=\"date_of_birth3\" /></td>\n");
      out.write("            \n");
      out.write("                    <td><input type=\"text\" name=\"occupation3\"  /></td>\n");
      out.write("            \n");
      out.write("                 <td>Male<input type=\"radio\" name=\"gender3\" value=\"M\" />\n");
      out.write("                     Female<input type=\"radio\" name=\"gender3\" value=\"F\" />\n");
      out.write("               \n");
      out.write("                  <td><select name=\"sum_insured3\">\n");
      out.write("                      <option>20000</option>\n");
      out.write("                      <option>30000</option>\n");
      out.write("                      <option>40000</option>\n");
      out.write("                      <option>50000</option>\n");
      out.write("                      </select></td>                     \n");
      out.write("                   </tr>\n");
      out.write("                   \n");
      out.write("                    <tr> \n");
      out.write("                     <td><input type=\"text\" name=\"memberid4\" value=\"4\" readonly=\"readonly\"/></td>\n");
      out.write("                    <td><input type=\"text\" name=\"name4\" /></td>\n");
      out.write("           \n");
      out.write("                    <td><input type=\"text\" name=\"date_of_birth4\" /></td>\n");
      out.write("            \n");
      out.write("                    <td><input type=\"text\" name=\"occupation4\"  /></td>\n");
      out.write("            \n");
      out.write("                 <td>Male<input type=\"radio\" name=\"gender4\" value=\"M\" />\n");
      out.write("                     Female<input type=\"radio\" name=\"gender4\" value=\"F\" />\n");
      out.write("               \n");
      out.write("                  <td><select name=\"sum_insured4\">\n");
      out.write("                      <option>20000</option>\n");
      out.write("                      <option>30000</option>\n");
      out.write("                      <option>40000</option>\n");
      out.write("                      <option>50000</option>\n");
      out.write("                      </select></td>                     \n");
      out.write("                   </tr>\n");
      out.write("                   \n");
      out.write("            </table>\n");
      out.write("            <input type=\"submit\" value=\"Submit\" name=\"btnsubmit\" />\n");
      out.write("        </form>\n");
      out.write("        <script>\n");
      out.write("   ");
        
       if(request.getParameter("btnsubmit")!=null)
                     {
             
      out.write("               \n");
      out.write("         alert(\"");
      out.print(msg);
      out.write("\");\n");
      out.write("         ");

                 }
 
      out.write("\n");
      out.write("     </script>\n");
      out.write("        </body>\n");
      out.write("          \n");
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
