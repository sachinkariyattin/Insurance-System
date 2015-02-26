<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%!
    Connection conn = null;
    PreparedStatement stmt = null;
    String name, loginid, empid, emailid,dsgn,password,gender,doj,address,var_count,dd,yyyy,mm,msg = "";
    String user_role="Co";
int count;
   
public void input(HttpServletRequest request) {
       
        name = request.getParameter("txtname");
        dd=request.getParameter("dd");
        loginid = request.getParameter("txtemail");
        emailid = request.getParameter("txtemail");
        password= request.getParameter("txtpassword");
        dsgn = request.getParameter("designation");
        gender=request.getParameter("gender");
        doj=request.getParameter("date");
        address=request.getParameter("txtaddress");
        mm=request.getParameter("mm");
        yyyy=request.getParameter("yyyy");
        
         doj=mm+"-"+dd+"-"+yyyy;
    }

    public void connect() {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
        } catch (Exception ex) {

            msg = ex.getMessage();
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
             
            stmt = conn.prepareStatement("insert into companyofficial(name,empid,emailid,designation,address,gender,doj,slno,loginid)values(?,?,?,?,?,?,?,?,?)");
           
            stmt.setString(1, name);
            stmt.setString(2, var_count);
            stmt.setString(3, emailid);
            stmt.setString(4, dsgn);
            stmt.setString(5, address);
            stmt.setString(6, gender);
            stmt.setString(7, doj);
            stmt.setInt(8, count);
            stmt.setString(9,loginid);
            stmt.executeUpdate();
            stmt.clearParameters();
            
            stmt.close();
        conn.close();
        msg = "Data is inserted"; 
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
<title>user_registrationform</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="deviation/style.css" rel="stylesheet" type="text/css" media="screen" />

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
	
  	
 
  	<%--if (validate_required(name,"Name must be filled out!")==false)
  {name.focus();return false}
  if (allLetter(name)==false)
  {name.focus();return false}
   if (validate_required(mname,"Middle-Name must be filled out!")==false)
  {mname.focus();return false}
  if (validate_required(lname,"Last-Name must be filled out!")==false)
  {lname.focus();return false}
  
	if(document.form.sex.selectedIndex<1)
				{
					alert("please select the Sex!");
					document.form.sex.focus();
				
					return false;
				}			
	
	--%>
 
 if(document.form.dd.selectedIndex<1)
				{
					alert("Please select the Day!");
					document.form.dd.focus();
					return false;
				}
				
  	if(document.form.mm.selectedIndex<1)
				{
					alert("Please select the Month!");
					document.form.mm.focus();
					return false;
				}
	if(document.form.yyyy.selectedIndex<1)
				{
					alert("Please select the Year!");
					document.form.yyyy.focus();
					return false;
				}
  if (validate_required(txtname,"UserName must be filled out!")==false)
  {txtname.focus();return false}
 
if (validate_required(txtpassword,"Password must be filled out!")==false)
  {txtpassword.focus();return false}
  //if (validate_required(conpassword,"Confirm Password must be filled out!")==false)
 // {conpassword.focus();return false}
 //if (validate_required(address,"Address must be filled out!")==false)
  //{address.focus();return false}
  // if (validate_required(street,"Street must be filled out!")==false)
  //{street.focus();return false}
 // if (validate_required(city,"City must be filled out!")==false)
  //{city.focus();return false}
   //if (validate_required(taluk,"Taluk must be filled out!")==false)
  //{taluk.focus();return false}
 
if (validate_required(designation,"Designation must be filled out!")==false)
  {designation.focus();return false}
 
  if (validate_required(txtaddress,"address must be filled out!")==false)
  {txtaddress.focus();return false}
<%--if (validate_required(pincode,"Pincode must be filled out!")==false)
  {pincode.focus();return false}
if (validate_required(phoneno,"Phone Number must be filled out!")==false)
  {phoneno.focus();return false}

if (validate_required(mobile,"Mobile Number must be filled out!")==false)
  {mobile.focus();return false}

if (validate_required(email,"Email Number must be filled out!")==false)
  {email.focus();return false}

var digits = "0123456789";
	var j=0;
	for (var i = 0; i < thisform.pincode.value.length; i++)
  	{
    	temp = thisform.pincode.value.substring(i, i+1)
		j++;
    	if (digits.indexOf(temp) == -1 &&
   		thisform.pincode.value != "")
    	{
      		alert("Pincode Number should have digits only\n");
      		pincode.focus();
      		return false;
    	}
    }	
    	if (j<6 || j>6)
    	{
      		alert("Pincode Number should have 6-digits only\n");
      		pincode.focus();
      		return false;
    	}
    	
  	




	for (var i = 0; i < thisform.phoneno.value.length; i++)
  	{
    	temp = thisform.phoneno.value.substring(i, i+1)
    	if (digits.indexOf(temp) == -1 &&
   		thisform.phoneno.value != "")
    	{	
      		alert("Phone Number should have digits only\n");
      	phoneno.focus();
      		return false;
    	}
  	}
 
 //var m=0;
  //for (var i = 0; i < thisform.mobile.value.length; i++)
  //	{
    //	temp = thisform.mobile.value.substring(i, i+1)
    //	m++;
    //	if (digits.indexOf(temp) == -1)
    //	{
      //		alert("Mobile Number should have digits only\n");
      	//	mobile.focus();
      	//	return false;
    	//}
  	//}
 
// if (m<11 || m>12)
   // 	{
     // 		alert("Mobile Number should have 11-digits only\n");
      //		pincode.focus();
      	//	return false;
    	//}
 
 --%>
 if (ValidateEmail(txtemail)==false)
  {txtemail.focus();return false}
  
 }
}
</script>	

</head>

<body topmargin="0" leftmargin="0" border="0">



	
	
	











<br>
<br>
<form action="sampleadd.jsp" method="post"   name="form">

<div align="center">
<table border="3" bgcolor="brown" align="center"  cellspacing="3" cellpadding="5" >
                <h2 align="center"> Enter details</h2>
              <tr>
                   <td>Email ID</td>
                   <td><input type="text" name="txtemail"  /></td></tr>
                <tr>
                <td>Password</td>
                <td><input type="password" name="txtpassword" value="" /></td>
                </tr>
                <tr>
                <td>User Role</td>
                <td><input type="text" name="txtuser_role" value="Co" disabled="disabled" /><td>
                
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" value="" /></td></tr>
                <tr>
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
			
					</font></tr>
		<tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txtaddress" value="" /></td></tr>
                 <tr>
                     <td>Designation</td>
                     <td><input type="text" name="designation" value="" /></td></tr>
                 <tr><td>Gender<td>Male<input type="radio" name="gender" value="M" />
                 Female<input type="radio" name="gender" value="F" /></td></tr>
                 
                  <tr>
                        <td><input type="submit" value="Submit" name="btnsubmit" onfocus="return validate_form(form);"/></td>
                        <td><input type="submit" value="Cancel" name="btnCancel"/></td>
                    </tr>
                
                 </table>
</div>


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
</form>


</body>
</html>
