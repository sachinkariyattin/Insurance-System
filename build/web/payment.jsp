<%-- 
    Document   : payment
    Created on : May 18, 2013, 2:12:52 PM
    Author     : Amol
--%>
<%@page import="java.sql.*" %>
<%@page import ="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
String msg="",card_no,name="",type="",policy_no="",var_policy_no,next_premium_date="",var_frequency="";
int cvv,count,pin_no;
float balance,premium_amt;
String var_system_date,var_next_date;
String next_date;
Connection conn=null;
PreparedStatement stmt=null;

 java.util.Date utilDate = new java.util.Date();



      
         public void connect() {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
        } catch (Exception ex) {

            msg = ex.getMessage();
        }

    }

void fetch_input(HttpServletRequest request)
{
card_no=request.getParameter("card_no");
cvv=Integer.parseInt(request.getParameter("cvv"));
name=request.getParameter("holder_name");
pin_no=Integer.parseInt(request.getParameter("pin"));
}        

void update(HttpServletRequest request)
{
try{
    stmt=conn.prepareStatement("Update credit_card set balance=balance-? where card_no=? and holder_name=? and cvv=? and pin=? and balance>=?");
     stmt.setFloat(1,premium_amt);
     stmt.setString(2,card_no);
     stmt.setString(3,name);
     stmt.setInt(4,cvv);
     stmt.setInt(5,pin_no);
     stmt.setFloat(6,premium_amt);
     
     
  int x=stmt.executeUpdate();
  stmt.clearParameters();
  stmt.close();

  if(x==0)
           {
        msg="card is invalid or balance is insufficient";
          }
     else
                 {
	//Insert into receipt table
        insert(request);
	//Update next premium date
        update_premium_date();
        fetch_rem_bal(request);
}
   }
catch(Exception ex)
{
msg=ex.getMessage();
}        

}

void insert(HttpServletRequest request)
{
    
  try{
    
      stmt=conn.prepareStatement("select count(receipt_no),max(receipt_no) from receipt");
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
    
  
    
    
   stmt=conn.prepareStatement("insert into receipt(policy_no,receipt_no,receipt_date,amt_paid) values(?,?,?,?)");
   stmt.setString(1,var_policy_no);
   stmt.setInt(2,count);
   stmt.setString(3,var_system_date);
   stmt.setFloat(4,premium_amt);
   
   stmt.executeUpdate();
   stmt.clearParameters();
   stmt.close();
  
   HttpSession obj=request.getSession(false);
    obj.setAttribute("session_receipt_no",count);
              
  }
  catch(Exception ex)
  {
    msg=ex.getMessage();
  }        
}


void update_premium_date()
{
    try{
        stmt=conn.prepareStatement("update policy set next_premium_date=? where policy_no=?");
         stmt.setString(1,var_next_date);
          stmt.setString(2,var_policy_no);
          stmt.executeUpdate();
          stmt.clearParameters();
          stmt.close();
    }
     catch(Exception ex)
  {
    msg=ex.getMessage();
  }        
}
void fetch_rem_bal(HttpServletRequest request)
{
try{
  stmt=conn.prepareStatement("select balance from credit_card where card_no=? and holder_name=? and cvv=? and pin=?");
     stmt.setString(1,card_no);
     stmt.setString(2,name);
     stmt.setInt(3,cvv);
     stmt.setInt(4,pin_no);
     ResultSet rs=stmt.executeQuery();
     rs.next();
     balance=rs.getFloat("balance");
     rs.close();
     stmt.clearParameters();
     stmt.close();
     conn.close();
     
     HttpSession obj=request.getSession(false);
     obj.setAttribute("session_balance", balance);
}
catch(Exception ex)
{
   msg=ex.getMessage();
}        
}             
       
%>

<%

  HttpSession obj=request.getSession(false);
  var_policy_no=obj.getAttribute("session_policy_no").toString();
  premium_amt=Float.parseFloat(obj.getAttribute("session_premium").toString());

if(request.getParameter("btnsubmit")!=null)
{
   fetch_input(request);
   connect();
  
   
  next_date=obj.getAttribute("session_next_premium_date").toString();
  var_frequency=obj.getAttribute("session_frequency").toString();
  
 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        //assign system date to string variables
         var_system_date = sdf.format(utilDate);
        
	
	Calendar c = Calendar.getInstance();
        c.setTime(sdf.parse(next_date));

        if("Yearly".equals(var_frequency))
                       {
	// number of days to add to nextdate is 4	
	c.add(Calendar.DATE, 365);  
	var_next_date = sdf.format(c.getTime());
               }
         else if("Quarterly".equals(var_frequency))
                         {
             c.add(Calendar.DATE, 91);  
	var_next_date = sdf.format(c.getTime());
         }
        else
                         {
             c.add(Calendar.DATE, 30);  
	var_next_date = sdf.format(c.getTime());
               }
        update(request);

obj.setAttribute("session_next_premium_date",var_next_date);

   response.sendRedirect("payment_details.jsp");

}    
  
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
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
        <form name="frm" action="payment.jsp" method="POST">
            <table border="2" align="center">
                <tr>
                <td>AMOUNT TO BE PAID</td><td><input type="text" name="premium" value="<%=premium_amt%>" /></td>
                </tr>
                
                <tr>
                    <td>CARD NUMBER</td><td><input type="text" name="card_no" value="" required="required" placeholder="Enter card number"/></td>
                <tr>
                <tr>
                    <td>CARD HOLDERS NAME</td><td><input type="text" name="holder_name" value="" required="required" placeholder="Enter card holders name"/></td>
                <tr>
                    <td>CVV</td><td><input type="password" name="cvv" value="" required="required" placeholder="Enter CVV Number"/></td>
                </tr>
                <tr>
                    <td>PIN NUMBER</td><td><input type="password" name="pin" value="" required="required" placeholder="Enter PIN Number"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Submit" name="btnsubmit" /></td>
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
