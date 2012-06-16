<%-- 
    Document   : sobre
    Created on : 07/05/2012, 02:53:30
    Author     : Felipe
--%>


<%@page import="classes.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contato</title>
        <link href="bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
        <link href="bootstrap/css/bootstrap-responsive.min.css" type="text/css" rel="stylesheet"/>
        <link href="/css/layout.css" rel="stylesheet" type="text/css" />
        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script type="text/javascript" src="jQueryUI/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-modal.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-dropdown.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-popover.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-transition.js"></script>
        <script type="text/javascript" src="/js/functions.js"></script>
    </head>
    <body>
        <%@ include file="cabecalho.jsp" %>
            <!-- Container para informações do sobre -->
            <div class="container">
                <div class="row">
                    
                    <div class="span6 well">
                        <h3>Informações</h3><br/>
                        <p>
                            O Projeto FPZ foi desenvolvido para o auxilio no controle de eventos, tendo cadastro de inscritos em palestras, palestrantes e eventos.
                        </p>
                        <p>
                            Os Colaboradores envolvidos no projeto são:<br/>
                            <b>Felipe Baldon Benutti<br/>
                            Paulo Ricardo Mancini<br/>
                            Wellington Zanelli Ribeiro</b><br/>
                        </p>
                    </div>
                </div>
            </div>
        <% Login l = (Login) session.getAttribute("usuario");
        out.println(l.getLogin());
        %>
        <%@ include file="rodape.jsp" %>
    </body>
</html>
