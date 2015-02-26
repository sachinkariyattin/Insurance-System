<%-- 
    Document   : Admin
    Created on : Mar 29, 2013, 5:56:25 PM
    Author     : Sac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Admin Home</title>
<link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css" />
<link href="Template/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Template/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Template/jquery.slidertron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.poptrox-1.0.js"></script>
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
            <div class="post">
			<div class="entry">
				<ul>
					<li>
						<h3>Welcome Admin</h3>
						<p>Choose from the below categories</p>
					</li>
					<li>
						<h3>Quick Links</h3>
						<ul>
							<li><a href="add_official.jsp">Add Employee</a></li>
                                            <li><a href="view_official.jsp">view all employees</a></li>
                                            <li><a href="search_official.jsp">Search or delete an employee</a></li>
                                            <li><a href="select_policy_type.jsp">Approve generated policies</a></li> 
                                            <li><a href="change_password.jsp">Change Password</a></li> 
                                            <li><a href="renew_policies.jsp">Renew Policies</a></li> 

						</ul>
					</li>
				
					
				</ul>
			</div>
		</div>
			
				</li>
			</ul>
        
		</div>

    </body>
</html>
