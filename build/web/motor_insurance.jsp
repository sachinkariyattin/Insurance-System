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
    String type,var_count,premium,msg,frequency,reg_no,engine_no,make="";
    String purchase_date,next_premium_date,start_date,expiry_date="";
    String exists="";
    String compare="";
    String var_cust_id="";
    String status="NO";
    int count;
    float purchase_value;
   
    public void input(HttpServletRequest request)
    {
          HttpSession obj=request.getSession(false);
          var_cust_id=obj.getAttribute("session_cust_id").toString();   
          frequency=request.getParameter("frequency");
          type=request.getParameter("txttype");
          premium=request.getParameter("premium_amt");
          purchase_date=request.getParameter("purchase_date");
          next_premium_date=request.getParameter("next_premium_date");
          start_date=request.getParameter("policy_start_date");
          expiry_date=request.getParameter("policy_exp_date");
          reg_no=request.getParameter("reg_no");
          engine_no=request.getParameter("engine_no");
          purchase_value=Float.parseFloat(request.getParameter("purchase_value"));
          make=request.getParameter("make");
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
     public void compare( HttpServletRequest request) 
    {
 
        try {
             stmt=conn.prepareStatement("select policy_no from vehicle_insurance where reg_no=? or engine_no=?");
             
            stmt.setString(1,reg_no);
            stmt.setString(2,engine_no);
             
             ResultSet rs=stmt.executeQuery();
              rs.next();
              
              exists=rs.getString("policy_no");
             
               rs.close();
               stmt.clearParameters();
               stmt.close();
           
            
           }
        
        catch(Exception ex)
        {
            insert(request);
        }
   }    

    public void insert( HttpServletRequest request) 
    {
 
        try {
             stmt=conn.prepareStatement("select count(slno),max(slno) from vehicle_insurance");
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
                  var_count="VEHICLE_INSU"+var_count;
            
             
            HttpSession obj=request.getSession(false);
            obj.setAttribute("session_vehicle_policy_no", var_count);
            
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
             
           
         
             stmt=conn.prepareStatement("insert into vehicle_insurance(policy_no,reg_no,engine_no,make,purchase_value,slno) values(?,?,?,?,?,?)");
             stmt.setString(1,var_count);
             stmt.setString(2,reg_no);
             stmt.setString(3,engine_no);
             stmt.setString(4,make);
             stmt.setFloat(5,purchase_value);
             stmt.setInt(6,count);
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
 
                if (request.getParameter("btnsubmit") != null) {
                input(request);
                connect();
                compare(request);
                 if(exists != (compare))
               {
                    
                    msg="VEHICLE INSURANCE FOR THIS VEHICLE ALREADY EXISTS";
                    
               }
                else
                response.sendRedirect("generated_vehicle_insurance_details.jsp");
            }

%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Policy Details</title>
        <script src="jquery-2.0.0.min.js"></script>
         <TITLE>JavaScript Toolbox - Calendar Popup To Select Date</TITLE>
        <SCRIPT LANGUAGE="JavaScript" SRC="CalendarPopup.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript">
         
	var now = new Date()
        var cal2 = new CalendarPopup();
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
           </div>
    <body>
        
        <form name="frm" method="post" action="motor_insurance.jsp" >
         
            <table border="1" bgcolor="white" align="center"  cellspacing="10" cellpadding="15" >
                <br>
                <h2 align="center"> Enter Policy Details</h2>
               
                    <tr>
                    <td>Policy Type</td>
                    <td><input type="text" name="txttype" value="Motor Insurance" readonly="readonly" /></td>
                </tr>
                    <tr>
                    <td>Purchase Date</td>
                    <td><input type="text" name="purchase_date" readonly="readonly" required="required"/><A HREF="#" onClick="cal2.select(document.forms['frm'].purchase_date,'anchor1','dd/MM/yyyy'); return false;"
                      NAME="anchor1" ID="anchor1"> <abbr title="open calendar"><img src="cal1.jpeg" alt="select" ></A></td></abbr></tr>
                </tr>

                 <tr>
                    <td>Premium Amount</td>
                    <td><input type="text" name="premium_amt" required="required" /></td>
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
                    <td><input type="text" name="policy_exp_date" readonly="readonly" required="required" /><A HREF="#" onClick="cal2.select(document.forms['frm'].policy_exp_date,'anchor1','dd/MM/yyyy'); return false;"
                      NAME="anchor1" ID="anchor1"> <abbr title="open calendar"><img src="cal1.jpeg" alt="select" ></A></td></abbr></tr>
                </tr>
                <th align="center"> Vehicle Details </th>
                 <tr>
                    <td>Make</td>
                    <td><select name="make">
                            <option>Hero</option>
                            <option>Yamaha</option>
                            <option>Honda</option>
                            <option>Bajaj</option>
                            <option>TVS</option>
                        </select></td>
                </tr>
                <tr>
                    <td>Registration Number</td>
                    <td><input type="text" name="reg_no" value="" required="required"/></td>
                </tr>
                <tr>
                    <td>Engine Number</td>
                    <td><input type="text" name="engine_no" value="" required="required"/></td>
                </tr>
                <tr>
                    <td>Purchase Value</td>
                    <td><input type="text" name="purchase_value" value="" required="required" /></td>
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
        
         <script>
            <%        
       if(request.getParameter("btnsubmit")!=null)
                 {
             %>               
         alert("<%=msg%> \n \t\t\t Policy No:<%=exists%>");
         <%
                exists=""; }
         %>
         </script>
    </body>
</html>