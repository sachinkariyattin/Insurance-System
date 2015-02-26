<%-- 
    Document   : policies
    Created on : Apr 13, 2013, 12:38:17 PM
    Author     : Sac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!
String cust_id="";
public void input(HttpServletRequest request)
{
   cust_id=request.getParameter("param");
   HttpSession obj=request.getSession(false);
   obj.setAttribute("session_cust_id", cust_id);
}
%>

<%
input(request);
%>

<html>
    <form action="policies.jsp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css" />
<link href="Template/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Template/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Template/jquery.slidertron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.poptrox-1.0.js"></script>
        <title>Select policy</title>
    </head>
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
                    <li class="current_page_item"><a href="Co.jsp"><span> Employee Home  </span></a></li>
        <li> <span>   My Account  </span>

			  <ul>
                                         <li><a href="view_profile.jsp"> View Profile </a></li>
                                         <li><a href="change_password.jsp" target="_blank">Change Password </a></li>
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
       <br>
			<ul>
				
					<h2 align="center">Select policy</h2>
					<ul>
                                            <h3 align="center">
                                             <li><a href="life_insurance.jsp">Generate Life Insurance Policy</a></li> 
                                             <li><a href="house_insurance.jsp">Generate House Insurance Policy</a></li>
                                             <li><a href="health_insurance.jsp">Generate Health Insurance</a></li>    
                                             <li><a href="motor_insurance.jsp">Generate Vehicle Insurance Policy</a></li></h3>
                                           
                        
                        
                        </ul>
				
			</ul>
        
        
		</div>
        
    </body>
    </form>
</html>
