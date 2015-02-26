<%-- 
    Document   : delete_official
    Created on : Mar 31, 2013, 1:05:11 PM
    Author     : Sac
--%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
 Connection conn = null;
    PreparedStatement stmt = null;
String txtcustid="",custidfetched="",loginid="",user_role="",name="",cust_id="",dob="",address="",phone_no="",email_id="",gender="",nationality="",country="",state="",city="",pincode="",msg = "";
    void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }
    
public void fetch_name(HttpServletRequest request)
        {
cust_id=request.getParameter("custid");
        }
public void fetch_empid(HttpServletRequest request)
        {
custidfetched=request.getParameter("txtcustid");
        }

public void search()
        {
    try
    {
   stmt=conn.prepareStatement("select name,cust_id,loginid,address,ph_no,dob,gender,nationality,country,state,city,pincode,email_id from cust where cust_id=?");
       stmt.setString(1, cust_id);
       ResultSet rs=stmt.executeQuery();
      rs.next();
     txtcustid=rs.getString("cust_id");
     loginid=rs.getString("loginid");
     address=rs.getString("address");
     name=rs.getString("name");
     dob=rs.getString("dob");
     gender=rs.getString("gender");
     phone_no=rs.getString("ph_no");
     country=rs.getString("country");
     nationality=rs.getString("nationality");
     state=rs.getString("state");
     city=rs.getString("city");
     pincode=rs.getString("pincode");
     email_id=rs.getString("email_id");
     rs.close();
     stmt.clearParameters();
     stmt.close();
     msg="search successfull";
    }
    catch(Exception e)
        {
         msg="NO DETAILS FOUND";
        }
    
}
public  void delete()
        {
    try
            {
        
            stmt=conn.prepareStatement("delete from login where loginid in (select loginid from cust where cust_id=?)");
           
            stmt.setString(1, custidfetched );
            stmt.executeUpdate();
            stmt.clearParameters();
            stmt.close();
            msg="DATA IS DELETED";
                       }
    catch(Exception e)
        {
        msg=e.getMessage();
       }
}  
%>

<%

if(request.getParameter("btnsearch")!=null)
    {
    connect();
    fetch_name(request);
    search();
    }
if(request.getParameter("btndelete")!=null)
    {
connect();
fetch_empid(request);
delete();
txtcustid="";
name="";
address="";
dob="";
gender="";
nationality="";
loginid="";
country="";
state="";
city="";
pincode="";
email_id="";
phone_no="";
    }

if(request.getParameter("btncancel")!=null)
    {
    msg="";
    }
if(request.getParameter("cancel")!=null)
    {
txtcustid="";
name="";
address="";
dob="";
gender="";
nationality="";
loginid="";
country="";
state="";
city="";
pincode="";
email_id="";
phone_no="";

    }
%>
<html>
    <head>
        <h2>Search and Delete Customer</h2>   
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Search Customer</title>
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
	<!-- end #header -->
	<div id="menu-wrapper">
		<ul id="menu">
                    <li class="current_page_item"><a href="Co.jsp"><span>  Employee Home  </span></a></li>
			<li> <span>   My Account  </span>

			  <ul>
                              <li class="first"><a href="view_profile.jsp"> View Profile</a></li>
					 <li><a href="logout.jsp"> Logout </a></li>
					 <li class="last"></li>
			  </ul>
		  </li>
			
			
         <li><a href="about.jsp" target="_blank"><span>About</span></a></li>
		</ul>
		<script type="text/javascript">
			$('#menu').dropotron();
		</script>
	</div>
	<!-- end #menu -->
    <form name="frm" action="search_customer.jsp">
        <br>
       <h2 align="center">Enter Customer ID</h2>
   <table align="center" border="1" height="100" width="100" bgcolor="white">
       <tr><td>CUSTOMER ID</td><td><input type="text" name="custid"  placeholder="Enter Customer Id" /></td></tr> 


       <tr><td><input name="btnsearch" type="submit" value="Search" /></td>
    <td><input name="btncancel" type="submit" value="Cancel"/></td></tr> 
</table>
        <h2 align="center">Customer details</h2>
       <table border="1" align="center" width="50" height="50">
           <tbody bgcolor="white">
             <tr>
           <td>Name</td><td><input type="text" name="Name" value="<%=name%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>Customer ID</td><td><input type="text" name="txtcustid" value="<%=txtcustid%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>Login ID</td><td><input type="text" name="loginid" value="<%=loginid%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>Address</td><td><input type="text" name="address" value="<%=address%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>DOB</td><td><input type="text" name="dob" value="<%=dob%>" readonly="readonly"/></td>
           </tr>
           <tr>
           <td>Gender</td><td><input type="text" name="gender" value="<%=gender%>"readonly="readonly"  /></td>
           </tr>
           <tr>
           <td>Nationality</td><td><input type="text" name="nationality" value="<%=nationality%>"readonly="readonly"  /></td>
           </tr>
           <tr>
           <td>Country</td><td><input type="text" name="country" value="<%=country%>"readonly="readonly"  /></td>
           </tr>
           <tr>
           <td>State</td><td><input type="text" name="state" value="<%=state%>"readonly="readonly"  /></td>
           </tr>
           <tr>
           <td>City</td><td><input type="text" name="city" value="<%=city%>"readonly="readonly"  /></td>
           </tr>
           <tr>
           <td>Pincode</td><td><input type="text" name="pincode" value="<%=pincode%>"readonly="readonly"  /></td>
           </tr>
           <tr>
           <td>Phone NO.</td><td><input type="text" name="phno" value="<%=phone_no%>"readonly="readonly"  /></td>
           </tr>
           <tr>
           <td>Email id</td><td><input type="text" name="emailid" value="<%=email_id%>"readonly="readonly"  /></td>
           </tr>
           <tr>
               <td><input type="submit" value="delete" name="btndelete"  /></td>
                <td><input type="submit" value="cancel" name="cancel" /></td>
                </tr>
</tbody>
     
</table>  
</form>
               </body>

  <script>
            <%        
       if(request.getParameter("btndelete")!=null)
                     {
             %>               
         alert("<%=msg%>");
         <%
                 }
         %>
             <%
             if(request.getParameter("btnsearch")!=null)
                     {
             %>               
         alert("<%=msg%>");
         <%
                 }
         %>
         </script>
</html>