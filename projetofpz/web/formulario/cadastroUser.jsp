<%-- 
    Document   : cadastroUser
    Created on : May 10, 2012, 11:49:48 PM
    Author     : Wellington
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <ul class="nav nav-tabs">
                <li class="active"><a id="cadastroUser" href="#cadastroUser">Usuário</a></li>
                <li><a id="cadastroInstituicao" href="#cadastroInstituicao">Instituição</a></li>
                <li><a id="cadastroPalestrante" href="#cadastroPalestrante">Palestrante</a></li>
            </ul>
            <form id="cadastroUsuario" name="cadastro" action="" method="post">
                <p><label>Nome: <input type="text" name="nome"></label></p>
                <p><label>CPF: <input type="text" name="cpf"></label></p>
                <p><label>Email: <input type="text" name="email"></label></p>
                <label for="cep">CEP:  </label>
                <div class="input-append">
                    <input name="cep" id="appendedPrependedInput" type="text" class="input-medium"><button class="btn" type="button">Validar</button>
                </div>
                <div id="loading"><img src="bootstrap/img/loader.gif"/></div>
                <div id="erro">Erro ao carregar os dados.</div>
                <div id="endereco" class="hidden">
                    <p><label>Rua: <input type="text" name="rua" id="rua" disabled="" title="Rua"></label></p>
                    <p><label>Número: <input type="text" name="numero" id="numero" title="Número"></label></p>
                    <p><label>Bairro: <input type="text" name="bairro" id="bairro" disabled="" title="Bairro"></label></p>
                    <p><label>Cidade: <input type="text" name="cidade" id="cidade" disabled="" title="Cidade"></label></p>
                    <p><label>Estado: <input type="text" name="estado" id="estado" disabled="" title="Estado"></label></p>
                </div>
                <input class="btn btn-primary" type="button" value="Enviar"/>
            </form>
        </div>
    </body>
</html>
