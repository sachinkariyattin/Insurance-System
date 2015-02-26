<%-- 
    Document   : nominee_details
    Created on : Apr 28, 2013, 12:25:27 PM
    Author     : Sac
--%>

<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%!

    Connection conn = null;
    PreparedStatement stmt = null;
     String name,city,email,address,dob,phone,gender,relation;
    String var_policy_no,msg,var_count,var_cust_id="";
    int count;
    
       Vector vnominee_id=new Vector();
       Vector vemail_id=new Vector();
       Vector vname=new Vector();
       Vector vdob=new Vector();
       Vector vaddress=new Vector();
       Vector vphone_no=new Vector();
       Vector vgender=new Vector();
       Vector vcity=new Vector();
       Vector vrelation=new Vector();
       
      public void input(HttpServletRequest request)
    {
           name=request.getParameter("nomname");
          city=request.getParameter("nomcity");
          email=request.getParameter("nomemail");
          address=request.getParameter("nomaddress");
          gender=request.getParameter("gender");
          dob=request.getParameter("nomdate");
          phone=request.getParameter("nomphone");    
          relation=request.getParameter("nomrelation");
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
                         vnominee_id.clear();
                         vemail_id.clear();
                         vname.clear();
                         vdob.clear();
                         vaddress.clear();
                         vphone_no.clear();
                         vemail_id.clear();
                         vgender.clear();
                         vcity.clear(); 
                         vrelation.clear();
                   
                stmt=conn.prepareStatement("select distinct  A.nominee_id,A.email_id,A.name,A.date_of_birth,A.address,A.city,A.phone_no,A.gender,A.relation from nominee A,life_insurance B,policy C where C.cust_id=? and C.policy_no=B.policy_no and B.nominee_id=A.nominee_id");             
                stmt.setString(1,var_cust_id );
                
                ResultSet rs=stmt.executeQuery();
                while(rs.next())
                {
                    vnominee_id.add(rs.getString("nominee_id"));
                    vemail_id.add(rs.getString("email_id"));
                    vname.add(rs.getString("name"));
                    vdob.add(rs.getString("date_of_birth"));
                    vaddress.add(rs.getString("address"));
                    vcity.add(rs.getString("city"));                       
                    vphone_no.add(rs.getString("phone_no"));
                    vgender.add(rs.getString("gender"));      
                     vrelation.add(rs.getString("relation"));                                    
                }    
                rs.close();
                stmt.close();

                                                                                  
            }
            catch(Exception ex)
            {
                ex.getMessage();
            }        
            
        }           
        public void insert_nominee()
      
      {
   
        try {
             stmt=conn.prepareStatement("select count(slno),max(slno) from nominee");
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
                  var_count="Nominee"+var_count;
            
            
            
            stmt=conn.prepareStatement("insert into nominee(nominee_id,name,email_id,city,gender,date_of_birth,address,phone_no,relation,slno)values(?,?,?,?,?,?,?,?,?,?)");
            stmt.setString(1,var_count);
            stmt.setString(2,name);
            stmt.setString(3,email);
            stmt.setString(4,city);
            stmt.setString(5,gender);
            stmt.setString(6,dob);
            stmt.setString(7,address);
            stmt.setString(8,phone);
            stmt.setString(9,relation);
            stmt.setInt(10,count);
         
            stmt.executeUpdate();
      
            stmt.clearParameters();
            stmt.close();
            
            
            stmt=conn.prepareStatement("update life_insurance set nominee_id=? where policy_no=?");
            stmt.setString(1,var_count);
            stmt.setString(2,var_policy_no);
           
            stmt.executeUpdate();
      
            stmt.clearParameters();
            stmt.close();
            
             conn.close();
             
             msg="policy generated!!!!!!";
          }
            
             catch (Exception ex) 
            {
            msg = ex.getMessage();
        }
    
   }
%>

<%
            HttpSession obj=request.getSession(false);
           var_policy_no=obj.getAttribute("session_policy_no").toString();   
           var_cust_id=obj.getAttribute("session_cust_id").toString();
              
              connect();
              fetch();
           if (request.getParameter("btnsubmit") != null) 
            {
               input(request);
               connect();
               insert_nominee();
               response.sendRedirect("generated_life_insurance_details.jsp");
           }
%>           


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generate Policies</title>
    <head> 
        <meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Generate Policies</title>
<link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css" />
<link href="Template/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Template/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Template/jquery.slidertron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.poptrox-1.0.js"></script>
         <script src="jquery-2.0.0.min.js"></script>
             <TITLE>JavaScript Toolbox - Calendar Popup To Select Date</TITLE>
        <SCRIPT LANGUAGE="JavaScript" SRC="CalendarPopup.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript">
         
	var cal2 = new CalendarPopup();
        cal2.showYearNavigation();
	
    </SCRIPT>
        <title>Nominee Details</title>
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
  <li><a href="logout.jsp"><span>logout  </span></a></li>
		<script type="text/javascript">
			$('#menu').dropotron();
		</script>
	</div>
