<%-- 
    Document   : logaAdm
    Created on : 16/06/2012, 15:55:49
    Author     : Paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Eventos</title>
    </head>
    <body>
        <%@include file="../cabecalho_adm.jsp" %>
        <div class="container">
                <div class="row">
                    <div class="span6 well">
                        <fieldset>
                            <legend>Cadastro de Eventos</legend>
                            <form id="cadastraEvento" name="cadastraEvento" action="../cadastrarEvento" method="post" enctype="multipart/form-data">
                                <p><label>Usuario: <input type="text" name="usuario"/></label></p>
                                <p><label>Senha: <input type="password" name="senha"/></label></p>
                                <h4>Dados do novo evento</h4><br/>
                                <p><label>Nome Evento: <input type="text" name="evento"/></label></p>
                                <p><label>Data Inicio: <input type="text" name="dtInic"/></label></p>
                                <p><label>Data Fim: <input type="text" name="dtFim"/></label></p>
                                <p><label>Foto:(somente .jpg) <input type="file" name="file"></label></p>
                                <input type="submit" />
                            </form>
                        </fieldset>
                    </div>
                </div>
        </div>
    </body>
</html>
