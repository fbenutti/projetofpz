<%-- 
    Document   : exibearquivo
    Created on : 10/06/2012, 12:43:24
    Author     : Paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Arquivo recebido!</h1>
        ${foto}
        <label>Tipo de conteúdo:</label>
        ${content}
        <br/>
        <label>Tamanho:</label>
        ${size}
    </body>
</html>
