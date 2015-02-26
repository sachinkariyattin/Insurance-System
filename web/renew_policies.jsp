<%-- 
    Document   : renew_policies
    Created on : 24 May, 2013, 4:10:29 PM
    Author     : ACER
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="java.util.Vector"%>

<!DOCTYPE html>
<%!
 String msg="";
       Vector vcust_id=new Vector();
       Vector vpolicy_no=new Vector();
       Vector vpaid=new Vector();
       
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
                stmt=conn.prepareStatement("select cust_id ,policy_no,renewal_amount from renew");             
                ResultSet rs=stmt.executeQuery();
                while(rs.next())
                {
                    vcust_id.add(rs.getString("cust_id"));
                    vpolicy_no.add(rs.getString("policy_no"));
                    vpaid.add(rs.getString("renewal_amount"));
          
                                                    
                }    
                rs.close();
                stmt.close();

                                                                                  
            }
            catch(Exception ex)
            {
               msg= ex.getMessage();
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
        <title>JSP Page</title>
    </head>
    <body>
        
         <body>
      
             <form action="renew_policies.jsp" method="POST" >
         <br>
         <h3 align="center">CLICK ON CUSTOMER ID TO GENERATE POLICY</h3>
        <table bgcolor ="white" border="1" align="center" width="50" height="50">
                <thead>
                    <tr>
                        <th>Policy No</th>
                        <th>Customer Id</th>
                        <th>Amount Paid</th>
                     
                </thead>
                <tbody>
                    <tr>
                        <br>
                        <%
                            for(int i=0;i<vcust_id.size();i++)
                            {
                        %> 
                       <td> <a href="renewal_details.jsp?param=<%=vpolicy_no.get(i)%>"><%=vpolicy_no.get(i)%></a></td>
                       
                       
                        <td><%=vcust_id.get(i)%></td>
                        <td><%=vpaid.get(i)%></td>
                 
                                
                     </tr>
                     <% }
                     vpolicy_no.clear();
                     vcust_id.clear();
                     vpaid.clear();
                     %>
                     </form>
    </body>
</html>
