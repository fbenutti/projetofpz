<%-- 
    Document   : cabecalho
    Created on : May 8, 2012, 9:35:37 PM
    Author     : Wellington
--%>

<div id="site" style="min-width: 1000px ; margin: 0 auto" >
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a class="brand" href="#">fpzCongressos</a>
                <div class="nav-collapse collapse">
                    <ul class="nav">
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="formulario/cadastroPalestrante.jsp">Cadastro de Palestrante</a></li>
                        <li><a href="#about">Sobre</a></li>
                        <li><a href="#contact">Contato</a></li>
                    </ul>
                    <div class="btn-group pull-right">
                        <a class="btn btn-primary" href="#"><i class="icon-user icon-white"></i> Wellington</a>
                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a data-toggle="modal" href="#cadastroModal"><i class="icon-pencil"></i> Editar</a></li>
                            <li><a href="#"><i class="icon-trash"></i> Delete</a></li>
                            <li><a href="#"><i class="icon-ban-circle"></i> Ban</a></li>
                            <li class="divider"></li>
                            <li><a href="#"><i class="i"></i> Make admin</a></li>
                        </ul>
                    </div>
                </div><!--/.nav-collapse -->
                <!--<p class="navbar-text pull-right">Autenticado como <a data-toggle="modal" href="#cadastroModal">Wellington</a></p>-->
            </div>
        </div>
    </div>