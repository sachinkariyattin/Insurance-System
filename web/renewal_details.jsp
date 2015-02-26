<%-- 
    Document   : renewal_details
    Created on : 24 May, 2013, 4:20:17 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="java.sql.*" %>
<!DOCTYPE html>



 
<%!
Connection conn = null;
    PreparedStatement stmt = null;
    String cust_id,policy_no,msg,renew,var_policy_no,var_cust_id,new_exp;
int count;
   
public void input(HttpServletRequest request) {
       
  
      new_exp= request.getParameter("new_exp");
        
        
    }

    public void connect() {

        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
        } catch (Exception ex) {

            msg = ex.getMessage();
        }
   
    }
    
     public void insert() {
        try {
 
             
            stmt = conn.prepareStatement("update policy set policy_exp_date=? where policy_no=? ");
             stmt.setString(1,new_exp);
            stmt.setString(2, policy_no);
            
              stmt.executeUpdate();
        
            
            stmt.clearParameters();
            stmt.close();
                       }
        catch (Exception ex) {

            msg = ex.getMessage();
        }
               }
   
%>

<%
if(request.getParameter("btnsubmit")!=null)
       {
 input(request);
 connect();
 insert();
 }
   else
             {
       policy_no=request.getParameter("param");
   }
 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Renew Policy</h1>
        <form name="frm" action="renewal_details.jsp" method="POST">
        
   
      New Expiry Date <input type="text" name="new_exp" value="" />
      
      <input type="submit" value="renew" name="btnsubmit" />
 
      
        </form>
    </body>
</html>
