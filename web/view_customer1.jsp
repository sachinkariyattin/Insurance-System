<%-- 
    Document   : VIEW_CUSTOMER
    Created on : Mar 31, 2013, 11:04:50 AM
    Author     : Amol
--%>
<%@ page  import="java.util.Vector"%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
       String msg="";
       Vector vcust_id=new Vector();
       Vector vmiddlename= new Vector();
       Vector vlastname= new Vector();
       Vector vlogin_id=new Vector();
       Vector vname=new Vector();
       Vector vdob=new Vector();
       Vector vaddress=new Vector();
       Vector vphone_no=new Vector();
       Vector vemail_id=new Vector();
       Vector vgender=new Vector();
       Vector vnationality=new Vector();
       Vector vcountry=new Vector();
       Vector vstate=new Vector();
       Vector vcity=new Vector();
       Vector vpincode=new Vector();
       Vector voccupation=new Vector();
       
       Connection conn=null;
       PreparedStatement stmt=null;
       

       public void connect() {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
        } catch (Exception ex) {

            msg = ex.getMessage();
        }

    }
       
        public void fetch()
        {
            try
            {
                stmt=conn.prepareStatement("select cust_id,loginid,name,middle_name,last_name,dob,address,ph_no,email_id,gender,nationality,country,state,city,pincode,occupation from cust");             
                ResultSet rs=stmt.executeQuery();
                while(rs.next())
                {
                    vcust_id.add(rs.getString("cust_id"));
                    vlogin_id.add(rs.getString("loginid"));
                    vname.add(rs.getString("name"));
                    vmiddlename.add(rs.getString("middle_name"));
                    vlastname.add(rs.getString("last_name"));
                    vdob.add(rs.getString("dob"));
                    vaddress.add(rs.getString("address"));
                    vphone_no.add(rs.getString("ph_no"));
                    vemail_id.add(rs.getString("email_id"));
                    vgender.add(rs.getString("gender"));
                    vnationality.add(rs.getString("nationality"));
                    vcountry.add(rs.getString("country"));
                    vstate.add(rs.getString("state"));
                    vcity.add(rs.getString("city"));
                    vpincode.add(rs.getString("pincode"));
                    voccupation.add(rs.getString("occupation"));
                                                    
                }    
                rs.close();
                stmt.close();

                                                                                  
            }
            catch(Exception ex)
            {
                ex.getMessage();
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
        <title>View Customer</title>
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
	<!-- end #header -->
	<div id="menu-wrapper">
		<ul id="menu">
                    <li class="current_page_item"><a href="Co.jsp"><span>  Employee Home  </span></a></li>
			<li> <span>   My Account  </span>

			  <ul>
                              <li class="first"><a href="view_profile.jsp"> View Profile</a></li>
					 <li><a href="logout.jsp"> Logout </a></li>
					 <li class="last"></li>
			  </ul>
		  </li>
			
			
          <li><a href="about.jsp" target="_blank"><span>About</span></a></li>
			
		</ul>
		<script type="text/javascript">
			$('#menu').dropotron();
		</script>
	</div>
	<!-- end #menu -->
        <form action="view_customer1.jsp">
         <br>
        <table bgcolor ="white" border="1" align="center" width="50" height="50">
                <thead>
                    <tr>
                        <th>CUSTOMER_ID</th>
                        <th>LOGIN_ID</th>
                        <th>FIRST NAME</th>
                        <th>MIDDLE NAME</th>
                        <th>LAST NAME</th>
                        <th>DATE OF BIRTH</th>
                        <th>ADDRESS</th>
                        <th>PHONE_NO</th>
                        <th>EMAIL_ID</th>
                        <th>GENDER</th>
                        <th>OCCUPATION</th>
                        <th>NATIONALITY</th>
                        <th>COUNTRY</th>
                        <th>STATE</th>
                        <th>CITY</th>
                        <th>PIN CODE</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <br>
                        <%
                            for(int i=0;i<vcust_id.size();i++)
                            {
                        %> 
                        <td><%=vcust_id.get(i)%></td>
                        <td><%=vlogin_id.get(i)%></td>
                        <td><%=vname.get(i)%></td>
                        <td><%=vmiddlename.get(i)%></td>
                        <td><%=vlastname.get(i)%></td>
                        <td><%=vdob.get(i)%></td>
                        <td><%=vaddress.get(i)%></td>
                        <td><%=vphone_no.get(i)%></td>
                        <td><%=vemail_id.get(i)%></td>
                        <td><%=vgender.get(i)%></td>
                        <td><%=voccupation.get(i)%></td>
                        <td><%=vnationality.get(i)%></td>
                        <td><%=vcountry.get(i)%></td>
                        <td><%=vstate.get(i)%></td>
                        <td><%=vcity.get(i)%></td>
                        <td><%=vpincode.get(i)%></td>
                                
                     </tr>
                     <% }
                         vcust_id.clear();
                         vlogin_id.clear();
                         vmiddlename.clear();
                         vlastname.clear();
                         vname.clear();
                         vdob.clear();
                         vaddress.clear();
                         vphone_no.clear();
                         vemail_id.clear();
                         vgender.clear();
                         vnationality.clear();
                         vcountry.clear();
                         vstate.clear();
                         vcity.clear();
                         vpincode.clear();
                    %>                    
                </tbody>
            </table>
                  
            
        </form>
    </body>
</html>
