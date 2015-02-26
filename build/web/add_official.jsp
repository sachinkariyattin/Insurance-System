<%-- 
    Document   : add_official.jsp
    Created on : Mar 30, 2013, 12:48:11 PM
    Author     : Sac
--%>

<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%!
    Connection conn = null;
    PreparedStatement stmt = null;
    String name, loginid, empid, emailid,phno,pincode,middlename,lastname,dsgn,city,gender,doj,address,var_count,mm,dd,yyyy,msg = "";
    String user_role="Co";
    String password;
    String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789+@";
    String sms="";
    int PASSWORD_LENGTH =5;
    Random RANDOM = new SecureRandom();
int count;
   
public void input(HttpServletRequest request) {
       
        name = request.getParameter("txtname");
        middlename=request.getParameter("txtmiddle");
        lastname=request.getParameter("txtlast");
        phno=request.getParameter("txtphno");
       // dd=request.getParameter("dd");
        loginid = request.getParameter("txtemail");
        emailid = request.getParameter("txtemail");
        dsgn = request.getParameter("designation");
        gender=request.getParameter("gender");
       // mm=request.getParameter("mm");
        //yyyy=request.getParameter("yyyy");
        address=request.getParameter("txtaddress");
        city=request.getParameter("txtcity");
        pincode=request.getParameter("txtpincode");
        doj=request.getParameter("txtdoj");
    }

    public void connect() {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
        } catch (Exception ex) {

            msg = ex.getMessage();
        }

    }
  
