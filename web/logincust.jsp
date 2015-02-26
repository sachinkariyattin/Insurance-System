<%-- 
    Document   : logincust
    Created on : Apr 12, 2013, 4:36:43 PM
    Author     : Sac
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <link href="LoginRegistrationForm/css/style.css" rel="stylesheet" type="text/css" media="screen" />
  <link rel="shortcut icon" href="../favicon.ico"> 
  <link rel="stylesheet" type="text/css" href="LoginRegistrationForm/css/demo.css" />
  <link rel="stylesheet" type="text/css" href="LoginRegistrationForm/css/animate-custom.css" />
<%@ page import="java.sql.*" %>
<!DOCTYPE html>

 <%!
   
  
   
    Connection conn = null;
    PreparedStatement stmt = null;
String msg="",name,password,kuser_role,cloginid,cuser_role,cpassword,var_name,cust_id;

    void connect() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:insuranc"," "," ");
        } catch (Exception e) {
            msg = e.getMessage();
        }
    }
    public void input(HttpServletRequest request) {
        name = request.getParameter("txtname");
       password = request.getParameter("txtpwd");
         HttpSession obj=request.getSession(true);
       obj.setAttribute("session_loginid", name);
        obj.setAttribute("session_pwd", password);
       //user_role=request.getParameter("txtuserrole");
          }
     public void fetch() {
        try {
            stmt = conn.prepareStatement("select user_role,name,cust_id from login L,cust C where L.loginid=? and password=? and L.loginid=C.loginid");
            stmt.setString(1,name);
            stmt.setString(2,password);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            //cloginid=rs.getString("loginid");
           //cpassword=rs.getString("password");
            kuser_role=rs.getString("user_role");
            var_name=rs.getString("name");
            cust_id=rs.getString("cust_id");
            rs.close();
            stmt.clearParameters();
            stmt.close();
         
        }

        catch (Exception ex) {
            msg ="loginid and password does not match";
        }

    }


%>

 <%
 if(request.getParameter("btnLogin")!=null)
    {
connect();
input(request);
fetch();


    
  HttpSession obj=request.getSession(false);
  obj.setAttribute("session_user_name", var_name);
    obj.setAttribute("session_cust_id",cust_id);

        
      if("Cust".equals(kuser_role))
                 {
        response.sendRedirect("Cust.jsp");
       }  
             
      
        }
else
      {
          msg="User name and password combination does not match";
}
 kuser_role="";
 

 
 %>
 
 
 <% if(request.getParameter("btnCancel")!=null)
         {
     msg=" ";
     }
%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>Customer Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
      
    </head>
    <B> <h1 align="left"><a href="home.jsp"><font color="blue">HOME</font></a></h2></B>
    <body>
        <div class="container">
            <!-- Codrops top bar -->
            <div class="codrops-top">
              <div class="clr"></div>
            </div><!--/ Codrops top bar -->
            <header>
                <h1>Insurance System With Tracking Manager</h1>
				<nav class="codrops-demos"></nav>
            </header>
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="logincust.jsp" autocomplete="on"> 
                                <h1>Customer Log in</h1> 
                                <p> 
                                    <label for="username" class="uname" data-icon="u" > Your email </label>
                                    <input id="txtname" name="txtname" required type="text" placeholder="mymail@mail.com"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Your password </label>
                                    <input id="txtpwd" name="txtpwd" required type="password" placeholder="password" /> 
                                </p>
                               
                                <p class="login button"> 
                                    <input type="submit" value="Login" name="btnLogin" /> 
								</p>
                                <p class="change_link">&nbsp;</p>
                            </form>
                            
                            <script>
            <%        
       if(request.getParameter("btnLogin")!=null)
                     {
             %>               
         alert("<%=msg%>");
         <%
                 }
 %>
         </script>
                        </div>

             			
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>

