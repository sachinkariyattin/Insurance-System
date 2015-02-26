<%-- 
    Document   : choose_nominee
    Created on : Apr 28, 2013, 1:51:40 PM
    Author     : Sac
--%>

<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%!
Connection conn = null;
 PreparedStatement stmt = null;
String nominee_id,var_policy_no,msg="";

public void input(HttpServletRequest request)
{
    HttpSession obj=request.getSession(false);
    var_policy_no=obj.getAttribute("session_policy_no").toString();
    nominee_id=request.getParameter("param");
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
  public void insert_nominee()
      
      {
      try
            {
         stmt=conn.prepareStatement("update life_insurance set nominee_id=? where policy_no=?");
            stmt.setString(1,nominee_id);
            stmt.setString(2,var_policy_no);
           
            stmt.executeUpdate();
      
            stmt.clearParameters();
            stmt.close();
            
            conn.close();
            msg="ploicy generated";
            }
   catch(Exception ex)
            {
                ex.getMessage();
         }                  
    }        
%>

<%
connect();
input(request);
insert_nominee();
response.sendRedirect("generated_life_insurance_details.jsp");
%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <h3></h3>
    </body>
    <script>
                      
         alert("<%=msg%>");
        
         </script>
         
</html>
