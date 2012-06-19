<%-- 
    Document   : index
    Created on : 11/06/2012, 20:46:23
    Author     : Wellington
--%>

<%@page import="classes.Inscricao"%>
<%@page import="dao.InscricaoDAO"%>
<%@page import="classes.Atividade"%>
<%@page import="java.util.List"%>
<%@page import="dao.AtividadeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
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
        <script type="text/javascript" src="bootstrap/js/bootstrap-button.js"></script>
        <script type="text/javascript" src="js/functions.js"></script>
        <script type="text/javascript">
            function inscrever(id){
                $("#op"+id).button('loading');
                $.ajax({
                    type: 'post',
                    data: 'atividade='+id,
                    url: 'InscrevePessoa',
                    success: function(resultado){
                        $("#inscrever"+id).hide(0);
                        $("#op"+id).button('reset');
                    },
                    error: function(erro, text){
                        $("#op"+id).button('reset');
                        $("#resultado"+id).html(text);
                    },
                    statusCode:{
                        404: function(){
                            $("#op"+id).button('reset');
                            $("#resultado"+id).html("Página não encontrada!");
                        }
                    }
           
                });   
            }
        </script>
    </head>
    <body>
        <%-- Include do cabeçalho (menu superior) --%>
        <%@ include file="cabecalho.jsp" %>
        <div class="container">
            <%
                AtividadeDAO dao = new AtividadeDAO();
                List<Atividade> atividades = dao.listarPorEvento(Integer.parseInt(request.getParameter("id")));
                InscricaoDAO DAO2 = new InscricaoDAO();
                HttpSession sessao = request.getSession();
                Login l = (Login) sessao.getAttribute("usuario");
                List<Inscricao> inscricoes = DAO2.listarPorUsuario(l.getLogin());
            %>
            <table class="table">
                <%
                    for (int c = 0; c < atividades.size(); c++) {
                %>
                <tr> 
                    <td>
                        <div id="inscrever<%=atividades.get(c).getId()%>">
                            <form>
                                <% if (DAO2.estaInscrito(atividades.get(c).getId(), l.getLogin())) {%>
                                <input class="btn btn-primary disabled" type="button" name="op" value="Inscrito" />
                                <%} else if(!dao.existeVagas(atividades.get(c).getId())){%>
                                <input class="btn btn-danger disabled" type="button" name="op" value="Vagas Esgotadas" />
                                <%} else {%>
                                <input class="btn btn-primary" data-loading-text="Inscrevendo..." type="button" name="op" id="op<%=atividades.get(c).getId()%>" value="Inscrever" onclick="inscrever(<%=atividades.get(c).getId()%>)"/>
                                <%}%>
                            </form>
                        </div>
                        <div id="desinscrever<%=atividades.get(c).getId()%>" style="display: none;">
                            <form>
                                <input class="btn btn-primary" data-loading-text="Excluindo..." type="button" name="op" id="op<%=atividades.get(c).getId()%>" value="Desinscrever" onclick="desinscrever(<%=atividades.get(c).getId()%>)"/>
                            </form>
                        </div>
                        <div class="label label-info span2" id="resultado<%=atividades.get(c).getId()%>" style="display: none;"></div>
                    </td>
                    <td><%=atividades.get(c).getDescricao()%></td> 
                    <td><%=atividades.get(c).getVagas()%></td> 
                    <td><%=atividades.get(c).getHorario_inicio()%></td> 
                    <td><%=atividades.get(c).getHorario_fim()%></td> 
                </tr> 
                <%                    }
                %>
            </table>
        </div>
        <%@ include file="rodape.jsp" %>
    </body>
</html>
