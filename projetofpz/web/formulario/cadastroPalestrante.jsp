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
        <script type="text/javascript">
            $(document).ready(function(){
                $('#EnviarTexto').click(function(){
                    $('#cadastroTex').fadeOut("slow", function(){
                        $('#cadastroFoto').fadeIn("slow");
                    });

                });

            });
        </script>
    </head>
    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="../index.jsp">fpzCongressos</a>
                    <div class="nav-collapse">
                        <ul class="nav">
                            <li><a href="../index.jsp">Home</a></li>
                            <li class="active"><a href="formulario/cadastroPalestrante.jsp">Cadastro de Palestrante</a></li>
                            <li><a href="#about">Sobre</a></li>
                            <li><a href="#contact">Contato</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->  
                    <p class="navbar-text pull-right">Autenticado como <a data-toggle="modal" href="#cadastroModal">Wellington</a></p>
                </div>
            </div>
        </div>
        <h1>Hello World!</h1>
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
    </body>
</html>