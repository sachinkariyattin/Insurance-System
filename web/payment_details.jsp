<%-- 
    Document   : payment_details
    Created on : May 18, 2013, 5:19:43 PM
    Author     : Sac
--%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
Connection conn=null;
PreparedStatement stmt=null;
String msg="",var_policy_no="",policy_no,receipt_date,next_premium_date;
int receipt_no;
float amt_paid,balance;
   public void connect() {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
        } catch (Exception ex) {

            msg = ex.getMessage();
        }
               }
void fetch()
{
    try{
          stmt=conn.prepareStatement("select policy_no,receipt_date,amt_paid from receipt where policy_no=? and receipt_no=?");
          stmt.setString(1,var_policy_no);
          stmt.setInt(2,receipt_no);
          ResultSet rs=stmt.executeQuery();
          rs.next();
          policy_no=rs.getString("policy_no");   
          receipt_date=rs.getString("receipt_date");
          amt_paid=rs.getFloat("amt_paid");  

          rs.close();
          stmt.clearParameters();
          stmt.close();
          conn.close();                                                                                                                    
          }
catch(Exception ex)
{
   msg=ex.getMessage();
}             
}
        
%>
<%

HttpSession obj=request.getSession(false);
receipt_no=Integer.parseInt(obj.getAttribute("session_receipt_no").toString());
var_policy_no=obj.getAttribute("session_policy_no").toString();
balance=Float.parseFloat(obj.getAttribute("session_balance").toString());
next_premium_date=obj.getAttribute("session_next_premium_date").toString();
connect();
fetch();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Details</title>
        <link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css" />
<link href="Template/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Template/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Template/jquery.slidertron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.poptrox-1.0.js"></script>
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
        <table border="2" align="center">
            <thead>
                <tr>
                    <th>Receipt No</th>
                    <th>Policy No</th>
                    <th>Receipt Date</th>
                    <th>Amount Paid</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%=receipt_no%></td>
                    <td><%=policy_no%></td>
                    <td><%=receipt_date%></td>
                    <td><%=amt_paid%></td>
                </tr>
            </tbody>
        </table>
                                <script>
                   
         alert("Payment Successfull\n\t\tRem Bal:<%=balance%>\n\t\tNext Premium Date:<%=next_premium_date%>");
   
         </script>
    </body>
</html>
