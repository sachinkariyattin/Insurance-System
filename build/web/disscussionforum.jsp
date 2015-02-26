
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

     String msg="",var_loginid,var_name;
       Vector vqueryid=new Vector();
    
       Vector vquery=new Vector();
       Vector vpostedby=new Vector();
       Vector vreply_id=new Vector();
       Vector vquery1=new Vector();
       Vector vpostedby1=new Vector();
       Vector vposteddate=new Vector();
       Vector vposteddate1=new Vector();
       Vector vtotalreplies=new Vector();
       Vector vqueryid1=new Vector(); 
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
        var_name=obj.getAttribute("session_user_name").toString();
        }

       
        public void fetch()
        {
            try
            {
                stmt=conn.prepareStatement("select q.query_id,q.query,q.posted_by,q.posted_date from query q where not exists (select q1.query_id,q1.query,q1.posted_by from query q1,reply r where q.query_id=q1.query_id and q1.query_id=r.query_id)");             
                ResultSet rs=stmt.executeQuery();
                while(rs.next())
                {
                    vqueryid.add(rs.getInt("query_id"));
                    vquery.add(rs.getString("query"));
                    vpostedby.add(rs.getString("posted_by"));
                    vposteddate.add(rs.getString("posted_date"));
//                    vtotalreplies.add(rs.getString("totalreplies"));                           
                }    
                rs.close();
                stmt.close();

                                                                                  
            }
            catch(Exception ex)
            {
                ex.getMessage();
            }        
            
        }
public void fetch1()
               {
     try
            {
                stmt=conn.prepareStatement("select q.query_id,q.query,q.posted_by,q.posted_date,count(r.query_id) as totalreplies from query q,reply r where q.query_id=r.query_id group by q.query_id,q.query,q.posted_by,q.posted_date");             
                ResultSet rs1=stmt.executeQuery();
                while(rs1.next())
                {
                   vqueryid1.add(rs1.getInt("query_id"));
                    vquery1.add(rs1.getString("query"));
                    vpostedby1.add(rs1.getString("posted_by"));
                    vposteddate1.add(rs1.getString("posted_date"));
                    vtotalreplies.add(rs1.getString("totalreplies"));                                       
                }    
                rs1.close();
                stmt.close();
                 conn.close();                                                                
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
    fetch1();
      fetch_login(request);
%>

 
 <h3><b> WELCOME:<%=var_name%> <a href="logout.jsp">LOGOUT</a></br></b></h3>

<html>
    <head>
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
        <title>Discussion Forum</title>
    </head>
    <body>
  
 <div id="wrapper">
	<div id="header-wrapper">
		<div id="header">
			<div id="logo">
				<h1><span> INSURANCE SYSTEM WITH </span></h1>
				<h1><span>TRACKING MANAGER</span>		  </h1>
		  </div>
		</div>
	</div>
     
   
      <div class="post">
			<div class="entry">
				<ul>
					
					<li>
						<h2>Quick Links</h2>
						<ul>
							<li><a href="add_query.jsp">Click here </a>to Post Query</li>
                                            
						</ul>
					</li>
				
					
				</ul>
			</div>
		</div>
        <form action="disscussionforum.jsp" method="POST" >
     <br>
                   <h2 align="center">Discussion Forum</h2>
          <table bgcolor ="white" border="1" align="center" width="50" height="50" size="500">
                <thead>
                    <tr>
                        <th size="250">Query_ID</th>
                        <th size="250">Query</th>
                        <th>posted By</th>
                        <th>Posted Date</th>
                        <th>Total Replies</th>
                         </tr>l
                </thead>
                <tbody>
                    <tr>
                        <br>
                        <%
                            for(int i=0;i<vqueryid1.size();i++)
                            {
                        %> 
      <td> <a href="reply.jsp?param=<%=vqueryid1.get(i)%>"><%=vqueryid1.get(i)%></a></td>
       
      <td><input type="text" name="query_id" value="<%=vquery1.get(i)%>"/></td> </td>
      <td><input type="text" name="postedby" value="<%=vpostedby1.get(i)%>" /></td>
      <td><input type="text" name="posteddate" value="<%=vposteddate1.get(i)%>" /></td>
         <td><input type="text" name="totalreplies" value="<%=vtotalreplies.get(i)%>" /></td>
                   
                                
                     </tr>
                     <% }
                      vqueryid1.clear();
                         vquery1.clear();
                         vpostedby1.clear();
                         vposteddate1.clear();
                        vtotalreplies.clear();
                    %> 
       
                    

                
            
           <br>
         <%
         if(vqueryid.size()!=0)
                         {
             %>
         
        <%--<table bgcolor ="white" border="1" align="center" width="50" height="50" size="500">
                <thead>
                    <tr>
                        <th size="250">Query_ID</th>
                        <th size="250">Query</th>
                        <th>Posted By</th>
                      
                         </tr>
                </thead>
                <tbody>--%>
                    <tr>
                       
                        <%
                            for(int i=0;i<vqueryid.size();i++)
                            {
                        %> 
      <td> <a href="reply.jsp?param=<%=vqueryid.get(i)%>"><%=vqueryid.get(i)%></a></td>
       
      <td><input type="text" name="query_id" value="<%=vquery.get(i)%>"/></td> </td>
      <td><input type="text" name="postedby" value="<%=vpostedby.get(i)%>" /></td>
       <td><input type="text" name="posteddate" value="<%=vposteddate.get(i)%>" /></td>
      <td><input type="text" name="totalreplies" value="0" readonly="readonly"/></td>
                   
                                
                     </tr>
                     <% }
                      vqueryid.clear();
                         vquery.clear();
                         vpostedby.clear();
                         vposteddate.clear();
                    %> 
       
                    

                </tbody>
            </table>
       <%}
      %>
          
        </form>
    </body>
</html>



