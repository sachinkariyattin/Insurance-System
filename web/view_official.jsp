<%-- 
    Document   : view_official
    Created on : Mar 30, 2013, 12:54:29 PM
    Author     : Sac
--%>
<%@ page  import="java.util.Vector"%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    String msg = "";
    Vector vname= new Vector();
    Vector vmiddlename= new Vector();
    Vector vlastname= new Vector();
    Vector vloginid = new Vector();
    Vector vaddress = new Vector();
    Vector vphno = new Vector();
    Vector vpincode = new Vector();
    Vector vcity = new Vector();
    Vector vemailid = new Vector();
    Vector vdsgn = new Vector();
    Vector vdoj = new Vector();
    Vector vgender = new Vector();
    Vector vslno=new Vector();
    Vector vempid = new Vector();
    
   
   
    Connection conn = null;
    PreparedStatement stmt = null;

   public void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }

    public void fetch() {
        try {
            stmt = conn.prepareStatement("select slno,name,middle_name,last_name,empid,emailid,designation,address,gender,doj,loginid,ph_no,pincode,city from companyofficial");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                vslno.add(rs.getString("slno"));
                vname.add(rs.getString("name"));
                vmiddlename.add(rs.getString("middle_name"));
                vlastname.add(rs.getString("last_name"));
                vloginid.add(rs.getString("loginid"));
                vaddress.add(rs.getString("address"));
                vemailid.add(rs.getString("emailid"));
                vempid.add(rs.getString("empid"));
                vdsgn.add(rs.getString("designation"));
                vdoj.add(rs.getString("doj"));
                vphno.add(rs.getString("ph_no"));
                vpincode.add(rs.getString("pincode"));
                vgender.add(rs.getString("gender"));
                vcity.add(rs.getString("city"));
                
                


            }
            rs.close();
            stmt.close();

        } catch (Exception e) {
            msg = e.getMessage();
        }
    }

%>


<%

connect();
fetch();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view all employees</title>
        <meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Admin Home</title>
<link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css" />
<link href="Template/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Template/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Template/jquery.slidertron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.poptrox-1.0.js"></script>
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
                    <li class="current_page_item"><a href="Admin.jsp"><span> Admin Home  </span></a></li>
        <li> <span>   My Account  </span>

			  <ul>
                              
					 <li><a href="logout.jsp"> logout </a></li>
					 <li class="last"></li>
			  </ul>
            		
            <li><a href="about.jsp" target="_blank"><span>About</span></a></li>
			
		</ul>
		<script type="text/javascript">
			$('#menu').dropotron();
		</script>
	</div>
    <form action="view_official.jsp">
         
        <table border="1" align="center" width="50" height="50" bgcolor="white">
<thead>
<h3><th>SLNO</th>
<th>FIRST NAME</th>
<th>MIDDLE NAME</th>
<th>LAST NAME</th>
<th>LOGINID</th>
<th>PHONE NO</th>
<th>ADDRESS</th>
<th>PINCODE</th>
<th>CITY</th>
<th>EMPID</th>
<th>DOJ</th>
<th>GENDER</th>
<th>EMAILID</th>
<th>DESIGNATION</th>
</tr></h3>

</thead>
<tbody bgcolor="white">
<tr>
    <%
    
    for(int i=0;i<vaddress.size();i++)
        {
    
 %>
 <td><%=vslno.get(i)%></td>
<td><%=vname.get(i)%></td>
<td><%=vmiddlename.get(i)%></td>
<td><%=vlastname.get(i)%></td>
<td><%=vloginid.get(i)%></td>
<td><%=vphno.get(i)%></td>
<td><%=vaddress.get(i)%></td>
<td><%=vpincode.get(i)%></td>
<td><%=vcity.get(i)%></td>
<td><%=vempid.get(i)%></td>
<td><%=vdoj.get(i)%></td>
<td><%=vgender.get(i)%></td>
<td><%=vemailid.get(i)%></td>
<td><%=vdsgn.get(i)%></td>
</tr>
<%}  vname.clear();
vloginid.clear();
vaddress.clear();
vemailid.clear();
vdoj.clear();
vgender.clear();
vempid.clear();
vdsgn.clear();
vslno.clear();
vmiddlename.clear();
vlastname.clear();
vcity.clear();
vphno.clear();
vpincode.clear();
%>

</tbody>
</table>


<%=msg%>
</form>
        
    </body>
</html>