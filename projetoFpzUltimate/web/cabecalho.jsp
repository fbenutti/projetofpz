<%-- 
    Document   : cabecalho
    Created on : May 8, 2012, 9:35:37 PM
    Author     : Wellington
--%>
<%@page import="classes.Login"%>
<div id="site" style="min-width: 300px ; margin: 0 auto" >
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a class="brand" href="#">fpzCongressos</a>
                <div class="nav-collapse collapse" style="height: 0px;">
                    <ul class="nav">
                        <li <% if (request.getRequestURI().equalsIgnoreCase("/index.jsp")) {
                                out.print("class='active'");
                            }%>><a href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}/index.jsp">Home</a></li>

                        <li><a data-toggle="modal" id="cadastro" href="#resultado">Cadastre-se</a></li>

                        <li <%    if (request.getRequestURI().equalsIgnoreCase("/sobre.jsp")) {
                                out.print("class='active'");
                            }%>><a href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}/sobre.jsp">Sobre</a></li>

                        <li <%    if (request.getRequestURI().equalsIgnoreCase("/formulario/contato.jsp")) {
                                out.print("class='active'");
                            }%>   ><a href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}/formulario/contato.jsp">Contato</a></li>
                        <li><a data-toggle="modal" id="cadastroPorInstituicao" href="#resultado">Cadastro</a></li>
                    </ul>
                    <%-- if logado --%>
                    <%
                        if (session.getAttribute("usuario") != null) {
                            Login l = (Login) session.getAttribute("usuario");
                    %>
                    <div class="btn-group pull-right" id="logado">
                        <a class="btn btn-primary" href="#"><i class="icon-user icon-white"></i> <%=l.getLogin()%></a>
                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="EncerraSessao"><span class="caret"></span></a>
                        <ul class="dropdown-menu dropdown-form">
                            <li class="dropdown-caret right">
                                <span class="caret-outer"></span>
                                <span class="caret-inner"></span>
                            </li>
                            <!--<li><a data-toggle="modal" id="cadastroModal" href="#cadastroModal"><i class="icon-pencil"></i> Editar</a></li>-->
                            <li id="deslogar"><a href="EncerraSessao.jsp"><i class="icon-ban-circle"></i> Sair</a></li>
                            <li class="divider"></li>
                            <li><a href="#"><i class="icon-list"></i> Minhas inscrições</a></li>
                        </ul>
                    </div>
                    <%-- else --%>
                    <%                    } else {
                    %>
                    <div class="pull-right" id="deslogado">
                        <form class="form-inline navbar-form" action="Logar">
                            <input type="text" id="login" name="login" class="input-small" placeholder="Login"/>
                            <input type="password" id="senha" name="senha" class="input-small" placeholder="Senha" />
                            <input type="submit" value="Entrar" class="btn btn-primary" id="logar"/>
                        </form>
                    </div>
                    <%                        }
                    %>
                    <%-- end if //logado --%>
                </div><!--/.nav-collapse -->
            </div>
        </div>
    </div>
    <div class="modal fade in" id="resultado">
    </div>