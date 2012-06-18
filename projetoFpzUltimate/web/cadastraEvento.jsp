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
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="cabecalho_adm.jsp" %>
        <div class="container">
                <div class="row">
                    <div class="span6 well">
                        <form id="cadastraEvento" name="cadastraEvento" action="../cadastrarEvento" method="post" enctype="multipart/form-data">
                            <p>Usuario: <input type="text" name="usuario"/></p>
                            <p>Senha: <input type="password" name="senha"/></p>
                            <h4>Dados do novo evento</h4><br/>
                            <p>Nome Evento: <input type="text" name="evento"/></p>
                            <p>Data Inicio: <input type="text" name="dtInic"/></p>
                            <p>Data Fim: <input type="text" name="dtFim"/></p>
                            <p><label>Foto:(somente .jpg) <input type="file" name="file"></label></p>
                            <input type="submit" />
                        </form>
                    </div>
                </div>
        </div>
    </body>
</html>
