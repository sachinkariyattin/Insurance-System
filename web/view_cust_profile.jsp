<%-- 
    Document   : view_cust_profile
    Created on : May 10, 2013, 10:30:33 AM
    Author     : Amol
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
 Connection conn = null;
 PreparedStatement stmt = null;
String var_name="",msg="",cust_id="",cust_name="",email_id="",loginid="",address="",dob="",phno="",nationality="",country="",state="",city="",pincode="",gender="",txtcustid="",empidfetched="",var_loginid="",occupation="";
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
     var_name=obj.getAttribute("session_user_name").toString();        
}

public void search()
        {
    try
    {
   stmt=conn.prepareStatement("select name,cust_id,loginid,email_id,address,dob,ph_no,nationality,country,state,city,pincode,gender,occupation from cust where loginid=?");
       stmt.setString(1, var_loginid);
       ResultSet rs=stmt.executeQuery();
      rs.next();
     cust_name=rs.getString("name");
     txtcustid=rs.getString("cust_id");
     loginid=rs.getString("loginid");
     email_id=rs.getString("email_id");
     address=rs.getString("address");
     dob=rs.getString("dob");
     phno=rs.getString("ph_no");
     nationality=rs.getString("nationality");
     country=rs.getString("country");
     state=rs.getString("state");
     city=rs.getString("city");
     pincode=rs.getString("pincode");
     gender=rs.getString("gender");
     occupation=rs.getString("occupation");
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
<title>Customer Profile</title>
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
    <body>
        
    <form name="frm" action="view_cust_profile.jsp">
       
   
        <h2 align="center">profile details</h2>
       <table border="1" align="center" width="50" height="50">
           <tbody bgcolor="white">
             <tr>
           <td>NAME</td><td><input type="text" name="Name" value="<%=cust_name%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>CUSTOMER ID</td><td><input type="text" name="txtempid" value="<%=txtcustid%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>LOGIN ID</td><td><input type="text" name="loginid" value="<%=loginid%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>EMAIL ID</td><td><input type="text" name="emailid" value="<%=email_id%>" readonly="readonly" /></td>
           </tr>
            <tr>
           <td>DOB</td><td><input type="text" name="dob" value="<%=dob%>" readonly="readonly"/></td>
           </tr>
           <tr>
           <td>ADDRESS</td><td><input type="text" name="address" value="<%=address%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>PHONE NO.</td><td><input type="text" name="phno" value="<%=phno%>" readonly="readonly" /></td>
           </tr>
            <tr>
           <td>NATIONALITY</td><td><input type="text" name="nationality" value="<%=nationality%>" readonly="readonly"/></td>
           </tr>
            <tr>
           <td>COUNTRY</td><td><input type="text" name="country" value="<%=country%>" readonly="readonly"/></td>
           </tr>
            <tr>
           <td>STATE</td><td><input type="text" name="state" value="<%=state%>" readonly="readonly"/></td>
           </tr>
           <tr>
           <td>City</td><td><input type="text" name="city" value="<%=address%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>PINCODE</td><td><input type="text" name="pincode" value="<%=pincode%>" readonly="readonly"/></td>
           </tr>
           <tr>
           <td>Gender</td><td><input type="text" name="gender" value="<%=gender%>" readonly="readonly"  /></td>
           </tr>
           <tr>
           <td>Occupation</td><td><input type="text" name="goccupation" value="<%=occupation%>" readonly="readonly"  /></td>
           </tr>
           
</tbody>
     
</table>  
</form>
       
               </body>       
        
</html>
