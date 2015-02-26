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
       Vector vpolicyno=new Vector();
       Vector vstart=new Vector();
       Vector vexpiry=new Vector();
       Vector vpremium=new Vector();
       Vector vpurchasedate=new Vector();
       Vector vpremiumstart=new Vector();
       Vector vregno=new Vector();
       Vector vvalue=new Vector();
       Vector vfrequency = new Vector();
       Vector vtype=new Vector();
       
       
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
                stmt=conn.prepareStatement("select policyno,cust_id,policy_type,purchase_date,next_premium_date,premium_amt,frequency,start_date,expiry_date,reg_no,purchase_value from vehicle_insurance");             
                ResultSet rs=stmt.executeQuery();
                while(rs.next())
                {
                    vpolicyno.add(rs.getString("policyno"));
                    vcust_id.add(rs.getString("cust_id"));
                    vtype.add(rs.getString("policy_type"));
                    vpurchasedate.add(rs.getString("purchase_date"));
                    vpremiumstart.add(rs.getString("next_premium_date"));
                    vpremium.add(rs.getString("premium_amt"));
                    vfrequency.add(rs.getString("frequency"));
                    vstart.add(rs.getString("start_date"));
                    vexpiry.add(rs.getString("expiry_date"));
                    vregno.add(rs.getString("reg_no"));
                    vvalue.add(rs.getString("purchase_value"));
                  
                                                    
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
    <head><marquee bgcolor="sky blue">
        <h2>POLICY INFORMATION</h2>   
    </marquee>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="grey">
      
    <form action="view_official.jsp">
         <br>
        <table bgcolor ="white" border="1" align="center" width="50" height="50">
                <thead>
                    <tr>
                        <th>POLICY NO</th>
                        <th>CUSTOMER</th>
                        <th>POLICY TYPE</th>
                        <th>PURCHASE DATE</th>
                        <th>NEXT PREMIUM DATE</th>
                        <th>POLICY START DATE</th>
                        <th>POLICY EXPIRY DATE</th>
                        <th>FREQUENCY</th>
                        <th>REG NO</th>
                        <th>PURCHASE VALUE</th>
                       
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <br>
                        <%
                            for(int i=0;i<vcust_id.size();i++)
                            {
                        %> 
                        <td><%=vpolicyno.get(i)%></td>
                        <td><%=vcust_id.get(i)%></td>
                        <td><%=vtype.get(i)%></td>
                        <td><%=vpurchasedate.get(i)%></td>
                        <td><%=vpremiumstart.get(i)%></td>
                        <td><%=vstart.get(i)%></td>
                        <td><%=vexpiry.get(i)%></td>
                        <td><%=vfrequency.get(i)%></td>
                        <td><%=vregno.get(i)%></td>
                        <td><%=vvalue.get(i)%></td>
                       
                     </tr>
                     <% }
                         vcust_id.clear();
                         vexpiry.clear();
                         vstart.clear();
                         vfrequency.clear();
                         vpremiumstart.clear();
                         vstart.clear();
                         vtype.clear();
                         vregno.clear();
                         vvalue.clear();
                         vpolicyno.clear();
                    %>                    
                </tbody>
            </table>
                   
            
        </form>
    </body>
</html>
