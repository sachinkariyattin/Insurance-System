<%-- 
    Document   : add_loan_details
    Created on : Apr 13, 2013, 12:38:17 PM
    Author     : Sac
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!

Connection conn=null;
PreparedStatement stmt=null;
String msg="",policy_no="",loan_no,loan_date;
float loan_amt,rof,EMI;
int period,count;

public void input(HttpServletRequest request)
{
   
   
   loan_date=request.getParameter("loandate");
   loan_amt=Float.parseFloat(request.getParameter("loan_amt"));
   period=Integer.parseInt(request.getParameter("time_period"));
   rof=Float.parseFloat(request.getParameter("rof"));
  
}

public void fetch(HttpServletRequest request)
 {
     policy_no=request.getParameter("param");
   HttpSession obj=request.getSession(false);
   obj.setAttribute("session_policy_no",policy_no);
 }
void calculate()
{
    rof=rof/1200;
 EMI = loan_amt * rof / (float)(1 - (Math.pow(1/(1 + rof), period)));
}
void connect()
{
    try{
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    conn=DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
      }
    catch(Exception ex)
    {
        msg=ex.getMessage();
    }       
}
void insert(HttpServletRequest request)
{
    try{
        stmt=conn.prepareStatement("select count(slno),max(slno) from loan");
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
    
             loan_no=count+"";
             loan_no="LOAN"+count;
              
             HttpSession obj=request.getSession(false);
   obj.setAttribute("session_loan_no",loan_no);
             
           stmt=conn.prepareStatement("insert into loan(slno,policy_no,loan_no,loan_date,loan_amt,time_period,rate_of_interest,emi) values(?,?,?,?,?,?,?,?)");                     
           stmt.setInt(1,count);
           stmt.setString(2,policy_no);
           stmt.setString(3,loan_no);
           stmt.setString(4,loan_date);
           stmt.setFloat(5,loan_amt);
           stmt.setInt(6,period);
           stmt.setFloat(7,rof);
           stmt.setFloat(8,EMI);
           
           stmt.executeUpdate();
           
           stmt.clearParameters();
           stmt.close();
    }
    catch(Exception ex)
    {
        msg=ex.getMessage();
    }        


}        
%>

<%
  
 

 if(request.getParameter("btnsubmit")!=null)
{       
input(request);
calculate();
connect();
insert(request);
response.sendRedirect("generated_loan_details.jsp");
}
 else{
     fetch(request);
 }
%>

<html>
  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <SCRIPT LANGUAGE="JavaScript" SRC="CalendarPopup.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript">
         
	var now = new Date()
        var cal2 = new CalendarPopup();
        cal2.addDisabledDates(null,formatDate(now,"yyyy-MM-dd"));
        cal2.showYearNavigation();
	</SCRIPT>
        <title>ADD LOAN DETAILS</title>
        <meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Employee Home</title>
<link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css" />
<link href="Template/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Template/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Template/jquery.slidertron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.poptrox-1.0.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         
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
                    <li class="current_page_item"><a href="Co.jsp"><span> Employee Home  </span></a></li>
        <li> <span>   My Account  </span>

			  <ul>
                           <li><a href="view_profile.jsp"> View Profile </a></li>
                           <li><a href="change_password.jsp" target="_blank"> Change Password </a></li>
			  <li><a href="logout.jsp"> logout </a></li>
                                         
					 <li class="last"></li>
			  </ul>
          
      
        <li><a href="generate_policies.jsp"> <span>Generate Policies</span></a></li>
			
		</ul>
		<script type="text/javascript">
			$('#menu').dropotron();
		</script>
	</div>
               <form action="add_loan_details.jsp" name="frm" method="POST">
        <table border="2" align="center">
            <tr>
                <td>POLICY NO.</td><td><input type="text" name="policy_no" value="<%=policy_no%>" readonly="readonly"/></td>
            </tr>
          
            <tr>
                <td>LOAN DATE</td><td><input type="text" name="loandate" value="" readonly="readonly" required/> <A HREF="#" onClick="cal2.select(document.forms['frm'].loandate,'anchor1','dd/MM/yyyy'); return false;"
                      NAME="anchor1" ID="anchor1"> <abbr title="open calendar"><img src="cal1.jpeg" alt="select" ></A></td></abbr></tr></td>
            </tr>
            <tr>
                <td>LOAN AMOUNT</td><td><input type="text" name="loan_amt" value="" required/></td>
            </tr>
            <tr>
                <td>TIME PERIOD(in months)</td><td><select name="time_period" required>
                <option>12</option>
                <option>24</option>
                <option>36</option>
                <option>48</option>
                <option>60</option>
            </select></td>
            </tr>
            <tr>
                <td>RATE OF INTEREST(in %)</td><td><input type="text" name="rof" value="10" readonly="readonly" required/></td>
            </tr>
         
            <tr>
                <td><input type="submit" name="btnsubmit" value="Submit"/></td>
            </tr>
        </table>
        
       	  
    </body>
    </form>
</html>
