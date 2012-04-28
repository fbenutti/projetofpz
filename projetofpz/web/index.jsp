<%-- 
    Document   : index
    Created on : Apr 17, 2012, 6:21:47 PM
    Author     : Wellington
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- teste comite, so por deus pra funcionar-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <link href="bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
        <style>
            body {
                padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
            }
            #cadastroModal{
                display: none;
            }
        </style>
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script type="text/javascript" src="jQueryUI/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-modal.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $('#cadastroModal').modal({
                    keyboard: true,
                    show: false,
                    backdrop: true
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
                    <a class="brand" href="#">fpzCongressos</a>
                    <div class="nav-collapse">
                        <ul class="nav">
                            <li class="active"><a href="#">Home</a></li>
                            <li><a href="#about">Sobre</a></li>
                            <li><a href="#contact">Contato</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->  
                    <p class="navbar-text pull-right">Autenticado como <a data-toggle="modal" href="#cadastroModal">Wellington</a></p>
                </div>
            </div>
        </div>
        <p>Clique aqui para se inscrever.</p>
        <div class="modal hide fade in" id="cadastroModal">
            <div class="modal-header">
                <a class="close" data-dismiss="modal">x</a>
                <h3>Atualização cadastral</h3>
            </div>
            <div class="modal-body">
                <form id="cadastroUsuario" name="cadastro" action="" method="post">
                    <p><label>Nome: <input type="text" name="nome"></label></p>
                    <p><label>CPF: <input type="text" name="cpf"></label></p>
                    <p><label>Email: <input type="text" name="email"></label></p>
                    <p><label>Cidade: <input type="text" name="cidade"></label></p>
                    <p><label>Estado: <input type="text" name="estado"></label></p>
                    <input class="btn btn-primary" type="button" value="Enviar"/>
                </form>
            </div>
            <div class="modal-footer"> 
            </div>
        </div>
        <!-- Cadastro de palestrantes fornecido pelo Paulo -->
        <div class="container">
        </div>
    </body>
</html>