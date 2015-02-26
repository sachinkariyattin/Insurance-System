<%-- 
    Document   : forum
    Created on : 21 Apr, 2013, 12:07:03 PM
    Author     : chiru
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
        
    Connection conn = null;
    PreparedStatement stmt = null;
String msg,name;
int count;
    void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:elearn", "", "");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }
    
        
    
    
   %>
   
<%
if(request.getParameter("btnsubmit")!=null)
    {
connect();

    }




%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <form action="forum.jsp">
        <table border="5">
            <tr><td>Query</td><td><input type="text" name="txtquery" /></td></tr>
            <tr><td>Posted By</td><td><input type="text" name="txtpostedby"  /></td></tr>
            <input type="submit" value="submit" name="btnsubmit" />    
        </table>
        <%=msg%>
        
</form>
    </body>
</html>
