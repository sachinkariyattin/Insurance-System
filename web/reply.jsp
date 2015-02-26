<%-- 
    Document   : reply
    Created on : 07 May, 2013, 11:40:36 AM
    Author     : sac
--%>
<%@ page  import="java.sql.*" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="java.util.Vector"%>
<!DOCTYPE html>


<%!
String total_replies; 
Connection conn = null;
    PreparedStatement stmt = null;
    int count;
    String password,repliedby,reply,msg = "";
  String query_id;
  String var_loginid,var_name;
String var_query2;
String temp,query,queryid1;;
String posted_by;
int name;
 Vector vquery=new Vector();
       Vector vrepliedby=new Vector();
      // Vector vtotalreplies=new Vector();
       Vector vreply=new Vector();

    public void input(HttpServletRequest request) {
        name=Integer.parseInt(request.getParameter("param"));
        //query_id = request.getParameter("txtqueryid");
      //  repliedby = request.getParameter("txtrepliedby");
       // posted_by=request.getParameter("posted_by");
       // password= request.getParameter("txtpassword");
        
        
     //     HttpSession obj=request.getSession(true);
      //  obj.setAttribute("session_queryid", name);
        //obj.setAttribute("session_query", query);
        //obj.setAttribute("session_reply",reply);
    }

    public void input_reply(HttpServletRequest request)
            {
        reply = request.getParameter("txtreply");
       
    }
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
   
    
     
       
    public  void auto_gen()
            {
      
    try{
    
    stmt=conn.prepareStatement("select count(reply_id),max(reply_id) from reply");
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
    
    
    public void viewdetails()
               {
     try
            {
                stmt=conn.prepareStatement("select r.replied_by,r.reply from reply r,query q where q.query_id=r.query_id and q.query_id=?");             
                stmt.setInt(1,name);
                ResultSet rs1=stmt.executeQuery();
                while(rs1.next())
                {
                   vrepliedby.add(rs1.getString("replied_by"));
                    vreply.add(rs1.getString("reply"));
                 //   vpostedby1.add(rs1.getString("posted_by"));
                //    vtotalreplies.add(rs1.getString("totalreplies"));                                       
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
    
   public void fetch1()
                       {
    try{
            stmt = conn.prepareStatement("select query,query_id,posted_by from query where query_id=?");
            stmt.setInt(1,name);
                    //stmt.setString(2,password);
            ResultSet rs = stmt.executeQuery();
            rs.next();
           // loginid=rs.getString("loginid");
            //password=rs.getString("password");
          query=rs.getString("query");
          queryid1=rs.getString("query_id");
          posted_by=rs.getString("posted_by");
            rs.close();
         stmt.clearParameters();
            stmt.close();
        
    }
    catch(Exception e)
                       {
        msg=e.getMessage();
    }
       }
    
    
            
    public void insert() {
        try {
           
             stmt = conn.prepareStatement("insert into reply(reply_id,replied_by,reply,query_id)values(?,?,?,?)");
             stmt.setInt(1, count);
            stmt.setString(2, var_loginid);
            stmt.setString(3, reply);
              stmt.setInt(4, name);
            stmt.executeUpdate();
        stmt.clearParameters();
        
        stmt.close();
            
        conn.close();
       msg = "Reply Posted"; 
        } 
        
        
        catch (Exception ex) {
            msg = ex.getMessage();
        }

    }
    
    
  
%>



<%
  
        //     response.sendRedirect("xx.jsp");
                   
               if (request.getParameter("btnsubmit") != null) 
               {
                                input_reply(request);
                                 connect(); 
                                 insert();
                                 
                                 connect();
                                 auto_gen(); 
        
                                 fetch1();
                             viewdetails();
                             fetch_login(request);
                                 //viewdetails();
                                 // response.sendRedirect("reply.jsp");
                                  
                } 
                             else{
                     input(request);  
fetch_login(request);
        connect();
        auto_gen(); 
        
        fetch1();
          viewdetails();
                             }
      
        %>

 <% if(request.getParameter("btnCancel")!=null)
         {
       //query="";
       //query_id=""; 
     msg=" ";
     }
%>

 

 <html>
   <h3><b> WELCOME:<%=var_name%> <a href="logout.jsp">LOGOUT</a></br></b></h3>
    <head>
        <meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Customer Home</title>
<link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css" />
<link href="Template/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Template/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Template/jquery.slidertron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.poptrox-1.0.js"></script>
     
       
            
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reply</title>
    </head>
    <script>
        function valid(frmpro)
        {
            if(frmpro.txtreply.value.trim()=="")
                {
                    alert("ENTER Query HOUSE NAME");
                    frmpro.txtreply.value.focus();
                    return false;
                }
                
                if(frmpro.txtrepliedby.value.trim()="")
                {
                    alert("ENTER Posted By ");
                    frmpro.txtrepliedby.focus();
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
							<li> <a href="disscussionforum.jsp"> Forum Home</a></li>
                                            
						</ul>
					</li>
				
					
				</ul>
			</div>
		</div>
    <body>
        <form name="frmpro" action="reply.jsp" method="post">
            <h3 align="center">QUERY DETAILS</h3>
            <table border="5" align="center" cellspacing="10" cellpadding="10">
              <tr> 
                  <th>Query_Id</th>
                   <th>Query</th>
                  <th>Posted_By</th>
                     
              </tr>
              
               <tr> 
                   <td><%=queryid1%></td>
                   <td><%=query%></td>
                   <td> <%=posted_by%></td> 
</tr>
          </table>
            <table bgcolor ="white" border="1" align="center" width="50" height="50" cellspacing="10" cellpadding="10" size="500">
                <thead>
                    <tr><h1 align="center">Previous Replies To This Query</h1>
                        <th size="250">Replied_By</th>
                        <th size="250">Reply</th>
                                              </tr>
                </thead>
                <tbody>
                    <tr>
                        <br>
                        <%
                            for(int i=0;i<vrepliedby.size();i++)
                            {
                        %> 
   
       
      <td><%=vrepliedby.get(i)%></td> </td>
      <td><%=vreply.get(i)%></td>
         
                   
                                
                     </tr>
                     <% }
                      vrepliedby.clear();
                         vreply.clear();
                 
                     %> </table>
<%--
<tr><td>Query</td>
                            <td><input type="text" name="txtquery" value="<%=query%>" readonly="readonly" /></td>
</tr>--%>
            <table align="center"><tr><h1 align="center">Post A Reply</h1>
                        <td>Reply(Answer)</td>
                        <td><textarea name="txtreply" rows="4" cols="20" required="required">
                            </textarea></td></tr></table>
 
<%---<tr><td>Replied By</td>
        <td><input type="text" name="txtrepliedby" value="<%=var_loginid%>" /></td>
</tr>-----%>
<table align="center">
                                       <tr>
                        <td><input type="submit" value="Submit" name="btnsubmit" onfocus="return valid(frmpro)"/></td>
                        <td><input type="submit" value="Cancel" name="btnCancel"/></td>
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


