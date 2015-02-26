<%-- 
    Document   : ADD_CUSTOMER
    Created on : Mar 31, 2013, 9:26:24 AM
    Author     : Amol
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    Connection conn = null;
    PreparedStatement stmt = null;
    String custid,type,ppmm,ppdd,ppyyyy,nnmm,nndd,nnyyyy,ssmm,ssdd,ssyyyy,eemm,eedd,eeyyyy,regno,value,var_count,premium,msg,frequency = "";
    String purchase_date,next_premium_date,start_date,expiry_date="";
    int count;
    public void input(HttpServletRequest request)
    {
          custid =request.getParameter("txtcustid");
          frequency=request.getParameter("txtfrequency");
          type=request.getParameter("txttype");
          premium=request.getParameter("txtpremium");
          ppmm=request.getParameter("pmm");
          ppdd=request.getParameter("pdd");
          ppyyyy=request.getParameter("pyyyy");
          nnmm=request.getParameter("nmm");
          nndd=request.getParameter("ndd");
          nnyyyy=request.getParameter("nyyyy");
          ssmm=request.getParameter("smm");
          ssdd=request.getParameter("sdd");
          ssyyyy=request.getParameter("syyyy");
          eemm=request.getParameter("emm");
          eedd=request.getParameter("edd");
          eeyyyy=request.getParameter("eyyyy"); 
          regno=request.getParameter("txtregno");
          value=request.getParameter("txtvalue");
          purchase_date=ppmm+"-"+ppdd+"-"+ppyyyy;
          next_premium_date=nnmm+"-"+nndd+"-"+nnyyyy;
          start_date=ssmm+"-"+ssdd+"-"+ssyyyy;
          expiry_date=eemm+"-"+eedd+"-"+eeyyyy;
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
             stmt=conn.prepareStatement("select count(slno),max(slno) from vehicle_insurance");
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
    
             var_count=count+"";
             var_count="POLICY"+var_count;
            
            
            
            stmt=conn.prepareStatement("insert into vehicle_insurance(policyno,cust_id,policy_type,purchase_date,next_premium_date,premium_amt,frequency,start_date,expiry_date,reg_no,purchase_value,slno)values(?,?,?,?,?,?,?,?,?,?,?,?)");
            stmt.setString(1,var_count);
            stmt.setString(2,custid);
            stmt.setString(3,type);
            stmt.setString(4,purchase_date);
            stmt.setString(5,next_premium_date);
            stmt.setString(6,premium);
            stmt.setString(7,frequency);
            stmt.setString(8,start_date);
            stmt.setString(9,expiry_date);
            stmt.setString(10,regno);
            stmt.setString(11,value);
            stmt.setInt(12,count);
            stmt.executeUpdate();
      
            stmt.clearParameters();
            stmt.close();
         
            conn.close();
            msg = "Data is inserted";

        } catch (Exception ex) {
            msg = ex.getMessage();
        }

    }

%>
<%
            if (request.getParameter("btnsubmit") != null) {
                input(request);
                connect();
                insert();
            }



%>
<%
if(request.getParameter("btnCancel")!=null)
     {
        msg=" ";
     }


