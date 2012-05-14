<%-- 
    Document   : cadastroInstituicao
    Created on : 12/05/2012, 17:35:25
    Author     : Paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Instituição</title>
        <link href="../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
        <link href="../bootstrap/css/bootstrap-responsive.min.css" type="text/css" rel="stylesheet" />
        <link href="../css/layout.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div>
            <ul class="nav nav-tabs">
                <li><a id="cadastroUser" href="#cadastroUser">Usuário</a></li>
                <li class="active"><a id="cadastroInstituicao" href="#cadastroInstituicao">Instituição</a></li>
                <li><a id="cadastroPalestrante" href="#cadastroPalestrante">Palestrante</a></li>
            </ul>
            <form id="cadastroInstituição" name="cadastro" action="" method="post">
                <p><label>Nome: <input type="text" name="nome" /></label></p>
                <p><label>Email: <input type="text" name="email" /></label></p>
                <p><label>Estado: <input type="text" name="estado" /></label></p>
                <p><label>Cidade: <input type="text" name="cidade" /></label></p>
                <p><label>Telefone: <input type="text" name="telefone"/></label></p>
                <input id="EnviarTexto" class="btn btn-primary" type="button" value="Enviar"/>
            </form>
        </div>
    </body>
</html>
