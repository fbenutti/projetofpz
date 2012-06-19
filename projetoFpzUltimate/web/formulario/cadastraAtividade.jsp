<%-- 
    Document   : logaAdm
    Created on : 16/06/2012, 15:55:49
    Author     : Paulo
--%>

<%@page import="classes.Evento"%>
<%@page import="dao.EventoDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ResponsavelDAO"%>
<%@page import="classes.Responsavel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Atividade</title>
    </head>
    <body>
        <%@include file="../cabecalho_adm.jsp" %>
        <div class="container">
            <div class="row">
                <div class="span4 well">
                    <fieldset>
                        <legend>Cadastro de Atividades</legend>
                        <form  id="cadastraAtividade" name="cadastraAtividade" action="../cadastrarAtividade" method="post">
                            <h4>Login</h4>
                            <br/>
                            <p><label>Usuario: <input type="text" name="usuario"/></label></p>
                            <p><label>Senha: <input type="password" name="senha"/></label></p>
                            <br/>
                            <h4>Dados da nova atividade</h4>
                            <br/>
                            <p><label>Descrição da Atividade: <input type="text" name="descricao"/></label></p>
                            <p><label>Vagas: <input type="text" name="vagas"/></label></p>
                            <p><label>Vagas Restantes: <input type="text" name="vagas_restantes"/></label></p>
                            <p><label>Horário de Ínicio <input type="text" name="horario_inicio"/></label></p>
                            <p><label>Horário de Fim: <input type="text" name="horario_fim"/></label></p>
                            <p><label>Utilize o <span style="color: red"><strong>ID</strong></span> do Palestrante ao lado</label></p>
                            <p><label>ID do Palestrante: <input type="text" name="palestrante"/></label></p>
                            <p><label>Utilize o <span style="color: red"><strong>ID</strong></span> do Evento ao lado</label></p>
                            <p><label>ID do Evento: <input type="text" name="evento"/></label></p>
                            <input type="submit" />
                        </form>
                    </fieldset>
                </div>


                <div class="span3 well">
                    <fieldset>
                        <legend>Palestrantes</legend>
                        <%
                            ResponsavelDAO daoResp = new ResponsavelDAO();
                            List<Responsavel> listaResposanveis = daoResp.listarTodos();
                        %>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>
                                        <p>ID</p>
                                    </th>
                                    <th>
                                        <p>Nome</p>
                                    </th>
                                </tr>
                            </thead>
                            <%
                                for (int c = 0; c < listaResposanveis.size(); c++) {
                            %>
                            <tr> 
                                <td>                                    
                                    <p style=""><%=listaResposanveis.get(c).getId()%></p>
                                </td>
                                <td>
                                    <p style=""><%=listaResposanveis.get(c).getNome()%></p>
                                    <img src="../RenderizarImagem2?id=<%=listaResposanveis.get(c).getId()%>&width=180&height=160" style="float: left;margin-right: 5px;"/>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </table>
                    </fieldset>
                </div>
                <div class="span3 well">
                    <fieldset>
                        <legend>Eventos</legend>
                        
                        <%
                            EventoDAO daoEvent = new EventoDAO();
                            List<Evento> listaEventos = daoEvent.listarTodos();
                        %>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>
                                        <p>ID</p>
                                    </th>
                                    <th>
                                        <p>Nome</p>
                                    </th>
                                </tr>
                            </thead>
                            <%
                                for (int c = 0; c < listaEventos.size(); c++) {
                            %>
                            <tr>
                                <td>                                    
                                    <p style=""><%=listaResposanveis.get(c).getId()%></p>
                                </td>
                                <td>
                                    <img src="../RenderizarImagem?id=<%=listaEventos.get(c).getId()%>&width=100&height=70" style="float: left;margin-right: 5px;"/>
                                    <p style=""><%=listaEventos.get(c).getNome()%></p>
                                </td>
                            </tr>
                            <%                    }
                            %>
                        </table>
                    </fieldset>
                </div>
            </div>
        </div>
    </body>
</html>
