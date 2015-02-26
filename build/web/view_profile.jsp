<%-- 
    Document   : view_profile
    Created on : Apr 12, 2013, 5:29:36 PM
    Author     : Sac
--%>

<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
 Connection conn = null;
    PreparedStatement stmt = null;
String msg="",empid="",loginid="",address="",doj="",dsgn="",gender="",name="",txtempid="",empidfetched="",var_loginid="";
    void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }
    

public void fetch_login(HttpServletRequest request)
        {
     HttpSession obj=request.getSession(false);

        var_loginid=obj.getAttribute("session_loginid").toString();
        }

public void search()
        {
    try
    {
   stmt=conn.prepareStatement("select name,empid,loginid,address,designation,doj,gender from companyofficial where loginid=?");
       stmt.setString(1, var_loginid);
       ResultSet rs=stmt.executeQuery();
      rs.next();
     txtempid=rs.getString("empid");
     loginid=rs.getString("loginid");
     address=rs.getString("address");
     dsgn=rs.getString("designation");
     doj=rs.getString("doj");
     gender=rs.getString("gender");
     name=rs.getString("name");
     rs.close();
     stmt.clearParameters();
     stmt.close();
     
    }
    catch(Exception e)
        {
         msg="NO DETAILS FOUND";
        }
    
}
  
%>

<%
    connect();
    fetch_login(request);
    search();  
%>

<html>
    <head>
         <meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Employee Profile</title>
<link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css" />
<link href="Template/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Template/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Template/jquery.slidertron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.poptrox-1.0.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
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
            	<li><a href="generate_policies.jsp"> <span>Generate policies</span></a></li>
        <li><a href="disscussionforum.jsp" target="_blank"> <span>Discussion Forum </span></a></li>	
           <li><a href="about.jsp" target="_blank"><span>About</span></a></li>
			
		</ul>
		<script type="text/javascript">
			$('#menu').dropotron();
		</script>
	</div>
    <body>
        
    <form name="frm" action="search_official.jsp">
       
   
        <h2 align="center">profile details</h2>
       <table border="1" align="center" width="50" height="50">
           <tbody bgcolor="white">
             <tr>
           <td>Name</td><td><input type="text" name="Name" value="<%=name%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>Employee ID</td><td><input type="text" name="txtempid" value="<%=txtempid%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>Login ID</td><td><input type="text" name="loginid" value="<%=loginid%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>City</td><td><input type="text" name="address" value="<%=address%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>DOJ</td><td><input type="text" name="doj" value="<%=doj%>" readonly="readonly"/></td>
           </tr>
           <tr>
           <td>Gender</td><td><input type="text" name="gender" value="<%=gender%>"readonly="readonly"  /></td>
           </tr>
           
</tbody>
     
</table>  
</form>
       
               </body>       
        
</html>
