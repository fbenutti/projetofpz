<%-- 
    Document   : index
    Created on : 11/06/2012, 20:46:23
    Author     : Wellington
--%>

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
        <script type="text/javascript" src="js/functions.js"></script>
        <script type="text/javascript">
            function inscrever(id){
                $.ajax({
                    type: 'post',
                    data: 'atividade='+id,
                    url: 'InscrevePessoa',
                    success: function(resultado){
                        $("#resultado").html(resultado);
                        $("#resultado").fadeIn("slow");
                    },
                    error: function(erro, text){
                        $("#resultado").html(text);
                    },
                    statusCode:{
                        404: function(){
                            $("#resultado").html("Página não encontrada!");
                        }
                    }
           
                });   
            }
            
            function desinscrever(id){
                $.ajax({
                    type: 'post',
                    data: 'atividade='+id,
                    url: 'InscrevePessoa',
                    success: function(resultado){
                        $("#resultado").html(resultado);
                        $("#resultado").fadeIn("slow");
                    },
                    error: function(erro, text){
                        $("#resultado").html(text);
                    },
                    statusCode:{
                        404: function(){
                            $("#resultado").html("Página não encontrada!");
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
                List<Atividade> atividades = dao.listarTodos();
            %>
            <table class="table">
                    <%
                        for (int c = 0; c < atividades.size(); c++) {
                    %>
                    <tr> 
                        <td>
                            <form>
                                <input type="button" name="op" value="Inscrever" onclick="inscrever(<%=atividades.get(c).getId()%>)"/>
                            </form>
                                <div id="resultado<%=atividades.get(c).getId()%>">Teste</div>
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
