<%-- 
    Document   : approve_policies
    Created on : Apr 30, 2013, 11:30:09 PM
    Author     : Sac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Vector"%>

<!DOCTYPE html>
<%!
      String msg="";
      String[] key;
       Vector vapproved=new Vector();
       Vector vpolicy_no=new Vector();
       Vector vtype=new Vector();
       Vector vpurchase_date=new Vector();
       Vector vnext_premium_date=new Vector();
       Vector vstart_date=new Vector();
       Vector vexpiry_date=new Vector();
       Vector vmembers=new Vector();
       Vector vfrequency=new Vector();
       Vector vpremium=new Vector();
       Vector vbuilding_cost=new Vector();
       Vector velectrical_cost=new Vector();
       Vector vjewelery=new Vector();
       Vector vcust_id=new Vector();
       Vector vname=new Vector();
       Vector vcity=new Vector();
       
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
       
       public void fetch_ckb(HttpServletRequest request)
       {
         key=request.getParameterValues("ckb");
       }

      
       public void approve()
        {

        try
         {
        for(int i=0;i<key.length;i++)
            {
        stmt=conn.prepareStatement("update policy set approved='YES' where policy_no=?");
             stmt.setString(1, key[i]);  
             stmt.executeUpdate();
             stmt.clearParameters();
             stmt.close();
            }
        msg="updated..";
         }
        catch(Exception ex)
          {
            msg=ex.getMessage();
          }
        }
        
       
       public void fetch()
        {
            try
            {
                         vcust_id.clear();
                         vname.clear();
                         vcity.clear();
                         vstart_date.clear();
                         vpurchase_date.clear();
                         vexpiry_date.clear();
                         vpremium.clear();
                         vmembers.clear();
                         vapproved.clear();
                         vfrequency.clear();
                         vpolicy_no.clear();
                         vtype.clear();
                         vbuilding_cost.clear();
                         velectrical_cost.clear();
                         vjewelery.clear();
                         vnext_premium_date.clear();
                
                stmt=conn.prepareStatement("select A.policy_no,count(D.policy_no) as members,A.cust_id,type,purchase_date,premium_amt,frequency,policy_start_date,policy_exp_date,next_premium_date,approved,buildingcost,electricalcost,jewelery,C.name,C.city from policy A,house_insurance B,cust C,house_members D where A.approved='NO' and C.cust_id=A.cust_id and A.policy_no=B.policy_no and B.policy_no=D.policy_no group by A.policy_no,A.cust_id,type,purchase_date,premium_amt,frequency,policy_start_date,policy_exp_date,next_premium_date,approved,buildingcost,electricalcost,jewelery,C.name,C.city ");             
                ResultSet rs=stmt.executeQuery();
                while(rs.next())
                {
                    vpolicy_no.add(rs.getString("policy_no"));
                    vmembers.add(rs.getString("members"));  
                    vcust_id.add(rs.getString("cust_id"));
                    vtype.add(rs.getString("type"));
                    vpurchase_date.add(rs.getString("purchase_date"));
                    vpremium.add(rs.getString("premium_amt"));
                    vfrequency.add(rs.getString("frequency"));
                    vstart_date.add(rs.getString("policy_start_date"));
                    vexpiry_date.add(rs.getString("policy_exp_date"));
                    vnext_premium_date.add(rs.getString("next_premium_date"));
                    vapproved.add(rs.getString("approved"));
                    vbuilding_cost.add(rs.getString("buildingcost"));
                    velectrical_cost.add(rs.getString("electricalcost"));
                    vjewelery.add(rs.getString("jewelery"));
                    vname.add(rs.getString("name"));
                    vcity.add(rs.getString("city")); 
                                                                                        
                }    
                rs.close();
                stmt.close();
                
              conn.close();
                                                                                  
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
   if(request.getParameter("btnsubmit")!=null)
     {
       connect();
       fetch_ckb(request);
       approve();
       fetch();     
     }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css" />
<link href="Template/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Template/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Template/jquery.slidertron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.poptrox-1.0.js"></script>
        <title>Approve House Insurance Policies</title>
    </head>
     
     <div id="wrapper">
	<div id="header-wrapper">
		<div id="header">
			<div id="logo">
				<h1><span> INSURANCE SYSTEM WITH </span></h1>
				<h1><span>TRACKING MANAGER</span>		  </h1>
		  </div>
		</div>
	</div>
        <div id="menu-wrapper">
		<ul id="menu">
                    <li class="current_page_item"><a href="Admin.jsp"><span> Admin Home  </span></a></li>
        <li> <span>   My Account  </span>

			  <ul>
                              
					 <li><a href="logout.jsp"> logout </a></li>
					 <li class="last"></li>
			  </ul>
            		
      <li><a href="about.jsp" target="_blank"><span>About</span></a></li>
			
		</ul>
		<script type="text/javascript">
			$('#menu').dropotron();
		</script>
	</div>
    <div class="post">
			<div class="entry">
				<ul>
					
					<li>
						<h3>Quick Links</h3>
						<ul>
							<li> <a href="approved_house_policies.jsp">Click here </a>to view approved House Insurance policies</li>
                                                        <li><a href="select_policy_type.jsp">Click here </a>to choose a different policy type</li>
                                            
						</ul>
					</li>
				
					
				</ul>
			</div>
		</div>
         	</li>
			
        
		</div>
            
        
    <body>
       
        
        <h1 align="center">Generated House Insurance Policies</h1>
        <h3 align="center">Select policies to change approval status to YES</h3>
        <body bgcolor="grey">
      
            <form action="approve_house_policies.jsp" method="POST" >
         <br>
           
         <%
         if(vpolicy_no.size()>0)
         {
             %>
        <table bgcolor ="white" border="1" align="center" width="50" height="50">
                <thead>
                    <tr>
                        <th>SELECT</th>
                        <th>POLICY NO</th>
                        <th>APPROVED</th>
                        <th>CUSTOMER ID</th>
                        <th>NAME</th>
                        <th>CITY</th>
                        <th>NO OF MEMBERS IN HOUSE</th>
                        <th>POLICY TYPE</th>
                        <th>PURCHASE DATE</th>
                        <th>START DATE</th>
                        <th>EXPIRY DATE</th>
                        <th>PREMIUM AMOUNT</th>
                        <th>FREQUENCY</th>
                        <th>NEXT PREMIUM DATE</th>
                        <th>BUILDING COST</th>
                        <th>ELECTRICAL COST</th>
                        <th>JEWELERY</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <br>
                        <%
                            for(int i=0;i<vpolicy_no.size();i++)
                            {
                        %> 
                       <td><input type="checkbox" name="ckb" value="<%=vpolicy_no.get(i)%>"/></td>
                        <td><%=vpolicy_no.get(i)%></td>
                        <td><%=vapproved.get(i)%></td>
                        <td><%=vcust_id.get(i)%></td>
                        <td><%=vname.get(i)%></td>
                        <td><%=vcity.get(i)%></td>
                        <td><%=vmembers.get(i)%></td>
                        <td><%=vtype.get(i)%></td>
                        <td><%=vpurchase_date.get(i)%></td>
                        <td><%=vstart_date.get(i)%></td>
                        <td><%=vexpiry_date.get(i)%></td>
                        <td><%=vpremium.get(i)%></td>
                        <td><%=vfrequency.get(i)%></td>
                        <td><%=vnext_premium_date.get(i)%></td>
                        <td><%=vbuilding_cost.get(i)%></td>
                        <td><%=velectrical_cost.get(i)%></td>
                         <td><%=vjewelery.get(i)%></td>
                                
                     </tr>
                     <% 
                            } 
                     %>                    
                </tbody>
               
               
            </table>
            <h1 align="center"><input type="submit" value="submit" name="btnsubmit"  /></h1>
            <% 
                            } 
                     %>  
                     <%
                     if(vpolicy_no.size()==0)
                      {
                       %>
                 <h5 align="center">NO NEW GENERATED POLICIES</h5>
                 
                 <% 
                            } 
                     %>  
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