public void randomgenerate()
           {
    password="";
   for (int i=0; i<PASSWORD_LENGTH; i++)
      {
          int index = (int)(RANDOM.nextDouble()*letters.length());
          password += letters.substring(index, index+1);
      }
}
 
    public void insert() {
        try {
             stmt=conn.prepareStatement("select count(slno),max(slno) from companyofficial");
    ResultSet rs=stmt.executeQuery();
    rs.next();
    count=rs.getInt(1);
    if(count==0)
        {
    count=1;
    
        }
    else
        {
    count=rs.getInt(2);
    count+=1;
        }    
    rs.close();
    stmt.clearParameters();
    stmt.close();
    
             var_count=count+"";
             var_count="C"+var_count;
            stmt = conn.prepareStatement("insert into login(loginid,password,user_role)values(?,?,?)");
             stmt.setString(1, loginid);
            stmt.setString(2, password);
            stmt.setString(3, user_role);
        stmt.executeUpdate();
        
        stmt.close();
             
            stmt = conn.prepareStatement("insert into companyofficial(name,empid,emailid,designation,address,gender,doj,slno,loginid,middle_name,last_name,pincode,city,ph_no)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
           
            stmt.setString(1, name);
            stmt.setString(2, var_count);
            stmt.setString(3, emailid);
            stmt.setString(4, dsgn);
            stmt.setString(5, address);
            stmt.setString(6, gender);
            stmt.setString(7, doj);
            stmt.setInt(8, count);
            stmt.setString(9,loginid);
            stmt.setString(10,middlename);
            stmt.setString(11,lastname);
            stmt.setString(12,pincode);
            stmt.setString(13,city);
            stmt.setString(14,phno);
            stmt.executeUpdate();
            stmt.clearParameters();
            
            stmt.close();
        conn.close();
        
        msg = "official added";
          
        
        } 
        
        
        catch (Exception ex) {
            msg = ex.getMessage();
            
        }

    }
    


%>

<%

            
               if (request.getParameter("btnsubmit")!= null) 
               {
                   
                input(request);
                connect();
                randomgenerate();
                insert();
                }
             

%>
<% 
if(request.getParameter("btnCancel")!=null)
     {
        msg=" ";
     }
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Insurance System with Tracking Manager</title>
<link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css" />
<link href="Template/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Template/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Template/jquery.slidertron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.poptrox-1.0.js"></script>
        <title>Add official</title>
        
          <TITLE>JavaScript Toolbox - Calendar Popup To Select Date</TITLE>
        <SCRIPT LANGUAGE="JavaScript" SRC="CalendarPopup.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript">
         
	var cal2 = new CalendarPopup();
        cal2.showYearNavigation();
	</SCRIPT>
        
    </head>
     
        <script type = "text/javascript">
function ValidateEmail(vmail)
{
var mailformat =/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
if(vmail.value.match(mailformat))
{
return true;
}
else
{
alert("You have Entered an Invalid email address!!Please Enter the valid email !!");
	document.form.email.focus();
return false;
}
}

function validate_required(field,alerttxt) {
with (field)
{
if (value==null||value=="")
  {alert(alerttxt);return false}
else {return true}
}
}

	
function validate_form(thisform)
{
with (thisform)
{
     
   if (ValidateEmail(txtemail)==false)
  {txtemail.focus();return false}

             if ( ( document.form.gender[0].checked == false ) && ( document.form.gender[1].checked == false ) )
                         {
                          alert ( "Please choose your Gender: Male or Female" );
                           return false;
                           }

    var digits = "0123456789";
	var j=0;
	for (var i = 0; i < thisform.txtpincode.value.length; i++)
  	{
    	temp = thisform.txtpincode.value.substring(i, i+1)
		j++;
    	if (digits.indexOf(temp) == -1 &&
   		thisform.txtpincode.value != "")
    	{
      		alert("Pincode should have digits only\n");
      		txtpincode.focus();
      		return false;
    	}
    }	
    	if (j<6 || j>6)
    	{
      		alert("Pincode should have 6-digits only\n");
      		txtpincode.focus();
      		return false;
    	}
    	
  	



 var m=0;
  for (var i = 0; i < thisform.txtphno.value.length; i++)
  	{
    	temp = thisform.txtphno.value.substring(i, i+1)
    	m++;
    	if (digits.indexOf(temp) == -1)
    	{
      		alert("Phone Number should have digits only\n");
      		txtphno.focus();
      		return false;
    	}
  	}
 
 if (m<10 || m>10)
    	{
      		alert("Phone Number should have 10-digits only\n");
      		txtphno.focus();
      		return false;
    	}
  
 }
}
        </script>
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
        <form name="form" action="add_official.jsp" method="POST" >
            <table border="1" bgcolor="white" align="center"  cellspacing="10" cellpadding="10" >
                <h2 align="center"> Enter Employee details</h2>
              <tr>
                   <td>Email ID</td>
                   <td><input type="text" name="txtemail" width="50" size="60" required="required"/></td></tr>
                
                <tr><td>Gender<td>Male<input type="radio" name="gender" value="M"  size="60" />
                 Female<input type="radio" name="gender" value="F"  size="60"/></td></tr>
                <tr>
                    <td>First Name</td>
                    <td><input type="text" name="txtname" value=""  width="50" size="60" required/></td>
                </tr>
                 
                <tr>
                    <td>Middle Name</td>
                    <td><input type="text" name="txtmiddle" value=""  width="50" size="60" required/></td>
                </tr>
                 <tr>
                    <td>Last Name</td>
                    <td><input type="text" name="txtlast" value=""  width="50" size="60" required/></td>
                </tr>
                <tr>
                    <td>Phone No.</td>
                    <td><input type="text" name="txtphno" value=""  width="50" size="60" required/></td>
                </tr>
              <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress" rows="5" columns="100" required></textarea> </td>
                </tr>
                <td>Date of Joining</td><td><input type="text" name="txtdoj" value="" readonly="readonly" required />
                   <A HREF="#" onClick="cal2.select(document.forms['form'].txtdoj,'anchor1','dd/MM/yyyy'); return false;"
                      NAME="anchor1" ID="anchor1"> <abbr title="open calendar"><img src="cal1.jpeg" alt="select" ></A></td></abbr></tr>
                
                <%-- <tr>
			<td style="font-size: 14pt" align="left" width="281"><font face="cambria">Date of Joining :</font></td>
			<td style="border-color: maroon" align="left" width="360"><font face="cambria">MM : <select name="mm">
				<option value="-1">MONTH</option>
				<option value="1">Jan</option><option value="2">Feb</option><option value="3">Mar</option><option value="4">Apr</option><option value="5">May</option><option value="6">Jun</option><option value="7">Jul</option><option value="8">Aug</option><option value="9">Sep</option><option value="10">Oct</option><option value="11">Nov</option><option value="12">Dec</option></select> 
				DD:<select name="dd" id="dd" value=""><option value="-1">DAY</option>
			
			<script type="text/javascript">
								var i=0
								for (i=01;i<=31;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							
							</script></select>
							

				YYYY:<select name="yyyy" id="yyyy" value=""><option value="-1">YEAR</option>
			<script type="text/javascript">
								var i=0
								for (i=1905;i<=2011;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							</script>
							
						</select>
			
</font></tr>--%>
               
                  <tr>
                     <td>Designation</td>
                  <td><select name="designation">
                      <option>Officer</option>
                      <option>Clerk</option>
                  </select></td>
                  <tr>
                    <td>City</td>
                    <td><input type="text" name="txtcity" value=""  width="50" size="60" required/></td></tr>
                 
                 <tr>
                    <td>Pincode</td>
                    <td><input type="text" name="txtpincode" value="" width="50" size="60" required/></td>
                </tr>
                  <tr>
                        <td><input type="submit" value="Submit" name="btnsubmit" onfocus="return validate_form(form)" /></td>
                        <td><input type="submit" value="Cancel" name="btnCancel"/></td>
                    </tr>
                
                 </table>
        </form>
<script>
            <%        
       if(request.getParameter("btnsubmit")!=null)
                     {
           
                %>
              
         alert("<%=msg%>");
         
         <%
                 }
 %>
     
    </script>   
    </body>
    
       
</html>