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
        <style type="text/css">
            #cadastroFoto {
                display: none;
            }
        </style>
        <script type="text/javascript" src="../jQueryUI/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="../bootstrap/js/bootstrap-modal.js"></script>
        <script type="text/javascript" src="../jQueryUI/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="../bootstrap/js/bootstrap-dropdown.js"></script>
        <script type="text/javascript" src="../bootstrap/js/bootstrap-popover.js"></script>
        <script type="text/javascript" src="../bootstrap/js/bootstrap-transition.js"></script>
        <script type="text/javascript" src="../bootstrap/js/bootstrap-collapse.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $('#EnviarTexto').click(function(){
                    $('#cadastroTex').fadeOut("slow", function(){
                        $('#cadastroFoto').fadeIn("slow");
                    });

                });

            });
        </script>
        
        <script type="text/javascript">
            $(document).ready(function(){
                $('#cadastroModal').modal({
                    keyboard: true,
                    show: false,
                    backdrop: true
                });
                
                //Login fake
                $('#logar').click(function(){
                    $('#deslogado').hide();
                    $('#logado').fadeIn("slow");
                });
                $('#deslogar').click(function(){
                    $('#logado').hide();
                    $('#deslogado').fadeIn("slow");
                });
        </script>
    </head>
    <body>
        <h1>Hello World!</h1>

        <%@ include file="../cabecalho.jsp" %>
        <h3>Cadastro de Palestrante</h3>
        <br />
        <div class="container" id="cadastroTex">
            <form id="cadastroPalestranteDados" name="cadastro" action="" method="post">
                <p><label>Nome: <input type="text" name="nome"></label></p>
                <p><label>Email: <input type="text" name="email"></label></p>
                <p><label>Estado: <input type="text" name="estado"></label></p>
                <p><label>Cidade: <input type="text" name="cidade"></label></p>
                <input id="EnviarTexto" class="btn btn-primary" type="button" value="Enviar"/>
            </form>
        </div>
        <div class="container" id="cadastroFoto">
            <form id="cadastroPalestranteFoto" name="cadastro" action="" method="post">
                <p><label>Foto: <input type="file" name="upFoto"></label></p>
                <p><label><input id="EnviarFoto" class="btn btn-primary" type="button" value="Upload"/></label></p>
            </form>
        </div>
        <%@include file="../rodape.jsp" %>
    </body>
</html>