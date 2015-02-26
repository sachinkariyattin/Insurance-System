<%-- 
    Document   : view_profile
    Created on : Apr 12, 2013, 5:29:36 PM
    Author     : Sac
--%>

<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
 Connection conn = null;
    PreparedStatement stmt = null;
String var_oldpwd="",msg="",newpass="",password="",loginid="",confpass="",dsgn="",branch="",var_loginid="",oldpass="";
    void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }
    

public void fetch_login(HttpServletRequest request)
        {
     HttpSession obj=request.getSession(false);

        var_loginid=obj.getAttribute("session_loginid").toString();
    var_oldpwd=obj.getAttribute("session_pwd").toString();
    
    
}

public void fetch(HttpServletRequest request)
               {
    oldpass=request.getParameter("password");
     newpass=request.getParameter("newpass");
    confpass=request.getParameter("confpass");
}
public void search()
        {
    try
    {
   stmt=conn.prepareStatement("select loginid,password from login where loginid=?");
       stmt.setString(1, var_loginid);
       ResultSet rs=stmt.executeQuery();
      rs.next();
     loginid=rs.getString("loginid");
   password=rs.getString("password");
  //   dsgn=rs.getString("designation");
    // emailid=rs.getString("emailid");
    // branch=rs.getString("branch");
     rs.close();
     stmt.clearParameters();
     stmt.close();
     
    }
    catch(Exception e)
        {
         msg="NO DETAILS FOUND";
        }
    
}




public  void update()
        {
    try
        {
        if(password.equals(oldpass))
        {
        if(newpass.equals(confpass))
        {
     
       stmt=conn.prepareStatement("update login set password=? where loginid=?");

      stmt.setString(1,confpass);
      stmt.setString(2,var_loginid);
      stmt.executeUpdate();
      stmt.clearParameters();
      stmt.close();
      msg="updated..";

    
    } else
        msg="new password and confirm password does not match";
               }
   
   else
    {
       msg="Entered old password is incorrect";
    }
    }
catch(Exception e)
        {
msg=e.getMessage();
}
        } 

  
%>

<%


    fetch(request);
       fetch_login(request); connect();
    search();
   if(request.getParameter("change")!=null)
          {
       update();
   }
    
    



    
%>
 
 <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="LoginRegistrationForm/css/style.css" rel="stylesheet" type="text/css" media="screen" />
  <link rel="shortcut icon" href="../favicon.ico"> 
  <link rel="stylesheet" type="text/css" href="LoginRegistrationForm/css/demo.css" />
  <link rel="stylesheet" type="text/css" href="LoginRegistrationForm/css/animate-custom.css" />
   <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
          <meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet" type="text/css" />
<link href="Template/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="Template/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Template/jquery.slidertron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="Template/jquery.poptrox-1.0.js"></script>
        <title>Change Password</title>
        
    </head>
    <script>    
         <%        
       if(request.getParameter("change")!=null)
                     {
             %>               
       
             alert("<%=msg%>");
             
         <%
                 }
          %>
    </script>
    <script>
        function valid(frm)
        {
            if(frm.password.value.trim()=="")
                {
                    alert("ENTER THE OLD PASSWORD");
                    frm.password.value.focus();
                     
                    return false;
                }
                if(frm.newpass.value.trim()=="")
                {
                    alert("ENTER THE NEW PASSWORD");
                    frm.newpass.value.focus();
                     
                    return false;
                }
                 if(frm.confpass.value.trim()=="")
                {
                    alert("ENTER THE CONFIRM PASSWORD");
                    frm.confpass.value.focus();
                     
                    return false;
                }
                
                if(frm.newpass.value.length<6|frm.newpass.value.length>9)
                    {
                        alert("ENter Password Between 6-9 Characters");
                        frm.newpass.value.focus();
                        return false;
                    }
        }
    </script>
    <body>
        
    <form name="frm" action="change_password.jsp">
        <div id="container_demo" >
                
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="login.jsp" autocomplete="on"> 
                                <h1>Change Password</h1> 
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p" > Old Password </label>
                                    <input id="password" name="password" required type="password" placeholder="Enter old password"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> New Password </label>
                                    <input id="newpass" name="newpass" required type="password" placeholder="Enter new password" /> 
                                </p>
                                 <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Confirm Password</label>
                                    <input id="txtpwd" name="confpass" required type="password" placeholder="Confirm new password" /> 
                                </p>
                                
                                <p class="login button"> 
                                    <input type="submit" value="update" name="change"  onfocus="return valid(frm)"/> 
								</p>
                                <p class="change_link">&nbsp;</p>
                                
                                   </div>

                       
						
                    </div>
                </div>  
                            </form>
          
           

</form>

</body>

  
         
        
</html>


