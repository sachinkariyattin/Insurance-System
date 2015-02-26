<%-- 
    Document   : view_policy_details
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
String msg="",cust_id="",login_id="",policy_no="",var_name;
Vector vpolicy_no=new Vector();
Vector vcust_id=new Vector();
Vector vtotal=new Vector();
Vector vtype=new Vector();

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
     policy_no=request.getParameter("policy_no");
     HttpSession obj=request.getSession(false);
     obj.setAttribute("session_policy_no",policy_no);
     
}        
void fetch(HttpServletRequest request)
{
    try{
    stmt=conn.prepareStatement("select C.cust_id,P.policy_no from cust C,policy P,login L where L.loginid=C.loginid and C.cust_id=P.cust_id and P.approved='YES' and L.loginid=?");
    stmt.setString(1,login_id);
    ResultSet rs=stmt.executeQuery();
    while(rs.next())
     {
        vcust_id.add(rs.getString("cust_id"));
        vpolicy_no.add(rs.getString("policy_no"));
    }
   
  
    rs.close();
    stmt.clearParameters();
    stmt.close();
    
    stmt=conn.prepareStatement("select count(P.policy_no)as total,P.type from cust C,policy P where C.cust_id=P.cust_id and P.approved='YES' and C.loginid=? group by P.type ");
    stmt.setString(1,login_id);
    ResultSet rs1=stmt.executeQuery();
    while(rs1.next())
           {    
        vtotal.add(rs1.getString("total"));
        vtype.add(rs1.getString("type"));
           }
    
    rs1.close();
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
 fetch(request);
if(request.getParameter("btngo")!=null)
{     
    fetch_input(request);
 if(policy_no.startsWith("LIFE"))
     {
       response.sendRedirect("view_life_insurance.jsp");
 }
 else if(policy_no.startsWith("HOUSE"))
     {
       response.sendRedirect("view_house_insurance.jsp");
 }    
 else if(policy_no.startsWith("HEALTH"))
     {
       response.sendRedirect("view_health_insurance.jsp");
 }
 else if(policy_no.startsWith("VEHICLE"))
     {
       response.sendRedirect("view_vehicle_insurance.jsp");
 }
}
else
{
    msg="POLICY DETAILS NOT AVAILABLE";
}    
%>
<html>
    <head>
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
        <title>View Details</title>
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
    <form name="frm" action="view_policy_details.jsp" method="POST">
    
    <body>
        
        <%
        if(vpolicy_no.size()==0)
                    {
        %>    
        <h1 align="center">NO POLICIES FOUND</h1>
        <%}
 %>
        
        <%
        if(vpolicy_no.size()>0)
                    {
        %>    
           
        <table align="center">
            <tr>
                <td>CUSTOMER ID:<input type="text" name="cust_id" value="<%=vcust_id.get(0)%>" readonly="readonly" /></td>
            </tr>
            <tr>
                <td>POLICY NO:
                    <select name="policy_no" required="">
                <%
                        for(int i=0;i<vpolicy_no.size();i++)
                                                   { %>
                      <option><%=vpolicy_no.get(i)%></option>
                   
                    <% }
                     vpolicy_no.clear();
                    %>
                </select></td><td><input type="submit" value="Go" name="btngo" /></td>
            </tr>
        </table>
                <br>
                <br>
                     <table border="2" colspan="2" align="center">
                         <thead>
                             <tr>
                <th>POLICY TYPE</th>
                <th>NO.OF APPROVED POLICIES</th></tr>
                             <tr><%
                for(int i=0;i<vtype.size();i++)
                                       {%>
                                       <td><%=vtype.get(i)%></td>
                                       <td><%=vtotal.get(i)%></td></tr>
            <%}  vtype.clear();
               vtotal.clear();
            %>
             
                             
                    </table>
               <%}
 %>

    </body>
    </form>
</html>
