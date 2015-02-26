<%-- 
    Document   : add_query
    Created on : 21 Apr, 2013, 12:35:12 PM
    Author     : chiru
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page  import="java.sql.*" %>
<%!
Connection conn = null;
    PreparedStatement stmt = null;
    int count;
    String password,posted_by,name,query,msg = "",var_loginid,var_name;
String user_role="pb_house";
String  var_system_date,posted_date;
java.util.Date utilDate = new java.util.Date();
 
 

    public void input(HttpServletRequest request) {
        //query_id = request.getParameter("txtqueryid");
        posted_by = request.getParameter("txtpostedby");
        
       // password= request.getParameter("txtpassword");
        query = request.getParameter("txtquery");
        posted_date=request.getParameter("txtposteddate");
    }

    public void connect() {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
        } catch (Exception ex) {

            msg = ex.getMessage();
        }

    }
  
    public  void auto_gen()
            {
        
        
        
        
    try{
    
    stmt=conn.prepareStatement("select count(query_id),max(query_id) from query");
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
    }catch(Exception e){
        msg=e.getMessage();
    }
            
            }
    public void fetch_login(HttpServletRequest request)
        {
     HttpSession obj=request.getSession(false);

        var_loginid=obj.getAttribute("session_loginid").toString();
        var_name=obj.getAttribute("session_user_name").toString();
        }
    public void insert() {
        try {
             stmt = conn.prepareStatement("insert into query(query_id,query,posted_by,posted_date)values(?,?,?,?)");
             stmt.setInt(1, count);
            stmt.setString(2, query);
            stmt.setString(3, posted_by);
            stmt.setString(4, posted_date);
        stmt.executeUpdate();
        
        stmt.close();
            
        conn.close();
        msg = "Query Posted"; 
        } 
        
        
        catch (Exception ex) {
            msg = ex.getMessage();
        }

    }
    
    
  
%>



<%

SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
         var_system_date = sdf.format(utilDate); 



fetch_login(request);

            
               if (request.getParameter("btnsubmit") != null) 
               {
                   
                input(request);
                connect();
                auto_gen();
                insert();
                
            }
               



%>

 <% if(request.getParameter("btnCancel")!=null)
         {
     msg=" ";
     }
%>


<h3>WELCOME:<%=var_name%></h3>

<h3><b> <br><a href="add_query.jsp">Add Query</a></br> </b></h3> 
  
<html>
   
    <head>
        <h2>Insurance System</h2>   
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
       
        <h2 align="center">Add Query</h2>
        <title>Post New Query</title>
    </head>
    <script>
        function valid(frmpub)
        {
            if(frmpub.txtquery.value.trim()=="")
                {
                    alert("ENTER Query HOUSE NAME");
                    frmpub.txtquery.value.focus();
                    return false;
                }
                
                if(frmpub.txtpostedby.value.trim()="")
                {
                    alert("ENTER Posted By ");
                    frmpub.txtpostedby.focus();
                    return false;
                }
                /*
           if(frmpub.txtloginid.value.trim()=="")
                {
                    alert("ENTER THE LOGIN ID");
                    frmpub.txtloginid.value.focus();
                    return false;
                }

                if(frmpub.txtemailid.value.trim()=="")
                {
                    alert("ENTER THE EMAIL ID");
                    frmpub.txtemailid.value.focus();
                    return false;
                }
                         var emailid=frmpub.txtemailid.value;
        atpos=emailid.indexOf("@");
               dotpos=emailid.lastIndexOf(".");
        if(atpos<=1 ||(dotpos-atpos)<=2)
            {
                alert("ENter Valid email id");
                frmpub.txtemailid.focus();
                return false;
            }
                if(frmpub.txtaddress.value.trim()=="")
                {
                    alert("ENTER THE ADRESS");
                    frmpub.txtdsgn.value.focus();
                    return false;
                }
*/
        }
        </script>
    <body >
        <form name="frmpro" action="add_query.jsp" method="post">
            <a href="disscussionforum.jsp"> Forum Home</a>
            <table border="5" height="300" width="300"  align="center" color="white">
               
                       <tr>
                        <td>Query</td>
                        <td><textarea name="txtquery" rows="4" cols="20" required="required">
                            </textarea></td>
                    </tr>
                    <tr>
                        <td>Posted By</td>
                        <td><input type="text" name="txtpostedby" value="<%=var_loginid%>" required="required"></td>
                    </tr>
              
                    <tr>
                        <td><input type="submit" value="Submit" name="btnsubmit" onfocus="return valid(frmpro)"/></td>
                        <td><input type="submit" value="Cancel" name="btnCancel"/></td>
                    </tr>
                  <tr>
                        <td>Posted Date</td>
                        <td><input type="text" name="txtposteddate" value="<%=var_system_date%>" readonly="readonly" </td>
                    </tr>

            </table>
          
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
    
        </form>
     
    </body>
    
</html>
<a href="logout.jsp">LOGOUT</a>

