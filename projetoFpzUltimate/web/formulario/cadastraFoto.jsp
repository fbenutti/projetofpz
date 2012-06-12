<%-- 
    Document   : cadastraFoto
    Created on : 10/06/2012, 10:45:15
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
    <div id="cadastroFoto" >
        <form id="cadastroPalestranteFoto" name="cadastro" action="../CadastraFoto" method="post" enctype="multipart/form-data">
            <p>ID:<input type="text" value=" ${id}" name="id"/></p>
            <p>Nome:<input type="text" value=" ${nome}" name="nome" /></p>
            <p>Objeto: ${obj}</p>
            <p><label>Foto: <input type="file" name="file"></label></p>
            <p><label><input id="EnviarFoto" class="btn btn-primary" type="submit" value="Upload"/></label></p>
        </form>
    </div>
    </body>
</html>
