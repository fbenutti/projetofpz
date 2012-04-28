<%-- 
    Document   : cadastroPalestrante
    Created on : 28/04/2012, 17:08:25
    Author     : Paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="jQueryUI/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-modal.js"></script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h3>Cadastro de Palestrante</h3>
        <br />
        <div id="cadastroTex">
            <form id="cadastroPalestranteDados" name="cadastro" action="" method="post">
                <p><label>Nome: <input type="text" name="nome"></label></p>
                <p><label>Email: <input type="text" name="email"></label></p>
                <p><label>Cidade: <input type="text" name="cidade"></label></p>
                <p><label>Estado: <input type="text" name="estado"></label></p>
                <input id="Enviar" class="btn btn-primary" type="button" value="Enviar"/>
            </form>
        </div>
        <div class="container" id="cadastroFoto">
            <form id="cadastroPalestranteFoto" name="cadastro" action="" method="post">
                <p><label>Foto: <input type="file" name="upFoto"></label></p>
                <p><label><input id="EnviarFoto" class="btn btn-primary" type="button" value="Upload"/></label></p>
            </form>
        </div>
    </body>
</html>
