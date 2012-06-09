<%-- 
    Document   : Contato
    Created on : 07/05/2012, 02:21:07
    Author     : Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contato</title>
        <link href="../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
        <link href="../bootstrap/css/bootstrap-responsive.min.css" type="text/css" rel="stylesheet"/>
        <link href="../css/layout.css" rel="stylesheet" type="text/css" />
        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script type="text/javascript" src="../jQueryUI/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="../bootstrap/js/bootstrap-modal.js"></script>
        <script type="text/javascript" src="../bootstrap/js/bootstrap-dropdown.js"></script>
        <script type="text/javascript" src="../bootstrap/js/bootstrap-popover.js"></script>
        <script type="text/javascript" src="../bootstrap/js/bootstrap-transition.js"></script>
        <script type="text/javascript" src="../js/functions.js"></script>
    </head>
    <body>
        <%@ include file="../cabecalho.jsp" %>

            <!-- Formulário para contato -->
            <div class="container">
                <div class="row">
                    <div class="span6 well">
                        <h3>Digite os seus dados e sua mensagem de contato!</h3> <br/>
                        <form id="formularioContato" name="contato" action="" method="post">
                            <p><label>Nome: <input type="text" name="nome"></label></p>
                            <p><label>Email: <input type="text" name="email"></label></p>
                            <p><label>Mensagem: <textarea name="mensagem"></textarea></label></p>
                            <input id="EnviarTexto" class="btn btn-primary" type="button" 
                            value="Enviar" onclick="alert('Sua mensagem foi enviada com sucesso!')"/>
                        </form>
                    </div>
                </div>
            </div>
        <%@ include file="../rodape.jsp" %>
    </body>
</html>