<script> 
$(document).ready(function(){
  $("#flip").click(function(){
    $("#panel").slideToggle("slow");
  });
});
</script>
 
<style type="text/css"> 
#panel,#flip
{
padding:5px;
text-align:center;
background-color:#e5eecc;
border:solid 1px #c3c3c3;
}
#panel
{
padding:50px;
display:none;
}
</style>
<script> 
$(document).ready(function(){
  $("#flip1").click(function(){
    $("#panel1").slideToggle("slow");
  });
});
</script>
 
<style type="text/css"> 
#panel1,#flip1
{
padding:5px;
text-align:center;
background-color:#e5eecc;
border:solid 1px #c3c3c3;
}
#panel1
{
padding:50px;
display:none;
}
</style>
  
<body>
    <form name="frm" method="post" action="nominee_details.jsp" >
     <div id="flip"><b><u>Click here to enter new Nominee details</u></b></div>
            <div id="panel">

            <table border="1" bgcolor="white" align="center"  cellspacing="3" cellpadding="5" >
                 
                    <tr>
                    <td>Name</td>
                    <td><input type="text" name="nomname"/></td>
                </tr>
                    <tr>
                    <td>Date of Birth</td>
                    <td><input type="text" name="nomdate" /><A HREF="#" onClick="cal2.select(document.forms['frm'].nomdate,'anchor1','dd/MM/yyyy'); return false;"
                      NAME="anchor1" ID="anchor1"> <abbr title="open calendar"><img src="cal1.jpeg" alt="select" ></A></td></abbr></tr>
                
                </tr>
                <tr>
                    <td>Choose Gender</td>
               <td>Male<input type="radio" name="gender" value="M" />
                   Female<input type="radio" name="gender" value="F" />
               </td>
               <tr>
                 <tr>
                    <td>Email ID</td>
                    <td><input type="text" name="nomemail"  /></td>
                 </tr>
                 
                 <tr>
                       <td>Relationship with life assured</td>
                 <td><select name="nomrelation">
                     <option>Son</option>
                     <option>Daughter</option>
                     <option>Spouse</option>
                     <option>Father</option>
                     <option>Mother</option>
                 </select></td>
                  </tr>
                  <tr>
                    <td>Phone No.</td>
                    <td><input type="text" name="nomphone" /></td>
                </tr>
                  <tr>
                    <td>Address</td>
                    <td><textarea  rows="3" cols="30" name="nomaddress" ></textarea></td>
                </tr>
                <tr>
                    <td>city</td>
                    <td><input type="text" name="nomcity" /></td>
                </tr>
                <tr>
                  <td colspan="2" align="center"><input type="submit" value="Submit" name="btnsubmit" /></td>
                <tr>
             </table></div>
     
     
        </form>
    <br>
    <br>
    
     <div id="flip1"><b><u>Click here to choose from existing nominees of the Customer</u></b></div>
            <div id="panel1">
                 <%
         if(vnominee_id.size()>0)
         {
             %>
                 <table bgcolor ="white" border="1" align="center" width="50" height="50">
                <thead>
                    <tr>
                        <th>NOMINEE_ID</th>
                        <th>NAME</th>
                        <th>EMAIL ID</th>
                        <th>DATE OF BIRTH</th>
                        <th>ADDRESS</th>
                        <th>PHONE_NO</th>         
                        <th>GENDER</th>     
                        <th>CITY</th>
                        <th>RELATION</th> 
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <br>
                        <%
                            for(int i=0;i<vnominee_id.size();i++)
                            {
                        %> 
                       <td> <a href="choose_nominee.jsp?param=<%=vnominee_id.get(i)%>"><%=vnominee_id.get(i)%></a></td>
                      
                        <td><%=vname.get(i)%></td>
                        <td><%=vemail_id.get(i)%></td>
                        <td><%=vdob.get(i)%></td>
                        <td><%=vaddress.get(i)%></td>
                        <td><%=vphone_no.get(i)%></td>        
                        <td><%=vgender.get(i)%></td>           
                        <td><%=vcity.get(i)%></td>
                       <td><%=vrelation.get(i)%></td>
                                
                     </tr>
                     <% }
                        
                    %>                    
                </tbody>
                 </table>
                 <% 
                            } 
                     %>  
                     <%
                     if(vnominee_id.size()==0)
                      {
                       %>
                       <h5 align="center">NO EXISTING NOMINEE FOR THIS CUSTOMER</h5>
                 
                 <% 
                            } 
                     %>  
            </div>
    
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