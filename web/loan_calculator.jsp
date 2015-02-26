<%-- 
    Document   : loan_calculator
    Created on : May 10, 2013, 10:56:29 AM
    Author     : Amol
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>LOAN CALCULATOR</title>
    
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body{
background-color:white;
font-size:10pt;
color:black;
font-family:sans-serif;
}
</style>
<script language="javascript">
var amount, apr, n, payment, npy, tablebuilt=false;

function calculate(){
var d=document.f;
amount=d.amount.value;
apr=d.apr.value;
n=d.n.value;
npy=d.npy.value;
if( (amount!='') && (n!='') && (apr!='') && (npy!='') ){
tmp=Math.pow((1+(apr/100/npy)), (n*npy));
payment=(amount*tmp*(apr/100/npy))/(tmp-1);
if((!isNaN(payment))&&(payment!=Number.POSITIVE_INFINITY)&&(payment!=Number.NEGATIVE_INFINITY)){
d.payment.value=round(payment);
d.totpaid.value=round(payment*n*npy);
d.intpaid.value=round((payment*n*npy)-amount);
}else alert('Error:\nOne or more fields contain data\nwhich cannot be used in the\ncalculation.');
}else alert('Error:\nYou did not provide enough data.');
}

function round(val){
tmp=Math.round(val*100)/100+'';
if(tmp.indexOf('.')==-1)tmp+='.00';
else if(tmp.length-tmp.indexOf('.')==2)tmp+='0';
return tmp;
}

function resetall(){
var d=document.f;
d.amount.value='';
d.apr.value='';
d.n.value='';
d.npy.value=12;
d.payment.value='';
d.totpaid.value='';
d.intpaid.value='';
d.amount.focus();
}

function buildtable(){
tablebuilt=true;
txt='<html><head><title>Payment Schedule</title></head><body bgcolor="#00436e"><center><form>';
txt+='<input type="button" value="Close" onClick="self.close()"><br><br>';
txt+='<table bgcolor="white" border="1" cellpadding="4">';
txt+='<tr><td align="center">Payment<br>Number</td><td align="center">Payment<br>Amount</td><td align="center">Interest</td><td align="center">Principle</td><td align="center">Balance</td></tr>';
amount=eval(amount);
for(i=1;i<=n*npy;i++){
tbldata='<td bgcolor="'+((i%2!=0) ? 'skyblue' : 'white')+'" align="right">';
interest=amount*apr/npy/100;
amount+=interest;
principle=payment-interest;
amount-=payment;
txt+='<tr>'+tbldata+i+':</td>'+tbldata+round(payment)+'</td>'+tbldata+round(interest)+'</td>'+tbldata+round(principle)+'</td>'+tbldata+round(amount)+'</td></tr>';
}
txt+='</table><br><br><input type="button" value="Close" onClick="self.close()"></center></form></body></html>';
var psch=window.open('', 'viewsch' ,'top=0,left=0,toolbar=no,scrollbars=yes,resizable=yes,width=500,height=450,menubar=no,status=no');
psch.document.write(txt);
}

window.onload=function(){
document.f.amount.focus();
}
</script>


    </head>
    <form name="f" action="loan_calculator.jsp" method="POST">
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
                    <li class="current_page_item"><a href="Cust.jsp"><span> Customer Home  </span></a></li>
        <li> <span>   My Account  </span>

			  <ul>
                           <li><a href="view_cust_profile.jsp"> View Profile </a></li>
                           <li><a href="change_password.jsp"> Change Password </a></li>
			  <li><a href="logout.jsp"> logout </a></li>
                                         
					 <li class="last"></li>
			  </ul>
           
        <li><a href="disscussionforum.jsp" target="_blank"> <span>Discussion Forum </span></a></li>
         <li><a href="#"><span>About</span></a></li>
			
		</ul>
		<script type="text/javascript">
			$('#menu').dropotron();
		</script>
        </div></div>
    <body>
        <br>
        <h2 align="center">LOAN CALCULATOR</h2><br>
<form name="f">
<table align="center" border="1" cellpadding="4"><tr><td><table border="0">
<tr><td colspan="2" align="center"><b>Enter Loan Data Here</b></td></tr>
<tr><td width="400">Loan Amount (in Rupees):</td><td><input type="text" name="amount" size="10" required></td></tr>
<tr><td>Annual Percentage Rate (APR) %:</td><td><input type="text" name="apr" size="5" required><b> 
	%</b></td></tr>

<tr><td>Repayment period in years:</td><td><input type="text" name="n" size="5" required></td></tr>
<tr><td>Amount of payments per year:</td><td><input type="text" name="npy" size="5" value="12" required></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td align="center" colspan="2"><input type="button" value="Calculate" onClick="calculate()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="Reset" onClick="resetall()"></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><td>Amount per payment:</td><td><b>Rs.</b> <input type="text" size="10" name="payment"></td></tr>
<tr><td>Total paid over the life of the loan:</td><td><b>Rs.</b> <input type="text" size="10" name="totpaid"></td></tr>
<tr><td>Total interest paid over the life of the loan:</td><td><b>Rs.</b> <input type="text" size="10" name="intpaid"></td></tr>

<tr><td colspan="2">&nbsp;</td></tr>
<tr><td colspan="2" align="center"><input type="button" value="Build Payment Schedule" onClick="buildtable()"><br><br><small>
	(Please give the script time to work, especially if the loan is for a long 
	time.)</small></td></tr>
</table></td></tr></table>
</form>

    </body>
</html>
