<%-- 
    Document   : view_allreplies
    Created on : 26 Apr, 2013, 5:48:55 PM
    Author     : chiru
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : display_query
    Created on : 21 Apr, 2013, 1:01:41 PM
    Author     : chiru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page  import="java.sql.*" %>
<%@ page  import="java.util.Vector"%>

<%!

     String msg="",var_loginid;
       Vector vreplyid=new Vector();
    Vector vqueryid=new Vector();
            Vector vreply=new Vector();
       Vector vrepliedby=new Vector();
       Vector vquery=new Vector();
       
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
       public void fetch_login(HttpServletRequest request)
        {
     HttpSession obj=request.getSession(false);

        var_loginid=obj.getAttribute("session_loginid").toString();
        }

       
        public void fetch()
        {
            try
            {
                stmt=conn.prepareStatement("select q.query_id,q.query,reply,replied_by from reply1 r,query1 q where q.query_id=r.query_id ");             
                ResultSet rs=stmt.executeQuery();
                while(rs.next())
                {   
                    vqueryid.add(rs.getString("query_id"));
                    vquery.add(rs.getString("query"));
                 vrepliedby.add(rs.getString("replied_by")); 
                vreply.add(rs.getString("reply"));                                                                              
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
      fetch_login(request);
%>
 <h1 bgcolor="red">WELCOME:<%=var_loginid%></h1>
 
 <h2><b> <br><a href="view_allreplies.jsp">Add Query</a></br></b></h2>

<html>
    <head><marquee bgcolor="orange">
        <h2>LIST OF All Questions</h2>   
    </marquee>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="sky blue">
      
        <form action="disscussionforum.jsp" method="POST" >
         <br>
        <table bgcolor ="white" border="1" align="center" width="50" height="50" size="500">
                <thead>
                    <tr>
                        <th size="250">Query</th>
                        <th size="250">Query_id</th>
                        <th>Replied By</th>
                        <th>Reply</th>
                         </tr>
                </thead>
                <tbody>
                    <tr>
                        <br>
                        <%
                            for(int i=0;i<vqueryid.size();i++)
                            {
                        %> 
                       
                        <td><%=vquery.get(i)%></td>
                         <td><%=vqueryid.get(i)%>
                        <td><%=vrepliedby.get(i)%></td>
                        <td><%=vreply.get(i)%></td>
                        
                                    
                                
                     </tr>
                     <% }
                         vqueryid.clear();
                         vreply.clear();
                         vrepliedby.clear();
                      vquery.clear();
                    %>                    
                </tbody>
            </table>
                    <%=msg%>
            
        </form>
    </body>
</html>
<a href="logout.jsp">LOGOUT</a>
