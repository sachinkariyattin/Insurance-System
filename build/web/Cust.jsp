<%-- 
    Document   : Cust
    Created on : Mar 29, 2013, 6:02:19 PM
    Author     : Sac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String var_loginid,var_oldpwd="",var_name;
HttpSession obj=request.getSession(false);
var_loginid=obj.getAttribute("session_loginid").toString();
var_oldpwd=obj.getAttribute("session_pwd").toString();
var_name=obj.getAttribute("session_user_name").toString();
%> 

<html>
    <head>
         <meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Customer Home</title>
<link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css" />
<link href="Template/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Template/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Template/jquery.slidertron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.poptrox-1.0.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
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
                    <li class="current_page_item"><a href="Cust.jsp"><span> Customer Home  </span></a></li>
        <li> <span>   My Account  </span>

			  <ul>
                           <li><a href="view_cust_profile.jsp"> View Profile </a></li>
                           <li><a href="change_password.jsp" target="_blank"> Change Password </a></li>
			  <li><a href="logout.jsp"> logout </a></li>
                                         
					 <li class="last"></li>
			  </ul>
           
        <li><a href="disscussionforum.jsp" target="_blank"> <span>Discussion Forum </span></a></li>
         <li><a href="about.jsp" target="_blank"><span>About</span></a></li>
			
		</ul>
		<script type="text/javascript">
			$('#menu').dropotron();
		</script>
	</div>
              
               <div class="post" >
			<div class="entry">
				<ul>
					<li>
						<h3>Welcome <%=var_name%></h3>
						<p>Choose from the below categories</p>
					</li>
					<li>
						<h3>Quick Links</h3>
						<ul>
					     <li><a href="view_policy_details.jsp">VIEW POLICY DETAILS</a></li>
                                             <li><a href="view_loan_details.jsp">VIEW LOAN DETAILS</a></li>
                                            <li><a href="view_policy_status.jsp">VIEW STATUS OF THE POLICIES</a></li>       
                                             <li><a href="view_payments.jsp">VIEW PAYMENTS</a></li> 
                                             <li><a href="loan_calculator.jsp">LOAN CALCULATOR</a></li> 
                                             
                                             
						</ul>
					</li>
				
					
				</ul>
			</div>
		</div>
       
        
      
		</div>
  
    </body>
</html>
