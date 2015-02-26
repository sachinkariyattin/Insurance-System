package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class select_005fpolicy_005ftype_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {



String type="";
public void fetch(HttpServletRequest request)
       {
         type=request.getParameter("type");
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
      out.write('\n');
      out.write('\n');


if(request.getParameter("btnsubmit")!=null)
 {
    fetch(request);
    
    if(type.equals("Life Insurance"))
    {
        response.sendRedirect("approve_policies.jsp");
    }
       else if(type.equals("House Insurance"))
        {
           response.sendRedirect("approve_house_policies.jsp");
        }
    else if(type.equals("Health Insurance"))
        {
           response.sendRedirect("approve_health_policies.jsp");
        }
    else if(type.equals("Motor Insurance"))
        {
           response.sendRedirect("approve_vehicle_policies.jsp");
        }
 }



      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Select Policy Type</title>\n");
      out.write("    </head>\n");
      out.write("    <form name=\"frm\" action=\"select_policy_type.jsp\" method=\"POST\">\n");
      out.write("   \n");
      out.write("    <body>\n");
      out.write("        <h2 align=\"center\">Select Insurance Type</h2>\n");
      out.write("        <h5 align=\"center\"><b> Insurance Type: <select name=\"type\">\n");
      out.write("            <option>Life Insurance</option>\n");
      out.write("            <option>House Insurance</option>\n");
      out.write("            <option>Health Insurance</option>\n");
      out.write("            <option>Motor Insurance</option>\n");
      out.write("            </select></b>     <input type=\"submit\" value=\"GO\" name=\"btnsubmit\" /></h5>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <a href=\"Admin.jsp\">HOME</a>\n");
      out.write("    </body>\n");
      out.write("     </form>\n");
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