%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2><a href="Co.jsp">Company Official</h2></a>
        <form name="frm" method="post" action="vehicle_insurance.jsp" >
            <table border="3" bgcolor="brown" align="center"  cellspacing="3" cellpadding="5" >
                <h2 align="center"> Enter details</h2>
                <tr>
                    <td>CUSTOMER ID</td>
                    <td><input type="text" name="txtcustid" value="" /></td>
                </tr>
                    <tr>
                    <td>Policy Type</td>
                    <td><input type="text" name="txttype" value="VehicleIn" readonly="readonly" /></td>
                </tr>
                <tr>
			<td style="font-size: 14pt" align="left" width="281"><font face="cambria">Purchase date :</font></td>
			<td style="border-color: maroon" align="left" width="360"><font face="cambria">MM : <select name="pmm">
				<option value="-1">MONTH</option>
				<option value="1">Jan</option><option value="2">Feb</option><option value="3">Mar</option><option value="4">Apr</option><option value="5">May</option><option value="6">Jun</option><option value="7">Jul</option><option value="8">Aug</option><option value="9">Sep</option><option value="10">Oct</option><option value="11">Nov</option><option value="12">Dec</option></select> 
				DD:<select name="pdd" id="dd" value=""><option value="-1">DAY</option>
			
			<script type="text/javascript">
								var i=0
								for (i=01;i<=31;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							
							</script></select>
							

				YYYY:<select name="pyyyy" id="yyyy" value=""><option value="-1">YEAR</option>
			<script type="text/javascript">
								var i=0
								for (i=1905;i<=2011;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							</script>
							
						</select>
			
					</font></tr>
                <tr>
			<td style="font-size: 14pt" align="left" width="281"><font face="cambria">Next Premium date :</font></td>
			<td style="border-color: maroon" align="left" width="360"><font face="cambria">MM : <select name="nmm">
				<option value="-1">MONTH</option>
				<option value="1">Jan</option><option value="2">Feb</option><option value="3">Mar</option><option value="4">Apr</option><option value="5">May</option><option value="6">Jun</option><option value="7">Jul</option><option value="8">Aug</option><option value="9">Sep</option><option value="10">Oct</option><option value="11">Nov</option><option value="12">Dec</option></select> 
				DD:<select name="ndd" id="dd" value=""><option value="-1">DAY</option>
			
			<script type="text/javascript">
								var i=0
								for (i=01;i<=31;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							
							</script></select>
							

				YYYY:<select name="nyyyy" id="yyyy" value=""><option value="-1">YEAR</option>
			<script type="text/javascript">
								var i=0
								for (i=1905;i<=2011;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							</script>
							
						</select>
			
					</font></tr>
               
                <tr>
                    <td>Premium amount</td>
                    <td><input type="text" name="txtpremium" value="" /></td>
                </tr>
             
                <tr>
                    <td>Frequency</td>
                    <td><input type="text" name="txtfrequency" value="yearly" readonly="readonly"/></td>
                </tr>
                <tr>
                   <td style="font-size: 14pt" align="left" width="281"><font face="cambria">Policy start date :</font></td>
			<td style="border-color: maroon" align="left" width="360"><font face="cambria">MM : <select name="smm">
				<option value="-1">MONTH</option>
				<option value="1">Jan</option><option value="2">Feb</option><option value="3">Mar</option><option value="4">Apr</option><option value="5">May</option><option value="6">Jun</option><option value="7">Jul</option><option value="8">Aug</option><option value="9">Sep</option><option value="10">Oct</option><option value="11">Nov</option><option value="12">Dec</option></select> 
				DD:<select name="sdd" id="dd" value=""><option value="-1">DAY</option>
			
			<script type="text/javascript">
								var i=0
								for (i=01;i<=31;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							
							</script></select>
							

				YYYY:<select name="syyyy" id="yyyy" value=""><option value="-1">YEAR</option>
			<script type="text/javascript">
								var i=0
								for (i=1905;i<=2011;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							</script>
							
						</select>
			
					</font></tr>
                <tr>
                   <td style="font-size: 14pt" align="left" width="281"><font face="cambria">Policy expiry date :</font></td>
			<td style="border-color: maroon" align="left" width="360"><font face="cambria">MM : <select name="emm">
				<option value="-1">MONTH</option>
				<option value="1">Jan</option><option value="2">Feb</option><option value="3">Mar</option><option value="4">Apr</option><option value="5">May</option><option value="6">Jun</option><option value="7">Jul</option><option value="8">Aug</option><option value="9">Sep</option><option value="10">Oct</option><option value="11">Nov</option><option value="12">Dec</option></select> 
				DD:<select name="edd" id="dd" value=""><option value="-1">DAY</option>
			
			<script type="text/javascript">
								var i=0
								for (i=01;i<=31;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							
							</script></select>
							

				YYYY:<select name="eyyyy" id="yyyy" value=""><option value="-1">YEAR</option>
			<script type="text/javascript">
								var i=0
								for (i=1905;i<=2011;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							</script>
							
						</select>
			
					</font></tr>
                
                  <tr>
                    <td>REG NO</td>
                    <td><input type="text" name="txtregno" value="" /></td>
                </tr>
                <tr>
                    <td>Purchase Value</td>
                    <td><input type="text" name="txtvalue" value="" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Submit" name="btnsubmit" /></td>
               
                    <td><input type="reset" name="btncancel" value="Cancel" /></td>
                </tr>
            </table>
         
        </form>
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
    </body>
</html>
