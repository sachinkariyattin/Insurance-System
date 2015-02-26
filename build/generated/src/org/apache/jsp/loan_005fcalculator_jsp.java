package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class loan_005fcalculator_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("    <title>LOAN CALCULATOR</title>\n");
      out.write("    \n");
      out.write("   <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("          <meta name=\"keywords\" content=\"\" />\n");
      out.write("<meta name=\"description\" content=\"\" />\n");
      out.write("<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("<link href=\"http://fonts.googleapis.com/css?family=Abel\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("<link href=\"Template/style.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />\n");
      out.write("<script type=\"text/javascript\" src=\"Template/jquery-1.7.1.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"Template/jquery.slidertron-1.0.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"Template/jquery.dropotron-1.0.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"Template/jquery.poptrox-1.0.js\"></script>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("<style type=\"text/css\">\n");
      out.write("body{\n");
      out.write("background-color:white;\n");
      out.write("font-size:10pt;\n");
      out.write("color:black;\n");
      out.write("font-family:sans-serif;\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("<script language=\"javascript\">\n");
      out.write("var amount, apr, n, payment, npy, tablebuilt=false;\n");
      out.write("\n");
      out.write("function calculate(){\n");
      out.write("var d=document.f;\n");
      out.write("amount=d.amount.value;\n");
      out.write("apr=d.apr.value;\n");
      out.write("n=d.n.value;\n");
      out.write("npy=d.npy.value;\n");
      out.write("if( (amount!='') && (n!='') && (apr!='') && (npy!='') ){\n");
      out.write("tmp=Math.pow((1+(apr/100/npy)), (n*npy));\n");
      out.write("payment=(amount*tmp*(apr/100/npy))/(tmp-1);\n");
      out.write("if((!isNaN(payment))&&(payment!=Number.POSITIVE_INFINITY)&&(payment!=Number.NEGATIVE_INFINITY)){\n");
      out.write("d.payment.value=round(payment);\n");
      out.write("d.totpaid.value=round(payment*n*npy);\n");
      out.write("d.intpaid.value=round((payment*n*npy)-amount);\n");
      out.write("}else alert('Error:\\nOne or more fields contain data\\nwhich cannot be used in the\\ncalculation.');\n");
      out.write("}else alert('Error:\\nYou did not provide enough data.');\n");
      out.write("}\n");
      out.write("\n");
      out.write("function round(val){\n");
      out.write("tmp=Math.round(val*100)/100+'';\n");
      out.write("if(tmp.indexOf('.')==-1)tmp+='.00';\n");
      out.write("else if(tmp.length-tmp.indexOf('.')==2)tmp+='0';\n");
      out.write("return tmp;\n");
      out.write("}\n");
      out.write("\n");
      out.write("function resetall(){\n");
      out.write("var d=document.f;\n");
      out.write("d.amount.value='';\n");
      out.write("d.apr.value='';\n");
      out.write("d.n.value='';\n");
      out.write("d.npy.value=12;\n");
      out.write("d.payment.value='';\n");
      out.write("d.totpaid.value='';\n");
      out.write("d.intpaid.value='';\n");
      out.write("d.amount.focus();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function buildtable(){\n");
      out.write("tablebuilt=true;\n");
      out.write("txt='<html><head><title>Payment Schedule</title></head><body bgcolor=\"#00436e\"><center><form>';\n");
      out.write("txt+='<input type=\"button\" value=\"Close\" onClick=\"self.close()\"><br><br>';\n");
      out.write("txt+='<table bgcolor=\"white\" border=\"1\" cellpadding=\"4\">';\n");
      out.write("txt+='<tr><td align=\"center\">Payment<br>Number</td><td align=\"center\">Payment<br>Amount</td><td align=\"center\">Interest</td><td align=\"center\">Principle</td><td align=\"center\">Balance</td></tr>';\n");
      out.write("amount=eval(amount);\n");
      out.write("for(i=1;i<=n*npy;i++){\n");
      out.write("tbldata='<td bgcolor=\"'+((i%2!=0) ? 'skyblue' : 'white')+'\" align=\"right\">';\n");
      out.write("interest=amount*apr/npy/100;\n");
      out.write("amount+=interest;\n");
      out.write("principle=payment-interest;\n");
      out.write("amount-=payment;\n");
      out.write("txt+='<tr>'+tbldata+i+':</td>'+tbldata+round(payment)+'</td>'+tbldata+round(interest)+'</td>'+tbldata+round(principle)+'</td>'+tbldata+round(amount)+'</td></tr>';\n");
      out.write("}\n");
      out.write("txt+='</table><br><br><input type=\"button\" value=\"Close\" onClick=\"self.close()\"></center></form></body></html>';\n");
      out.write("var psch=window.open('', 'viewsch' ,'top=0,left=0,toolbar=no,scrollbars=yes,resizable=yes,width=500,height=450,menubar=no,status=no');\n");
      out.write("psch.document.write(txt);\n");
      out.write("}\n");
      out.write("\n");
      out.write("window.onload=function(){\n");
      out.write("document.f.amount.focus();\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <form name=\"f\" action=\"loan_calculator.jsp\" method=\"POST\">\n");
      out.write("    <div id=\"wrapper\">\n");
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
      out.write("                           <li><a href=\"change_password.jsp\"> Change Password </a></li>\n");
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
      out.write("        </div></div>\n");
      out.write("    <body>\n");
      out.write("        <br>\n");
      out.write("        <h2 align=\"center\">LOAN CALCULATOR</h2><br>\n");
      out.write("<form name=\"f\">\n");
      out.write("<table align=\"center\" border=\"1\" cellpadding=\"4\"><tr><td><table border=\"0\">\n");
      out.write("<tr><td colspan=\"2\" align=\"center\"><b>Enter Loan Data Here</b></td></tr>\n");
      out.write("<tr><td width=\"400\">Loan Amount (in Rupees):</td><td><input type=\"text\" name=\"amount\" size=\"10\" required></td></tr>\n");
      out.write("<tr><td>Annual Percentage Rate (APR) %:</td><td><input type=\"text\" name=\"apr\" size=\"5\" required><b> \n");
      out.write("\t%</b></td></tr>\n");
      out.write("\n");
      out.write("<tr><td>Repayment period in years:</td><td><input type=\"text\" name=\"n\" size=\"5\" required></td></tr>\n");
      out.write("<tr><td>Amount of payments per year:</td><td><input type=\"text\" name=\"npy\" size=\"5\" value=\"12\" required></td></tr>\n");
      out.write("<tr><td colspan=\"2\">&nbsp;</td></tr>\n");
      out.write("<tr><td align=\"center\" colspan=\"2\"><input type=\"button\" value=\"Calculate\" onClick=\"calculate()\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" value=\"Reset\" onClick=\"resetall()\"></td></tr>\n");
      out.write("<tr><td colspan=\"2\"><hr></td></tr>\n");
      out.write("<tr><td>Amount per payment:</td><td><b>Rs.</b> <input type=\"text\" size=\"10\" name=\"payment\"></td></tr>\n");
      out.write("<tr><td>Total paid over the life of the loan:</td><td><b>Rs.</b> <input type=\"text\" size=\"10\" name=\"totpaid\"></td></tr>\n");
      out.write("<tr><td>Total interest paid over the life of the loan:</td><td><b>Rs.</b> <input type=\"text\" size=\"10\" name=\"intpaid\"></td></tr>\n");
      out.write("\n");
      out.write("<tr><td colspan=\"2\">&nbsp;</td></tr>\n");
      out.write("<tr><td colspan=\"2\" align=\"center\"><input type=\"button\" value=\"Build Payment Schedule\" onClick=\"buildtable()\"><br><br><small>\n");
      out.write("\t(Please give the script time to work, especially if the loan is for a long \n");
      out.write("\ttime.)</small></td></tr>\n");
      out.write("</table></td></tr></table>\n");
      out.write("</form>\n");
      out.write("\n");
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
