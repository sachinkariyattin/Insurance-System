<%-- 
    Document   : logout
    Created on : Apr 12, 2013, 6:01:55 PM
    Author     : Sac
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
    </head>
      <body>
        
            
    </body>
</html>

<%   HttpSession obj=request.getSession(false);
        obj.invalidate();
        response.sendRedirect("home.jsp"); 
%>