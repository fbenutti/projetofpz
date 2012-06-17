<%-- 
    Document   : EncerraSessao
    Created on : 16/06/2012, 12:10:18
    Author     : Wellington
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("usuario");
    response.sendRedirect("index.jsp");
%>
