<%-- 
    Document   : view_loan
    Created on : May 10, 2013, 5:42:17 PM
    Author     : Sac
--%>

<%@ page  import="java.util.Vector"%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!
     String var_loan_no="",msg="",loan_date,policy_no;
     float loan_amt,emi;
     int time_period;
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
       public void fetch()
       {
           try
            {
                stmt=conn.prepareStatement("select policy_no,loan_date,loan_amt,time_period,emi from loan where loan_no=?");             
                stmt.setString(1,var_loan_no);
                ResultSet rs=stmt.executeQuery();
                rs.next();
                
               policy_no=rs.getString("policy_no");
                loan_date=rs.getString("loan_date");
                loan_amt=rs.getFloat("loan_amt");
                time_period=rs.getInt("time_period");
                emi=rs.getFloat("emi");
               rs.close();
        stmt.clearParameters();
        stmt.close();
        
        msg="POLICY GENERATED";        
       }    
  catch(Exception ex)
            {
                ex.getMessage();
         }                  
    }                      
  %>
  
  <%
           HttpSession obj=request.getSession(false);
           var_loan_no=obj.getAttribute("session_loan_no").toString(); //Session variable created in life_insurance.jsp
           
           connect();
           fetch();
   %>        
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loan Details</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Customer Home</title>
<link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css" />
<link href="Template/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Template/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Template/jquery.slidertron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.poptrox-1.0.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <form action="view_loan.jsp" method="POST" >
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
        <h3 align="center">LOAN DETAILS</h3>
        <table border="1" align="center">
            <tr>
                <th>POLICY NO.</th>       
                <td><%=policy_no%></td>
           </tr> 
           <tr>
                <th>LOAN NO.</th>       
                <td><%=var_loan_no%></td>
           </tr> 
           <tr>
                <th>LOAN DATE</th>       
                <td><%=loan_date%></td>
           </tr> 
           <tr>
                <th>LOAN AMOUNT</th>       
                <td><%=loan_amt%></td>
           </tr>
           <tr>
                <th>TIME PERIOD</th>       
                <td><%=time_period%></td>
           </tr> 
           <tr>
                <th>EMI</th>       
                <td><%=emi%></td>
           </tr> 
           </table>
    </form>
           <a href="view_loan_details.jsp">VIEW ANOTHER LOAN DETAILS</a>   
    </body>
</html>

