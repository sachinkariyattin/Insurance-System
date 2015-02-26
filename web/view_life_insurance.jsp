<%-- 
    Document   : view_life_insurance
    Created on : May 10, 2013, 5:42:17 PM
    Author     : Sac
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page  import="java.util.Vector"%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!
     String life_cover,type,cust_id,premium,msg, premium_paying_term,frequency,nominee_id,nominee_name,relation,name,dob= "";
     String purchase_date,start_date,email,policy_no="";
     String var_policy_no;
     Date next_premium_date;
     Date expiry_date;
     String  var_next_date;
     long x;
       Connection conn=null;
       PreparedStatement stmt=null;
       

       public void connect() {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
        } catch (Exception ex) {

             msg= ex.getMessage();
        }

    }
       public void fetch(HttpServletRequest request)
       {
           try
            {
                stmt=conn.prepareStatement("select A.cust_id,A.name,A.dob,A.email_id,B.policy_no,B.frequency,B.premium_amt,B.policy_start_date,B.policy_exp_date,B.next_premium_date,C.life_cover,D.nominee_id,D.name as nom_name,D.relation from cust A,policy B,life_insurance C,nominee D where B.policy_no=? and B.cust_id=A.cust_id and B.policy_no=C.policy_no and C.nominee_id=D.nominee_id");             
                stmt.setString(1,var_policy_no);
                ResultSet rs=stmt.executeQuery();
                rs.next();
                
               cust_id=rs.getString("cust_id");
                name=rs.getString("name");
                dob =rs.getString("dob");
                email=rs.getString("email_id");
                policy_no=rs.getString("policy_no");
                frequency=rs.getString("frequency");
                premium=rs.getString("premium_amt");
               start_date=rs.getString("policy_start_date");
               expiry_date=rs.getDate("policy_exp_date");
               next_premium_date=rs.getDate("next_premium_date");
               life_cover=rs.getString("life_cover");
               nominee_id=rs.getString("nominee_id");
               nominee_name=rs.getString("nom_name");
               relation=rs.getString("relation");
               rs.close();
        stmt.clearParameters();
        stmt.close();
        
        msg="POLICY GENERATED";
          
        HttpSession obj=request.getSession(false);
         obj.setAttribute("session_premium", premium);
      
                      
       }    
  catch(Exception ex)
            {
                ex.getMessage();
         }                  
    }                      
  %>
  
  <%
  
          
         
        //assign system date to string variablesCalendar c = Calendar.getInstance();
          
        
	// number of days to add to nextdate is 4	
	
	
          
        
           HttpSession obj=request.getSession(false);
          
           var_policy_no=obj.getAttribute("session_policy_no").toString(); //Session variable created in life_insurance.jsp
           
           connect();
           fetch(request);
           obj.setAttribute("session_next_premium_date",next_premium_date);
           obj.setAttribute("session_frequency",frequency);
             
           obj.setAttribute("session_cust",cust_id);
   
         x= (expiry_date.getTime()-next_premium_date.getTime())/(1000 * 60 * 60 * 24);
   %>        
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>Life Insurance Policy Details</title>
    </head>
    <form action="view_life_insurance.jsp" method="POST">
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
           
        <li><a href="disscussionforum.jsp" target="_blank" > <span>Discussion Forum </span></a></li>
        <li><a href="about.jsp" target="_blank"><span>About</span></a></li>
			
		</ul>
		<script type="text/javascript">
			$('#menu').dropotron();
		</script>
	</div>
               <ul>
                   <%
          if(x>=0)
               {
                    %>
           <li><h4><a href="payment.jsp">PAY PREMIUM</a></h4></li>
             <%}
         %>
                  
       <li><h4><a href="view_policy_details.jsp">VIEW ANOTHER POLICY DETAILS</a></h4></li>  
       <li><h4><a href="renew.jsp">RENEW POLICY</a></h4></li>
       </ul>
    <body>
        <br>
        <h3 align="center"> CUSTOMER DETAILS</h3>
        <table border="1" align="center">
            <tr>
                <th>Customer ID</th>       
                <td><%=cust_id%></td>
           </tr> 
           <tr>
                <th>Customer Name</th>       
                <td><%=name%></td>
           </tr> 
           <tr>
                <th>Email ID</th>       
                <td><%=email%></td>
           </tr> 
           <tr>
                <th>Date Of Birth</th>       
                <td><%=dob%></td>
           </tr> 
           </table>
           
          <br>
          <br>
           <h3 align="center"> POLICY DETAILS</h3>
          <table border="1" align="center">
              <tr>
                <th>Policy No</th>       
                <td><%=policy_no%></td>
           </tr> 
        <tr>
                <th>Frequency</th>       
                <td><%=frequency%></td>
           </tr> 
           <tr>
                <th>Premium Amount</th>       
                <td>₹<%=premium%></td>
           </tr> 
           <tr>
                <th>Policy Start Date</th>       
                <td><%=start_date%></td>
           </tr> 
           <tr>
                <th>Policy Expiry Date</th>       
                <td><%=expiry_date%></td>
           </tr> 
           <tr>
                <th>Next Premium Date</th>       
                <td><%=next_premium_date%></td>
           </tr> 
            <tr>
                <th>Life Cover</th>       
                <td><%=life_cover%></td>
           </tr> 
          </table>
           
            <br>
            <br>
             <h3 align="center">NOMINEE DETAILS</h3>
           <table border="1" align="center">
           <tr>
                <th>Nominee ID</th>       
                <td><%=nominee_id%></td>
           </tr> 
            <tr>
                <th>Nominee Name</th>       
                <td><%=nominee_name%></td>
           </tr> 
            <tr>
                <th>Relationship with Life assured</th>       
                <td><%=relation%></td>
           </tr> 
           </table>
           
    </form>
           <script>
                <%
                if(x<0)
               {
                    %>
               alert("POLICY EXPIRED");
                <%}
         %>
        </script>
            
    </body>
</html>

