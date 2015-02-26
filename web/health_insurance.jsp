<%-- 
    Document   : motor_insurance
    Created on : Apr 23, 2013, 08:02:45 AM
    Author     : Amol
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!


    Connection conn = null;
    PreparedStatement stmt = null;
    String type,var_count,premium,msg,frequency= "";
    String purchase_date,next_premium_date,start_date,expiry_date="";
    String var_cust_id="";
    String status="NO";
    int count;
    float sum_insured;
   
    public void input(HttpServletRequest request)
    {
             
          frequency=request.getParameter("frequency");
          type=request.getParameter("txttype");
          premium=request.getParameter("premium_amt");
          purchase_date=request.getParameter("purchase_date");
          next_premium_date=request.getParameter("next_premium_date");
          start_date=request.getParameter("policy_start_date");
          expiry_date=request.getParameter("policy_exp_date");
          sum_insured=Float.parseFloat(request.getParameter("sum_insured"));
    }    

    public void connect() 
    {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
        } catch (Exception ex) {

            msg = ex.getMessage();
        }

    }

    public void insert(HttpServletRequest request) {
       
            
        try {
             stmt=conn.prepareStatement("select count(slno),max(slno) from health_insurance");
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
                  var_count="HEALTH_INSU"+var_count;
            
            HttpSession obj=request.getSession(false);
            obj.setAttribute("session_health_policy_no", var_count);
            
            stmt=conn.prepareStatement("insert into policy(policy_no,cust_id,type,purchase_date,premium_amt,frequency,policy_start_date,policy_exp_date,next_premium_date,approved)values(?,?,?,?,?,?,?,?,?,?)");
            stmt.setString(1,var_count);
            stmt.setString(2,var_cust_id);
            stmt.setString(3,type);
            stmt.setString(4,purchase_date);
            stmt.setString(5,premium);
            stmt.setString(6,frequency);
            stmt.setString(7,start_date);
            stmt.setString(8,expiry_date);
            stmt.setString(9,next_premium_date);
            stmt.setString(10,status);
         
            stmt.executeUpdate();
      
            stmt.clearParameters();
            stmt.close();
         
             stmt=conn.prepareStatement("insert into health_insurance(policy_no,sum_insured,slno) values(?,?,?)");
             stmt.setString(1,var_count);
             stmt.setFloat(2,sum_insured);
             stmt.setInt(3,count);
            
            stmt.executeUpdate();
      
            stmt.clearParameters();
            stmt.close();
            
            conn.close();
           
            msg = "Policy Generated!!!";

        } catch (Exception ex) {
            msg = ex.getMessage();
        }

    }

%>
<%
          HttpSession obj=request.getSession(false);
          var_cust_id=obj.getAttribute("session_cust_id").toString();
            
          if (request.getParameter("btnsubmit") != null)
            {
                input(request);
                connect();
                insert(request);
                response.sendRedirect("generated_health_insurance_details.jsp");
            }

%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Policy Details</title>
        <TITLE>JavaScript Toolbox - Calendar Popup To Select Date</TITLE>
        <SCRIPT LANGUAGE="JavaScript" SRC="CalendarPopup.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript">
         var Date=new Date();
	var cal2 = new CalendarPopup();
        cal2.showYearNavigation();
         cal2.addDisabledDates(null,formatDate(now,"yyyy-MM-dd"));
        cal2.showYearNavigation();
	</SCRIPT>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
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
                    <li class="current_page_item"><a href="Co.jsp"><span> Employee Home  </span></a></li>
          <li>   <li><a href="logout.jsp"><span> logout</span> </a></li>

			  
                           <li><a href="view_profile.jsp"> <span>View Profile</span> </a></li>
                           <li><a href="change_password.jsp" target="_blank"> Change Password </a></li>
			 
                                         
					 <li class="last"></li>
			
		</ul>
		<script type="text/javascript">
			$('#menu').dropotron();
		</script>
	</div>
    <body>
        
        <form name="frm" method="post" action="health_insurance.jsp" >
            <br>
            <table border="1" bgcolor="white" align="center"  cellspacing="10" cellpadding="15" >
                <h2 align="center"> Enter Policy Details for <%=var_cust_id%></h2>
               
                <tr>
                    <td>Policy Type</td>
                    <td><input type="text" name="txttype" value="Health Insurance" readonly="readonly" /></td>
                </tr>
                <tr>
                    <td>Purchase Date</td>
                    <td><input type="text" name="purchase_date" readonly="readonly" required="required"/><A HREF="#" onClick="cal2.select(document.forms['frm'].purchase_date,'anchor1','dd/MM/yyyy'); return false;"
                      NAME="anchor1" ID="anchor1"> <abbr title="open calendar"><img src="cal1.jpeg" alt="select" ></A></td></abbr></tr>
                </tr>

                 <tr>
                    <td>Premium Amount</td>
                    <td><input type="text" name="premium_amt" readonly="readonly" required="required"/><A HREF="#" onClick="cal2.select(document.forms['frm'].premium_amt,'anchor1','dd/MM/yyyy'); return false;"
                      NAME="anchor1" ID="anchor1"> <abbr title="open calendar"><img src="cal1.jpeg" alt="select" ></A></td></abbr></tr>
                 </tr>
                 
                 <tr>
                       <td>Frequency</td>
                 <td><select name="frequency">
                     <option>Yearly</option>
                 </select></td>
                  </tr>
                  
                <tr>
                    <td>Policy Start Date</td>
                    <td><input type="text" name="policy_start_date" readonly="readonly" required="required"/><A HREF="#" onClick="cal2.select(document.forms['frm'].policy_start_date,'anchor1','dd/MM/yyyy'); return false;"
                      NAME="anchor1" ID="anchor1"> <abbr title="open calendar"><img src="cal1.jpeg" alt="select" ></A></td></abbr></tr>
                </tr>
                <tr>
                    <td>Policy Expiry Date</td>
                    <td><input type="text" name="policy_exp_date" readonly="readonly" required="required"/><A HREF="#" onClick="cal2.select(document.forms['frm'].policy_exp_date,'anchor1','dd/MM/yyyy'); return false;"
                      NAME="anchor1" ID="anchor1"> <abbr title="open calendar"><img src="cal1.jpeg" alt="select" ></A></td></abbr></tr>
                </tr>
                
                <tr>
                    <td>Sum Insured</td>
                <td><select name="sum_insured">
                    <option>40000</option>
                    <option>50000</option>
                    <option>100000</option>
                    <option>150000</option>
                </select></td>
                </tr>
                <tr>
                    <td>Next Premium Date</td>
                    <td><input type="text" name="next_premium_date" readonly="readonly" required="required"/><A HREF="#" onClick="cal2.select(document.forms['frm'].next_premium_date,'anchor1','dd/MM/yyyy'); return false;"
                      NAME="anchor1" ID="anchor1"> <abbr title="open calendar"><img src="cal1.jpeg" alt="select" ></A></td></abbr></tr>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Submit" name="btnsubmit" /></td>
                <tr>
            </table>
        </form>
         
    </body>
</html>