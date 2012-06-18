<%-- 
    Document   : cabecalho
    Created on : May 8, 2012, 9:35:37 PM
    Author     : Wellington
--%>

<link href="bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-responsive.min.css" type="text/css" rel="stylesheet"/>
<link href="css/layout.css" type="text/css" rel="stylesheet"/>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="jQueryUI/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-modal.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-transition.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="js/functions.js"></script>
<div id="site" style="min-width: 300px ; margin: 0 auto" >
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a class="brand" href="#">fpzCongressos - Admin</a>
                <div class="nav-collapse collapse" style="height: 0px;">
                    <ul class="nav">
                        <li <% if (request.getRequestURI().equalsIgnoreCase("/cadastraEvento.jsp")) {
                                out.print("class='active'");
                            }%>><a href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}/cadastraEvento.jsp">Cadastar Eventos</a></li>

                        <li <%    if (request.getRequestURI().equalsIgnoreCase("/cadastraAtividade.jsp")) {
                                out.print("class='active'");
                            }%>><a href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}/cadastraAtividade.jsp">Cadastrar Atividades</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div>
    </div>
    <div class="modal fade in" id="resultado">
    </div>