<%-- 
    Document   : delete_official
    Created on : Mar 31, 2013, 1:05:11 PM
    Author     : Sac
--%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
 Connection conn = null;
    PreparedStatement stmt = null;
String msg="",empid="",loginid="",address="",doj="",dsgn="",gender="",name="",txtempid="",empidfetched="";
    void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }
    
public void fetch_name(HttpServletRequest request)
        {
empid=request.getParameter("empid");
        }
public void fetch_empid(HttpServletRequest request)
        {
empidfetched=request.getParameter("txtempid");
        }

public void search()
        {
    try
    {
   stmt=conn.prepareStatement("select name,empid,loginid,address,designation,doj,gender from companyofficial where empid=?");
       stmt.setString(1, empid);
       ResultSet rs=stmt.executeQuery();
      rs.next();
     txtempid=rs.getString("empid");
     loginid=rs.getString("loginid");
     address=rs.getString("address");
     dsgn=rs.getString("designation");
     doj=rs.getString("doj");
     gender=rs.getString("gender");
     name=rs.getString("name");
     rs.close();
     stmt.clearParameters();
     stmt.close();
     msg="search successfull";
    }
    catch(Exception e)
        {
         msg="NO DETAILS FOUND";
        }
    
}
public  void delete()
        {
    try
            {
        
            stmt=conn.prepareStatement("delete from login where loginid in (select loginid from companyofficial where empid=?)");
           
            stmt.setString(1, empidfetched );
            stmt.executeUpdate();
            stmt.clearParameters();
            stmt.close();
            msg="DATA IS DELETED";
                       }
    catch(Exception e)
        {
        msg=e.getMessage();
       }
}  
%>

<%

if(request.getParameter("btnsearch")!=null)
    {
    connect();
    fetch_name(request);
    search();
    }
if(request.getParameter("btndelete")!=null)
    {
connect();
fetch_empid(request);
delete();
txtempid="";
dsgn="";
address="";
doj="";
gender="";
name="";
loginid="";
    }

if(request.getParameter("btncancel")!=null)
    {
    msg="";
    }
if(request.getParameter("cancel")!=null)
    {
    msg="";
    txtempid="";
   dsgn="";
address="";
doj="";
gender="";
name="";
loginid="";
    }
%>
<html>
    <head>
        <h1>Search and Delete employee</h1>   
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Official</title>
        
    </head>
    <script>
    function valid(frm)
        {
            if(frm.empid.value.trim()=="")
                {
                    alert("ENTER EMPLOYEE ID TO SEARCH");
                    frm.empid.value.focus();
                    return false;
                }   
         }
    </script>
    <body bgcolor="grey" >
        <h2><a href="Admin.jsp">Admin</h2></a>
    <form name="frm" action="search_official.jsp">
       
   <table align="center" border="8" height="100" width="100" bgcolor="white">
       <tr><td>EMPLOYEE ID</td><td><input type="text" name="empid"  placeholder="Enter employee Id" /></td></tr> 


       <tr><td><input name="btnsearch" type="submit" value="Search" onfocus="return valid(frm)"/></td>
    <td><input name="btncancel" type="submit" value="Cancel"/></td></tr> 
</table>
        <h2 align="center">Employee details</h2>
       <table border="1" align="center" width="50" height="50">
           <tbody bgcolor="white">
             <tr>
           <td>Name</td><td><input type="text" name="Name" value="<%=name%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>Employee ID</td><td><input type="text" name="txtempid" value="<%=txtempid%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>Login ID</td><td><input type="text" name="loginid" value="<%=loginid%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>City</td><td><input type="text" name="address" value="<%=address%>" readonly="readonly" /></td>
           </tr>
           <tr>
           <td>DOJ</td><td><input type="text" name="doj" value="<%=doj%>" readonly="readonly"/></td>
           </tr>
           <tr>
           <td>Gender</td><td><input type="text" name="gender" value="<%=gender%>"readonly="readonly"  /></td>
           </tr>
           <tr>
               <td><input type="submit" value="delete" name="btndelete"  /></td>
                <td><input type="submit" value="cancel" name="cancel" /></td>
                </tr>
</tbody>
     
</table>  
</form>
               </body>

  <script>
            <%        
       if(request.getParameter("btndelete")!=null)
                     {
             %>               
         alert("<%=msg%>");
         <%
                 }
         %>
             <%
             if(request.getParameter("btnsearch")!=null)
                     {
             %>               
         alert("<%=msg%>");
         <%
                 }
         %>
         </script>
</html>