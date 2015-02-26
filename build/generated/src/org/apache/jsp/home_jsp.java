package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n");
      out.write("<!--\n");
      out.write("Design by Free CSS Templates\n");
      out.write("http://www.freecsstemplates.org\n");
      out.write("Released for free under a Creative Commons Attribution 2.5 License\n");
      out.write("\n");
      out.write("Name       : Boldness v.2   \n");
      out.write("Description: A two-column, fixed-width design with simple color scheme.\n");
      out.write("Version    : 1.0\n");
      out.write("Released   : 20120430\n");
      out.write("-->\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("<head>\n");
      out.write("<meta name=\"keywords\" content=\"\" />\n");
      out.write("<meta name=\"description\" content=\"\" />\n");
      out.write("<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("<title>Insurance System with Tracking Manager</title>\n");
      out.write("<link href=\"http://fonts.googleapis.com/css?family=Abel\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("<link href=\"Template/style.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />\n");
      out.write("<script type=\"text/javascript\" src=\"Template/jquery-1.7.1.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"Template/jquery.slidertron-1.0.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"Template/jquery.dropotron-1.0.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"Template/jquery.poptrox-1.0.js\"></script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div id=\"wrapper\">\n");
      out.write("\t<div id=\"header-wrapper\">\n");
      out.write("\t\t<div id=\"header\">\n");
      out.write("\t\t\t<div id=\"logo\">\n");
      out.write("\t\t\t\t<h1><span> INSURANCE SYSTEM WITH </span></h1>\n");
      out.write("\t\t\t\t<h1><span>TRACKING MANAGER</span>\t\t  </h1>\n");
      out.write("\t\t  </div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("\t<!-- end #header -->\n");
      out.write("\t<div id=\"menu-wrapper\">\n");
      out.write("\t\t<ul id=\"menu\">\n");
      out.write("\t\t\t<li class=\"current_page_item\"><a href=\"#\"><span>  Home  </span></a></li>\n");
      out.write("\t\t\t<li> <span>   login  </span>\n");
      out.write("\n");
      out.write("\t\t\t  <ul>\n");
      out.write("                              <li class=\"first\"><a href=\"logincust.jsp\"> Customer Login</a></li>\n");
      out.write("\t\t\t\t\t <li><a href=\"login.jsp\"> Employee Login </a></li>\n");
      out.write("\t\t\t\t\t <li class=\"last\"></li>\n");
      out.write("\t\t\t  </ul>\n");
      out.write("\t\t  </li>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\n");
      out.write("            <li><a href=\"about.jsp\" target=\"_blank\"><span>About</span></a></li>\n");
      out.write("\t\t\t\n");
      out.write("\t\t</ul>\n");
      out.write("\t\t<script type=\"text/javascript\">\n");
      out.write("\t\t\t$('#menu').dropotron();\n");
      out.write("\t\t</script>\n");
      out.write("\t</div>\n");
      out.write("\t<!-- end #menu -->\n");
      out.write("\t<div id=\"page\">\n");
      out.write("\t\t<div id=\"content\">\n");
      out.write("\t\t\t<div class=\"contentbg\">\n");
      out.write("\t\t\t\t<div id=\"slider\">\n");
      out.write("\t\t\t\t\t<div class=\"viewer\">\n");
      out.write("\t\t\t\t\t\t<div class=\"reel\">\n");
      out.write("\t\t\t\t\t\t\t<div id=\"gallery\">\n");
      out.write("                                                            <div class=\"slide\"> <a href=\"images/health.jpg\"><img src=\"Template/images/health.jpg\" width=\"590\" height=\"300\" alt=\"\" /></a> </div>\n");
      out.write("                                                            <div class=\"slide\"> <a href=\"images/house.jpg\"><img src=\"Template/images/house.jpg\" width=\"590\" height=\"300\" alt=\"\" /></a> </div>\n");
      out.write("                                                            <div class=\"slide\"> <a href=\"images/life-insurance1_1.jpg\"><img src=\"Template/images/life-insurance1_1.jpg\" width=\"590\" height=\"300\" alt=\"\" /></a> </div>\n");
      out.write("                                \n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"slide\"> <a href=\"images/vehicle.jpg\"><img src=\"Template/images/vehicle.jpg\" width=\"590\" height=\"300\" alt=\"\" /></a> </div>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<script type=\"text/javascript\">\n");
      out.write("\t\t\t\t$('#slider').slidertron({\n");
      out.write("\t\t\t\t\tviewerSelector: '.viewer',\n");
      out.write("\t\t\t\t\treelSelector: '.viewer .reel',\n");
      out.write("\t\t\t\t\tslidesSelector: '.viewer .reel .slide',\n");
      out.write("\t\t\t\t\tadvanceDelay: 3000,\n");
      out.write("\t\t\t\t\tspeed: 'slow'\n");
      out.write("\t\t\t\t});\n");
      out.write("\t\t\t</script>\n");
      out.write("\t\t\t\t<script type=\"text/javascript\">\n");
      out.write("\t\t\t\t$('#gallery').poptrox({\n");
      out.write("\t\t\t\t\toverlayColor: '#222222',\n");
      out.write("\t\t\t\t\toverlayOpacity: 0.75,\n");
      out.write("\t\t\t\t\tpopupCloserBackgroundColor: '#560969',\n");
      out.write("\t\t\t\t\tpopupBackgroundColor: '#FFFFFF',\n");
      out.write("\t\t\t\t\tpopupTextColor: '#aaaaaa',\n");
      out.write("\t\t\t\t\tpopupPadding: 20\n");
      out.write("\t\t\t\t});\n");
      out.write("\t\t\t</script>\n");
      out.write("\t\t\t\t<div class=\"post\">\n");
      out.write("\t\t\t\t  <p class=\"meta\">&nbsp;</p>\n");
      out.write("\t\t\t\t\t<div class=\"entry\">\n");
      out.write("                  <div id=\"Life Insurance\">  <h2 class=\"title\">Life Insurance</h2></div>\n");
      out.write("                    <p>In today&rsquo;s uncertain world, there could be calamity at every  step of the life. It is up to you to ensure that your family stays protected  always.ISTM Plans helps you do exactly the same. You  have a wide range of options to choose a plan from. Right from limited period  plans to lifetime protection plans, you can opt for the one that suits your  lifestyle.While we understand that nothing can compensate for the loss  of a life, we intend to provide you the peace of mind. Investing in ISTM  Protection Plans would mean your family&rsquo;s future is in safe hands.</p>\n");
      out.write("</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"post\">\n");
      out.write("\t\t\t\t  <div id=\"Motor Insurance\"><h2 class=\"title\">Motor  Insurance</h2></div>\n");
      out.write("\t\t\t\t  <div class=\"entry\">\n");
      out.write("\t\t\t\t    <p>Your car is not only a means of transport, but it's also a  valued possession in which you and your family can travel together. Any  untoward incident, loss or theft would inconvenience you and also cause you  stress. 'Drive forward' with the assurance of ISTM Car Insurance. Motor  Insurance is mandatory in India, so go ahead and buy a ISTM Motor Insurance  policy and drive ahead with no tension! ISTM Motor Insurance not only  offers a comprehensive motor insurance for your car, but also offers post-accident  assistance. In addition to this, two wheeler insurance is also offered for  bikes and scooters. Two wheelers are the life-line of any family and any loss,  damage or theft could leave you stranded and helpless. Not only does ISTM  Motor Insurance offer coverage for any loss or liabilities, but it also has a  comprehensive plan that covers third party liability.</p>\n");
      out.write("</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"post\">\n");
      out.write("\t\t\t\t\t<div id=\"House Insurance\"><h2 class=\"title\">House Insurance</h2></div>\n");
      out.write("\t\t\t\t\t<div class=\"entry\">\n");
      out.write("\t\t\t\t\t  <p><strong>ISTM  Householder's Package Policy</strong><br />\n");
      out.write("\t\t\t\t\t  </p>\n");
      out.write("                                            <p><img width=\"7\" height=\"7\" src=\"Template/index_clip_image001.jpg\" alt=\"Description: http://www.reliancegeneral.co.in/SiteCollectionImages/articles/dot.jpg\" />Covers burglary &amp; Housebreaking<br />\n");
      out.write("                        <img width=\"7\" height=\"7\" src=\"Template/index_clip_image001_0000.jpg\" alt=\"Description: http://www.reliancegeneral.co.in/SiteCollectionImages/articles/dot.jpg\" />Covers Domestic electrical appliances<br />\n");
      out.write("                        <img width=\"7\" height=\"7\" src=\"Template/index_clip_image001_0001.jpg\" alt=\"Description: http://www.reliancegeneral.co.in/SiteCollectionImages/articles/dot.jpg\" />Covers structure &amp; contents of house                      </p>\n");
      out.write("                      <p><strong>Key Advantages - Home Insurance</strong><br/>\n");
      out.write("  &quot;Home sweet home  be it ever so humble&quot; is true for everyone. Home is one of your biggest  investments. Get this biggest investment protected with ISTM Householders'  Package Policy which is tailor made to insure your individual home and prized  possessions.<br />\n");
      out.write("                      ISTM Householders'  Package Policy gives you comprehensive insurance cover for your home and its  contents at a reasonable insurance premium along with added incentives as below</p>\n");
      out.write("                      <ul type=\"disc\">\n");
      out.write("                        <li>The policy covers both structure and /or contents of       your home</li>\n");
      out.write("                        <li>It covers your home against burglary, fire, terrorism</li>\n");
      out.write("                        <li>Within the house it will provide cover for valuables,       electronics, and just about anything you wish</li>\n");
      out.write("                      </ul>\n");
      out.write("                    </div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("                <div class=\"post\">\n");
      out.write("\t\t\t\t  <div id=\"Health Insurance\"><h2 class=\"title\">Health Insurance</h2></div>\n");
      out.write("\t\t\t\t  <div class=\"entry\">\n");
      out.write("\t\t\t\t    <p>Health is Wealth! At ISTM General Insurance we believe  that your health is the most important asset you possess. Yet when an unexpected  illness or accident occurs, we ensure that you do not need to worry about  finances. We offer a variety of health insurance policies that cover you for  hospitalization expenses for illness, treatment and recuperation. Our health  insurance is designed to be simple and provide the widest coverage. Our network  of hospitals and agents spans the entire country and provides cashless  facilities across the nation. We believe that every family should be covered by  an insurance policy. Health insurance in India is growing rapidly so why wait,  join the ISTM family and be assured with our customized health insurance  plans. This is the best gift you can give your family! Get covered and be  assured.</p>\n");
      out.write("</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div style=\"clear: both;\">&nbsp; </div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<!-- end #content -->\n");
      out.write("\t\t<div id=\"sidebar-bg\">\n");
      out.write("\t\t\t<div id=\"sidebar\">\n");
      out.write("\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t<h3>Welcome to ISTM</h3>\n");
      out.write("\t\t\t\t\t\t<p>Our company provides Health Insurance,Life Insurance,House Insurance and Motor Insurance policies</p>\n");
      out.write("\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t\t<h3>Quick Links</h3>\n");
      out.write("\t\t\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"#Life Insurance\">Life Insurance </a></li>\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"#Motor Insurance\">Motor Insurance </a></li>\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"#House Insurance\">House Insurance</a></li>\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"#Health Insurance\">Health Insurance</a></li>\n");
      out.write("\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<!-- end #sidebar -->\n");
      out.write("\t\t<div style=\"clear: both;\">&nbsp;</div>\n");
      out.write("\t</div>\n");
      out.write("\t<!-- end #page -->\n");
      out.write("</div>\n");
      out.write("<div id=\"footer\">\n");
      out.write("\t<p>2013. ISTM.com. All rights reserved. Design by <a href=\"http://www.TECH_CRUNCHERS.org/\">&copy Tech Crunchers</a>.</p>\n");
      out.write("</div>\n");
      out.write("<!-- end #footer -->\n");
      out.write("</body>\n");
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
