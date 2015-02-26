<%-- 
    Document   : house_members
    Created on : Apr 21, 2013, 12:48:51 PM
    Author     : Sac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%!


    Connection conn = null;
    PreparedStatement stmt = null;
    String cust_name,cust_dob,cust_occupation,cust_gender;
    String[] txtmemid=new String[5];
    String[] txtgender=new String[5];
    String[] txtname=new String[5];
    String[] txtdob=new String[5];
    String[] txtoccupation=new String[5];
    String[] txtsuminsured=new String[5]; //txtmemid2,txtgender2,txtname2,txtdob2,txtoccupation2,txtsuminsured2,txtmemid3,txtgender3,txtname3,txtdob3,txtoccupation3,txtsuminsured3,txtmemid4,txtgender4,txtname4,txtdob4,txtoccupation4,txtsuminsured4= "";
    String var_members,var_policy,var_cust_id,mname,mdob,moccupation,msuminsured,mmemid,mgender,var_count,msg,x="";
    int n,i;
   
         
    public void input(HttpServletRequest request)
    {
         
     
          txtmemid[0]=request.getParameter("memberid1");
          txtname[0]=request.getParameter("name1");
          txtdob[0]=request.getParameter("date_of_birth1");
          txtgender[0]=request.getParameter("gender1");
          txtoccupation[0]=request.getParameter("occupation1");
          
          
          txtmemid[1]=request.getParameter("memberid2");
          txtname[1]=request.getParameter("name2");
          txtdob[1]=request.getParameter("date_of_birth2");
          txtgender[1]=request.getParameter("gender2");
          txtoccupation[1]=request.getParameter("occupation2");
          
          
          txtmemid[2]=request.getParameter("memberid3");
          txtname[2]=request.getParameter("name3");
          txtdob[2]=request.getParameter("date_of_birth3");
          txtgender[2]=request.getParameter("gender3");
          txtoccupation[2]=request.getParameter("occupation3");
         
          
          txtmemid[3]=request.getParameter("memberid4");
          txtname[3]=request.getParameter("name4");
          txtdob[3]=request.getParameter("date_of_birth4");
          txtgender[3]=request.getParameter("gender4");
          txtoccupation[3]=request.getParameter("occupation4");
          
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
      
      
      public void fetch()
     {
         try
            {
                stmt=conn.prepareStatement("select name,dob,occupation,gender from cust where cust_id=?");   
                stmt.setString(1, var_cust_id);                         
                ResultSet rs=stmt.executeQuery();
                rs.next();
                
                   cust_name=rs.getString("name");
                   cust_dob=rs.getString("dob");
                   cust_occupation=rs.getString("occupation");
                   cust_gender=rs.getString("gender");
                     rs.close();
                     stmt.close();
                   
          }
                
         
         catch(Exception ex)
            {
                ex.getMessage();
            }        
  }
      
      
      
      public void insert()
      {
          
        try{
             
             
            for(int j=0;j<n;j++)
           {
          
           stmt=conn.prepareStatement("insert into house_members(memberid,name,occupation,gender,date_of_birth,policy_no) values(?,?,?,?,?,?)");
             stmt.setString(1,txtmemid[j]);
             stmt.setString(2,txtname[j]);
             stmt.setString(3,txtoccupation[j]);
             stmt.setString(4,txtgender[j]);
             stmt.setString(5,txtdob[j]);
             stmt.setString(6,var_policy);
            stmt.executeUpdate();
      
            stmt.clearParameters();
            stmt.close();
            }
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
          var_members=obj.getAttribute("session_members").toString();
          var_policy=obj.getAttribute("session_policy").toString();
          
          n=Integer.parseInt(obj.getAttribute("session_members").toString());
                 connect();
                 fetch();
           if (request.getParameter("btnsubmit") != null) {
               input(request);
               connect();
               insert();
               response.sendRedirect("generated_house_insurance_details.jsp");
              
            }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Member Details</title>
        <TITLE>JavaScript Toolbox - Calendar Popup To Select Date</TITLE>
        <SCRIPT LANGUAGE="JavaScript" SRC="CalendarPopup.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript">
         
	var cal2 = new CalendarPopup();
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
          <table border="1" bgcolor="white" align="center"  cellspacing="10" cellpadding="15" >
          
           <thead>
                  <tr>
                     <th>Customer ID</th>
                     <th>Number Of Members</th>
                     <th>Policy Number</th>
                </tr>
           </thead> 
           <tr>
           <td><%=var_cust_id%></td>
           <td><%=n%></td>
           <td><%=var_policy%></td>
           </tr>
        <form name="frm" method="post" action="house_members.jsp" >
            <table border="1" bgcolor="white" align="center"  cellspacing="10" cellpadding="15" >
                <h2 align="center">Enter Member Details</h2>
                
                <thead>
                  <tr>
                     <th>Member ID</th>
                     <th> Name</th>
                     <th>Date of Birth</th>
                     <th>Occupation</th>
                     <th>Gender</th> 
                  </tr>
                  
                </thead>
                <tr>
                     <td><input type="text" name="memberid1" value="1" readonly="readonly"/></td>

                    <td><input type="text" name="name1" value="<%=cust_name%>" readonly="readonly"/></td>
           
                    <td><input type="text" name="date_of_birth1" value="<%=cust_dob%>" readonly="readonly"/></td>
            
                    <td><input type="text" name="occupation1" value="<%=cust_occupation%>" /></td>
            
                 <td><input type="text" name="gender1" value="<%=cust_gender%>" readonly="readonly" /></td>
                     
                  
                </tr>
                <%
                            for(int i=2;i<=n;i++)
                            {
                        %> 
                    
                <tr>
                    <td><input type="text" name="memberid<%=i%>" value="<%=i%>" readonly="readonly"/></td>

                    <td><input type="text" name="name<%=i%>"/></td>
           
                    <td><input type="text" name="date_of_birth<%=i%>" /><A HREF="#" onClick="cal2.select(document.forms['frm'].date_of_birth<%=i%>,'anchor1','dd/MM/yyyy'); return false;"
                      NAME="anchor1" ID="anchor1"> <abbr title="open calendar"><img src="cal1.jpeg" alt="select" ></A></td></abbr>
            
                    <td><select name="occupation<%=i%>">
                    <option>Government Service</option>
                    <option>Student</option>
                    <option>House Wife</option>
                    <option>Private Business</option>
                    <option>Farmer</option>
                   </td>
            
                 <td>Male<input type="radio" name="gender<%=i%>" value="M" />
                     Female<input type="radio" name="gender<%=i%>" value="F" />
               
                 
                                

                </tr>
                <%
                            }
          %>
   <tr>
       <td colspan="6" align="center"><input type="submit" value="Submit" name="btnsubmit" /></td>
    </tr>
                    
            </table>    
        </form>
        <script>
   <%        
       if(request.getParameter("btnsubmit")!=null)
                     {
             %>               
         alert("<%=msg%>");
         <%
                 }
 %>
     </script>
        </body>
          
</html>