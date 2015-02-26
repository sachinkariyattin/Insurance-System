<%-- 
    Document   : view_loan_details
    Created on : May 10, 2013, 10:53:01 AM
    Author     : Amol
--%>
<%@page import="java.util.Vector" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
Connection conn=null;
PreparedStatement stmt=null;
String msg="",cust_id="",login_id="",loan_no="",var_name;
Vector vloan_no=new Vector();
Vector vcust_id=new Vector();

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
void fetch_loginid(HttpServletRequest request)
{
   HttpSession obj=request.getSession(false);
   login_id=obj.getAttribute("session_loginid").toString();
   var_name=obj.getAttribute("session_user_name").toString();
}
void fetch_input(HttpServletRequest request)
{
     loan_no=request.getParameter("loan_no");
     HttpSession obj=request.getSession(false);
     obj.setAttribute("session_loan_no",loan_no);
     
}        
void fetch()
{
    try{
    stmt=conn.prepareStatement("select C.cust_id,L.loan_no from loan L,life_insurance P,policy Po,cust C where C.loginid=? and L.policy_no=P.policy_no and P.policy_no=Po.policy_no and C.cust_id=Po.cust_id");
    stmt.setString(1,login_id);
    ResultSet rs=stmt.executeQuery();
    while(rs.next())
     {
        vcust_id.add(rs.getString("cust_id"));
        vloan_no.add(rs.getString("loan_no"));
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
 connect();
 fetch_loginid(request);
 fetch();
if(request.getParameter("btngo")!=null)
{     
    fetch_input(request);
    response.sendRedirect("view_loan.jsp");
}
else
{
    msg="LOAN DETAILS NOT AVAILABLE";
}    
%>
<html>
    <head>
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
    <form name="frm" action="view_loan_details.jsp" method="POST">
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
        <%
        if(vloan_no.size()==0)
                    {
        %>    
        <h1 align="center">NO LOAN DETAIL FOUND</h1>
        <%}
 %>
        
        <%
        if(vloan_no.size()>0)
                    {
        %>    
           
        <table align="center">
            <tr>
                <td>CUSTOMER ID:<input type="text" name="cust_id" value="<%=vcust_id.get(0)%>" readonly="readonly" /></td>
            </tr>
            <tr>
                <td>LOAN NO:
                    <select name="loan_no">
                <%
                        for(int i=0;i<vloan_no.size();i++)
                                                   { %>
                      <option><%=vloan_no.get(i)%></option>
                   
                    <% }
                     vloan_no.clear();
                    %>
                </select></td><td><input type="submit" value="Go" name="btngo" /></td>
            </tr>
        </table>
<%}
 %>
    </body>
    </form>
</html>
