<%-- 
    Document   : life_insurance
    Created on : Apr 13, 2013, 10:12:45 PM
    Author     : Sac
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!


    Connection conn = null;
    PreparedStatement stmt = null;
    String type,var_count,msg, premium_paying_term,frequency,var_count1= "";
    String purchase_date,next_premium_date,start_date,expiry_date="";
    String name,city,email,address,dob,phone,gender,relation;
    String var_cust_id="";
    String status="NO";
    int count,count1,yearly=3366,half_yearly=1709,quarterly=868,monthly=304;
    float life_cover,premium;
    public void input(HttpServletRequest request)
    {
           
          frequency=request.getParameter("frequency");
          type=request.getParameter("txttype");
          purchase_date=request.getParameter("purchase_date");
          next_premium_date=request.getParameter("next_premium_date");
          start_date=request.getParameter("policy_start_date");
          expiry_date=request.getParameter("policy_exp_date");
          life_cover=Float.parseFloat(request.getParameter("life_cover"));
          premium_paying_term=request.getParameter("premium_term");
          
        
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
             stmt=conn.prepareStatement("select count(slno),max(slno) from life_insurance");
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
                  var_count="LIFE_INSU"+var_count;
            
            if("Monthly".equals(frequency))
            {
               premium=(monthly*life_cover/100000)-((life_cover/100000)*100);   
            }                 
            else if("Half Yearly".equals(frequency))
            {
              premium=(half_yearly*life_cover/100000)-((life_cover/100000)*100);
            }
           else if("Quarterly".equals(frequency))
           {
              premium=(quarterly*life_cover/100000)-((life_cover/100000)*100);
           }
           else
           {
              premium=(yearly*life_cover/100000)-((life_cover/100000)*100);
           }                                                                                                                
            stmt=conn.prepareStatement("insert into policy(policy_no,cust_id,type,purchase_date,premium_amt,frequency,policy_start_date,policy_exp_date,next_premium_date,approved)values(?,?,?,?,?,?,?,?,?,?)");
            stmt.setString(1,var_count);
            stmt.setString(2,var_cust_id);
            stmt.setString(3,type);
            stmt.setString(4,purchase_date);
            stmt.setFloat(5,premium);
            stmt.setString(6,frequency);
            stmt.setString(7,start_date);
            stmt.setString(8,expiry_date);
            stmt.setString(9,next_premium_date);
            stmt.setString(10,status);
            
            stmt.executeUpdate();
      
            stmt.clearParameters();
            stmt.close();
         
             stmt=conn.prepareStatement("insert into life_insurance(policy_no,life_cover,premium_paying_term,nominee_id,slno) values(?,?,?,?,?)");
             stmt.setString(1,var_count);
            stmt.setFloat(2,life_cover);
            stmt.setString(3,premium_paying_term);
            stmt.setString(4,null);
            stmt.setInt(5,count);
            
            stmt.executeUpdate();
      
            stmt.clearParameters();
            stmt.close();
            
            conn.close();
            
            HttpSession obj=request.getSession(false);
            obj.setAttribute("session_policy_no", var_count);
             
            msg = "Policy Generated!!!";

        } catch (Exception ex) {
            msg = ex.getMessage();
        }

    }

   
%>

<%
           String var_loginid,var_name="";
           HttpSession obj=request.getSession(false);
           var_cust_id=obj.getAttribute("session_cust_id").toString(); 
            
       var_loginid=obj.getAttribute("session_loginid").toString();
       var_name=obj.getAttribute("session_user_name").toString();
            
       if (request.getParameter("btnsubmit") != null) 
            {
                input(request);
                connect();   
                insert(request);
                response.sendRedirect("nominee_details.jsp");
                                    
            }

%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="jquery-2.0.0.min.js"></script>
         <TITLE>JavaScript Toolbox - Calendar Popup To Select Date</TITLE>
        <SCRIPT LANGUAGE="JavaScript" SRC="CalendarPopup.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript">
         
	var now = new Date()
        var cal2 = new CalendarPopup();
        cal2.addDisabledDates(null,formatDate(now,"yyyy-MM-dd"));
        cal2.showYearNavigation();
	</SCRIPT>
          <meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Life Insurance</title>
