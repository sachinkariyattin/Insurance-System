<%-- 
    Document   : view_payments
    Created on : May 18, 2013, 7:23:58 PM
    Author     : Sac
--%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
Connection conn=null;
PreparedStatement stmt=null;
String msg="",cust_id;
Vector vpolicy_no=new Vector();
Vector vreceipt_no=new Vector();
Vector vamt_paid=new Vector();
Vector vreceipt_date=new Vector();

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
           stmt=conn.prepareStatement("select r.policy_no,r.receipt_no,r.receipt_date,r.amt_paid from receipt r,policy p where p.cust_id=? and p.policy_no=r.policy_no");
           stmt.setString(1,cust_id);
           ResultSet rs=stmt.executeQuery();
           while(rs.next())
           {
              vpolicy_no.add(rs.getString("policy_no"));
              vreceipt_no.add(rs.getString("receipt_no"));
              vreceipt_date.add(rs.getString("receipt_date"));
              vamt_paid.add(rs.getString("amt_paid"));
           }
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
cust_id=obj.getAttribute("session_cust_id").toString();
connect();
fetch();
%>
<html>
    <head>
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
        <title>View Payments</title>
    </head>
    <form name="frm" action="view_policy_status.jsp" method="POST">
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
                           <li><a href="change_password.jsp"> Change Password </a></li>
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
        <h2 align="center">Generated Receipts</h2>
        <table bgcolor ="white" border="1" align="center" width="50" height="50">
                  <thead>
                    <tr>
                        <th>Policy No</th>
                        <th>Receipt No</th>
                        <th>Receipt Date</th>
                        <th>Amount Paid</th>
                    </tr>
                </thead>
                <tbody>
                     <tr>
                        <br>
                        <%
                            for(int i=0;i<vreceipt_no.size();i++)
                            {
                        %> 
                        <td><%=vpolicy_no.get(i)%></td>
                        <td><%=vreceipt_no.get(i)%></td>
                        <td><%=vreceipt_date.get(i)%></td>
                        <td><%=vamt_paid.get(i)%></td>
                    </tr>
                     <% }
                    %>                    
                </tbody>
        </table>
    </body>
</html>
