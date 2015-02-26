<%-- 
    Document   : renew
    Created on : 24 May, 2013, 3:27:36 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page  import="java.sql.*" %>
<%@ page  import="java.util.Vector"%>

<%!
    Connection conn = null;
    PreparedStatement stmt = null;
    String cust_id,policy_no,msg,renew,var_policy_no,var_cust_id;
int count;
   
public void input(HttpServletRequest request) {
       
        cust_id = request.getParameter("cust_id");
        policy_no=request.getParameter("policy_no");
        renew=request.getParameter("renew");
        
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
             stmt=conn.prepareStatement("select count(slno),max(slno) from renew");
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
    
             
            stmt = conn.prepareStatement("insert into renew(slno,policy_no,cust_id,renewal_amount)values(?,?,?,?)");
             stmt.setInt(1,count);
            stmt.setString(2, policy_no);
            stmt.setString(3,cust_id);
            stmt.setString(4,renew);
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

   HttpSession obj=request.getSession(false);
 var_policy_no=obj.getAttribute("session_policy_no").toString();
 var_cust_id=obj.getAttribute("session_cust_id").toString();
 
 if(request.getParameter("btnsubmit")!=null)
         {
     input(request);
     connect();
     insert();
 }
 
 %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Renew Policy</h1>
        <form name="frm" action="renew.jsp" method="POST">
        
        
       Policy No <input type="text" name="policy_no" value="<%=var_policy_no%>" />
       
       Customer Code<input type="text" name="cust_id" value="<%=var_cust_id%>" />
       
       Renewal Amount<input type="text" name="renew" value="2500" />
       <input type="submit" value="submit" name="btnsubmit" />
        </form>
    </body>
</html>