<link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css" />
<link href="Template/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Template/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Template/jquery.slidertron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.poptrox-1.0.js"></script>
        <title>Policy Details</title>
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
        <li> <span>   My Account  </span>

			  <ul>
                                         <li><a href="view_profile.jsp"> View Profile </a></li>
                                         <li><a href="change_password.jsp" target="_blank">Change Password </a></li>
                                         <li><a href="logout.jsp"> logout </a></li>
                                         
					 <li class="last"></li>
			  </ul>
            		
            <li><a href="about.jsp" target="_blank"><span>About</span></a></li>
			
		</ul>
		<script type="text/javascript">
			$('#menu').dropotron();
		</script>
	</div>
    <body>
        
        <form name="frm" method="post" action="life_insurance.jsp" >
            <br>
            <table border="1" bgcolor="white" align="center"  cellspacing="10" cellpadding="15" >
                <h2 align="center"> Enter Policy Details for <%=var_cust_id%></h2>
               
                    <tr>
                    <td>Policy Type</td>
                    <td><input type="text" name="txttype" value="Life Insurance" readonly="readonly" /></td>
                </tr>
                    <tr>
                    <td>Purchase Date</td>
                    <td><input type="text" name="purchase_date" readonly="readonly" required/>
                         <A HREF="#" onClick="cal2.select(document.forms['frm'].purchase_date,'anchor1','dd/MM/yyyy'); return false;"
                      NAME="anchor1" ID="anchor1"> <abbr title="open calendar"><img src="cal1.jpeg" alt="select" ></A></td></abbr></tr>
                </tr>
                 
                 <tr>
                       <td>Frequency</td>
                 <td><select name="frequency">
                     <option>Yearly</option>
                     <option>Quarterly</option>
                     <option>Monthly</option>
                 </select></td>
                  </tr>
                  
                  <tr>
                    <td>Policy Start Date</td>
                    <td><input type="text" name="policy_start_date" readonly="readonly" required="required"/>
                        <A HREF="#" onClick="cal2.select(document.forms['frm'].policy_start_date,'anchor1','dd/MM/yyyy'); return false;"
                      NAME="anchor1" ID="anchor1"> <abbr title="open calendar"><img src="cal1.jpeg" alt="select" ></A></td></abbr></tr>
                </tr>
                  <tr>
                    <td>Policy Expiry Date</td>
                    <td><input type="text" name="policy_exp_date" readonly="readonly" required="required"/>
                         <A HREF="#" onClick="cal2.select(document.forms['frm'].policy_exp_date,'anchor1','dd/MM/yyyy'); return false;"
                      NAME="anchor1" ID="anchor1"> <abbr title="open calendar"><img src="cal1.jpeg" alt="select" ></A></td></abbr></tr>
                </tr>
                  <tr>
                       <td>Life Cover</td>
                 <td><select name="life_cover">
                     <option>500000</option>
                     <option>1000000</option>
                     <option>2000000</option>
                      <option>3000000</option>
                      <option>4000000</option>
                
                 </select> </td>
                  </tr>
                   <tr>
                       <td>Premium Paying Term</td>
                 <td><select name="premium_term">
                    
                     <option>10 Years</option>
                     <option>20 Years </option>
                     <option>30 Years</option>
                     <option>Till policy expiry</option>
                 </select>
                 </td>
                  </tr>
                  <tr>
                    <td>Next Premium Date</td>
                    <td><input type="text" name="next_premium_date" readonly="readonly" required="required" />
                         <A HREF="#" onClick="cal2.select(document.forms['frm'].next_premium_date,'anchor1','dd/MM/yyyy'); return false;"
                      NAME="anchor1" ID="anchor1"> <abbr title="open calendar"><img src="cal1.jpeg" alt="select" ></A></td></abbr></tr>
                </tr>
                
          
               <tr>
                    <td colspan="2" align="center"><input type="submit" value="Submit" name="btnsubmit" /></td>
                </tr>
             </table>
        </form>
        
    </body>
</html>