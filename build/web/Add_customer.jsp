<%-- 
    Document   : ADD_CUSTOMER
    Created on : Mar 31, 2013, 9:26:24 AM
    Author     : Amol
--%>

<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    Connection conn = null;
    PreparedStatement stmt = null,stmt1=null;
    String var_dob,var_count,var_pwd,var_login_id,var_role,var_name,var_middle,var_last,var_cust_id,dd,mm,yyyy,var_address,var_phone_no,var_email_id,var_gender,var_nationality,var_country,var_state,var_city,var_pincode,var_occupation,msg = "";
    String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789+@";
    int PASSWORD_LENGTH =5;
    Random RANDOM = new SecureRandom();
    int count;
    
    
    
    public void input(HttpServletRequest request)
    {
          var_name=request.getParameter("txtcustname");
          var_middle=request.getParameter("txtmiddlename");
          var_last=request.getParameter("txtlastname");
          var_login_id=request.getParameter("txtemail");
          var_role=request.getParameter("txtrole");
          var_cust_id=request.getParameter("txtcustid");
          //dd=request.getParameter("txtdd");
         // mm=request.getParameter("txtmm");
         // yyyy=request.getParameter("txtyyyy");
          var_address=request.getParameter("txtaddress");
          var_phone_no=request.getParameter("txtphno");
          var_email_id=request.getParameter("txtemail");
          var_gender=request.getParameter("gender");
          var_nationality=request.getParameter("txtnationality");
          var_country=request.getParameter("txtcountry");
          var_state=request.getParameter("txtstate");
          var_city=request.getParameter("txtcity");
          var_pincode=request.getParameter("txtpincode");
          var_occupation=request.getParameter("occupation"); 
          var_dob=request.getParameter("txtdob"); 
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
    var_pwd="";
   for (int i=0; i<PASSWORD_LENGTH; i++)
      {
          int index = (int)(RANDOM.nextDouble()*letters.length());
          var_pwd += letters.substring(index, index+1);
      }
}

    public void insert() {
      
        try {
             stmt1=conn.prepareStatement("select count(slno),max(slno) from cust");
    ResultSet rs=stmt1.executeQuery();
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
    stmt1.clearParameters();
    stmt1.close();
    
             var_count=count+"";
             var_count="CUST"+var_count;
            
            
            stmt = conn.prepareStatement("insert into login(loginid,password,user_role)values(?,?,?)");
            stmt.setString(1,var_login_id);
            stmt.setString(2, var_pwd);
            stmt.setString(3,var_role);
            
            stmt1=conn.prepareStatement("insert into cust(cust_id,loginid,name,dob,address,ph_no,email_id,gender,nationality,country,state,city,pincode,occupation,slno,middle_name,last_name)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            stmt1.setString(1,var_count);
            stmt1.setString(2,var_login_id);
            stmt1.setString(3,var_name);
            stmt1.setString(4,var_dob);
            stmt1.setString(5,var_address);
            stmt1.setString(6,var_phone_no);
            stmt1.setString(7,var_email_id);
            stmt1.setString(8,var_gender);
            stmt1.setString(9,var_nationality);
            stmt1.setString(10,var_country);
            stmt1.setString(11,var_state);
            stmt1.setString(12,var_city);
            stmt1.setString(13,var_pincode);
            stmt1.setString(14,var_occupation);
            stmt1.setInt(15,count);
            stmt1.setString(16,var_middle);
            stmt1.setString(17,var_last);
            
            stmt.executeUpdate();
            stmt1.executeUpdate();
            stmt.clearParameters();
            stmt.close();
            stmt1.clearParameters();
            stmt1.close();
            conn.close();
            msg = "Customer Added";

        } catch (Exception ex) {
            msg = "Email Id already registered";
        }

    }

%>
<%

       String var_loginid,var_name="";
       HttpSession obj=request.getSession(false);
       var_loginid=obj.getAttribute("session_loginid").toString();
       var_name=obj.getAttribute("session_user_name").toString();

            if (request.getParameter("btnsubmit") != null) {
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
<title>Add Customer</title>
<link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css" />
<link href="Template/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Template/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Template/jquery.slidertron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.poptrox-1.0.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
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
	document.form.txtemail.focus();
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
alert ( "Please choose Gender: Male or Female" );
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
        
        <form name="form" method="post" action="Add_customer.jsp">
            <table border="3" bgcolor="white" align="center"  cellspacing="20" cellpadding="10" >
                <h2 align="center"> Enter Customer details</h2>
                <tr>
                    <td>First NAME</td>
                    <td><input type="text" name="txtcustname" value="" width="60" size="60" required="required"/></td>
                </tr>
                <tr>
                    <td>Middle Name</td>
                    <td><input type="text" name="txtmiddlename" value="" width="60" size="60" required="required"/></td>
                </tr>
                <tr>
                    <td>Last NAME</td>
                    <td><input type="text" name="txtlastname" value="" width="60" size="60" required="required"/></td>
                </tr>
                    <tr>
                    <td>EMAIL ID</td>
                    <td><input type="text" name="txtemail" value="" width="50" size="60" required/></td>
                </tr>
                <tr>
                    <td>ROLE</td>
                    <td><input type="text" name="txtrole" value="Cust" readonly="readonly" width="50" size="60" /></td>
                </tr>
       <tr>
                 <td>Date of Birth</td><td><input type="text" name="txtdob" value=""/>
                   <A HREF="#" onClick="cal2.select(document.forms['form'].txtdob,'anchor1','dd/MM/yyyy'); return false;"
                      NAME="anchor1" ID="anchor1"> <abbr title="open calendar"><img src="cal1.jpeg" alt="select" ></A></td></abbr></tr>
               <%-- <tr>
            <td style="font-size: 14pt" align="left" width="281"><font face="cambria">Date of Birth :</font></td>
            <td style="border-color: maroon" align="left" width="360"><font face="cambria">MM : <select name="txtmm">
				<option value="-1">MONTH</option>
				<option value="1">Jan</option><option value="2">Feb</option><option value="3">Mar</option><option value="4">Apr</option><option value="5">May</option><option value="6">Jun</option><option value="7">Jul</option><option value="8">Aug</option><option value="9">Sep</option><option value="10">Oct</option><option value="11">Nov</option><option value="12">Dec</option></select> 
				DD:<select name="txtdd" id="dd"value=""><option value="-1">DAY</option>
			
			<script type="text/javascript">
								var i=0;
                                                                   
								        for (i=01;i<=31;i++)	
									{
									  document.write("<option value="+i+">"+i+"</option>");
									}
                                                                
							</script></select>
							

				YYYY:<select name="txtyyyy" id="yyyy" value=""><option value="-1">YEAR</option>
			<script type="text/javascript">
								var i=0;
								for (i=1905;i<=2013;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							</script>
							
						</select>
			
					</font></tr>--%>
               <tr>     
                   <td> Select Occupation </td> 
                   <td><select name="occupation">
                    <option>Government Service</option>
                    <option>Student</option>
                    <option>House Wife</option>
                    <option>Private Business</option>
                    <option>Farmer</option>
                   </td>
              </tr>
                   
        </select>
        
                  <tr>
                    <td>ADDRESS</td>
                    <td><textarea name="txtaddress" rows="5" columns="100"></textarea> </td>
                </tr>
                <tr>
                    <td>PHONE NO.</td>
                    <td><input type="text" name="txtphno" value="" width="50" size="60" required/></td>
                </tr>
             
                <tr>
                    <td>NATIONALITY</td>
                    <td><input type="text" name="txtnationality" value="" width="50" size="60" required/></td>
                </tr>
                <tr>
                    <td>COUNTRY</td>
                    <td><input type="text" name="txtcountry" value="" width="50" size="60" required/></td>
                </tr>
                <tr>
                    <td>STATE</td>
                    <td><input type="text" name="txtstate" value="" width="50" size="60" required/></td>
                </tr>
                <tr>
                    <td>CITY</td>
                    <td><input type="text" name="txtcity" value="" width="50" size="60" required/></td>
                </tr>
                <tr>
                    <td>PINCODE</td>
                    <td><input type="text" name="txtpincode" value="" width="50" size="60" required/></td>
                </tr>
                <tr>
                    <td>GENDER</td>
                    <td>MALE<input type="radio" name="gender" value="M"  size="60"/>
                
                    FEMALE<input type="radio" name="gender" value="F"  size="60"/>
                    
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Submit" name="btnsubmit" onfocus="return validate_form(form);" size="60"/></td>
               
                    <td><input type="reset" name="btncancel" value="Cancel" size="60"/></td>
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
