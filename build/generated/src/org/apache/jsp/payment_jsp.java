package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;
import java.text.DateFormat;

public final class payment_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


String msg="",card_no,name="",type="",policy_no="",var_policy_no,next_premium_date="";
int cvv,count;
float balance,premium_amt;
String var_system_date,var_next_date;
Connection conn=null;
PreparedStatement stmt=null;

 java.util.Date utilDate = new java.util.Date();
java.sql.Date receiptdate = new java.sql.Date(utilDate.getTime());

      
         public void connect() {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
        } catch (Exception ex) {

            msg = ex.getMessage();
        }

    }

void fetch_input(HttpServletRequest request)
{
card_no=request.getParameter("card_no");
cvv=Integer.parseInt(request.getParameter("cvv"));
name=request.getParameter("holders_name");
}        

void update()
{
try{
    stmt=conn.prepareStatement("Update credit_card set balance=balance-? where card_no=? and holder_name=? and cvv=? and balance>=?");
     stmt.setFloat(1,premium_amt);
     stmt.setString(2,card_no);
     stmt.setString(3,name);
     stmt.setInt(4,cvv);
     stmt.setFloat(5,premium_amt);
     
     
  int x=stmt.executeUpdate();

  if(x==0)
           {
        msg="card is invalid or balance is insufficient";
          }
     else
                 {
	//Insert into receipt table
        insert();
	//Update next premium date
        update_premium_date();
}
   }
catch(Exception ex)
{
msg=ex.getMessage();
}        

}

void insert()
{
    
  try{
      
      
      
    
      stmt=conn.prepareStatement("select count(receipt_no),max(receipt_no) from receipt");
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
    
   stmt=conn.prepareStatement("insert into receipt(policy_no,receipt_no,receipt_date,amt_paid) values(?,?,?,?)");
   stmt.setString(1,var_policy_no);
   stmt.setInt(2,count);
   stmt.setDate(3,receiptdate);
   stmt.setFloat(4,premium_amt);
   
   stmt.executeUpdate();
 
              
  }
  catch(Exception ex)
  {
    msg=ex.getMessage();
  }        
}


void update_premium_date()
{
    try{
        stmt=conn.prepareStatement("update policy set next_premium_date=? where policy_no=?");
         stmt.setString(1,var_next_date);
          stmt.setString(2,var_policy_no);
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write('\n');
      out.write('\n');

 SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

        //assign system date to string variables
         var_system_date = sdf.format(utilDate);
         var_next_date = sdf.format(utilDate);
	
	Calendar c = Calendar.getInstance();
        c.setTime(sdf.parse(var_next_date));

	// number of days to add to nextdate is 4	
	c.add(Calendar.DATE, 365);  
	var_next_date = sdf.format(c.getTime());

HttpSession obj=request.getSession(false);

var_policy_no=obj.getAttribute("session_policy_no").toString();
premium_amt=Float.parseFloat(obj.getAttribute("session_premium").toString());

if(request.getParameter("btnsubmit")!=null)
{
   fetch_input(request);
   connect();
   update();

}    

      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form name=\"frm\" action=\"payment.jsp\" method=\"POST\">\n");
      out.write("            <table border=\"2\" align=\"center\">\n");
      out.write("                <tr>\n");
      out.write("                <td>AMOUNT TO BE PAID</td><td><input type=\"text\" name=\"premium\" value=\"\" /></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>CARD NUMBER</td><td><select name=\"card_no\">\n");
      out.write("                            <option>78621498500063</option>\n");
      out.write("                            <option>85469732561046</option>\n");
      out.write("                            <option>97632154800234</option>\n");
      out.write("                            <option>97123658940012</option>\n");
      out.write("                        </select></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>CARD HOLDERS NAME</td><td><input type=\"text\" name=\"holder_name\" value=\"\" required=\"required\" placeholder=\"Enter card holders name\"/></td>\n");
      out.write("                <tr>\n");
      out.write("                    <td>CVV</td><td><input type=\"text\" name=\"cvv\" value=\"\" required=\"required\" placeholder=\"Enter CVV Number\"/></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"submit\" value=\"Submit\" name=\"btnsubmit\" /></td>\n");
      out.write("                </tr>  \n");
      out.write("            </table>\n");
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
