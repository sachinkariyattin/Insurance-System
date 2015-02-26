<%-- 
    Document   : select_policy_type
    Created on : May 2, 2013, 12:02:11 AM
    Author     : Sac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!

String type="";
public void fetch(HttpServletRequest request)
       {
         type=request.getParameter("type");
       }

%>

<%

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


%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css" />
<link href="Template/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Template/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Template/jquery.slidertron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.poptrox-1.0.js"></script>
        <title>Select Policy Type</title>
    </head>
    <form name="frm" action="select_policy_type.jsp" method="POST">
   <div id="wrapper">
	<div id="header-wrapper">
		<div id="header">
			<div id="logo">
				<h1><span> INSURANCE SYSTEM WITH </span></h1>
				<h1><span>TRACKING MANAGER</span>		  </h1>
		  </div>
		</div>
	</div>
        <div id="menu-wrapper">
		<ul id="menu">
                    <li class="current_page_item"><a href="Admin.jsp"><span> Admin Home  </span></a></li>
        <li> <span>   My Account  </span>

			  <ul>
                              
					 <li><a href="logout.jsp"> logout </a></li>
					 <li class="last"></li>
			  </ul>
            		
          <li><a href="about.jsp" target="_blank"><span>About</span></a></li>
			
		</ul>
		<script type="text/javascript">
			$('#menu').dropotron();
		</script>
	</div>
    <body>
        <br>
        <h2 align="center">Select Insurance Type</h2>
        <h5 align="center"><b> Insurance Type: <select name="type">
            <option>Life Insurance</option>
            <option>House Insurance</option>
            <option>Health Insurance</option>
            <option>Motor Insurance</option>
            </select></b>     <input type="submit" value="GO" name="btnsubmit" /></h5>
        
        
    </body>
     </form>
</html>
