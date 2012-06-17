<%-- 
    Document   : EncerraSessao
    Created on : 16/06/2012, 12:10:18
    Author     : Wellington
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
        session.removeAttribute("usuario");
        response.sendRedirect("index.jsp");
        %>
    </body>
</html>
